import { IAspectExports } from "../util/IAspectExports";
import { Rtrace, BlockInfo, TOTAL_OVERHEAD } from "../util/rTrace";

// @ts-ignore: Constructor is new Long(low, high, signed);
import Long from "long";
import { NameSection } from "../util/wasmTools";
import { ReflectedValue } from "../util/ReflectedValue";
import { ReflectedValueType } from "@as-pect/assembly/assembly/internal/ReflectedValueType";
import { TestNode } from "./TestNode";
import { TestNodeType } from "../util/TestNodeType";
import { IReporter } from "../reporter/IReporter";
import { performance } from "perf_hooks";
import { IWarning } from "./IWarning";
import {
  Snapshot,
  SnapshotDiffResultType,
  SnapshotDiff,
} from "@as-pect/snapshots";
import { StringifyReflectedValueProps } from "../util/stringifyReflectedValue";

type WASI = import("wasi").WASI;

const id = (a: string) => a;

const stringifyOptions: Partial<StringifyReflectedValueProps> = {
  classNameFormatter: id,
  indent: 0,
  keywordFormatter: id,
  maxExpandLevel: Infinity,
  maxLineLength: Infinity,
  maxPropertyCount: Infinity,
  numberFormatter: id,
  stringFormatter: id,
  tab: 2,
};

type InstantiateResult = {
  // instance: WebAssembly.Instance;
  exports: IAspectExports;
  instance: WebAssembly.Instance;
};

/**
 * This function is a filter for stack trace lines.
 *
 * @param {string} input - The stack trace line.
 */
const wasmFilter = (input: string): boolean => /wasm/i.test(input);

/**
 * This is a collection of all the parameters required for intantiating a TestCollector.
 */
export interface ITestContextParameters {
  /** A regular expression that filters what tests can be run. Must be set before calling `testContext.run(wasm);` */
  testRegex?: RegExp;
  /** A regular expression that filters what test groups can be run. Must be set before calling `testContext.run(wasm);` */
  groupRegex?: RegExp;
  /** The test file name. */
  fileName?: string;
  /** The web assembly binary. */
  binary?: Uint8Array;
  /** The reporter. */
  reporter: IReporter;
  /** The expected snapshot output. */
  snapshots?: Snapshot;
  /** WASI, if provided. */
  wasi?: WASI | null;
}

/** This class is responsible for collecting and running all the tests in a test binary. */

export class TestContext {
  /** The web assembly module if it was set. */
  protected wasm: IAspectExports | null = null;

  /** The name section for function name evaluation. */
  protected nameSection: NameSection | null = null;

  /** The top level node for this test suite. */
  public rootNode: TestNode = new TestNode();

  /** The current working node that is collecting logs and callback pointers. */
  protected targetNode: TestNode = this.rootNode;

  /** The name of the AssemblyScript test file. */
  public fileName: string = "";

  /** An indicator to see if the TestSuite passed. */
  public pass: boolean = false;

  /** The test context's reporter. */
  protected reporter: IReporter;

  /** The place where stack traces are stored when a function pointer errors.  */
  protected stack: string = "";

  /** The place where the abort() messages are stored. */
  protected message: string = "";

  /** The collected actual value. */
  protected actual: ReflectedValue | null = null;

  /** The collected expected value. */
  protected expected: ReflectedValue | null = null;

  /** Filter the tests by regex. */
  protected testRegex: RegExp = new RegExp("");

  /** Filter the groups by regex. */
  protected groupRegex: RegExp = new RegExp("");

  /** The test count. */
  public testCount: number = 0;

  /** The number of tests that ran. */
  public testRunCount: number = 0;

  /** The number of passing tests count. */
  public testPassCount: number = 0;

  /** The group count. */
  public groupCount: number = 0;

  /** The number of groups that ran. */
  public groupRunCount: number = 0;

  /** The number of passing groups count. */
  public groupPassCount: number = 0;

  /** The number of todos. */
  public todoCount: number = 0;

  /** A collection of all the generated namespaces for shapshot purposes. */
  protected namespaces: Set<string> = new Set<string>();

  /** The wasi instance associated with this module */
  private wasi: WASI | null = null;

  /** The WebAssembly.Instance object. */
  private instance: WebAssembly.Instance | null = null;

  /** The module instance. */
  // private instance: WebAssembly.Instance | null = null;

  /**
   * A collection of reflected values used to help cache and aid in the creation
   * of nested reflected values.
   */
  private reflectedValueCache: ReflectedValue[] = [];

  /** A collection of errors. */
  public errors: IWarning[] = [];

  /** A collection of warnings. */
  public warnings: IWarning[] = [];

  /** A collection of collected snapshots. */
  public snapshots = new Snapshot();

  /** The expected snapshots. */
  public expectedSnapshots: Snapshot;

  public rtrace: Rtrace & { blocks: Map<number, number> };

  /** The resulting snapshot diff. */
  public snapshotDiff: SnapshotDiff | null = null;

  constructor(props: ITestContextParameters) {
    ``;
    this.rtrace = new Rtrace({
      /* istanbul ignore next */
      getMemory: () => {
        /* istanbul ignore next */
        return this.wasm!.memory as WebAssembly.Memory;
      },
      /* istanbul ignore next */
      onerror: (err: Error, info: BlockInfo) => {
        /* istanbul ignore next */
        return this.onRtraceError(err, info);
      },
      /* istanbul ignore next */
      oninfo: (msg: string) => {
        /* istanbul ignore next */
        return this.onRtraceInfo(msg);
      },
    }) as Rtrace & { blocks: Map<number, number> };
    /* istanbul ignore next */
    if (props.fileName) this.fileName = props.fileName;
    /* istanbul ignore next */
    if (props.testRegex) this.testRegex = props.testRegex;
    /* istanbul ignore next */
    if (props.groupRegex) this.groupRegex = props.groupRegex;
    if (props.binary) this.nameSection = new NameSection(props.binary);
    if (props.wasi) this.wasi = props.wasi;
    this.expectedSnapshots = props.snapshots ? props.snapshots : new Snapshot();

    this.reporter = props.reporter;

    /* istanbul ignore next */
    if (typeof props.reporter.onEnter !== "function") {
      /* istanbul ignore next */
      this.pushError({
        message: "Invalid reporter callback: onEnter is not a function",
        stackTrace: "",
        type: "TestContext Initialization",
      });
    }

    /* istanbul ignore next */
    if (typeof props.reporter.onExit !== "function") {
      /* istanbul ignore next */
      this.pushError({
        message: "Invalid reporter callback: onExit is not a function",
        stackTrace: "",
        type: "TestContext Initialization",
      });
    }

    /* istanbul ignore next */
    if (typeof props.reporter.onFinish !== "function") {
      /* istanbul ignore next */
      this.pushError({
        message: "Invalid reporter callback: onFinish is not a function",
        stackTrace: "",
        type: "TestContext Initialization",
      });
    }

    /** The root node is a group. */
    this.rootNode.type = TestNodeType.Group;
  }

  /**
   * Track an rtrace error. This method should be bound and passed to the RTrace options.
   *
   * @param err - The error.
   * @param block - BlockInfo
   */
  // @ts-ignore
  private onRtraceError(err: Error, block: BlockInfo): void {
    /* istanbul ignore next */
    this.pushError({
      message: `Block: ${block.ptr} => ${err.message}`,
      stackTrace:
        /* istanbul ignore next */
        err.stack?.split("\n").filter(wasmFilter).join("\n") ||
        "No stack trace provided.",
      type: "rtrace",
    });
  }

  private onRtraceInfo(_message: string): void {
    // this.pushWarning({
    //   message,
    //   stackTrace: this.getLogStackTrace(),
    //   type: "rtrace",
    // });
  }

  /**
   * Call this method to start the `__main()` method provided by the `as-pect` exports to start the
   * process of test collection and evaluation.
   */
  public run(wasm: InstantiateResult): void {
    /* istanbul ignore next */
    this.wasm = wasm.exports || ((<any>wasm) as IAspectExports);
    this.instance = wasm.instance;

    // start by visiting the root node
    this.visit(this.rootNode);

    // calculate snapshot diff
    const snapshotDiff = this.snapshots.diff(this.expectedSnapshots);

    // determine if this test suite passed
    const snapshotsPass = Array.from(snapshotDiff.results.values()).reduce(
      (result, value) => {
        if (result) {
          return (
            // @ts-ignore
            value.type === SnapshotDiffResultType.Added ||
            // @ts-ignore
            value.type === SnapshotDiffResultType.NoChange
          );
        }
        return false;
      },
      true,
    );

    // store the diff results
    this.snapshotDiff = snapshotDiff;

    // determine if this test suite passed or failed
    this.pass = Boolean(snapshotsPass) && this.rootNode.pass;

    // finish the report
    this.reporter.onFinish(this);
  }

  /** Visit a node and evaluate it's children. */
  protected visit(node: TestNode): void {
    // validate this node will run
    if (node !== this.rootNode) {
      const regexTester =
        node.type === TestNodeType.Group ? this.groupRegex : this.testRegex;
      if (!regexTester.test(node.name)) return;
    }

    // this node is being tested for sure
    node.ran = true;
    if (node.type === TestNodeType.Group) {
      this.groupRunCount += 1;
    } else {
      this.testRunCount += 1;
    }

    // set the start timer for this node
    node.start = performance.now();

    // set the rtraceStart value
    node.rtraceStart = this.rtrace.blocks.size;

    // set the target node for collection
    this.targetNode = node;

    // in the case of a throws() test
    if (node.negated) {
      const success = this.tryCall(node.callback) === 0; // we want the value to be 0
      this.reporter.onEnter(this, node);
      if (success) {
        node.message = null;
        node.stackTrace = null;
        node.pass = true;
        node.actual = null;
        node.expected = null;
      }
      node.end = performance.now();
      this.addResult(node, success);
      this.reporter.onExit(this, node);
      return;
    }

    // perform test collection and evaluate the node, each node must set pass to `true` if it passes
    if (node === this.rootNode) {
      try {
        if (this.wasi) {
          this.wasi!.start(this.instance!);
        } else {
          // collect all the top level function pointers, tests, groups, and logs
          this.wasm!._start();
        }
      } catch (ex) {
        this.reporter.onEnter(this, node);
        /**
         * If this catch occurs, the entire test suite is completed.
         * This is a sanity check.
         */
        node.end = performance.now();
        this.addResult(node, false);
        this.reporter.onExit(this, node);
        return;
      }
    } else {
      // gather all the tests and groups, validate program state at this level
      const success = this.tryCall(node.callback) === 1;
      this.reporter.onEnter(this, node);
      if (!success) {
        // collection or test failure, stop traversal of this node
        this.collectStatistics(node);
        this.addResult(node, false);
        this.reporter.onExit(this, node);
        return;
      }
    }

    // Errors can occur at any level before you visit them, even if nothing was thrown
    if (node.errors.length > 0) {
      this.collectStatistics(node);
      this.addResult(node, false);
      this.reporter.onExit(this, node);
      return;
    }

    // We now have the responsibility to run each beforeAll callback before traversing children
    if (!this.runFunctions(node.beforeAll)) {
      this.collectStatistics(node);
      this.addResult(node, false);
      this.reporter.onExit(this, node);
      return;
    }

    // now that the tests have been collected and the beforeAll has run, visit each child
    const children = node.children;
    for (let i = 0; i < children.length; i++) {
      const child = children[i];

      // in the context of running a test, run the beforeEach functions
      if (child.type === TestNodeType.Test) {
        if (!this.runBeforeEach(node)) {
          this.collectStatistics(node);
          this.addResult(node, false);
          this.reporter.onExit(this, node);
          return;
        }
      }

      // now we can visit the child
      this.visit(child);

      // in the context of running a test, run the afterEach functions
      if (child.type === TestNodeType.Test) {
        if (!this.runAfterEach(node)) {
          this.collectStatistics(node);
          this.addResult(node, false);
          this.reporter.onExit(this, node);
          return;
        }
      }
    }

    // We now have the responsibility to run each afterAll callback after traversing children
    if (!this.runFunctions(node.afterAll)) {
      this.collectStatistics(node);
      this.addResult(node, false);
      this.reporter.onExit(this, node);
      return;
    }

    // if any children failed, this node failed too, but assume it passes
    node.pass = node.children.reduce(
      (pass: boolean, node: TestNode) => pass && node.pass,
      true,
    );
    node.end = performance.now();
    this.addResult(node, true);
    this.reporter.onExit(this, node);
  }

  /** Report a TestNode */
  private reportTestNode(
    type: TestNodeType,
    descriptionPointer: number,
    callbackPointer: number,
    negated: 1 | 0,
    messagePointer: number,
  ): void {
    const parent = this.targetNode;
    const node = new TestNode();
    node.type = type;
    node.name = this.getString(descriptionPointer, node.name);
    node.callback = callbackPointer;
    node.negated = negated === 1;
    node.message = node.negated
      ? this.getString(messagePointer, "No Message Provided.")
      : node.message;

    // namespacing for snapshots later
    const namespacePrefix = `${parent.namespace}!~${node.name}`;
    let i = 0;
    while (true) {
      const namespace = `${namespacePrefix}[${i}]`;
      if (this.namespaces.has(namespace)) {
        i++;
        continue;
      }
      node.namespace = namespace;
      this.namespaces.add(namespace);
      break;
    }

    // fix the node hierarchy
    node.parent = parent;
    parent.children.push(node);
  }

  /** Obtain the stack trace, actual, expected, and message values, and attach them to a given node. */
  private collectStatistics(node: TestNode): void {
    node.stackTrace = this.stack;
    node.actual = this.actual;
    node.expected = this.expected;
    node.message = this.message;
    node.end = performance.now();
    node.rtraceEnd = this.rtrace.blocks.size;
  }

  /** Add a test or group result to the statistics. */
  private addResult(node: TestNode, pass: boolean): void {
    if (node.type === TestNodeType.Group) {
      this.groupCount += 1;
      if (pass) this.groupPassCount += 1;
    } else {
      this.testCount += 1;
      if (pass) this.testPassCount += 1;
    }
    this.todoCount += node.todos.length;
  }

  /** Run a series of callbacks into web assembly. */
  private runFunctions(funcs: number[]): boolean {
    for (let i = 0; i < funcs.length; i++) {
      if (this.tryCall(funcs[i]) === 0) return false;
    }
    return true;
  }

  /** Run every before each callback in the proper order. */
  private runBeforeEach(node: TestNode): boolean {
    return node.parent
      ? //run parents first and bail early if the parents failed
        this.runBeforeEach(node.parent) && this.runFunctions(node.beforeEach)
      : this.runFunctions(node.beforeEach);
  }

  /** Run every before each callback in the proper order. */
  private runAfterEach(node: TestNode): boolean {
    return node.parent
      ? //run parents first and bail early if the parents failed
        this.runAfterEach(node.parent) && this.runFunctions(node.afterEach)
      : this.runFunctions(node.afterEach);
  }

  /**
   * This method creates a WebAssembly imports object with all the TestContext functions
   * bound to the TestContext.
   *
   * @param {any[]} imports - Every import item specified.
   */
  public createImports(...imports: any[]): any {
    const finalImports: any = {};

    for (const moduleImport of imports) {
      for (const [key, value] of Object.entries(moduleImport)) {
        /* istanbul ignore next */
        if (key === "__aspect") continue;
        /* istanbul ignore next */
        finalImports[key] = Object.assign(finalImports[key] || {}, value);
      }
    }

    finalImports.__aspect = {
      attachStackTraceToReflectedValue: this.attachStackTraceToReflectedValue.bind(
        this,
      ),
      afterAll: this.reportAfterAll.bind(this),
      afterEach: this.reportAfterEach.bind(this),
      beforeAll: this.reportBeforeAll.bind(this),
      beforeEach: this.reportBeforeEach.bind(this),
      clearActual: this.clearActual.bind(this),
      clearExpected: this.clearExpected.bind(this),
      createReflectedValue: this.createReflectedValue.bind(this),
      createReflectedNumber: this.createReflectedNumber.bind(this),
      createReflectedLong: this.createReflectedLong.bind(this),
      debug: this.debug.bind(this),
      logReflectedValue: this.logReflectedValue.bind(this),
      pushReflectedObjectKey: this.pushReflectedObjectKey.bind(this),
      pushReflectedObjectValue: this.pushReflectedObjectValue.bind(this),
      reportActualReflectedValue: this.reportActualReflectedValue.bind(this),
      reportExpectedFalsy: this.reportExpectedFalsy.bind(this),
      reportExpectedFinite: this.reportExpectedFinite.bind(this),
      reportExpectedReflectedValue: this.reportExpectedReflectedValue.bind(
        this,
      ),
      reportNegatedTestNode: this.reportNegatedTestNode.bind(this),
      reportTodo: this.reportTodo.bind(this),
      reportTestTypeNode: this.reportTestTypeNode.bind(this),
      reportGroupTypeNode: this.reportGroupTypeNode.bind(this),
      reportExpectedSnapshot: this.reportExpectedSnapshot.bind(this),
      reportExpectedTruthy: this.reportExpectedTruthy.bind(this),
      tryCall: this.tryCall.bind(this),
    };

    this.rtrace.install(finalImports);
    finalImports.rtrace.onalloc = this.onalloc.bind(this);
    finalImports.rtrace.onfree = this.onfree.bind(this);

    /** add an env object */
    finalImports.env = finalImports.env || {};

    /** Override the abort function */
    const previousAbort = finalImports.env.abort || (() => {});
    finalImports.env.abort = (...args: any[]) => {
      previousAbort(...args);
      // @ts-ignore
      this.abort(...args);
    };
    /** Override trace completely. */
    finalImports.env.trace = this.trace.bind(this);

    // add wasi support if requested
    if (this.wasi) {
      finalImports.wasi_snapshot_preview1 = this.wasi.wasiImport;
    }
    return finalImports;
  }

  /**
   * This function sets up a test group.
   *
   * @param {number} description - The test suite description string pointer.
   * @param {number} runner - The pointer to a test suite callback
   */
  private reportGroupTypeNode(description: number, runner: number): void {
    this.reportTestNode(TestNodeType.Group, description, runner, 0, 0);
  }

  /**
   * This function sets up a test node.
   *
   * @param description - The test description string pointer
   * @param runner - The pointer to a test callback
   */
  private reportTestTypeNode(description: number, runner: number): void {
    this.reportTestNode(TestNodeType.Test, description, runner, 0, 0);
  }

  /**
   * This function expects a throws from a test node.
   *
   * @param description - The test description string pointer
   * @param runner - The pointer to a test callback
   * @param message - The pointer to an additional assertion message in string
   */
  private reportNegatedTestNode(
    description: number,
    runner: number,
    message: number,
  ): void {
    this.reportTestNode(TestNodeType.Test, description, runner, 1, message);
  }

  /**
   * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
   */
  /* istanbul ignore next */
  private debug(): void {
    /* istanbul ignore next */
    debugger;
  }

  /**
   * This is a web assembly utility function that wraps a function call in a try catch block to
   * report success or failure.
   *
   * @param {number} pointer - The function pointer to call. It must accept no parameters and return
   * void.
   * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
   * returns 0.
   */
  protected tryCall(pointer: number): 1 | 0 {
    /** This is a safety net conditional, no reason to test it. */
    /* istanbul ignore next */
    if (pointer < 0) return 1;

    try {
      this.wasm!.__call(pointer);
    } catch (ex) {
      this.stack = this.getErrorStackTrace(ex);
      return 0;
    }
    return 1;
  }

  /**
   * This web assembly linked function sets the group's "beforeEach" callback pointer to
   * the current groupStackItem.
   *
   * @param {number} callbackPointer - The callback that should run before each test.
   */
  private reportBeforeEach(callbackPointer: number): void {
    this.targetNode.beforeEach.push(callbackPointer);
  }

  /**
   * This web assembly linked function adds the group's "beforeAll" callback pointer to
   * the current groupStackItem.
   *
   * @param {number} callbackPointer - The callback that should run before each test in the
   * current context.
   */
  private reportBeforeAll(callbackPointer: number): void {
    this.targetNode.beforeAll.push(callbackPointer);
  }

  /**
   * This web assembly linked function sets the group's "afterEach" callback pointer.
   *
   * @param {number} callbackPointer - The callback that should run before each test group.
   */
  private reportAfterEach(callbackPointer: number): void {
    this.targetNode.afterEach.push(callbackPointer);
  }

  /**
   * This web assembly linked function adds the group's "afterAll" callback pointer to
   * the current groupStackItem.
   *
   * @param {number} callbackPointer - The callback that should run before each test in the
   * current context.
   */
  private reportAfterAll(callbackPointer: number): void {
    this.targetNode.afterAll.push(callbackPointer);
  }

  /**
   * This function reports a single "todo" item in a test suite.
   *
   * @param {number} todoPointer - The todo description string pointer.
   * @param {number} _callbackPointer - The test callback function pointer.
   */
  private reportTodo(todoPointer: number, _callbackPointer: number): void {
    this.targetNode.todos.push(
      this.getString(todoPointer, "No todo() value provided."),
    );
  }

  /**
   * This function overrides the provided AssemblyScript `env.abort()` function to catch abort
   * reasons.
   *
   * @param {number} reasonPointer - This points to the message value that causes the expectation to
   * fail.
   * @param {number} fileNamePointer - The file name that reported the error. (Ignored)
   * @param {number} line - The line that reported the error. (Ignored)
   * @param {number} col - The column that reported the error. (Ignored)
   */
  private abort(
    reasonPointer: number,
    fileNamePointer: number,
    line: number,
    col: number,
  ): void {
    this.message = this.getString(
      reasonPointer,
      `Error in ${this.getString(
        fileNamePointer,
        "[No Filename Provided]",
      )}:${line}:${col} `,
    );
  }

  /**
   * Gets an error stack trace.
   */
  protected getErrorStackTrace(ex: Error): string {
    var stackItems = ex.stack!.toString().split("\n");
    return [stackItems[0], ...stackItems.slice(1).filter(wasmFilter)].join(
      "\n",
    );
  }

  /**
   * Gets a log stack trace.
   */
  protected getLogStackTrace(): string {
    return new Error("Get stack trace.")
      .stack!.toString()
      .split("\n")
      .slice(1)
      .filter(wasmFilter)
      .join("\n");
  }

  /** A map of strings that can be cached because they are static. */
  private cachedStrings = new Map<number, string>();

  /**
   * This method is called when a memory block is deallocated from the heap.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  public onfree(block: number): void {
    this.targetNode.frees += 1;
    // remove any cached strings at this pointer
    this.cachedStrings.delete(block + TOTAL_OVERHEAD);
    this.rtrace.onfree(block);
  }

  /**
   * This method is called when a memory block is allocated on the heap.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  public onalloc(block: number): void {
    this.targetNode.allocations += 1;
    this.rtrace.onalloc(block);
  }

  /**
   * Gets a string from the wasm module, unless the module string is null. Otherwise it returns
   * a default value.
   */
  protected getString(pointer: number, defaultValue: string): string {
    pointer >>>= 0;
    if (pointer === 0) return defaultValue;
    if (this.cachedStrings.has(pointer)) {
      return this.cachedStrings.get(pointer)!;
    }
    const result = this.wasm!.__getString(pointer);
    this.cachedStrings.set(pointer, result);
    return result;
  }

  /**
   * An override implementation of the AssemblyScript trace function.
   *
   * @param {number} strPointer - The trace string.
   * @param {number} count - The number of arguments to be traced.
   * @param {number[]} args - The traced arguments.
   */
  private trace(strPointer: number, count: number, ...args: number[]): void {
    const reflectedValue = new ReflectedValue();
    reflectedValue.pointer = strPointer;
    reflectedValue.stack = this.getLogStackTrace();
    reflectedValue.typeName = "trace";
    reflectedValue.type = ReflectedValueType.String;
    reflectedValue.value = `trace: ${this.getString(
      strPointer,
      "",
    )} ${args.slice(0, count).join(", ")}`;

    // push the log value to the logs
    this.targetNode.logs.push(reflectedValue);
  }

  /**
   * Retrieve the function name of a given web assembly function.
   *
   * @param {number} index - The function index
   */
  private funcName(index: number): string {
    const nameSection = this.nameSection;
    /* istanbul ignore next */
    if (nameSection) {
      const result = this.wasm!.table!.get(index);
      return nameSection.fromIndex(parseInt(result!.name));
    }
    /* istanbul ignore next */
    return "";
  }

  private createReflectedValue(
    isNull: 1 | 0,
    hasKeys: 1 | 0,
    nullable: 1 | 0,
    offset: number, // offsetof<T>("propName")
    pointer: number, // changetype<usize>(this) | 0
    signed: 1 | 0, // isSigned<T>()
    size: number, // sizeof<T>()
    reflectedTypeValue: ReflectedValueType,
    typeId: number, // idof<T>()
    typeName: number, // nameof<T>()
    value: number, // usize
    hasValues: 1 | 0, // bool
    isManaged: 1 | 0, // bool
  ): number {
    const reflectedValue = new ReflectedValue();
    reflectedValue.isNull = isNull === 1;
    reflectedValue.keys = hasKeys ? [] : null;
    reflectedValue.nullable = nullable === 1;
    reflectedValue.offset = offset;
    reflectedValue.pointer = pointer;
    reflectedValue.signed = signed === 1;
    reflectedValue.size = size;
    reflectedValue.type = reflectedTypeValue;
    reflectedValue.typeId = typeId;
    reflectedValue.typeName = this.getString(typeName, "");
    reflectedValue.values = hasValues ? [] : null;
    reflectedValue.isManaged = isManaged === 1;

    if (isNull === 1) {
      reflectedValue.value = "null";
    } else if (reflectedTypeValue === ReflectedValueType.String) {
      reflectedValue.value = this.getString(value, "");
    } else if (reflectedTypeValue === ReflectedValueType.Function) {
      reflectedValue.value = this.funcName(value);
    } else {
      reflectedValue.value = value;
    }

    return this.reflectedValueCache.push(reflectedValue) - 1;
  }

  /**
   * Create a reflected number value.
   *
   * @param {1 | 0} signed - Indicate if the value is signed.
   * @param {number} size - The size of the value in bytes.
   * @param {ReflectedValueType} reflectedTypeValue - The ReflectedValueType
   * @param {number} typeName - The name of the type.
   * @param {number} value - The value itself
   */
  private createReflectedNumber(
    signed: 1 | 0, // isSigned<T>()
    size: number, // sizeof<T>()
    reflectedTypeValue: ReflectedValueType,
    typeName: number, // nameof<T>()
    value: number, // f64
  ): number {
    const reflectedValue = new ReflectedValue();
    reflectedValue.signed = signed === 1;
    reflectedValue.size = size;
    reflectedValue.type = reflectedTypeValue;
    reflectedValue.typeName = this.getString(typeName, "");
    reflectedValue.value = value;
    return this.reflectedValueCache.push(reflectedValue) - 1;
  }

  /**
   * Create reflection of a long number (not supported directly from javascript)
   */
  private createReflectedLong(
    signed: 1 | 0, // isSigned<T>()
    size: number, // sizeof<T>()
    reflectedTypeValue: ReflectedValueType,
    typeName: number, // nameof<T>()
    lowValue: number, // i32
    highValue: number, // i32
  ): number {
    const reflectedValue = new ReflectedValue();
    reflectedValue.signed = signed === 1;
    reflectedValue.size = size;
    reflectedValue.type = reflectedTypeValue;
    reflectedValue.typeName = this.getString(typeName, "");

    reflectedValue.value = Long.fromBits(
      lowValue >>> 0,
      highValue >>> 0,
      signed === 0,
    ).toString();

    return this.reflectedValueCache.push(reflectedValue) - 1;
  }

  /**
   * Log a reflected value.
   *
   * @param {number} id - The ReflectedValue id
   */
  private logReflectedValue(id: number): void {
    /* istanbul ignore next */
    if (id >= this.reflectedValueCache.length || id < 0) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot log ReflectedValue of id ${id}. Index out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }
    this.targetNode.logs.push(this.reflectedValueCache[id]);
  }

  /**
   * Report an actual reflected value.
   *
   * @param {number} id - The ReflectedValue id
   */
  private reportActualReflectedValue(id: number): void {
    // ignored lines are santiy checks for error reporting
    /* istanbul ignore next */
    if (id >= this.reflectedValueCache.length || id < 0) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot report actual ReflectedValue of id ${id}. Index out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }
    this.actual = this.reflectedValueCache[id];
  }

  /**
   * Report an expected reflected value.
   *
   * @param {number} id - The ReflectedValue id
   */
  private reportExpectedReflectedValue(id: number, negated: number): void {
    // ignored lines are error reporting for sanity checks
    /* istanbul ignore next */
    if (id >= this.reflectedValueCache.length || id < 0) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot report expected ReflectedValue of id ${id}. Index out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }
    this.expected = this.reflectedValueCache[id];
    this.expected.negated = negated === 1;
  }

  /**
   * Push a reflected value to a given reflected value.
   *
   * @param {number} reflectedValueID - The target reflected value parent.
   * @param {number} childID - The child value by it's id to be pushed.
   */
  private pushReflectedObjectValue(
    reflectedValueID: number,
    childID: number,
  ): void {
    // each ignored line for test coverage is error reporting for sanity checks
    /* istanbul ignore next */
    if (
      reflectedValueID >= this.reflectedValueCache.length ||
      reflectedValueID < 0
    ) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot push ReflectedValue of id ${childID} to ReflectedValue ${reflectedValueID}. ReflectedValue id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }

    /* istanbul ignore next */
    if (childID >= this.reflectedValueCache.length || childID < 0) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot push ReflectedValue of id ${childID} to ReflectedValue ${reflectedValueID}. ReflectedValue id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }

    let reflectedParentValue = this.reflectedValueCache[reflectedValueID];
    let childValue = this.reflectedValueCache[childID];

    /* istanbul ignore next */
    if (!reflectedParentValue.values) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot push ReflectedValue of id ${childID} to ReflectedValue ${reflectedValueID}. ReflectedValue was not initialized with a values array.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }
    reflectedParentValue.values.push(childValue);
  }

  /**
   * Push a reflected value key to a given reflected value.
   *
   * @param {number} reflectedValueID - The target reflected value parent.
   * @param {number} keyId - The target reflected value key to be pushed.
   */
  private pushReflectedObjectKey(
    reflectedValueID: number,
    keyId: number,
  ): void {
    // every ignored line for test coverage in this function are sanity checks
    /* istanbul ignore next */
    if (
      reflectedValueID >= this.reflectedValueCache.length ||
      reflectedValueID < 0
    ) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot push ReflectedValue of id ${keyId} to ReflectedValue ${reflectedValueID}. ReflectedValue id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }

    /* istanbul ignore next */
    if (keyId >= this.reflectedValueCache.length || keyId < 0) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot push ReflectedValue of id ${keyId} to ReflectedValue ${reflectedValueID}. ReflectedValue key id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }
    let reflectedValue = this.reflectedValueCache[reflectedValueID];
    let key = this.reflectedValueCache[keyId];

    // this is a failsafe if a keys[] does not exist on the ReflectedValue
    /* istanbul ignore next */
    if (!reflectedValue.keys) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot push ReflectedValue of id ${keyId} to ReflectedValue ${reflectedValueID}. ReflectedValue was not initialized with a keys array.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }
    reflectedValue.keys.push(key);
  }

  /**
   * Clear the expected value.
   */
  private clearExpected(): void {
    this.expected = null;
  }

  /**
   * Clear the actual value.
   */
  private clearActual(): void {
    this.actual = null;
  }

  /**
   * Report an expected truthy value, and if it's negated.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedTruthy(negated: number): void {
    const expected = (this.expected = new ReflectedValue());

    expected.negated = negated === 1;
    expected.type = ReflectedValueType.Truthy;
  }

  /**
   * Report an expected truthy value, and if it's negated.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedFalsy(negated: number): void {
    const expected = (this.expected = new ReflectedValue());

    expected.negated = negated === 1;
    expected.type = ReflectedValueType.Falsy;
  }

  /**
   * Report an expected finite value, and if it's negated.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedFinite(negated: number): void {
    const expected = (this.expected = new ReflectedValue());

    expected.negated = negated === 1;
    expected.type = ReflectedValueType.Finite;
  }

  /**
   * Attaches a stack trace to the given reflectedValue by it's id.
   *
   * @param {number} reflectedValueID - The given reflected value by it's id.
   */
  private attachStackTraceToReflectedValue(reflectedValueID: number): void {
    /* istanbul ignore next */
    if (
      reflectedValueID >= this.reflectedValueCache.length ||
      reflectedValueID < 0
    ) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot push a stack trace to ReflectedValue ${reflectedValueID}. ReflectedValue id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }
    this.reflectedValueCache[reflectedValueID].stack = this.getLogStackTrace();
  }

  /** Push an error to the errors array. */
  protected pushError(error: IWarning): void {
    this.targetNode.errors.push(error);
    this.errors.push(error);
  }

  /** Push an warning to the warnings array. */
  /* istanbul ignore next */
  protected pushWarning(warning: IWarning): void {
    /* istanbul ignore next */
    this.targetNode.warnings.push(warning);
    /* istanbul ignore next */
    this.warnings.push(warning);
  }

  /**
   * Report an expected snapshot.
   *
   * @param {number} reflectedValueID - The id of the reflected actual value.
   * @param {number} namePointer - The name of the snapshot.
   */
  protected reportExpectedSnapshot(
    reflectedValueID: number,
    namePointer: number,
  ): void {
    const name = `${this.targetNode.name}!~${this.getString(namePointer, "")}`;
    /* istanbul ignore next */
    if (
      reflectedValueID >= this.reflectedValueCache.length ||
      reflectedValueID < 0
    ) {
      /* istanbul ignore next */
      this.pushError({
        message: `Cannot add snapshot ${name} with reflected value ${reflectedValueID}. ReflectedValue id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }
    this.snapshots.add(
      name,
      this.reflectedValueCache[reflectedValueID].stringify(stringifyOptions),
    );
  }
}
