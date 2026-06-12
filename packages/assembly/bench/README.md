# Assembly reflection equality benchmarks

This directory contains AssemblyScript benchmarks for the runtime cost of `Reflect.equals`.
They are deliberately compiled outside the normal `@as-pect/assembly` build and test flow so
benchmark fixtures do not affect package tests or published runtime artifacts.

## Run

From the repository root:

```sh
npm run bench:assembly-reflect
```

Or from `packages/assembly`:

```sh
npm run bench:reflect
```

The command compiles `bench/assembly/reflect-equality.ts` to ignored files under
`bench/build/`, then runs `bench/reflect-equality.bench.mjs` against the generated wasm.
Each output line is JSON for one case.

## Environment variables

- `ASPECT_REFLECT_BENCH_ITERATIONS`: measured samples per case. Default: `10`.
- `ASPECT_REFLECT_BENCH_WARMUP`: warmup samples per case. Default: `3`.
- `ASPECT_REFLECT_BENCH_INNER`: `Reflect.equals` calls inside each measured sample. Default: `20`.
- `ASPECT_REFLECT_BENCH_FILTER`: substring filter matched against the case name.

## Cases

- `Set<i32>` equality for sizes 10, 100, and 1000.
- `Map<string, i32>` equality for sizes 10, 100, and 1000.
- Nested `i32[][][]` equality.
- Transformed class equality using the `@as-pect/transform` generated strict-equality member.
- Cyclic transformed class equality.
