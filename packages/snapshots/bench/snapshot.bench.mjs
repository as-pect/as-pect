#!/usr/bin/env node
import { performance } from "node:perf_hooks";
import { Snapshot, SnapshotLifecycle } from "../lib/index.js";

const DEFAULT_ITERATIONS = 15;
const DEFAULT_WARMUP_ITERATIONS = 3;
const benchmarkVersion = 1;

const iterations = readPositiveInteger("SNAPSHOT_BENCH_ITERATIONS", DEFAULT_ITERATIONS);
const warmupIterations = readPositiveInteger("SNAPSHOT_BENCH_WARMUP", DEFAULT_WARMUP_ITERATIONS);

const cases = [
  createUnchangedSnapshotsCase(),
  createAddedSnapshotsCase(),
  createChangedSnapshotsCase(),
  createLargeMultilineValuesCase(),
  createRepeatedBacktickValuesCase(),
];

for (const benchmarkCase of cases) {
  runCase(benchmarkCase);
}

function runCase(benchmarkCase) {
  const operations = {
    parse: () => {
      Snapshot.parse(benchmarkCase.actualText);
    },
    diff: () => {
      benchmarkCase.actual.diff(benchmarkCase.expected);
    },
    lifecycle: () => {
      new SnapshotLifecycle(benchmarkCase.actual, benchmarkCase.expected);
    },
    stringify: () => {
      benchmarkCase.actual.stringify();
    },
  };

  for (const [operation, run] of Object.entries(operations)) {
    const samples = measure(run);
    const totalMs = samples.reduce((total, sample) => total + sample, 0);
    const meanMs = totalMs / samples.length;
    const minMs = Math.min(...samples);
    const maxMs = Math.max(...samples);

    process.stdout.write(
      `${JSON.stringify({
        benchmark: "snapshots",
        version: benchmarkVersion,
        case: benchmarkCase.name,
        operation,
        snapshots: benchmarkCase.snapshots,
        actualSnapshots: benchmarkCase.actual.values.size,
        expectedSnapshots: benchmarkCase.expected.values.size,
        iterations: samples.length,
        warmupIterations,
        totalMs: roundMilliseconds(totalMs),
        meanMs: roundMilliseconds(meanMs),
        minMs: roundMilliseconds(minMs),
        maxMs: roundMilliseconds(maxMs),
      })}\n`,
    );
  }
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

function createUnchangedSnapshotsCase() {
  const actual = createSnapshot(1000, (index) => [`unchanged[${index}]`, createValue(index)]);
  const expected = createSnapshot(1000, (index) => [`unchanged[${index}]`, createValue(index)]);
  return createBenchmarkCase("1k-unchanged", actual, expected);
}

function createAddedSnapshotsCase() {
  const actual = createSnapshot(1000, (index) => [`added[${index}]`, createValue(index)]);
  const expected = new Snapshot();
  return createBenchmarkCase("1k-added", actual, expected);
}

function createChangedSnapshotsCase() {
  const actual = createSnapshot(1000, (index) => [`changed[${index}]`, createValue(index, "actual")]);
  const expected = createSnapshot(1000, (index) => [`changed[${index}]`, createValue(index, "expected")]);
  return createBenchmarkCase("1k-changed", actual, expected);
}

function createLargeMultilineValuesCase() {
  const actual = createSnapshot(100, (index) => [`large-multiline[${index}]`, createLargeMultilineValue(index, "actual")]);
  const expected = createSnapshot(100, (index) => [`large-multiline[${index}]`, createLargeMultilineValue(index, "expected")]);
  return createBenchmarkCase("large-multiline-values", actual, expected);
}

function createRepeatedBacktickValuesCase() {
  const actual = createSnapshot(1000, (index) => [
    `backtick\`key\`${index}`,
    `value ${index} contains \`single\`, \`\`double\`\`, and \`\`\`triple\`\`\` backticks`,
  ]);
  const expected = createSnapshot(1000, (index) => [
    `backtick\`key\`${index}`,
    `value ${index} contains \`single\`, \`\`double\`\`, and \`\`\`triple\`\`\` backticks`,
  ]);
  return createBenchmarkCase("repeated-backtick-values", actual, expected);
}

function createBenchmarkCase(name, actual, expected) {
  return {
    name,
    actual,
    expected,
    actualText: actual.stringify(),
    snapshots: Math.max(actual.values.size, expected.values.size),
  };
}

function createSnapshot(size, createEntry) {
  return Snapshot.from(new Map(Array.from({ length: size }, (_, index) => createEntry(index))));
}

function createValue(index, prefix = "value") {
  return `${prefix} ${index}\n  alpha: ${index}\n  beta: ${index * 2}\n  gamma: ${index * 3}`;
}

function createLargeMultilineValue(index, prefix) {
  return Array.from({ length: 80 }, (_, line) => `${prefix} ${index} line ${line}: ${"x".repeat((line % 12) + 1)}`).join("\n");
}

function readPositiveInteger(name, fallback) {
  const value = process.env[name];
  if (value === undefined) return fallback;

  const parsed = Number.parseInt(value, 10);
  return Number.isFinite(parsed) && parsed > 0 ? parsed : fallback;
}

function roundMilliseconds(value) {
  return Math.round(value * 1000) / 1000;
}
