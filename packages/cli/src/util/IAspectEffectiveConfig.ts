import { IReporter } from "@as-pect/core";
import { WASI } from "wasi";

export interface IAspectEffectiveConfig {
  debug: boolean;
  include: string[];
  add: string[];
  disclude: string[];
  test: RegExp;
  group: RegExp;
  files: RegExp[];
  reporter: IReporter | null;
  outputBinary: boolean;
  memorySize: number;
  memoryMax: number;
  wasi: WASI | null;
  flags: string[];
  imports: Record<string, any> | null;
}
