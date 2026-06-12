# Wasm host extraction plan

Verified: June 12, 2026

## Goal

Extract the smallest safe `Wasm host` seam from `TestContext` without changing test-suite behavior or any external AssemblyScript import names. The first extraction should be a move-only refactor: `TestContext.createImports()` remains the public compatibility method, and the generated import object must keep the existing `__aspect`, `env`, `rtrace`, and optional `wasi_snapshot_preview1` shapes.

## Current scope

`TestContext` currently owns two responsibilities that are worth separating:

1. **Test suite traversal**: running `_start()` / WASI start, visiting the test tree, applying group and test filters, running hooks, calculating pass/fail facts, calculating snapshot lifecycle facts, and publishing reporting lifecycle events.
2. **Wasm host import handling**: merging caller imports, installing `__aspect` callbacks, wrapping `env.abort`, replacing `env.trace`, installing rtrace hooks, reading wasm strings, building reflected values, recording logs/errors/snapshots on the active test node, and calling function pointers through `__call`.

The extraction should keep traversal as the owner of test-tree order and reporting. The new host module should only encapsulate imports and wasm-facing fact collection.

## External import names to protect

These AssemblyScript-facing names are compatibility boundaries and must not be renamed or moved to a different import module in the first extraction:

- `__aspect.attachStackTraceToReflectedValue`
- `__aspect.afterAll`
- `__aspect.afterEach`
- `__aspect.beforeAll`
- `__aspect.beforeEach`
- `__aspect.clearActual`
- `__aspect.clearExpected`
- `__aspect.createReflectedValue`
- `__aspect.createReflectedNumber`
- `__aspect.createReflectedLong`
- `__aspect.debug`
- `__aspect.logReflectedValue`
- `__aspect.pushReflectedObjectKey`
- `__aspect.pushReflectedObjectValue`
- `__aspect.reportActualReflectedValue`
- `__aspect.reportExpectedFalsy`
- `__aspect.reportExpectedFinite`
- `__aspect.reportExpectedReflectedValue`
- `__aspect.reportExpectedSnapshot`
- `__aspect.reportExpectedTruthy`
- `__aspect.reportGroupTypeNode`
- `__aspect.reportNegatedTestNode`
- `__aspect.reportTestTypeNode`
- `__aspect.reportTodo`
- `__aspect.tryCall`
- `env.abort` wrapper semantics: call the user-provided abort first, then record the as-pect abort message.
- `env.trace` replacement semantics: collect an as-pect trace log on the active test node.
- `rtrace` import installation and the `onalloc` / `onfree` overrides.
- `wasi_snapshot_preview1` when WASI is configured.

## Facts suite traversal needs from the host

Suite traversal should be able to ask the host for these wasm-derived facts or operations:

- **Strings**: `getString(pointer, defaultValue)` with the existing pointer normalization, null-pointer defaulting, wasm `__getString` read, and pointer cache behavior.
- **Reflected values**: access to the current actual and expected reflected values, plus the ability to clear them, create reflected values/numbers/longs, attach stack traces, append reflected keys/values, stringify snapshot values, and log reflected values.
- **Abort messages**: the latest assertion failure message recorded by the `env.abort` wrapper.
- **Trace logs**: `env.trace` should keep producing a `ReflectedValue` log with stack, `trace` type name, string type, and the current formatted trace message.
- **rtrace deltas**: active allocation/free counts must still be attributed to the current test node so `TestNode.rtraceDelta` remains unchanged.
- **Callback invocation**: `tryCall(pointer)` must keep using the instantiated `IAspectExports.__call` and must keep storing wasm-filtered stack traces when callback invocation throws.
- **Function-name lookup**: reflected function values need the same name-section/table lookup currently performed by `funcName(index)`.
- **Import object assembly**: merging user imports, preserving user non-`__aspect` imports, installing rtrace, wrapping `env.abort`, replacing `env.trace`, and adding WASI imports must stay centralized in one host-facing operation.

## Facts the host needs from suite traversal

The host should not decide traversal order. Instead, traversal must supply or expose these facts to the host:

- **Current target node**: the host needs a way to read the active `TestNode` for logs, todos, hook callback pointers, rtrace counts, errors, warnings, and snapshots. The traversal remains responsible for switching this target with `withTargetNode()`.
- **Test-node creation context**: when `reportGroupTypeNode`, `reportTestTypeNode`, or `reportNegatedTestNode` fires, the host needs the current parent node and namespace registry so it can preserve deterministic child insertion and snapshot namespace assignment.
- **Snapshot recorder**: the host needs write access to the actual snapshot collection and the current node name for `reportExpectedSnapshot()`.
- **Error recorder**: reflected-value bounds checks and rtrace failures must still append the same `IWarning` object to both the active node and suite-level error list.
- **Warning recorder**: warning handling should remain available even though the current rtrace info hook is intentionally quiet.
- **Function-name lookup context**: reflected function names need the `NameSection`, wasm table, and current wasm exports.
- **Wasm instance state**: the host must be attached to the current `IAspectExports` and `WebAssembly.Instance` before callbacks that read memory, strings, tables, or call pointers can run.
- **WASI setting**: create-import behavior needs to know whether a WASI instance was configured.

## Compatibility decision

`TestContext.createImports()` should remain as a compatibility method. The CLI, package tests, generated init template, and user configs already receive or call this function. Changing that public path would increase migration risk and is unnecessary for the first extraction.

The first implementation should make `TestContext.createImports(...imports)` delegate to a new internal host object, for example:

```ts
public createImports(...imports: any[]): any {
  return this.wasmHost.createImports(...imports);
}
```

That delegation must be behavior-preserving and should not expose the new host class as a public API until a later, separately-reviewed slice proves the seam is stable.

## Smallest safe first extraction slice

Create an internal core module such as `packages/core/src/test/WasmHost.ts` that receives a narrow adapter around `TestContext` and moves only these import-facing helpers as-is:

1. `createImports()` import merging and installation.
2. `abort()`, `trace()`, `getString()`, `getLogStackTrace()`, `getErrorStackTrace()`, and `tryCall()` if the adapter exposes the current wasm exports and stack/message setters.
3. Reflected-value cache ownership and the `createReflected*`, `pushReflectedObject*`, `logReflectedValue`, `reportActualReflectedValue`, `reportExpected*`, `clearActual`, `clearExpected`, and `attachStackTraceToReflectedValue` callbacks.
4. `onalloc()` / `onfree()` rtrace attribution, while leaving traversal to set `node.rtraceStart` / `node.rtraceEnd`.
5. `reportBeforeEach`, `reportBeforeAll`, `reportAfterEach`, `reportAfterAll`, `reportTodo`, and test/group node registration callbacks, provided the adapter exposes the active target node and namespace registry.

Do **not** move `visit()`, `run()`, `runFunctions()`, `runBeforeEach()`, `runAfterEach()`, snapshot lifecycle calculation, result aggregation, or reporting lifecycle calls in this first slice. Those are traversal responsibilities and should be extracted only after the host seam is characterized by tests.

## Test strategy for the first extraction

Use existing behavior tests as the primary regression guard:

- `packages/core/__tests__/TestContext.lifecycle.spec.ts` for active-node ownership across hooks and failures.
- `packages/core/__tests__/TestContext.pass-fail.spec.ts` for pass/fail, abort messages, actual/expected reflected values, and rtrace facts.
- `packages/core/__tests__/TestContext.log.spec.ts` for reflected value logging and stringification.
- `packages/core/__tests__/WASI.spec.ts` for WASI import preservation.
- Reporter smoke tests that instantiate through `ctx.createImports()` for end-to-end import compatibility.

Add focused unit tests for the new host only if the adapter can be tested without duplicating broad wasm snapshots. The first slice should be considered successful when the existing core tests pass without snapshot updates.

## Non-goals for the first extraction

- No public API rename.
- No external `__aspect` name changes.
- No reporter lifecycle changes.
- No snapshot lifecycle changes.
- No traversal-order changes.
- No reflected-value stringify changes.
- No rtrace behavior changes beyond moving code behind the host seam.
