import { access, mkdir, mkdtemp, readFile, rm } from "fs/promises";
import { join, relative } from "path";
import CSVReporter from "../index.js";
import type { SuiteReport, SuiteResultReport } from "@as-pect/core";

class TestCSVReporter extends CSVReporter {
  public async writeAndWait(report: Pick<SuiteReport, "fileName" | "hasResults" | "results">): Promise<void> {
    this.onReportFinish({ report: report as SuiteReport });
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
    message: "ok",
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

function parseRows(output: string): string[][] {
  const rows: string[][] = [];
  let row: string[] = [];
  let field = "";
  let quoted = false;

  for (let i = 0; i < output.length; i++) {
    const char = output[i];
    const next = output[i + 1];

    if (quoted) {
      if (char === '"' && next === '"') {
        field += '"';
        i++;
      } else if (char === '"') {
        quoted = false;
      } else {
        field += char;
      }
    } else if (char === '"') {
      quoted = true;
    } else if (char === ",") {
      row.push(field);
      field = "";
    } else if (char === "\n") {
      row.push(field);
      rows.push(row);
      row = [];
      field = "";
    } else if (char !== "\r") {
      field += char;
    }
  }

  if (field !== "" || row.length > 0) {
    row.push(field);
    rows.push(row);
  }

  return rows;
}

async function reporterCreatesFile(report: Pick<SuiteReport, "hasResults" | "results">): Promise<boolean> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-csv-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "example.spec.ts");
  const reporter = new TestCSVReporter();
  const outputPath = join(tempDir, "example.spec.csv");

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

async function runReporter(results: SuiteResultReport[]): Promise<string[][]> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-csv-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "example.spec.ts");
  const reporter = new TestCSVReporter();

  try {
    await reporter.writeAndWait({ fileName, hasResults: true, results });
    const output = await readFile(join(tempDir, "example.spec.csv"), "utf8");
    return parseRows(output);
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

async function runNestedReporter(): Promise<string[][]> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-csv-reporter-"));
  const sourceDir = join(tempDir, "assembly", "__tests__");
  const fileName = join(relative(process.cwd(), sourceDir), "entry.spec.ts");
  const reporter = new TestCSVReporter();

  try {
    await mkdir(sourceDir, { recursive: true });
    await reporter.writeAndWait({ fileName, hasResults: true, results: [testResult()] });
    const output = await readFile(join(sourceDir, "entry.spec.csv"), "utf8");
    return parseRows(output);
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

async function runProjectRootReporter(): Promise<string[][]> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-csv-reporter-root-"));
  const sourceDir = join(tempDir, "assembly", "__tests__");
  const reporter = new TestCSVReporter(tempDir);

  try {
    await mkdir(sourceDir, { recursive: true });
    await reporter.writeAndWait({
      fileName: "assembly/__tests__/entry.spec.ts",
      hasResults: true,
      results: [testResult()],
    });
    const output = await readFile(join(sourceDir, "entry.spec.csv"), "utf8");
    return parseRows(output);
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

async function writeReportWithMissingOutputDirectory(): Promise<void> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-csv-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "missing", "entry.spec.ts");
  const reporter = new TestCSVReporter();

  try {
    await reporter.writeAndWait({ fileName, hasResults: true, results: [testResult()] });
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

describe("CSVReporter", () => {
  it("does not write a file for reports with no executed results", async () => {
    await expect(
      reporterCreatesFile({
        hasResults: false,
        results: [testResult({ name: "skipped by filter", ran: false })],
      }),
    ).resolves.toBe(false);
  });

  it("writes the documented CSV header order", async () => {
    await expect(runReporter([])).resolves.toEqual([
      ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"],
    ]);
  });

  it("writes the CSV file next to a nested test entry", async () => {
    await expect(runNestedReporter()).resolves.toEqual([
      ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"],
      ["math", "adds values", "RAN", "FALSE", "PASS", "3", "ok", "3", "3"],
    ]);
  });

  it("writes project-relative report files under the configured output root", async () => {
    await expect(runProjectRootReporter()).resolves.toEqual([
      ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"],
      ["math", "adds values", "RAN", "FALSE", "PASS", "3", "ok", "3", "3"],
    ]);
  });

  it("surfaces output stream errors through flush", async () => {
    await expect(writeReportWithMissingOutputDirectory()).rejects.toMatchObject({ code: "ENOENT" });
  });

  it("writes test rows in the same column order as the header", async () => {
    await expect(runReporter([testResult()])).resolves.toEqual([
      ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"],
      ["math", "adds values", "RAN", "FALSE", "PASS", "3", "ok", "3", "3"],
    ]);
  });

  it("writes NOT RUN under the Ran column for skipped test rows", async () => {
    await expect(runReporter([testResult({ name: "skips values", ran: false })])).resolves.toEqual([
      ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"],
      ["math", "skips values", "NOT RUN", "FALSE", "PASS", "3", "ok", "3", "3"],
    ]);
  });

  it("writes todo rows in the same column order as the header", async () => {
    await expect(
      runReporter([
        {
          type: "todo",
          groupName: "math",
          description: "handles division",
        },
      ]),
    ).resolves.toEqual([
      ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"],
      ["math", "handles division", "TODO", "", "", "", "", "", ""],
    ]);
  });

  it("emits values with comma, quote, and newline as parseable CSV fields", async () => {
    await expect(
      runReporter([
        testResult({
          groupName: "math, core",
          name: 'quotes "work"',
          message: "line one\nline two",
          actual: "1,2",
          expected: '"1,2"',
        }),
      ]),
    ).resolves.toEqual([
      ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"],
      ["math, core", 'quotes "work"', "RAN", "FALSE", "PASS", "3", "line one\nline two", "1,2", '"1,2"'],
    ]);
  });

  it("keeps null actual and expected values as empty CSV fields", async () => {
    await expect(runReporter([testResult({ actual: null, expected: null })])).resolves.toEqual([
      ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"],
      ["math", "adds values", "RAN", "FALSE", "PASS", "3", "ok", "", ""],
    ]);
  });
});
