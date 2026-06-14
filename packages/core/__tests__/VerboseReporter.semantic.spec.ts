import {
  errorSuiteReport,
  failingSuiteReport,
  passingSuiteReport,
  snapshotChangeSuiteReport,
  suiteGroupReport,
  suiteReport,
  suiteTestReport,
  todoSuiteReport,
  warningSuiteReport,
} from "./setup/SuiteReportFixtures.js";
import {
  writeVerboseGroupFinish,
  writeVerboseGroupStart,
  writeVerboseReport,
  writeVerboseTestFinish,
} from "./setup/ReporterTestUtils.js";

test("VerboseReporter skips files that only collected filtered-out tests", () => {
  const skippedTest = suiteTestReport({ name: "skipped by filter", ran: false, pass: true });
  const output = writeVerboseReport(
    suiteReport({
      fileName: "assembly/skipped.spec.ts",
      pass: true,
      hasResults: false,
      groups: [suiteGroupReport({ tests: [skippedTest] })],
      results: [skippedTest],
    }),
  );

  expect(output).toBe("");
});

test("VerboseReporter writes group starts from SuiteReport group facts", () => {
  const [group] = passingSuiteReport().groups;
  const output = writeVerboseGroupStart(group);

  expect(output).toBe("[Describe]: math\n\n");
});

test("VerboseReporter writes passing test results, rtrace deltas, and logs", () => {
  const [group] = passingSuiteReport().groups;
  const [test] = group.tests;
  const output = writeVerboseTestFinish(test, group);

  expect(output).toContain("[Success]: ✔ adds numbers RTrace: +7\n");
  expect(output).toContain('[Log]: "test log"\n');
  expect(output).toContain("[Stack]: test stack\n");
});

test("VerboseReporter writes failed test details from SuiteReport test facts", () => {
  const [group] = failingSuiteReport().groups;
  const [test] = group.tests;
  const output = writeVerboseTestFinish(test, group);

  expect(output).toContain("[Fail]: ✖ compares numbers\n");
  expect(output).toContain("[Actual]: 1\n");
  expect(output).toContain("[Expected]: 2\n");
  expect(output).toContain("[Message]: numbers differ\n");
  expect(output).toContain("[Stack]: compare.ts:10:2\n");
  expect(output).toContain('[Log]: "failure log"\n');
});

test("VerboseReporter writes todos and group logs from group finish facts", () => {
  const [group] = todoSuiteReport().groups;
  const output = writeVerboseGroupFinish(group);

  expect(output).toContain("[Todo]: write the edge case\n");
});

test("VerboseReporter writes todos from todo-only group finish facts", () => {
  const group = suiteGroupReport({ tests: [], todos: ["write the only case"] });
  const output = writeVerboseGroupFinish(group);

  expect(output).toContain("[Todo]: write the only case\n");
});

test("VerboseReporter writes file summary stats from SuiteReport facts", () => {
  const output = writeVerboseReport(passingSuiteReport());

  expect(output).toContain("[File]: assembly/pass.spec.ts\n");
  expect(output).toContain("[Groups]: 1 pass, 1 total\n");
  expect(output).toContain("[Result]: ✔ PASS\n");
  expect(output).toContain("[Snapshot]: 0 total, 0 added, 0 removed, 0 different\n");
  expect(output).toContain("[Summary]: 1 pass,  0 fail, 1 total\n");
  expect(output).toContain("[Time]: 5ms\n");
});

test("VerboseReporter writes warnings and errors from SuiteReport facts", () => {
  const warningOutput = writeVerboseReport(warningSuiteReport());
  const errorOutput = writeVerboseReport(errorSuiteReport());

  expect(warningOutput).toContain("[Warning]: WarningType -> warning message\n");
  expect(warningOutput).toContain("[Stack]: warning.ts:1:1");
  expect(errorOutput).toContain("[Error]: ErrorType error message\n");
  expect(errorOutput).toContain("[Stack]: error.ts:2:1\n           error.ts:3:1\n");
});

test("VerboseReporter routes snapshot-change output through its writer only", () => {
  const originalConsoleLog = console.log;
  const consoleWrites: unknown[][] = [];
  console.log = (...args: unknown[]): void => {
    consoleWrites.push(args);
  };

  try {
    const output = writeVerboseReport(snapshotChangeSuiteReport());

    expect(consoleWrites).toEqual([]);
    expect(output).toContain("[Snapshot]: snapshot group!~snapshot name[0]\n");
    expect(output).toContain("- old snapshot\n");
    expect(output).toContain("+ new snapshot\n");
    expect(output).toContain("  same snapshot\n");
    expect(output).toContain("[Snapshot]: 1 total, 1 added, 0 removed, 0 different\n");
  } finally {
    console.log = originalConsoleLog;
  }
});
