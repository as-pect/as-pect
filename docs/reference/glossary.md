# Glossary

Use these terms consistently in docs, code reviews, and maintainer discussions.

## Test session

A full run of one or more AssemblyScript test entries through compilation, wasm instantiation, execution, reporting, and snapshot handling.

Avoid: runner service, CLI workflow.

## Test session entry plan

The ordered test entries and include files for a Test session after CLI/config globs are expanded, filtered, sorted, and deduplicated.

Avoid: discovered file batch, glob result set.

## Test session entry

The lifecycle for one planned AssemblyScript test entry: compiling with shared compiler IO, optionally writing compiler artifacts, optionally instantiating and executing wasm, flushing reporters, and returning suite facts with snapshot write decisions.

Avoid: entry runner, spec file executor.

## Compiler IO adapter

The AssemblyScript compiler-facing file system seam that reads source files, lists source directories, respects absolute compiler paths, caches successful lookups across a Test session, and captures compiler output files in memory.

Avoid: filesystem wrapper, compiler cache helper.

## Compiler output

The validated `output.wasm` binary and `output.wat` text artifacts emitted by the AssemblyScript compiler for one Test session entry.

Avoid: build result blob, emitted file map.

## Test suite

The collected tests and groups for a single AssemblyScript test binary.

Avoid: spec bundle, test file model.

## Test tree

The hierarchy of test nodes collected from AssemblyScript `describe`, `it`, and related declarations.

Avoid: tree structure, node graph.

## Test node

A single group or test in the test tree, including its result facts, logs, todos, and child nodes.

Avoid: test component, result object.

## Reporter

An adapter that renders reportable facts from a test suite to stdout, stderr, files, or another output target.

Avoid: printer, output service.

## Reporting lifecycle

The module that publishes test suite events and final suite report facts to reporters through one seam.

Avoid: reporter manager, output lifecycle service.

## Suite report

The stable reportable facts for one completed test suite: counts, groups, tests, todos, warnings, errors, snapshot stats, and snapshot change lines.

Avoid: reporter model, result DTO.

## Report event

A reporting lifecycle event that carries only suite report, group report, or test report facts to reporter adapters.

Avoid: callback payload, event DTO.

## Legacy reporter adapter

The compatibility seam that translates Report events plus separate legacy report facts to older `onEnter`, `onExit`, and `onFinish` reporter callbacks when a reporter has not implemented the corresponding report callback.

Avoid: reporter fallback, callback shim.

## Snapshot lifecycle

The rules for parsing expected snapshots, recording actual snapshots, diffing them, deciding pass/fail, and planning updates.

Avoid: snapshot utility, snapshot manager.

## Coverage setup

The Test session seam that decides whether coverage is enabled, selects the compiler target, lazily loads the coverage runtime, installs coverage imports, registers compiled modules, and produces the final coverage report string.

Avoid: coverage globals, scattered coverage glue.

## Wasm host

The JavaScript-side interface that exposes `__aspect` imports and runtime facts to AssemblyScript test code.

Avoid: runtime bridge, host service.

## Class reflection transform

The AssemblyScript transform module that generates class reflection methods consumed by runtime `Reflect` helpers.

Avoid: reflection plugin, transform service.

## Class-member plan

The ordered set of class members that generated class reflection methods use for strict equality and reflected key/value output.

Avoid: member list, property collection.

## Related pages

- [Package architecture](../maintaining/package-architecture.md)
- [Test session lifecycle](../maintaining/test-session-lifecycle.md)
- [Reporting lifecycle](../maintaining/reporting-lifecycle.md)
- [Snapshot lifecycle](../maintaining/snapshot-lifecycle.md)

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
