import { access, mkdtemp, readFile, rm } from "fs/promises";
import { join, relative } from "path";
import JSONReporter from "../index.js";
import type { SuiteReport, SuiteResultReport } from "@as-pect/core";

class TestJSONReporter extends JSONReporter {
  public async writeAndWait(report: Pick<SuiteReport, "fileName" | "hasResults" | "results">): Promise<void> {
    this.onReportFinish({ report: report as SuiteReport, context: undefined as never });
    await this.onFlush();
  }
}

function testResult(overrides: Partial<SuiteResultReport> = {}): SuiteResultReport {
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
  } as SuiteResultReport;
}

async function reporterCreatesFile(report: Pick<SuiteReport, "hasResults" | "results">): Promise<boolean> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-json-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "example.spec.ts");
  const reporter = new TestJSONReporter();
  const outputPath = join(tempDir, "example.spec.json");

  try {
    await reporter.writeAndWait({ fileName, ...report });
    await access(outputPath);
    return true;
  } catch {
    return false;
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

async function runReporter(results: SuiteResultReport[]): Promise<unknown> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-json-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "example.spec.ts");
  const reporter = new TestJSONReporter();

  try {
    await reporter.writeAndWait({ fileName, results });
    const output = await readFile(join(tempDir, "example.spec.json"), "utf8");
    return JSON.parse(output);
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

describe("JSONReporter", () => {
  it("does not write a file for reports with no executed results", async () => {
    await expect(
      reporterCreatesFile({
        hasResults: false,
        results: [testResult({ name: "skipped by filter", ran: false })],
      }),
    ).resolves.toBe(false);
  });

  it("writes parseable JSON for an empty report", async () => {
    await expect(runReporter([])).resolves.toEqual([]);
  });

  it("writes parseable JSON for one test result", async () => {
    await expect(runReporter([testResult()])).resolves.toEqual([
      {
        group: "math",
        name: "adds values",
        ran: true,
        pass: true,
        negated: false,
        runtime: 3,
        message: null,
        actual: "3",
        expected: "3",
      },
    ]);
  });

  it("writes parseable JSON for multiple test results", async () => {
    await expect(
      runReporter([
        testResult({ name: "adds values", runtime: 3 }),
        testResult({
          name: "subtracts values",
          pass: false,
          runtime: 5,
          message: "expected 1",
          actual: "2",
          expected: "1",
        }),
      ]),
    ).resolves.toEqual([
      {
        group: "math",
        name: "adds values",
        ran: true,
        pass: true,
        negated: false,
        runtime: 3,
        message: null,
        actual: "3",
        expected: "3",
      },
      {
        group: "math",
        name: "subtracts values",
        ran: true,
        pass: false,
        negated: false,
        runtime: 5,
        message: "expected 1",
        actual: "2",
        expected: "1",
      },
    ]);
  });

  it("writes parseable JSON for a todo result", async () => {
    await expect(
      runReporter([
        {
          type: "todo",
          groupName: "math",
          description: "handles division",
        },
      ]),
    ).resolves.toEqual([
      {
        group: "math",
        name: "TODO: handles division",
        ran: false,
        pass: null,
        negated: false,
        runtime: 0,
        message: "",
        actual: null,
        expected: null,
      },
    ]);
  });
});
