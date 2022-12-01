import { WASIOptions } from "wasi";
import { ResultObject } from "@assemblyscript/loader";

export interface IAspectConfig {
  coverage?: string[];
  disclude?: RegExp[];
  include?: string[];
  entries?: string[];
  outputBinary?: boolean;
  reporter?: string;
  wasi?: WASIOptions;
  instantiate(
    memory: WebAssembly.Memory,
    createImports: (...args: any[]) => Promise<ResultObject>,
    instantiate: typeof import("@assemblyscript/loader").instantiate,
    binary: Uint8Array,
  ): Promise<ResultObject>;
  transform?: string[];
}
