# as-pect Context

This context names the project-specific testing and reflection concepts used by `as-pect`. Use these terms consistently when changing modules, interfaces, documentation, or commit messages.

## Language

**Test session**:
A full run of one or more AssemblyScript test entries through compilation, wasm instantiation, execution, reporting, and snapshot handling.
_Avoid_: Runner service, CLI workflow

**Test session entry plan**:
The ordered test entries and include files for a Test session after CLI/config globs are expanded, filtered, sorted, and deduplicated.
_Avoid_: Discovered file batch, glob result set

**Compiler IO adapter**:
The AssemblyScript compiler-facing file system seam that reads source files, lists source directories, caches successful lookups across a Test session, and captures compiler output files in memory.
_Avoid_: Filesystem wrapper, compiler cache helper

**Compiler output**:
The validated `output.wasm` binary and `output.wat` text artifacts emitted by the AssemblyScript compiler for one Test session entry.
_Avoid_: Build result blob, emitted file map

**Test session snapshot plan**:
The per-entry snapshot file path, expected snapshot loading, compare/write mode, and write/update decisions for a Test session entry.
_Avoid_: Snapshot file helper, snapshot path utility

**Test suite**:
The collected tests and groups for a single AssemblyScript test binary.
_Avoid_: Spec bundle, test file model

**Test tree**:
The hierarchy of test nodes collected from AssemblyScript `describe`, `it`, and related declarations.
_Avoid_: Tree structure, node graph

**Test node**:
A single group or test in the test tree, including its result facts, logs, todos, and child nodes.
_Avoid_: Test component, result object

**Reporter**:
An adapter that renders reportable facts from a test suite to stdout, stderr, files, or another output target.
_Avoid_: Printer, output service

**Reporting lifecycle**:
The module that publishes test suite events and final suite report facts to reporters through one seam.
_Avoid_: Reporter manager, output lifecycle service

**Suite report**:
The stable reportable facts for one completed test suite: counts, groups, tests, todos, warnings, errors, snapshot stats, and snapshot change lines.
_Avoid_: Reporter model, result DTO

**Report event**:
A reporting lifecycle event that carries a suite report, group report, or test report to reporter adapters. Compatibility-only event fields may expose the old `TestContext` or `TestNode` seam for legacy reporters.
_Avoid_: Callback payload, event DTO

**Snapshot lifecycle**:
The rules for parsing expected snapshots, recording actual snapshots, diffing them, deciding pass/fail, and planning updates.
_Avoid_: Snapshot utility, snapshot manager

**Wasm host**:
The JavaScript-side interface that exposes `__aspect` imports and runtime facts to AssemblyScript test code.
_Avoid_: Runtime bridge, host service

**Class reflection transform**:
The AssemblyScript transform module that generates class reflection methods consumed by runtime `Reflect` helpers.
_Avoid_: Reflection plugin, transform service

**Class-member plan**:
The ordered set of class members that generated class reflection methods use for strict equality and reflected key/value output.
_Avoid_: Member list, property collection
