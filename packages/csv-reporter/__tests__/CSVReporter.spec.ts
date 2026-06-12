import { mkdtemp, readFile, rm } from "fs/promises";
import { join, relative } from "path";
import CSVReporter from "../index.js";
import type { SuiteReport, SuiteResultReport } from "@as-pect/core";

class TestCSVReporter extends CSVReporter {
  public async writeAndWait(report: Pick<SuiteReport, "fileName" | "results">): Promise<void> {
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
  return output
    .trimEnd()
    .split(/\r?\n/)
    .map((line) => line.split(","));
}

async function runReporter(results: SuiteResultReport[]): Promise<string[][]> {
  const tempDir = await mkdtemp(join(process.cwd(), "tmp-csv-reporter-"));
  const fileName = join(relative(process.cwd(), tempDir), "example.spec.ts");
  const reporter = new TestCSVReporter();

  try {
    await reporter.writeAndWait({ fileName, results });
    const output = await readFile(join(tempDir, "example.spec.csv"), "utf8");
    return parseRows(output);
  } finally {
    await rm(tempDir, { recursive: true, force: true });
  }
}

describe("CSVReporter", () => {
  it("writes the documented CSV header order", async () => {
    await expect(runReporter([])).resolves.toEqual([
      ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"],
    ]);
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
});
