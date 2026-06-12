import {
  errorSuiteReport,
  failingSuiteReport,
  passingSuiteReport,
  snapshotChangeSuiteReport,
  todoSuiteReport,
  warningSuiteReport,
} from "./setup/SuiteReportFixtures.js";
import { writeSummaryReport } from "./setup/ReporterTestUtils.js";

test("SummaryReporter writes pass totals and captured logs from SuiteReport facts", () => {
  const output = writeSummaryReport(passingSuiteReport());

  expect(output).toContain("✔ assembly/pass.spec.ts Pass: 1 / 1 Todo: 0 Time: 5ms\n");
  expect(output).toContain('[Log]: "group log"\n');
  expect(output).toContain('[Log]: "test log"\n');
  expect(output).not.toContain("Failed:");
});

test("SummaryReporter writes failed groups, failed tests, and comparison values", () => {
  const output = writeSummaryReport(failingSuiteReport());

  expect(output).toContain("❌ assembly/fail.spec.ts Pass: 0 / 1 Todo: 0 Time: 8ms\n");
  expect(output).toContain("Failed: math\n");
  expect(output).toContain("❌ compares numbers - numbers differ\n");
  expect(output).toContain("[Actual]  : 1\n");
  expect(output).toContain("[Expected]: 2\n");
  expect(output).toContain('[Log]: "failure log"\n');
});

test("SummaryReporter includes todo counts from SuiteReport facts", () => {
  const output = writeSummaryReport(todoSuiteReport());

  expect(output).toContain("✔ assembly/todo.spec.ts Pass: 1 / 1 Todo: 1 Time: 6ms\n");
});

test("SummaryReporter writes human-readable warning lines", () => {
  const output = writeSummaryReport(warningSuiteReport());

  expect(output).toContain(" [Warning]: WarningType -> warning message\n");
  expect(output).toContain("[Stack]: warning.ts:1:1\n");
  expect(output).not.toContain("NaN");
});

test("SummaryReporter writes error lines and preserves multiline stacks", () => {
  const output = writeSummaryReport(errorSuiteReport());

  expect(output).toContain("[Error]: ErrorType error message\n");
  expect(output).toContain("[Stack]: error.ts:2:1\n           error.ts:3:1\n");
});

test("SummaryReporter routes snapshot-change output through its writer only", () => {
  const originalConsoleLog = console.log;
  const consoleWrites: unknown[][] = [];
  console.log = (...args: unknown[]): void => {
    consoleWrites.push(args);
  };

  try {
    const output = writeSummaryReport(snapshotChangeSuiteReport());

    expect(consoleWrites).toEqual([]);
    expect(output).toContain("[Snapshot]: snapshot group!~snapshot name[0]\n");
    expect(output).toContain("- old snapshot\n");
    expect(output).toContain("+ new snapshot\n");
    expect(output).toContain("  same snapshot\n");
  } finally {
    console.log = originalConsoleLog;
  }
});
