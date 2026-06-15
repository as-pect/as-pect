import { access, mkdir, mkdtemp, readFile, rm } from "fs/promises";
import { join, relative } from "path";
import JUnitReporter from "../index.js";
import type { SuiteReport, SuiteResultReport } from "@as-pect/core";

class TestJUnitReporter extends JUnitReporter {
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
    rootRuntime: 12,
    results: [testResult()],
    errors: [],
    snapshotChanges: [],
    ...overrides,
  } as Partial<SuiteReport> & Pick<SuiteReport, "fileName" | "hasResults" | "results">;
}

async function reporterCreatesFile(input: Partial<SuiteReport> & Pick<SuiteReport, "fileName" | "hasResults" | "results">): Promise<boolean> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-junit-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "example.spec.ts");
  const reporter = new TestJUnitReporter();
  const outputPath = join(tempDir, "example.spec.xml");

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

async function runReporter(input: Partial<SuiteReport> & Pick<SuiteReport, "fileName" | "hasResults" | "results">): Promise<string> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-junit-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "example.spec.ts");
  const reporter = new TestJUnitReporter();

  try {
    await reporter.writeAndWait({ ...input, fileName });
    return await readFile(join(tempDir, "example.spec.xml"), "utf8");
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

async function runProjectRootReporter(): Promise<string> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-junit-reporter-root-"));
  const sourceDir = join(tempDir, "assembly", "__tests__");
  const reporter = new TestJUnitReporter(tempDir);

  try {
    await mkdir(sourceDir, { recursive: true });
    await reporter.writeAndWait(report({ fileName: "assembly/__tests__/entry.spec.ts" }));
    return await readFile(join(sourceDir, "entry.spec.xml"), "utf8");
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

async function writeReportWithMissingOutputDirectory(): Promise<void> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-junit-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "missing", "entry.spec.ts");
  const reporter = new TestJUnitReporter();

  try {
    await reporter.writeAndWait(report({ fileName }));
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

describe("JUnitReporter", () => {
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

  it("writes a passing suite as JUnit XML", async () => {
    await expect(runReporter(report())).resolves.toContain(
      '<testsuite name="tmp-junit-reporter-',
    );
    const xml = await runReporter(report());

    expect(xml).toContain('tests="1" failures="0" errors="0" skipped="0" time="0.012"');
    expect(xml).toContain('<testcase classname="math" name="adds values" time="0.003"/>');
  });

  it("writes project-relative report files under the configured output root", async () => {
    await expect(runProjectRootReporter()).resolves.toContain('<testsuite name="assembly/__tests__/entry.spec.ts"');
  });

  it("writes escaped failure details", async () => {
    const xml = await runReporter(
      report({
        results: [
          testResult({
            groupName: "math & core",
            name: "uses <xml>",
            pass: false,
            message: 'expected "1" & got <2>',
            stackTrace: "stack <line> & trace",
            actual: "<2>",
            expected: '"1"',
          }),
        ],
      }),
    );

    expect(xml).toContain('classname="math &amp; core" name="uses &lt;xml&gt;"');
    expect(xml).toContain('<failure message="expected &quot;1&quot; &amp; got &lt;2&gt;">');
    expect(xml).toContain("stack &lt;line&gt; &amp; trace");
    expect(xml).toContain("Actual: &lt;2&gt;");
    expect(xml).toContain("Expected: &quot;1&quot;");
  });

  it("writes suite-level errors as error testcases", async () => {
    const xml = await runReporter(
      report({
        results: [],
        errors: [{ type: "RuntimeError", message: "boom <bad>", stackTrace: "stack & trace" }],
      }),
    );

    expect(xml).toContain('tests="1" failures="0" errors="1" skipped="0"');
    expect(xml).toContain('<testcase classname="as-pect" name="RuntimeError" time="0">');
    expect(xml).toContain('<error message="boom &lt;bad&gt;">stack &amp; trace</error>');
  });

  it("writes todo and not-run tests as skipped testcases", async () => {
    const xml = await runReporter(
      report({
        results: [
          testResult({ name: "filtered out", ran: false }),
          { type: "todo", groupName: "math", description: "handles division" },
        ],
      }),
    );

    expect(xml).toContain('tests="2" failures="0" errors="0" skipped="2"');
    expect(xml.match(/<skipped/g)).toHaveLength(2);
    expect(xml).toContain('<skipped message="Not run"/>');
    expect(xml).toContain('<skipped message="TODO"/>');
  });

  it("writes snapshot changes to system-out", async () => {
    const xml = await runReporter(
      report({
        snapshotChanges: [
          {
            name: "math adds values 1",
            lines: [
              { type: "removed", value: "old" },
              { type: "added", value: "new" },
            ],
            result: null,
          },
        ],
      } as Partial<SuiteReport>),
    );

    expect(xml).toContain("<system-out>Snapshot: math adds values 1");
    expect(xml).toContain("- old");
    expect(xml).toContain("+ new</system-out>");
  });

  it("surfaces output stream errors through flush", async () => {
    await expect(writeReportWithMissingOutputDirectory()).rejects.toMatchObject({ code: "ENOENT" });
  });
});
