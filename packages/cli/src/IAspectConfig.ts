import type { WASIOptions } from "wasi";
import type { Imports as AssemblyScriptImports } from "@assemblyscript/loader";

export type AspectImports = AssemblyScriptImports;
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
  wasi?: WASIOptions;

  /**
   * Instantiate one compiled AssemblyScript test binary.
   *
   * @param memory Imported WebAssembly memory configured from CLI memory options.
   * @param createImports Merges user imports with as-pect's host imports and returns a WebAssembly imports object.
   * @param instantiate AssemblyScript loader instantiate function.
   * @param binary Compiled wasm bytes for the current test file.
   */
  instantiate(
    memory: WebAssembly.Memory,
    createImports: AspectCreateImports,
    instantiate: AspectInstantiate,
    binary: Uint8Array,
  ): Promise<AspectInstantiateResult>;
}
