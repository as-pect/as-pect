import { IReporter } from "@as-pect/core";

/**
 * This is the shape of the compiler flags.
 */
export interface CompilerFlags {
  [flag: string]: string[];
}

/**
 * This is an interface describing the shape of an exported configuration for the
 * `as-pect.config.js` file. An empty object should be a valid `as-pect` configuration.
 */
export interface AspectConfiguration {
  [key: string]: any;
  /**
   * A set of globs that denote files that must be used for testing.
   */
  include?: string[];
  /**
   * A set of globs that denote files that must be added to every compilation.
   */
  add?: string[];
  /**
   * The compiler flags needed for this test suite. Do not forget that a binary file must be output.
   */
  flags?: CompilerFlags;
  /**
   * A set of regular expressions that are tested against the file names. If they match, the
   * files will be discluded.
   */
  disclude?: RegExp[];
  /**
   * The web assembly imports required for testing your module.
   */
  imports?: any;
  /**
   * A custom reporter that extends the `TestReporter` class, and is responsible for generating log
   * output.
   */
  reporter?: IReporter;
  /**
   * A regular expression that instructs the TestContext to only run tests that match this regex.
   */
  testRegex?: RegExp;
  /**
   * A regular expression that instructs the TestContext to only run groups that match this regex.
   */
  groupRegex?: RegExp;
  /**
   * Specifies if a wasm binary should be output. Default is false.
   */
  outputBinary?: boolean;
  /**
   * Specifies if rtrace counting should be skipped. Use with stub allocator.
   */
  nortrace?: boolean;
  /**
   * WASM Memory size in pages. Default is 10.
   */
  memorySize?: number;
  /**
   * WASM Memory max size in pages 64kb. Should be positive. Default is disabled or -1.
   */
  memoryMax?: number;
  /** A wasi configuration. */
  wasi?: {
    /** An array of strings that the WebAssembly application will see as command line arguments. The first argument is the virtual path to the WASI command itself. Default: []. */
    args: string[];
    /** An object similar to process.env that the WebAssembly application will see as its environment. Default: {}. */
    env: {
      [envVar: string]: string; // value
    };
    /** This object represents the WebAssembly application's sandbox directory structure. The string keys of preopens are treated as directories within the sandbox. The corresponding values in preopens are the real paths to those directories on the host machine. */
    preopens: {
      [virtualPath: string]: string;
    };
    /** By default, WASI applications terminate the Node.js process via the __wasi_proc_exit() function. Setting this option to true causes wasi.start() to return the exit code rather than terminate the process. Default: false */
    returnOnExit: boolean;
  };
}
