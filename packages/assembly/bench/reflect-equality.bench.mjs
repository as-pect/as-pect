#!/usr/bin/env node
import { readFile } from "node:fs/promises";
import { performance } from "node:perf_hooks";

const DEFAULT_ITERATIONS = 10;
const DEFAULT_WARMUP_ITERATIONS = 3;
const DEFAULT_INNER_ITERATIONS = 20;
const benchmarkVersion = 1;

const iterations = readPositiveInteger("ASPECT_REFLECT_BENCH_ITERATIONS", DEFAULT_ITERATIONS);
const warmupIterations = readPositiveInteger("ASPECT_REFLECT_BENCH_WARMUP", DEFAULT_WARMUP_ITERATIONS);
const innerIterations = readPositiveInteger("ASPECT_REFLECT_BENCH_INNER", DEFAULT_INNER_ITERATIONS);
const filter = process.env.ASPECT_REFLECT_BENCH_FILTER || "";

const wasmPath = new URL("./build/reflect-equality.wasm", import.meta.url);
const wasmBytes = await readFile(wasmPath);
const { instance } = await WebAssembly.instantiate(wasmBytes, createImports());

const benchmarkCases = [
  {
    area: "reflect-equals-set",
    case: "set-i32-size-10",
    operation: "Reflect.equals<Set<i32>>",
    exportName: "benchSet10",
    metrics: { entries: 10 },
  },
  {
    area: "reflect-equals-set",
    case: "set-i32-size-100",
    operation: "Reflect.equals<Set<i32>>",
    exportName: "benchSet100",
    metrics: { entries: 100 },
  },
  {
    area: "reflect-equals-set",
    case: "set-i32-size-1000",
    operation: "Reflect.equals<Set<i32>>",
    exportName: "benchSet1000",
    metrics: { entries: 1000 },
  },
  {
    area: "reflect-equals-map",
    case: "map-string-i32-size-10",
    operation: "Reflect.equals<Map<string, i32>>",
    exportName: "benchMap10",
    metrics: { entries: 10 },
  },
  {
    area: "reflect-equals-map",
    case: "map-string-i32-size-100",
    operation: "Reflect.equals<Map<string, i32>>",
    exportName: "benchMap100",
    metrics: { entries: 100 },
  },
  {
    area: "reflect-equals-map",
    case: "map-string-i32-size-1000",
    operation: "Reflect.equals<Map<string, i32>>",
    exportName: "benchMap1000",
    metrics: { entries: 1000 },
  },
  {
    area: "reflect-equals-array",
    case: "nested-arrays",
    operation: "Reflect.equals<i32[][][]>",
    exportName: "benchNestedArrays",
    metrics: { depth: 3, width: 6, leafLength: 5 },
  },
  {
    area: "reflect-equals-class",
    case: "transformed-classes",
    operation: "Reflect.equals<TransformedClassNode>",
    exportName: "benchTransformedClasses",
    metrics: { depth: 5, valuesPerNode: 4 },
  },
  {
    area: "reflect-equals-class",
    case: "cyclic-classes",
    operation: "Reflect.equals<CyclicClassNode>",
    exportName: "benchCyclicClasses",
    metrics: { nodes: 32, cycles: 1 },
  },
];

for (const benchmarkCase of benchmarkCases) {
  if (shouldRun(benchmarkCase.case)) runBenchmarkCase(benchmarkCase);
}

function runBenchmarkCase(benchmarkCase) {
  const run = instance.exports[benchmarkCase.exportName];
  if (typeof run !== "function") {
    throw new Error(`Missing wasm export: ${benchmarkCase.exportName}`);
  }

  const samples = measure(() => {
    const matches = run(innerIterations);
    if (matches !== innerIterations) {
      throw new Error(
        `${benchmarkCase.case} returned ${matches}; expected ${innerIterations} successful equality matches`,
      );
    }
  });

  reportResult({
    ...benchmarkCase,
    samples,
  });
}

function reportResult({ area, case: caseName, operation, metrics, samples }) {
  const totalMs = samples.reduce((total, sample) => total + sample, 0);
  const meanMs = totalMs / samples.length;
  const minMs = Math.min(...samples);
  const maxMs = Math.max(...samples);
  const meanEqualsMs = meanMs / innerIterations;

  process.stdout.write(
    `${JSON.stringify({
      benchmark: "assembly-reflect-equality",
      version: benchmarkVersion,
      area,
      case: caseName,
      operation,
      iterations: samples.length,
      warmupIterations,
      innerIterations,
      totalMs: roundMilliseconds(totalMs),
      meanMs: roundMilliseconds(meanMs),
      minMs: roundMilliseconds(minMs),
      maxMs: roundMilliseconds(maxMs),
      meanEqualsMs: roundMilliseconds(meanEqualsMs),
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

function createImports() {
  return {
    env: {
      abort(message, file, line, column) {
        throw new Error(`AssemblyScript abort at ${line}:${column}`);
      },
    },
    __aspect: {
      attachStackTraceToReflectedValue() {},
      createReflectedValue() {
        return 0;
      },
      createReflectedNumber() {
        return 0;
      },
      createReflectedLong() {
        return 0;
      },
      pushReflectedObjectValue() {},
      pushReflectedObjectKey() {},
    },
  };
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

function shouldRun(name) {
  return filter === "" || name.includes(filter);
}
