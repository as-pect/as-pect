# Snapshot benchmarks

Run the snapshot benchmark harness from the repository root:

```sh
npm run bench:snapshots
```

Or run only the package command:

```sh
npm run bench --workspace @as-pect/snapshots
```

The harness uses `node:perf_hooks` and adds no benchmark dependency. It prints one JSON object per line so results can be captured by scripts. Each line identifies the benchmark case, the operation (`parse`, `diff`, `lifecycle`, or `stringify`), iteration counts, and elapsed milliseconds.

Benchmark output is informational only. It is not a pass/fail test gate unless explicit thresholds are added in a future slice.

Optional environment variables:

- `SNAPSHOT_BENCH_ITERATIONS`: measured iterations per operation. Defaults to `15`.
- `SNAPSHOT_BENCH_WARMUP`: warmup iterations per operation. Defaults to `3`.
