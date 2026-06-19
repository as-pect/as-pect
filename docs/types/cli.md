# `@as-pect/cli` types

Package-root exports from current `master`. Types marked as supporting types appear in public signatures but are not package-root named exports.

## Runtime exports

```ts
export function createCliProgram(shell?: CliShell): CliProgram;
export const program: CliProgram;
export function asp(argv: string[], shell?: CliShell): Promise<void>;
export function log(str: string): void;
export function warning(str: string): void;
export { SnapshotMode };
```

## CLI shell supporting types

`CliWriter`, `CliShell`, and `CliProgram` appear in emitted public declarations for CLI helpers. They are supporting declaration types, not package-root named exports.

```ts
interface CliWriter {
  write(text: string): void;
}

interface CliShell {
  stdout: CliWriter;
  stderr: CliWriter;
  exit(code: number): never;
}
```

## Config types

```ts
export type AspectImports = import("@assemblyscript/loader").Imports;
export type AspectCreateImports = (...imports: AspectImports[]) => AspectImports;
export type AspectInstantiate = typeof import("@assemblyscript/loader").instantiate;
export type AspectInstantiateResult = Awaited<ReturnType<AspectInstantiate>>;

export interface IAspectConfig {
  coverage?: string[];
  disclude?: RegExp[];
  include?: string[];
  entries?: string[];
  outputBinary?: boolean;
  reporter?: string;
  wasi?: import("wasi").WASIOptions;
  instantiate(
    memory: WebAssembly.Memory,
    createImports: AspectCreateImports,
    instantiate: AspectInstantiate,
    binary: Uint8Array,
  ): Promise<AspectInstantiateResult>;
}
```

## Snapshot mode

```ts
export const enum SnapshotMode {
  WriteSnapshots,
  CompareSnapshots,
}
```

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
