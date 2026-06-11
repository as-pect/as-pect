# Agent TODO — as-pect architecture deepening

Date: June 11, 2026

Source report: `.pi/reports/architecture-review-20260611-144134.html`

## Purpose

Deepen the architecture of `as-pect` so testing AssemblyScript projects stays simple, fast, and dependable.

This TODO turns the architecture review candidates into independently reviewable implementation work. Prefer small, atomic commits. Each phase should preserve existing public behavior unless a task explicitly says otherwise.

## Vocabulary to preserve

Use these terms in code comments, docs, commit messages, and issue text when relevant:

- **Module** — anything with an interface and implementation.
- **Interface** — everything callers must know to use the module correctly.
- **Implementation** — code inside a module.
- **Depth** — leverage at the interface.
- **Deep** — much behavior behind a small interface.
- **Shallow** — interface nearly as complex as implementation.
- **Seam** — where an interface lives.
- **Adapter** — concrete thing satisfying an interface at a seam.
- **Leverage** — what callers get from depth.
- **Locality** — what maintainers get from depth.

Avoid substituting “component,” “service,” “API,” or “boundary” when these terms apply.

## Project notes from review

- No `CONTEXT.md` was found.
- No `docs/adr/` directory was found.
- Existing domain terms used here:
  - test session
  - test suite
  - test tree
  - test node
  - reporter
  - snapshot lifecycle
  - wasm host
  - class reflection transform
- If new domain names are introduced during implementation, add or update `CONTEXT.md` before relying on them broadly.

## Recommended order

1. Reporting lifecycle
2. Snapshot lifecycle
3. Test session
4. Wasm host
5. Class reflection transform

Reason: reporting already has multiple adapters, so the seam is real. Snapshot lifecycle is smaller and reduces leakage before the CLI/test session work. The wasm host and transform are deeper internals and should come after observable behavior is better protected.

---

# Phase 0 — Safety rails

## Goal

Create enough characterization coverage to refactor safely.

## Files to inspect

- `packages/core/__tests__/`
- `packages/core/src/test/TestContext.ts`
- `packages/core/src/reporter/*.ts`
- `packages/cli/src/index.ts`
- `packages/snapshots/src/*.ts`
- `packages/csv-reporter/index.ts`
- `packages/json-reporter/index.ts`
- `packages/transform/src/*.ts`

## Tasks

- [ ] Run the current test suite and record the baseline command/output.
  - Likely command: `npm test`
  - If too slow, run focused workspace tests first and document why.
- [ ] Run typechecking and record the baseline command/output.
  - Likely command: `npm run tsc:all`
- [ ] Identify snapshot tests that protect reporter output.
- [ ] Identify gaps where modules have no direct tests.
- [ ] Add characterization tests only where a later phase would otherwise be unsafe.

## Acceptance criteria

- [ ] Baseline test/typecheck behavior is known.
- [ ] Any new characterization tests pass before refactoring.
- [ ] No public behavior is intentionally changed in this phase.

---

# Phase 1 — Deepen the reporting lifecycle

## Recommendation strength

Strong

## Dependency category

ports & adapters

## Files involved

- `packages/core/src/reporter/IReporter.ts`
- `packages/core/src/reporter/CombinationReporter.ts`
- `packages/core/src/reporter/SummaryReporter.ts`
- `packages/core/src/reporter/VerboseReporter.ts`
- `packages/core/src/reporter/EmptyReporter.ts`
- `packages/core/src/test/TestContext.ts`
- `packages/csv-reporter/index.ts`
- `packages/json-reporter/index.ts`
- `packages/cli/src/collectReporter.ts`
- reporter tests in `packages/core/__tests__/`

## Current problem

Reporter adapters cross the seam and depend on `TestContext` / `TestNode` shape. The current reporter interface is shallow: each adapter must know traversal details, suite shape, snapshot diff shape, and sometimes file-output timing.

## Target solution

Create a deep reporting lifecycle module. `TestContext` should publish lifecycle facts through one seam. Output adapters should focus on rendering or writing, not reconstructing the test tree or interpreting suite internals.

## Design questions before coding

- [ ] What is the smallest reportable suite view adapters need?
- [ ] Which facts are stable enough for the reporting interface?
- [ ] Should adapters receive events, a final suite report, or both?
- [ ] How do custom reporters stay compatible?
- [ ] Does `IReporter` need a compatibility adapter for the old interface?
- [ ] Should CSV/JSON open files on suite start, root enter, or finalization?

## Implementation checklist

### 1. Characterize current reporter behavior

- [ ] Preserve `SummaryReporter` snapshot output.
- [ ] Preserve `VerboseReporter` snapshot output.
- [ ] Add focused tests for `CombinationReporter` writer propagation.
  - Note: inspect current `stderr` setter behavior; it appears to assign `stdout`.
- [ ] Add or update tests for CSV and JSON reporter file lifecycle if practical.

### 2. Name the new module

Potential names:

- `ReportingLifecycle`
- `SuiteReport`
- `ReportEvents`
- `ReportAdapter`

Tasks:

- [ ] Pick names that match existing domain language.
- [ ] If the names are new domain terms, create/update `CONTEXT.md`.

### 3. Define the reporting seam

- [ ] Define a small interface that hides `TestContext` internals.
- [ ] Keep the interface focused on reportable facts.
- [ ] Avoid exposing mutable `TestNode` objects unless required for compatibility.
- [ ] Consider a compatibility adapter from old `IReporter` to the new seam.

### 4. Move lifecycle ordering into one implementation

- [ ] Concentrate `onEnter` / `onExit` / `onFinish` ordering decisions.
- [ ] Concentrate group/test filtering rules visible to reporters.
- [ ] Concentrate snapshot-diff report facts.
- [ ] Keep output adapters thin.

### 5. Update adapters

- [ ] Update `SummaryReporter` to consume the new report facts.
- [ ] Update `VerboseReporter` to consume the new report facts.
- [ ] Update `CSVReporter` to consume the new report facts.
- [ ] Update `JSONReporter` to consume the new report facts.
- [ ] Update `CombinationReporter` to combine adapters at the new seam.
- [ ] Keep `EmptyReporter` simple.

### 6. Preserve compatibility

- [ ] Preserve exports from `packages/core/src/index.ts` unless intentionally changed.
- [ ] Preserve custom reporter behavior or provide a compatibility adapter.
- [ ] Document any unavoidable interface changes.

## Tests

- [ ] `npm run tsc:all`
- [ ] `npm test`
- [ ] Focused core reporter tests
- [ ] Focused csv/json reporter tests if added

## Acceptance criteria

- [ ] Reporter adapters no longer need to walk mutable `TestNode` internals directly, or the remaining usages are explicitly compatibility-only.
- [ ] Reporting lifecycle behavior has one test surface.
- [ ] Summary, verbose, CSV, and JSON adapters still produce equivalent output.
- [ ] Public compatibility is preserved or documented.

## Expected benefits

- locality: reporter bugs concentrate in one module
- leverage: four adapters benefit from one implementation
- tests hit one interface
- `TestNode` stops leaking across the reporting seam

---

# Phase 2 — Deepen the snapshot lifecycle

## Recommendation strength

Worth exploring

## Dependency category

local-substitutable

## Files involved

- `packages/snapshots/src/Snapshot.ts`
- `packages/snapshots/src/SnapshotDiff.ts`
- `packages/snapshots/src/SnapshotDiffResult.ts`
- `packages/core/src/test/TestContext.ts`
- `packages/core/src/reporter/SummaryReporter.ts`
- `packages/core/src/reporter/VerboseReporter.ts`
- `packages/cli/src/index.ts`
- snapshot tests in `packages/snapshots/__tests__/`
- reporter snapshot tests in `packages/core/__tests__/`

## Current problem

Snapshot rules leak across snapshots, core, reporters, and CLI. Parse/stringify lives in `@as-pect/snapshots`; pass/fail rules live in `TestContext`; update/write rules live in the CLI; diff rendering lives in reporters.

## Target solution

Deepen snapshots into a snapshot lifecycle module that owns parse, record actual, diff, pass/fail, update decisions, and report facts.

## Design questions before coding

- [ ] Is the snapshot lifecycle owned by `@as-pect/snapshots` or `@as-pect/core`?
- [ ] Which part should remain pure and local-substitutable?
- [ ] Does filesystem I/O belong outside the lifecycle module behind an adapter?
- [ ] Should “Added” snapshots pass by default remain unchanged?
- [ ] What report facts do reporters need to render diffs without reading raw internals?

## Implementation checklist

### 1. Characterize current snapshot behavior

- [ ] Preserve `Snapshot.parse()` behavior.
- [ ] Preserve `Snapshot.stringify()` behavior.
- [ ] Preserve `Snapshot.diff()` behavior.
- [ ] Preserve `TestContext.pass` snapshot behavior.
- [ ] Preserve CLI update behavior for added snapshots.
- [ ] Preserve reporter diff output.

### 2. Name the lifecycle module

Potential names:

- `SnapshotLifecycle`
- `SnapshotRun`
- `SnapshotPlan`
- `SnapshotReport`

Tasks:

- [ ] Pick the smallest name that matches the domain.
- [ ] Add/update `CONTEXT.md` if the name becomes project vocabulary.

### 3. Concentrate snapshot decisions

- [ ] Move pass/fail calculation out of `TestContext` into snapshot lifecycle implementation.
- [ ] Move added/removed/changed counting into snapshot lifecycle implementation.
- [ ] Move update plan creation out of CLI loops.
- [ ] Expose report facts for reporters.
- [ ] Keep parse/stringify stable.

### 4. Separate pure decisions from I/O

- [ ] Keep file read/write in CLI or behind a local adapter.
- [ ] Let the lifecycle produce an update plan rather than writing directly, unless there is a strong reason otherwise.
- [ ] Test lifecycle decisions without filesystem access.

### 5. Update callers

- [ ] Update `TestContext` to ask the snapshot lifecycle whether snapshots pass.
- [ ] Update CLI to apply the snapshot update plan.
- [ ] Update reporters to consume snapshot report facts.

## Tests

- [ ] `npm run tsc:all`
- [ ] `npm test`
- [ ] `npm run test:update-snapshots -- --dry-run` if such a dry run exists; otherwise do not update snapshots unless intended.
- [ ] Focused tests for added, removed, changed, and unchanged snapshots.

## Acceptance criteria

- [ ] Snapshot lifecycle decisions are tested directly.
- [ ] `TestContext` no longer owns snapshot pass/fail rules.
- [ ] CLI no longer mutates diff results directly.
- [ ] Reporters render from snapshot report facts.
- [ ] Existing snapshot file format is preserved.

## Expected benefits

- locality: snapshot rules concentrate
- leverage: reporters reuse one set of facts
- CLI stops mutating diff internals
- snapshot tests become direct

---

# Phase 3 — Deepen the test session module

## Recommendation strength

Strong

## Dependency category

in-process

## Files involved

- `packages/cli/src/index.ts`
- `packages/cli/src/test.ts`
- `packages/cli/src/IAspectConfig.ts`
- `packages/cli/src/collectReporter.ts`
- `packages/core/src/test/TestContext.ts`
- `packages/snapshots/src/*.ts`
- CLI package configuration in `packages/cli/package.json`

## Current problem

The CLI module is shallow because one `asp()` function owns parsing, config loading, entry discovery, include discovery, compiler setup, file caching, coverage wiring, WASI wiring, instantiation, running, snapshots, summary aggregation, and process exits.

## Target solution

Create a deep test session module. The CLI parses terminal options and delegates the full test session implementation behind a small interface. The test session returns a result that the CLI can print and map to process exit.

## Design questions before coding

- [ ] What is the minimal interface for running a test session?
- [ ] Which options are CLI-only and which belong to the test session?
- [ ] Should process exit be completely outside the test session?
- [ ] Should stdout/stderr writes be adapters?
- [ ] How should compiler `readFile`, `writeFile`, and `listFiles` caching be tested?
- [ ] How should coverage and WASI adapters be represented?

## Implementation checklist

### 1. Characterize CLI behavior

- [ ] Add tests around CLI option mapping if no tests exist.
- [ ] Add tests for entry/include discovery if practical.
- [ ] Add tests for summary result formatting if practical.
- [ ] Confirm current behavior for `--version`, `--init`, `--no-run`, `--output-binary`, and `--update-snapshots`.

### 2. Name the module

Preferred name from review: `TestSession`.

Tasks:

- [ ] Add `TestSession` to `CONTEXT.md` if it becomes project vocabulary.
- [ ] Place implementation where package dependencies remain clean.
  - Likely `packages/cli/src/TestSession.ts` initially.

### 3. Extract pure session configuration

- [ ] Convert commander options + config into a typed session configuration.
- [ ] Separate terminal concerns from session concerns.
- [ ] Validate regex and memory options in one place.

### 4. Extract session execution

- [ ] Move entry discovery into the test session implementation.
- [ ] Move include discovery into the test session implementation.
- [ ] Move compiler invocation/caching into the test session implementation.
- [ ] Move instantiate/run orchestration into the test session implementation.
- [ ] Move per-entry result aggregation into the test session implementation.
- [ ] Use the snapshot lifecycle module from Phase 2.

### 5. Return a result instead of exiting

- [ ] Return a test session result with pass/fail, counts, and printable summary facts.
- [ ] Keep `process.exit()` only in the CLI shell.
- [ ] Keep stdout/stderr writing at the edge where practical.

### 6. Preserve CLI behavior

- [ ] Keep current command names: `asp`, `aspect`.
- [ ] Preserve config defaults.
- [ ] Preserve output binary behavior.
- [ ] Preserve no-run behavior.
- [ ] Preserve snapshot update behavior.
- [ ] Preserve coverage behavior.
- [ ] Preserve WASI behavior.

## Tests

- [ ] `npm run tsc:all`
- [ ] `npm test`
- [ ] Focused tests for `TestSession` without `process.exit()`.
- [ ] Manual smoke test of CLI against an existing AssemblyScript test fixture.

## Acceptance criteria

- [ ] `asp()` becomes a small CLI shell.
- [ ] Test session behavior is testable without starting a separate process.
- [ ] Process exit is outside the deep test session module.
- [ ] Compiler/file/snapshot orchestration has locality.
- [ ] User-visible CLI behavior is preserved.

## Expected benefits

- locality: runner bugs concentrate
- leverage: CLI becomes small
- snapshot rules stop leaking
- session tests avoid `process.exit()`

---

# Phase 4 — Deepen the wasm host module

## Recommendation strength

Worth exploring

## Dependency category

ports & adapters

## Files involved

- `packages/core/src/test/TestContext.ts`
- `packages/core/src/util/IAspectExports.ts`
- `packages/core/src/util/ReflectedValue.ts`
- `packages/core/src/util/ReflectedValueType.ts`
- `packages/core/src/util/rTrace.d.ts`
- `packages/assembly/assembly/internal/Reflect.ts`
- `packages/assembly/assembly/internal/Actual.ts`
- `packages/assembly/assembly/internal/Expected.ts`
- `packages/assembly/assembly/internal/Test.ts`
- `packages/assembly/assembly/internal/log.ts`

## Current problem

`TestContext` mixes suite traversal with wasm host implementation details: linked functions, pointer/string translation, reflection cache, rtrace installation, abort handling, trace handling, WASI imports, and target-node mutation.

## Target solution

Create a deep wasm host module that owns the host interface between AssemblyScript test code and JavaScript runtime facts. `TestContext` should consume host facts and drive suite traversal; it should not own every linked function.

## Design questions before coding

- [ ] What facts does suite traversal need from the host?
- [ ] What facts does the host need from suite traversal?
- [ ] Should `targetNode` mutation stay in `TestContext` or move behind a recorder interface?
- [ ] Can reflection cache be tested without a real wasm instance?
- [ ] How can we preserve the `__aspect` external function names?
- [ ] Does rtrace belong inside the wasm host module or behind an internal adapter?

## Implementation checklist

### 1. Characterize host behavior

- [ ] Preserve `createImports()` output shape.
- [ ] Preserve external names under `__aspect`.
- [ ] Preserve `env.abort` chaining behavior.
- [ ] Preserve trace/log behavior.
- [ ] Preserve rtrace allocation/free behavior.
- [ ] Preserve reflected value creation and stringification behavior.

### 2. Name the module

Preferred name from review: `WasmHost`.

Tasks:

- [ ] Add `WasmHost` to `CONTEXT.md` if it becomes project vocabulary.
- [ ] Decide whether it lives under `packages/core/src/host/` or `packages/core/src/test/`.

### 3. Extract host state

- [ ] Move reflected value cache into the wasm host implementation.
- [ ] Move string cache into the wasm host implementation.
- [ ] Move `getString()` / function name translation into the wasm host implementation.
- [ ] Move linked reflected-value creation functions into the wasm host implementation.

### 4. Extract import creation

- [ ] Move `createImports()` implementation into `WasmHost`.
- [ ] Keep a compatibility method on `TestContext` if needed.
- [ ] Let `TestContext` provide a suite recorder or callbacks for test tree mutations.

### 5. Extract runtime event capture

- [ ] Move `abort()` capture into the host implementation.
- [ ] Move `trace()` capture into the host implementation.
- [ ] Move rtrace install/onalloc/onfree integration into the host implementation.
- [ ] Expose collected facts through a small interface.

### 6. Update `TestContext`

- [ ] Remove direct reflection-cache manipulation.
- [ ] Remove direct import-object assembly.
- [ ] Keep traversal, filtering, before/after hooks, and result aggregation in `TestContext` unless another phase deepens them.

## Tests

- [ ] `npm run tsc:all`
- [ ] `npm test`
- [ ] Focused wasm host tests with fake wasm exports where possible.
- [ ] Existing `TestContext` pass/fail/log/WASI tests.

## Acceptance criteria

- [ ] `TestContext` shrinks meaningfully.
- [ ] The `__aspect` external seam is named and localized.
- [ ] Pointer/string/reflection bugs can be tested through the wasm host interface.
- [ ] Existing AssemblyScript tests still run.
- [ ] External function names remain compatible.

## Expected benefits

- locality: pointer bugs concentrate
- leverage: reflection tests improve
- external seam becomes named
- `TestContext` shrinks

---

# Phase 5 — Deepen the class reflection transform

## Recommendation strength

Speculative

## Dependency category

in-process

## Files involved

- `packages/transform/src/index.ts`
- `packages/transform/src/createStrictEqualsMember.ts`
- `packages/transform/src/createAddReflectedValueKeyValuePairsMember.ts`
- `packages/transform/src/createGenericTypeParameter.ts`
- `packages/transform/src/hash.ts`
- `packages/transform/src/emptyTransformer.ts`
- `packages/assembly/assembly/internal/Reflect.ts`
- `packages/transform/README.md`

## Current problem

The transform modules duplicate class-member traversal and generate magic methods that runtime reflection must know implicitly. Strict equality generation and reflected key/value generation both rediscover the same class-member plan.

## Target solution

Create a deep class reflection transform module that builds one class-member plan and generates both behaviors from it. Runtime reflection should depend on one documented generated shape.

## Design questions before coding

- [x] What is the shared class-member plan?
- [x] Which members are included: fields, getters, inherited members?
- [x] How are ignored names represented?
- [x] Should generated method names remain exactly the same?
- [x] How can transform output be tested without brittle full-AST snapshots?
- [x] What runtime assumptions should be documented in `packages/transform/README.md`?

## Implementation checklist

### 1. Characterize current transform behavior

- [x] Compile existing AssemblyScript test fixtures with the transform.
- [x] Preserve strict equality behavior.
- [x] Preserve reflected key/value behavior.
- [x] Preserve inherited-member ignore behavior.
- [x] Preserve generated method names:
  - `__aspectStrictEquals`
  - `__aspectAddReflectedValueKeyValuePairs`

### 2. Name the module

Preferred name from review: `ClassReflectionTransform`.

Tasks:

- [x] Add `ClassReflectionTransform` to `CONTEXT.md` if it becomes project vocabulary.
- [x] Decide whether to create `packages/transform/src/ClassReflectionTransform.ts` or a small directory.

### 3. Introduce a member plan

- [x] Create a local representation of reflected/equality-relevant members.
- [x] Extract class-member traversal once.
- [x] Include name text, hash, range, member kind, and getter/field distinction.

### 4. Generate both behaviors from the plan

- [x] Update strict equality generation to use the plan.
- [x] Update reflected key/value generation to use the plan.
- [x] Keep helper constructors local where they improve locality.
- [x] Remove duplicated traversal.

### 5. Document generated shape

- [x] Replace placeholder `packages/transform/README.md` content.
- [x] Document what the transform injects.
- [x] Document how runtime `Reflect` depends on the generated methods.
- [x] Document compatibility expectations.

## Tests

- [x] `npm run tsc:all`
- [x] `npm test`
- [x] Focused transform tests if infrastructure exists or can be added cheaply.
- [x] Existing AssemblyScript fixtures compiled by `packages/core` scripts.

Validation note: commands were run through `corepack npm` with Node 22.22.3 on the PATH because the system `node` is v20.19.2 and the package requires Node >=22.22.2.

## Acceptance criteria

- [x] Class-member traversal exists in one place.
- [x] Both generated methods are produced from one plan.
- [x] Runtime magic method dependency is documented.
- [x] Existing transform behavior is preserved.
- [x] No new dependency is added unless strongly justified.

## Expected benefits

- locality: transform rules concentrate
- leverage: two generated methods share one plan
- README names the seam
- runtime magic is documented

---

# Cross-phase cleanup

## Documentation

- [x] Create `CONTEXT.md` if new domain terms become load-bearing.
- [ ] Consider `docs/adr/` only for decisions future agents must not re-litigate.
- [x] Update package READMEs when a public interface or generated shape changes.

## Dependency discipline

- [x] Avoid adding packages unless clearly justified.
- [x] Prefer small local implementations.
- [x] Keep startup time and test runtime in mind.

## Compatibility discipline

- [x] Preserve public exports unless a breaking change is explicitly accepted.
- [x] Preserve CLI behavior unless a change is explicitly accepted.
- [x] Preserve `@as-pect/assembly` external linked names unless a migration is planned.
- [x] Preserve snapshot file format unless a migration is planned.

## Commit discipline

Suggested commit sequence:

1. `test: characterize current architecture seams`
2. `refactor(core): deepen reporting lifecycle`
3. `refactor(snapshots): concentrate snapshot lifecycle rules`
4. `refactor(cli): extract test session module`
5. `refactor(core): extract wasm host module`
6. `refactor(transform): share class reflection member plan`
7. `docs: record architecture vocabulary and generated transform shape`

Each commit should have a descriptive message explaining intent, context, and user-visible impact.

## Final validation

- [x] `npm run tsc:all`
- [x] `npm test`
- [ ] `npm run check` if practical
- [ ] Manual CLI smoke test with `asp --summary`
- [ ] Manual CLI smoke test with `asp --verbose`
- [ ] Snapshot update smoke test in a disposable fixture
- [ ] Confirm generated report remains only in `.pi/reports/` and does not affect packages
