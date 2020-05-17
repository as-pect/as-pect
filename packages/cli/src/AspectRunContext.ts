import { IAspectConfiguration } from "./IAspectConfiguration";
import { IProcessConfiguration } from "./IProcessConfiguration";
import { IWritable } from "@as-pect/core/src/util/IWritable";

export interface IASCProps {
  stdout: IWritable; // use any type to quelch error
  stderr: IWritable;
  listFiles(dirname: string, baseDir: string): string[];
  readFile(filename: string, baseDir: string): Uint8Array | null;
  writeFile(name: string, contents: Uint8Array, baseDir?: string): void;
}

export interface IASC {
  ready(): Promise<void>;
  main(
    args: string[],
    config: IASCProps,
    callback: (error: Error) => number,
  ): void;
}

export interface IOptionalRunContextProps {
  parsed: import("assemblyscript/cli/util/options").Result;
  config: Partial<IAspectConfiguration>;
  asc: IASC;
}

export interface IRequiredRunContextProps {
  argv: string[];
  files: Promise<void>[];
  process: IProcessConfiguration;
  exitCode: number;
}

export type AspectRunContext = Partial<IOptionalRunContextProps> &
  IRequiredRunContextProps;
