type ResultObject = import("assemblyscript/lib/loader").ResultObject;
type IReporter = import("@as-pect/core").IReporter;
type WASIOptions = import("wasi").WASIOptions;

type InstantiateCallback = (
  source:
    | WebAssembly.Module
    | ArrayBufferView
    | ArrayBuffer
    | Response
    | PromiseLike<
        WebAssembly.Module | ArrayBufferView | ArrayBuffer | Response
      >,
  imports: Record<string, any>,
) => Promise<ResultObject>;

type ImportsCallback = (
  memory: WebAssembly.Memory,
  createImports: (imports: Record<string, any>) => Record<string, any>,
  instantiate: InstantiateCallback,
  binary: Uint8Array,
) => ResultObject;

export interface IAspectConfiguration {
  /**
   * The globs, seperated by ',' that indicate the files to include
   * as testing modules for the test run. This must be provided by the
   * configuration or the cli, otherwise the process will exit code 1.
   *
   * Note that this set of globs will be concatenated with any globs
   * that are passed to the cli.
   */
  include: string[];

  /**
   * The globs, seperated by ',' that indicate the files that should
   * be removed from the 'include' results so that they will not be run
   * as test modules.
   *
   * Note that this set of globs will be concatenated with any globs
   * that are passed to the cli.
   */
  disclude: string[];

  /**
   * The globs, seperated by ',' that indicate the files to add
   * as entry points for testing modules.
   *
   * Note that this set of globs will be concatenated with any globs
   * that are passed to the cli.
   */
  add: string[];

  /**
   * A custom reporter if desired.
   */
  reporter: IReporter;

  /**
   * The absolute file system url to the AssemblyScript compiler, or the
   * name of the package.
   *
   * @default "assemblyscript"
   */
  compiler: string;

  /** Compiler flags that should be passed to the AssemblyScript compiler. */
  flags: string[];

  /**
   * Output the wasm file associated with each test in the same locataion as
   * the testing file.
   *
   * @example
   * ./example.spec.ts -> ./example.spec.wasm
   */
  outputBinary: boolean;

  /**
   * Your module imports, or a method that instantiates the module manually using the
   * assemblyscript loader.
   */
  imports: ImportsCallback | Record<string, any>;

  /**
   * Set the initial memory size of each testing module in [64kb]
   * pages.
   *
   * @default 10
   */
  memorySize: number;

  /**
   * Set the maximum memory size of each testing module in [64kb]
   * pages. Pass -1 to disable setting the maximum.
   *
   * @default -1
   */
  maxMemory: number;

  /**
   * Use a default wasi configuration that only sets the env
   * wasi option.
   */
  defaultWasi: boolean;

  /** Provide a set of wasi options if using wasi imports in AssemblyScript. . */
  wasi: WASIOptions;
}
