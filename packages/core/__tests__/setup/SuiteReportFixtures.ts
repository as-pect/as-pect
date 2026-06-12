import type {
  SnapshotReportChange,
  SuiteGroupReport,
  SuiteReport,
  SuiteResultReport,
  SuiteTestReport,
} from "../../src/index.js";
import { ReflectedValue } from "../../src/util/ReflectedValue.js";
import { ReflectedValueType } from "../../src/util/ReflectedValueType.js";

export function reflectedString(value: string, stack: string = ""): ReflectedValue {
  const reflected = new ReflectedValue();
  reflected.type = ReflectedValueType.String;
  reflected.value = value;
  reflected.stack = stack;
  return reflected;
}

export function reflectedInteger(value: number, negated: boolean = false): ReflectedValue {
  const reflected = new ReflectedValue();
  reflected.type = ReflectedValueType.Integer;
  reflected.typeName = "i32";
  reflected.value = value;
  reflected.size = 4;
  reflected.signed = true;
  reflected.negated = negated;
  return reflected;
}

export function suiteTestReport(overrides: Partial<SuiteTestReport> = {}): SuiteTestReport {
  return {
    type: "test",
    groupName: "math",
    name: "adds numbers",
    ran: true,
    negated: false,
    pass: true,
    runtime: 3,
    message: null,
    stackTrace: null,
    rtraceDelta: 0,
    logs: [],
    actual: null,
    expected: null,
    actualValue: null,
    expectedValue: null,
    ...overrides,
  };
}

export function suiteGroupReport(overrides: Partial<SuiteGroupReport> = {}): SuiteGroupReport {
  const tests = overrides.tests ?? [suiteTestReport()];

  return {
    type: "group",
    name: "math",
    pass: tests.every((test) => test.pass),
    runtime: 4,
    hasChildren: tests.length > 0 || (overrides.todos?.length ?? 0) > 0,
    logs: [],
    todos: [],
    tests,
    ...overrides,
  };
}

export function suiteReport(overrides: Partial<SuiteReport> = {}): SuiteReport {
  return {
    fileName: "assembly/example.spec.ts",
    pass: true,
    testCount: 0,
    testPassCount: 0,
    groupCount: 0,
    groupPassCount: 0,
    rootRuntime: 0,
    hasResults: false,
    todoCount: 0,
    rootNode: null,
    warnings: [],
    errors: [],
    snapshotChanges: [],
    snapshotStats: {
      total: 0,
      added: 0,
      removed: 0,
      different: 0,
    },
    groups: [],
    results: [],
    ...overrides,
  } as unknown as SuiteReport;
}

export function passingSuiteReport(): SuiteReport {
  const test = suiteTestReport({
    logs: [reflectedString("test log", "test stack")],
    rtraceDelta: 7,
  });
  const group = suiteGroupReport({
    logs: [reflectedString("group log", "group stack")],
    tests: [test],
  });

  return suiteReport({
    fileName: "assembly/pass.spec.ts",
    pass: true,
    testCount: 1,
    testPassCount: 1,
    groupCount: 1,
    groupPassCount: 1,
    rootRuntime: 5,
    hasResults: true,
    groups: [group],
    results: [test],
  });
}

export function failingSuiteReport(): SuiteReport {
  const test = suiteTestReport({
    name: "compares numbers",
    pass: false,
    message: "numbers differ",
    stackTrace: "compare.ts:10:2",
    actual: "1",
    expected: "2",
    actualValue: reflectedInteger(1),
    expectedValue: reflectedInteger(2),
    logs: [reflectedString("failure log")],
  });
  const group = suiteGroupReport({
    pass: false,
    tests: [test],
  });

  return suiteReport({
    fileName: "assembly/fail.spec.ts",
    pass: false,
    testCount: 1,
    testPassCount: 0,
    groupCount: 1,
    groupPassCount: 0,
    rootRuntime: 8,
    hasResults: true,
    groups: [group],
    results: [test],
  });
}

export function todoSuiteReport(): SuiteReport {
  const test = suiteTestReport();
  const todo = "write the edge case";
  const group = suiteGroupReport({
    todos: [todo],
    tests: [test],
  });

  return suiteReport({
    fileName: "assembly/todo.spec.ts",
    pass: true,
    testCount: 1,
    testPassCount: 1,
    groupCount: 1,
    groupPassCount: 1,
    rootRuntime: 6,
    hasResults: true,
    todoCount: 1,
    groups: [group],
    results: [test, { type: "todo", groupName: group.name, description: todo } as SuiteResultReport],
  });
}

export function warningSuiteReport(): SuiteReport {
  return suiteReport({
    fileName: "assembly/warning.spec.ts",
    pass: true,
    hasResults: true,
    warnings: [
      {
        type: "WarningType",
        message: "warning message",
        stackTrace: "warning.ts:1:1",
      },
    ],
  });
}

export function errorSuiteReport(): SuiteReport {
  return suiteReport({
    fileName: "assembly/error.spec.ts",
    pass: false,
    hasResults: true,
    errors: [
      {
        type: "ErrorType",
        message: "error message",
        stackTrace: "error.ts:2:1\nerror.ts:3:1",
      },
    ],
  });
}

export function snapshotChangeSuiteReport(): SuiteReport {
  const snapshotChange: SnapshotReportChange = {
    name: "snapshot group!~snapshot name[0]",
    lines: [
      { type: "removed", value: "old snapshot" },
      { type: "added", value: "new snapshot" },
      { type: "unchanged", value: "same snapshot" },
    ],
    result: null,
  } as unknown as SnapshotReportChange;

  return suiteReport({
    fileName: "assembly/snapshot.spec.ts",
    pass: false,
    hasResults: true,
    snapshotChanges: [snapshotChange],
    snapshotStats: {
      total: 1,
      added: 1,
      removed: 0,
      different: 0,
    },
  });
}
