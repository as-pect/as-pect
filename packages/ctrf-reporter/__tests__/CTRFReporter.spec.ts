import { access, mkdir, mkdtemp, readFile, rm } from "fs/promises";
import { join, relative } from "path";
import CTRFReporter from "../index.js";
import type { SnapshotReportChange, SuiteReport, SuiteResultReport } from "@as-pect/core";

class TestCTRFReporter extends CTRFReporter {
  public async writeAndWait(report: Partial<SuiteReport> & Pick<SuiteReport, "fileName" | "hasResults" | "results">): Promise<void> {
    this.onReportFinish({ report: report as SuiteReport });
    await this.onFlush();
  }
}

function testResult(overrides: Partial<Extract<SuiteResultReport, { type: "test" }>> = {}): Extract<SuiteResultReport, { type: "test" }> {
  return {
    type: "test",
    groupName: "math",
    name: "adds values",
    ran: true,
    negated: false,
    pass: true,
    runtime: 3,
    message: null,
    stackTrace: null,
    rtraceDelta: 0,
    logs: [],
    actual: "3",
    expected: "3",
    actualValue: null,
    expectedValue: null,
    ...overrides,
  };
}

function report(overrides: Partial<SuiteReport> = {}): Partial<SuiteReport> & Pick<SuiteReport, "fileName" | "hasResults" | "results"> {
  return {
    fileName: "assembly/__tests__/entry.spec.ts",
    hasResults: true,
    pass: true,
    rootRuntime: 12,
    testCount: 1,
    testPassCount: 1,
    groupCount: 1,
    groupPassCount: 1,
    todoCount: 0,
    results: [testResult()],
    errors: [],
    warnings: [],
    snapshotChanges: [],
    snapshotStats: { total: 0, added: 0, removed: 0, different: 0 },
    ...overrides,
  } as Partial<SuiteReport> & Pick<SuiteReport, "fileName" | "hasResults" | "results">;
}

async function reporterCreatesFile(input: Partial<SuiteReport> & Pick<SuiteReport, "fileName" | "hasResults" | "results">): Promise<boolean> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-ctrf-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "example.spec.ts");
  const reporter = new TestCTRFReporter();
  const outputPath = join(tempDir, "example.spec.ctrf.json");

  try {
    await reporter.writeAndWait({ ...input, fileName });
    await access(outputPath);
    return true;
  } catch {
    return false;
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

async function runReporter(input: Partial<SuiteReport> & Pick<SuiteReport, "fileName" | "hasResults" | "results">): Promise<any> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-ctrf-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "example.spec.ts");
  const reporter = new TestCTRFReporter();

  try {
    await reporter.writeAndWait({ ...input, fileName });
    const output = await readFile(join(tempDir, "example.spec.ctrf.json"), "utf8");
    return JSON.parse(output);
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

async function runProjectRootReporter(): Promise<unknown> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-ctrf-reporter-root-"));
  const sourceDir = join(tempDir, "assembly", "__tests__");
  const reporter = new TestCTRFReporter(tempDir);

  try {
    await mkdir(sourceDir, { recursive: true });
    await reporter.writeAndWait(report({ fileName: "assembly/__tests__/entry.spec.ts" }));
    const output = await readFile(join(sourceDir, "entry.spec.ctrf.json"), "utf8");
    return JSON.parse(output);
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

async function writeReportWithMissingOutputDirectory(): Promise<void> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-ctrf-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "missing", "entry.spec.ts");
  const reporter = new TestCTRFReporter();

  try {
    await reporter.writeAndWait(report({ fileName }));
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

describe("CTRFReporter", () => {
  it("does not write a file for reports with no executed results", async () => {
    await expect(
      reporterCreatesFile(
        report({
          hasResults: false,
          results: [testResult({ name: "skipped by filter", ran: false })],
        }),
      ),
    ).resolves.toBe(false);
  });

  it("writes a passing suite as CTRF JSON", async () => {
    const ctrf = await runReporter(report());

    expect(ctrf).toMatchObject({
      reportFormat: "CTRF",
      specVersion: expect.any(String),
      results: {
        tool: { name: "as-pect" },
        summary: {
          tests: 1,
          passed: 1,
          failed: 0,
          pending: 0,
          skipped: 0,
          other: 0,
        },
        tests: [
          {
            name: "adds values",
            status: "passed",
            duration: 3,
            suite: ["math"],
            filePath: expect.stringContaining("example.spec.ts"),
            extra: {
              asPect: {
                fileName: expect.stringContaining("example.spec.ts"),
                groupName: "math",
                negated: false,
                rtraceDelta: 0,
                actual: "3",
                expected: "3",
              },
            },
          },
        ],
      },
    });
  });

  it("writes project-relative report files under the configured output root", async () => {
    await expect(runProjectRootReporter()).resolves.toMatchObject({
      results: {
        tests: [{ filePath: "assembly/__tests__/entry.spec.ts" }],
      },
    });
  });

  it("writes failed assertion details in CTRF-compatible fields and as-pect extras", async () => {
    const ctrf = await runReporter(
      report({
        pass: false,
        testPassCount: 0,
        results: [
          testResult({
            pass: false,
            message: "expected 1",
            stackTrace: "stack line",
            actual: "2",
            expected: "1",
          }),
        ],
      }),
    );

    expect(ctrf.results.summary).toMatchObject({ tests: 1, passed: 0, failed: 1 });
    expect(ctrf.results.tests[0]).toMatchObject({
      status: "failed",
      message: "expected 1",
      trace: "stack line",
      extra: {
        asPect: {
          actual: "2",
          expected: "1",
        },
      },
    });
  });

  it("maps suite errors to failed CTRF test entries", async () => {
    const ctrf = await runReporter(
      report({
        pass: false,
        testCount: 0,
        testPassCount: 0,
        results: [],
        errors: [{ type: "RuntimeError", message: "boom", stackTrace: "stack line" }],
      }),
    );

    expect(ctrf.results.summary).toMatchObject({ tests: 1, passed: 0, failed: 1 });
    expect(ctrf.results.tests[0]).toMatchObject({
      name: "RuntimeError",
      status: "failed",
      duration: 0,
      message: "boom",
      trace: "stack line",
      extra: {
        asPect: {
          fileName: expect.stringContaining("example.spec.ts"),
          type: "suiteError",
        },
      },
    });
  });

  it("maps todo results to pending and not-run tests to skipped", async () => {
    const ctrf = await runReporter(
      report({
        testCount: 2,
        testPassCount: 1,
        todoCount: 1,
        results: [
          testResult({ name: "filtered out", ran: false }),
          { type: "todo", groupName: "math", description: "handles division" },
        ],
      }),
    );

    expect(ctrf.results.summary).toMatchObject({ tests: 2, passed: 0, failed: 0, pending: 1, skipped: 1 });
    expect(ctrf.results.tests).toEqual(
      expect.arrayContaining([
        expect.objectContaining({ name: "filtered out", status: "skipped", duration: 3 }),
        expect.objectContaining({ name: "TODO: handles division", status: "pending", duration: 0 }),
      ]),
    );
  });

  it("nests snapshot and warning facts under extra.asPect", async () => {
    const snapshotChange: SnapshotReportChange = {
      name: "math adds values 1",
      lines: [
        { type: "removed", value: "old" },
        { type: "added", value: "new" },
      ],
      result: null as unknown as SnapshotReportChange["result"],
    };
    const ctrf = await runReporter(
      report({
        warnings: [{ type: "Warning", message: "watch out", stackTrace: "warning stack" }],
        snapshotChanges: [snapshotChange],
        snapshotStats: { total: 1, added: 1, removed: 0, different: 0 },
      }),
    );

    expect(ctrf.results.extra.asPect).toMatchObject({
      warnings: [{ type: "Warning", message: "watch out", stackTrace: "warning stack" }],
      snapshotStats: { total: 1, added: 1, removed: 0, different: 0 },
      snapshotChanges: [
        {
          name: "math adds values 1",
          lines: [
            { type: "removed", value: "old" },
            { type: "added", value: "new" },
          ],
        },
      ],
    });
  });

  it("surfaces output stream errors through flush", async () => {
    await expect(writeReportWithMissingOutputDirectory()).rejects.toMatchObject({ code: "ENOENT" });
  });
});
