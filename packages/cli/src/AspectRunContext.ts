import { IAspectConfiguration } from "./IAspectConfiguration";
import { IProcessConfiguration } from "./IProcessConfiguration";
import { IWritable } from "@as-pect/core/src/util/IWritable";

export interface IASCProps {
  stdout: IWritable;
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
  /** The assemblyscript help text generation function. */
  help: typeof import("assemblyscript/cli/util/options").help;
  /** The assemblyscript cli parse function. */
  parse: typeof import("assemblyscript/cli/util/options").parse;
  /** The result of calling the assemblyscript cli parse function. */
  parseResult: import("assemblyscript/cli/util/options").Result;
  /** The retreived as-pect config file. */
  config: Partial<IAspectConfiguration>;
  /** The assemblyscript compiler cli interface itself. */
  asc: IASC;
}

export interface IRequiredRunContextProps {
  /** Raw argv from the node process. */
  argv: string[];
  /** A set of file promises that must be resolved before the application exits. */
  files: Promise<void>[];
  /** A stripped down version of a process that contains an exit function, stdout and stderr. */
  process: IProcessConfiguration;
  /** The exit code used to exit the program. It starts as 0, and can only be set to 1 otherwise. */
  exitCode: number;
}

export type AspectRunContext = Partial<IOptionalRunContextProps> &
  IRequiredRunContextProps;
