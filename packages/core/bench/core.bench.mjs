#!/usr/bin/env node
import { performance } from "node:perf_hooks";
import { ReportingLifecycle, SuiteReport, SummaryReporter, TestNode, VerboseReporter } from "../lib/index.js";
import { ReflectedValue } from "../lib/util/ReflectedValue.js";
import { stringifyReflectedValue } from "../lib/util/stringifyReflectedValue.js";

const DEFAULT_ITERATIONS = 10;
const DEFAULT_WARMUP_ITERATIONS = 3;
const benchmarkVersion = 1;

const iterations = readPositiveInteger("CORE_BENCH_ITERATIONS", DEFAULT_ITERATIONS);
const warmupIterations = readPositiveInteger("CORE_BENCH_WARMUP", DEFAULT_WARMUP_ITERATIONS);
const filter = process.env.CORE_BENCH_FILTER || "";
let sink = 0;

const TestNodeType = {
  Test: 0,
  Group: 1,
};

const ReflectedValueType = {
  None: 0,
  Class: 1,
  String: 2,
  ArrayBuffer: 3,
  Map: 4,
  Set: 5,
  Function: 6,
  Integer: 7,
  Float: 8,
  Boolean: 9,
  Array: 10,
  TypedArray: 11,
  Finite: 12,
  Truthy: 13,
  Falsy: 14,
};

const identity = (value) => value;
const stringifyOptions = {
  classNameFormatter: identity,
  indent: 0,
  keywordFormatter: identity,
  maxExpandLevel: Infinity,
  maxLineLength: Infinity,
  maxPropertyCount: Infinity,
  numberFormatter: identity,
  stringFormatter: identity,
  tab: 2,
};

const reportingCases = [
  createLargeFlatSuiteCase(),
  createNestedSuiteCase(),
  createManyTodosSuiteCase(),
  createManyLogsSuiteCase(),
];

const stringifyCases = [
  createLargeArrayStringifyCase(),
  createNestedClassStringifyCase(),
  createCyclicClassStringifyCase(),
  createLargeMapStringifyCase(),
  createLargeSetStringifyCase(),
  createPropertyLimitStringifyCase(),
];

for (const benchmarkCase of reportingCases) {
  if (shouldRun(benchmarkCase.name)) runReportingCase(benchmarkCase);
}

for (const benchmarkCase of stringifyCases) {
  if (shouldRun(benchmarkCase.name)) runStringifyCase(benchmarkCase);
}

function runReportingCase(benchmarkCase) {
  const report = SuiteReport.from(benchmarkCase.suite);
  const writer = createCountingWriter();
  const lifecycleReporter = createReportSinkReporter(writer);
  const summaryReporter = new SummaryReporter();
  summaryReporter.stdout = writer;
  summaryReporter.stderr = writer;
  const verboseReporter = new VerboseReporter();
  verboseReporter.stdout = writer;
  verboseReporter.stderr = writer;

  const operations = {
    "suite-report-from": () => {
      consume(SuiteReport.from(benchmarkCase.suite).results.length);
    },
    "reporting-lifecycle-finish": () => {
      new ReportingLifecycle(benchmarkCase.suite, lifecycleReporter).finish();
    },
    "summary-report-finish": () => {
      summaryReporter.onReportFinish({ context: benchmarkCase.suite, report });
    },
    "verbose-lifecycle-events": () => {
      const lifecycle = new ReportingLifecycle(benchmarkCase.suite, verboseReporter);
      visitLifecycleEvents(benchmarkCase.suite.rootNode, lifecycle);
      lifecycle.finish();
    },
  };

  for (const [operation, run] of Object.entries(operations)) {
    reportResult({
      area: "reporting",
      case: benchmarkCase.name,
      operation,
      metrics: benchmarkCase.metrics,
      samples: measure(run),
    });
  }
}

function runStringifyCase(benchmarkCase) {
  const operations = {
    stringify: () => {
      consume(stringifyReflectedValue(benchmarkCase.value, benchmarkCase.options).length);
    },
  };

  for (const [operation, run] of Object.entries(operations)) {
    reportResult({
      area: "stringify-reflected-value",
      case: benchmarkCase.name,
      operation,
      metrics: benchmarkCase.metrics,
      samples: measure(run),
    });
  }
}

function reportResult({ area, case: caseName, operation, metrics, samples }) {
  const totalMs = samples.reduce((total, sample) => total + sample, 0);
  const meanMs = totalMs / samples.length;
  const minMs = Math.min(...samples);
  const maxMs = Math.max(...samples);

  process.stdout.write(
    `${JSON.stringify({
      benchmark: "core",
      version: benchmarkVersion,
      area,
      case: caseName,
      operation,
      iterations: samples.length,
      warmupIterations,
      totalMs: roundMilliseconds(totalMs),
      meanMs: roundMilliseconds(meanMs),
      minMs: roundMilliseconds(minMs),
      maxMs: roundMilliseconds(maxMs),
      ...metrics,
    })}\n`,
  );
}

function measure(run) {
  for (let i = 0; i < warmupIterations; i++) {
    run();
  }

  const samples = [];
  for (let i = 0; i < iterations; i++) {
    const start = performance.now();
    run();
    samples.push(performance.now() - start);
  }
  return samples;
}

function createLargeFlatSuiteCase() {
  const rootNode = createRootNode();
  const group = createGroup("large flat suite", rootNode);
  for (let i = 0; i < 2_000; i++) {
    createTest(`flat test ${i}`, group);
  }
  return createReportingCase("large-flat-suite", rootNode);
}

function createNestedSuiteCase() {
  const rootNode = createRootNode();
  createNestedGroups(rootNode, 0, 4, 4, 3);
  return createReportingCase("nested-suites", rootNode);
}

function createManyTodosSuiteCase() {
  const rootNode = createRootNode();
  const group = createGroup("todo heavy suite", rootNode);
  for (let i = 0; i < 50; i++) {
    createTest(`covered behavior ${i}`, group);
  }
  for (let i = 0; i < 2_000; i++) {
    group.todos.push(`todo behavior ${i}`);
  }
  return createReportingCase("many-todos", rootNode);
}

function createManyLogsSuiteCase() {
  const rootNode = createRootNode();
  const group = createGroup("log heavy suite", rootNode);
  for (let i = 0; i < 250; i++) {
    group.logs.push(createReflectedString(`group log ${i}`));
    const logs = Array.from({ length: 8 }, (_, logIndex) =>
      createReflectedString(`test ${i} log ${logIndex}: ${"detail ".repeat(6)}`),
    );
    createTest(`logged test ${i}`, group, { logs });
  }
  return createReportingCase("many-logs", rootNode);
}

function createNestedGroups(parent, depth, maxDepth, fanout, testsPerGroup) {
  if (depth === maxDepth) return;

  for (let i = 0; i < fanout; i++) {
    const group = createGroup(`group ${depth}.${i}`, parent);
    for (let testIndex = 0; testIndex < testsPerGroup; testIndex++) {
      createTest(`test ${depth}.${i}.${testIndex}`, group);
    }
    createNestedGroups(group, depth + 1, maxDepth, fanout, testsPerGroup);
  }
}

function createReportingCase(name, rootNode) {
  const snapshotLifecycle = createEmptySnapshotLifecycle();
  const metrics = collectTreeMetrics(rootNode);
  const suite = {
    fileName: `assembly/${name}.spec.ts`,
    pass: true,
    testCount: metrics.tests,
    testPassCount: metrics.tests,
    groupCount: metrics.groups,
    groupPassCount: metrics.groups,
    rootRuntime: rootNode.deltaT,
    rootNode,
    warnings: [],
    errors: [],
    snapshotLifecycle,
    snapshotDiff: snapshotLifecycle.diff,
  };
  return { name, suite, metrics };
}

function createEmptySnapshotLifecycle() {
  return {
    diff: {
      results: new Map(),
    },
    stats: {
      addedSnapshots: 0,
      removedSnapshots: 0,
      changedSnapshots: 0,
    },
  };
}

function createRootNode() {
  const rootNode = new TestNode();
  rootNode.type = TestNodeType.Group;
  rootNode.name = "root";
  rootNode.pass = true;
  rootNode.ran = true;
  rootNode.start = 0;
  rootNode.end = 1;
  return rootNode;
}

function createGroup(name, parent) {
  const group = new TestNode();
  group.type = TestNodeType.Group;
  group.name = name;
  group.pass = true;
  group.ran = true;
  group.start = 0;
  group.end = 1;
  group.parent = parent;
  parent.children.push(group);
  return group;
}

function createTest(name, parent, options = {}) {
  const test = new TestNode();
  test.type = TestNodeType.Test;
  test.name = name;
  test.pass = options.pass ?? true;
  test.ran = true;
  test.start = 0;
  test.end = 1;
  test.parent = parent;
  test.logs = options.logs ?? [];
  parent.children.push(test);
  return test;
}

function collectTreeMetrics(rootNode) {
  const metrics = {
    groups: 0,
    tests: 0,
    todos: 0,
    logs: rootNode.logs.length,
    nodes: 1,
  };

  rootNode.visit((node) => {
    metrics.nodes += 1;
    metrics.todos += node.todos.length;
    metrics.logs += node.logs.length;
    if (node.type === TestNodeType.Group) {
      metrics.groups += 1;
    } else {
      metrics.tests += 1;
    }
  });

  return metrics;
}

function createLargeArrayStringifyCase() {
  const value = createArrayValue("Array<i32>", 5_000, (index) => createReflectedInteger(index));
  return createStringifyCase("large-array", value, { elements: value.values.length });
}

function createNestedClassStringifyCase() {
  const value = createNestedClassValue("NestedClass", 5, 5);
  return createStringifyCase("nested-classes", value, { depth: 5, propertiesPerLevel: 5 });
}

function createCyclicClassStringifyCase() {
  const value = createClassValue("CyclicClass");
  pushClassProperty(value, "name", createReflectedString("cycle root"));
  pushClassProperty(value, "self", value);
  const child = createClassValue("CyclicChild");
  pushClassProperty(child, "parent", value);
  pushClassProperty(value, "child", child);
  return createStringifyCase("cyclic-classes", value, { objects: 2, cycles: 2 });
}

function createLargeMapStringifyCase() {
  const value = createClassValue("Map<string, i32>", ReflectedValueType.Map);
  for (let i = 0; i < 2_000; i++) {
    value.keys.push(createReflectedString(`key ${i}`));
    value.values.push(createReflectedInteger(i));
  }
  return createStringifyCase("large-map", value, { entries: value.values.length });
}

function createLargeSetStringifyCase() {
  const value = createArrayValue("Set<i32>", 2_000, (index) => createReflectedInteger(index), ReflectedValueType.Set);
  return createStringifyCase("large-set", value, { entries: value.values.length });
}

function createPropertyLimitStringifyCase() {
  const value = createClassValue("WideClass");
  for (let i = 0; i < 2_000; i++) {
    pushClassProperty(value, `property${i}`, createReflectedInteger(i));
  }
  return createStringifyCase("property-count-limit", value, { properties: value.keys.length, maxPropertyCount: 25 }, {
    ...stringifyOptions,
    maxPropertyCount: 25,
  });
}

function createStringifyCase(name, value, metrics, options = stringifyOptions) {
  return { name, value, options, metrics };
}

function createNestedClassValue(typeName, depth, width) {
  const value = createClassValue(`${typeName}${depth}`);
  for (let i = 0; i < width; i++) {
    pushClassProperty(value, `number${i}`, createReflectedInteger(depth * 100 + i));
    pushClassProperty(value, `string${i}`, createReflectedString(`level ${depth} value ${i}`));
  }
  if (depth > 0) {
    pushClassProperty(value, "child", createNestedClassValue(typeName, depth - 1, width));
  }
  return value;
}

function createClassValue(typeName, type = ReflectedValueType.Class) {
  const value = new ReflectedValue();
  value.type = type;
  value.typeName = typeName;
  value.keys = [];
  value.values = [];
  return value;
}

function pushClassProperty(parent, key, value) {
  parent.keys.push(createReflectedString(key));
  parent.values.push(value);
}

function createArrayValue(typeName, length, createElement, type = ReflectedValueType.Array) {
  const value = new ReflectedValue();
  value.type = type;
  value.typeName = typeName;
  value.values = Array.from({ length }, (_, index) => createElement(index));
  return value;
}

function createReflectedInteger(value) {
  const reflectedValue = new ReflectedValue();
  reflectedValue.type = ReflectedValueType.Integer;
  reflectedValue.typeName = "i32";
  reflectedValue.value = value;
  return reflectedValue;
}

function createReflectedString(value, stack = "") {
  const reflectedValue = new ReflectedValue();
  reflectedValue.type = ReflectedValueType.String;
  reflectedValue.typeName = "string";
  reflectedValue.value = value;
  reflectedValue.stack = stack;
  return reflectedValue;
}

function createCountingWriter() {
  return {
    count: 0,
    write(value) {
      this.count += value.length;
      consume(this.count);
    },
  };
}

function createReportSinkReporter(writer) {
  return {
    stdout: writer,
    stderr: writer,
    onEnter(_context, _node) {},
    onExit(_context, _node) {},
    onFinish(_context) {},
    onReportGroupStart(event) {
      consume(event.group.tests.length);
    },
    onReportGroupFinish(event) {
      consume(event.group.tests.length + event.group.todos.length);
    },
    onReportTestStart(event) {
      consume(event.test.name.length);
    },
    onReportTestFinish(event) {
      consume(event.test.name.length + event.test.logs.length);
    },
    onReportFinish(event) {
      consume(event.report.results.length);
    },
  };
}

function visitLifecycleEvents(node, lifecycle) {
  for (const child of node.children) {
    lifecycle.enter(child);
    if (child.type === TestNodeType.Group) {
      visitLifecycleEvents(child, lifecycle);
    }
    lifecycle.exit(child);
  }
}

function consume(value) {
  sink = (sink + value) | 0;
}

process.on("exit", () => {
  if (sink === Number.MIN_SAFE_INTEGER) process.stderr.write("");
});

function readPositiveInteger(name, fallback) {
  const value = process.env[name];
  if (value === undefined) return fallback;

  const parsed = Number.parseInt(value, 10);
  return Number.isFinite(parsed) && parsed > 0 ? parsed : fallback;
}

function roundMilliseconds(value) {
  return Math.round(value * 1000) / 1000;
}

function shouldRun(name) {
  return filter === "" || name.includes(filter);
}
