import { IAspectExports } from "../util/IAspectExports";

// @ts-ignore: Constructor is new Long(low, high, signed);
import Long from "long";
import { NameSection } from "../util/wasmTools";
import { ReflectedValue } from "../util/ReflectedValue";
import { ReflectedValueType } from "@as-pect/assembly/assembly/internal/ReflectedValueType";
import { TestNode } from "./TestNode";
import { TestNodeType } from "@as-pect/assembly/assembly/internal/TestNodeType";
import { IReporter } from "../reporter/IReporter";
import { performance } from "perf_hooks";

/**
 * This function is a filter for stack trace lines.
 *
 * @param {string} input - The stack trace line.
 */
const wasmFilter = (input: string): boolean => /wasm-function/i.test(input);

/**
 * This is a collection of all the parameters required for intantiating a TestCollector.
 */
export interface ITestContextParameters {
  /** A regular expression that filters what tests can be run. Must be set before calling `testContext.run(wasm);` */
  testRegex?: RegExp;
  /** A regular expression that filters what test groups can be run. Must be set before calling `testContext.run(wasm);` */
  groupRegex?: RegExp;
  /**
   * Put the AssemblyScript test filename here.
   *
   * @example
   * ```ts
   * const ctx = new TestContext({
   *   fileName: "example.spec.ts",
   * });
   * ```
   */
  fileName?: string;
  /** Disable RTrace when set to `true`. */
  nortrace?: boolean;
  /** The web assembly binary. */
  binary?: Uint8Array;
  /** The reporter. */
  reporter: IReporter;
}

/**
 * This class is responsible for collecting all the tests in a test binary.
 */
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

  /**
   * RTrace is a funciton that helps with debugging reference counting and can be used to find
   * leaks. If it is enabled, it will be included automatically by the bootstrap in the
   * assemblyscript imports.
   */
  protected rtraceEnabled: boolean = true;

  /**
   * A collection of reflected values used to help cache and aid in the creation
   * of nested reflected values.
   */
  private reflectedValueCache: ReflectedValue[] = [];

  /* This map collects the starting values for the labels created by `RTrace.start()` */
  private rtraceLabels: Map<number, number> = new Map();

  constructor(props: ITestContextParameters) {

    /* istanbul ignore next */
    if (props.fileName) this.fileName = props.fileName;
    /* istanbul ignore next */
    if (props.testRegex) this.testRegex = props.testRegex;
    /* istanbul ignore next */
    if (props.groupRegex) this.groupRegex = props.groupRegex;
    /* istanbul ignore next */
    if (props.nortrace) this.rtraceEnabled = false;
    /* istanbul ignore next */
    if (props.binary) this.nameSection = new NameSection(props.binary);

    this.reporter = props.reporter;

    if (typeof props.reporter.onEnter !== "function") {
      this.rootNode.errors.push({
        message: "Invalid reporter callback: onEnter is not a function",
        stackTrace: "",
        type: "TestContext Initialization"
      });
    }

    if (typeof props.reporter.onExit !== "function") {
      this.rootNode.errors.push({
        message: "Invalid reporter callback: onExit is not a function",
        stackTrace: "",
        type: "TestContext Initialization"
      });
    }

    if (typeof props.reporter.onFinish !== "function") {
      this.rootNode.errors.push({
        message: "Invalid reporter callback: onFinish is not a function",
        stackTrace: "",
        type: "TestContext Initialization"
      });
    }
  }

  /**
   * Call this method to start the `__main()` method provided by the `as-pect` exports to start the
   * process of test collection and evaluation.
   */
  protected run(wasm: IAspectExports): void {
    // set the wasm
    this.wasm = wasm;

    // start by visiting the root node
    this.visit(this.rootNode);

    // determine if this test suite passed or failed
    this.pass = this.rootNode.pass;

    this.reporter.onFinish(this);
  }

  /** Visit a node and evaluate it's children. */
  protected visit(node: TestNode): void {
    // set the start timer for this node
    node.start = performance.now();

    const rtraceStart = this.blocks.size;

    // set the target node for collection
    this.targetNode = node;

    // in the case of a throws() test
    if (node.negated) {
      this.reporter.onEnter(this, node);
      const success = this.tryCall(node.callback) === 0; // we want the value to be 0
      if (success) {
        node.message = null;
        node.stackTrace = null;
        node.pass = true;
        node.actual = null;
        node.expected = null;
      }
      node.end = performance.now();
      node.rtraceDelta = this.blocks.size - rtraceStart;
      this.reporter.onExit(this, node);
      return;
    }


    // perform test collection and evaluate the node, each node must set pass to `true` if it passes
    if (node === this.rootNode) {
      try {
        // collect all the top level function pointers, tests, groups, and logs
        this.wasm!._start();
      } catch (ex) {
        this.collectStatistics(node);
        node.end = performance.now();
        node.rtraceDelta = this.blocks.size - rtraceStart;
        return;
      }
    } else {
      // gather all the tests and groups, validate program state at this level
      const success = this.tryCall(node.callback) === 1;
      if (!success) {
        // collection or test failure, stop traversal of this node
        this.collectStatistics(node);
        node.end = performance.now();
        node.rtraceDelta = this.blocks.size - rtraceStart;
        return;
      }
    }

    // Errors can occur at any level before you visit them, even if nothing was thrown
    if (node.errors.length > 0) {
      node.end = performance.now();
      return;
    }

    // notify the reporter of the start of a TestNode evaluation
    this.reporter.onEnter(this, node);

    // We now have the responsibility to run each beforeAll callback before traversing children
    if (!this.runFunctions(node.beforeAll)) {
      this.collectStatistics(node);
      node.end = performance.now();
      node.rtraceDelta = this.blocks.size - rtraceStart;
      this.reporter.onExit(this, node);
      return;
    }

    // cannot traverse a negated node
    if (!node.negated) {
      // now that the tests have been collected and the beforeAll has run, visit each child
      const children = node.children;
      for (let i = 0; i < children.length; i++) {
        const child = children[i];

        // in the context of running a test, run the beforeEach functions
        if (child.type === TestNodeType.Test) {
          if (!this.runBeforeEach(node)) {
            this.collectStatistics(node);
            node.rtraceDelta = this.blocks.size - rtraceStart;
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
            node.end = performance.now();
            node.rtraceDelta = this.blocks.size - rtraceStart;
            this.reporter.onExit(this, node);
            return;
          }
        }
      }
    }

    // We now have the responsibility to run each afterAll callback after traversing children
    if (!this.runFunctions(node.afterAll)) {
      this.collectStatistics(node);
      node.end = performance.now();
      node.rtraceDelta = this.blocks.size - rtraceStart;
      this.reporter.onExit(this, node);
      return;
    }

    // if any children failed, this node failed too, but assume it passes
    node.pass = node.children.reduce(
      (pass: boolean, node: TestNode) => pass && node.pass, true);
    node.end = performance.now();
    node.rtraceDelta = this.blocks.size - rtraceStart;
    this.reporter.onExit(this, node);
  }

  /** Obtain the stack trace, actual, expected, and message values, and attach them to a given node. */
  private collectStatistics(node: TestNode): void {
    node.stackTrace = this.stack;
    node.actual = this.actual;
    node.expected = this.expected;
    node.message = this.message;
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
      ? this.runBeforeEach(node.parent) && this.runFunctions(node.beforeEach)
      : this.runFunctions(node.beforeEach);
  }

  /** Run every before each callback in the proper order. */
  private runAfterEach(node: TestNode): boolean {
    return node.parent
      ? this.runAfterEach(node.parent) && this.runFunctions(node.beforeEach)
      : this.runFunctions(node.beforeEach);
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
      clearActual: this.clearActual.bind(this),
      clearExpected: this.clearExpected.bind(this),
      createReflectedValue: this.createReflectedValue.bind(this),
      debug: this.debug.bind(this),
      endRTrace: this.endRTrace.bind(this),
      getRTraceAllocations: this.getRTraceAllocations.bind(this),
      getRTraceBlocks: this.getRTraceBlocks.bind(this),
      getRTraceCount: this.getRTraceCount.bind(this),
      getRTraceDecrements: this.getRTraceDecrements.bind(this),
      getRTraceFrees: this.getRTraceFrees.bind(this),
      getRTraceNodeAllocations: this.getRTraceNodeAllocations.bind(this),
      getRTraceNodeBlocks: this.getRTraceNodeBlocks.bind(this),
      getRTraceNodeDecrements: this.getRTraceNodeDecrements.bind(this),
      getRTraceNodeFrees: this.getRTraceNodeFrees.bind(this),
      getRTraceNodeIncrements: this.getRTraceNodeIncrements.bind(this),
      getRTraceNodeReallocs: this.getRTraceNodeReallocs.bind(this),
      getRTraceIncrements: this.getRTraceIncrements.bind(this),
      getRTraceReallocs: this.getRTraceReallocs.bind(this),
      logReflectedValue: this.logReflectedValue.bind(this),
      pushReflectedObjectKey: this.pushReflectedObjectKey.bind(this),
      pushReflectedObjectValue: this.pushReflectedObjectValue.bind(this),
      reportActualReflectedValue: this.reportActualReflectedValue.bind(this),
      reportAfterAll: this.reportAfterAll.bind(this),
      reportAfterEach: this.reportAfterEach.bind(this),
      reportBeforeAll: this.reportBeforeAll.bind(this),
      reportBeforeEach: this.reportBeforeEach.bind(this),
      reportExpectedFalsy: this.reportExpectedFalsy.bind(this),
      reportExpectedFinite: this.reportExpectedFinite.bind(this),
      reportExpectedReflectedValue: this.reportExpectedReflectedValue.bind(
        this,
      ),
      reportExpectedTruthy: this.reportExpectedTruthy.bind(this),
      reportTodo: this.reportTodo.bind(this),
      startRTrace: this.startRTrace.bind(this),
      tryCall: this.tryCall.bind(this),
    };

    /** If RTrace is enabled, add it to the imports. */
    if (this.rtraceEnabled) {
      finalImports.rtrace = {
        onalloc: this.onalloc.bind(this),
        onfree: this.onfree.bind(this),
        onincrement: this.onincrement.bind(this),
        ondecrement: this.ondecrement.bind(this),
        onrealloc: this.onrealloc.bind(this),
      };
    }

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

    return finalImports;
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
   */
  private reportTodo(todoPointer: number): void {
    this.targetNode.todos.push(this.getString(todoPointer, "No todo() value provided."));
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

  /**
   * This method returns the current rtrace count.
   */
  private getRTraceCount(): number {
    return this.blocks.size;
  }

  /**
   * This method starts a new rtrace count label.
   *
   * @param {number} label - The RTrace label.
   */
  private startRTrace(label: number): void {
    this.rtraceLabels.set(label, this.blocks.size);
  }

  /**
   * This method ends an RTrace label and returns the difference between the current and the
   * starting reference counts.
   *
   * @param {number} label - The RTrace label.
   * @returns {number}
   */
  private endRTrace(label: number): number {
    const result = this.blocks.size - this.rtraceLabels.get(label)!;
    this.rtraceLabels.delete(label);
    return result;
  }

  /**
   * This is the current number of net allocations that occurred during `TestContext` execution.
   */
  public allocationCount: number = 0;

  /**
   * This is the current number of net allocations that occured during `TestNode` execution.
   */
  protected nodeAllocationCount: number = 0;

  /**
   * This is the current number of net dellocations that occurred during `TestContext` execution.
   */
  public freeCount: number = 0;

  /**
   * This is the current number of net allocations that occured during `TestNode` execution.
   */
  protected nodeFreeCount: number = 0;

  /**
   * This is the current number of net increments that occurred during `TestContext` execution.
   */
  protected incrementCount: number = 0;

  /**
   * This is the current number of net increments that occurred during `TestNode` execution.
   */
  protected nodeIncrementCount: number = 0;

  /**
   * This is the current number of net decrements that occurred during `TestContext` execution.
   */
  protected decrementCount: number = 0;

  /**
   * This is the current number of net decrements that occurred during `TestNode` execution.
   */
  protected nodeDecrementCount: number = 0;

  /**
   * This is the current number of net reallocations during the `TestContext` execution.
   */
  protected reallocationCount: number = 0;

  /**
   * This is the current number of net reallocations during the `TestNode` execution.
   */
  protected nodeReallocationCount: number = 0;

  /**
   * This map is responsible for keeping track of which blocks are currently allocated by their id.
   */
  protected blocks: Map<number, number> = new Map();

  /**
   * This set contains all the blocks currently allocated for the current node.
   */
  protected nodeBlocks: Set<number> = new Set();

  /**
   * This method is called when a memory block is allocated on the heap.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  private onalloc(block: number): void {
    this.allocationCount += 1;
    this.nodeAllocationCount += 1;
    /**
     * This is impossible to test but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (this.blocks.has(block)) {
      /* istanbul ignore next */
      this.targetNode.errors.push({
        message:
          "A duplicate allocation has occurred at block: " + block.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Allocation Error",
      });
    } else {
      this.blocks.set(block, 0);
    }

    this.nodeBlocks.add(block);
  }

  /**
   * This method is called when a memory block is deallocated from the heap.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  private onfree(block: number): void {
    this.freeCount += 1;
    this.nodeFreeCount += 1;
    /**
     * This is impossible to test, but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (!this.blocks.has(block)) {
      /* istanbul ignore next */
      this.targetNode.errors.push({
        message:
          "An orphaned dellocation has occurred at block: " + block.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Orphaned Deallocation Error",
      });
    } else {
      this.blocks.delete(block);
    }

    this.nodeBlocks.delete(block);
  }

  /**
   * This method is called when a memory block reference count is incremented.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  private onincrement(block: number): void {
    this.incrementCount += 1;
    this.nodeIncrementCount += 1;
    /**
     * This is impossible to test, but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (!this.blocks.has(block)) {
      /* istanbul ignore next */
      this.targetNode.errors.push({
        message:
          "An orphaned increment has occurred at block: " + block.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Orphaned Increment Error",
      });
    } else {
      const count = this.blocks.get(block)!;
      this.blocks.set(block, count + 1);
    }
  }

  /**
   * This method is called when a memory block reference count is decremented.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  private ondecrement(block: number): void {
    this.decrementCount += 1;
    this.nodeDecrementCount += 1;
    /**
     * This is impossible to test, but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (!this.blocks.has(block)) {
      /* istanbul ignore next */
      this.targetNode.errors.push({
        message:
          "An orphaned decrement has occurred at block: " + block.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Orphaned Decrement Error",
      });
    } else {
      const count = this.blocks.get(block)!;
      this.blocks.set(block, count - 1);
    }
  }

  private onrealloc(oldBlock: number, newBlock: number): void {
    this.reallocationCount += 1;
    this.nodeReallocationCount += 1;
    /**
     * This is impossible to test, but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (!this.blocks.has(oldBlock)) {
      /* istanbul ignore next */
      this.targetNode.errors.push({
        message:
          "An orphaned realloc has occurred at old block: " +
          oldBlock.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Orphaned Reallocation Error (old)",
      });
    } else {
      /* istanbul ignore next */
      if (!this.blocks.has(newBlock)) {
        /* istanbul ignore next */
        this.targetNode.errors.push({
          message:
            "An orphaned realloc has occurred at new block: " +
            newBlock.toString(),
          stackTrace: this.getLogStackTrace(),
          type: "Orphaned Reallocation Error (new)",
        });
      } else {
        /* istanbul ignore next */
        let newRc = this.blocks.get(newBlock);
        /* istanbul ignore next */
        if (newRc != 0) {
          /* istanbul ignore next */
          this.targetNode.errors.push({
            message: `An invalid realloc error has occurred from ${oldBlock} to ${newBlock}.`,
            stackTrace: this.getLogStackTrace(),
            type: "Invalid Reallocation Error",
          });
        } else {
          let oldRc = this.blocks.get(oldBlock)!;
          this.blocks.set(newBlock, oldRc);
        }
      }
    }
  }

  /**
   * This linked method gets all the RTrace increments for this entire test up until this point.
   */
  private getRTraceIncrements(): number {
    return this.incrementCount;
  }

  /**
   * This linked method gets all the RTrace increments for this entire test up until this point.
   */
  private getRTraceNodeIncrements(): number {
    return this.nodeIncrementCount;
  }

  /**
   * This linked method gets all the RTrace decrements for this entire test up until this point.
   */
  private getRTraceDecrements(): number {
    return this.decrementCount;
  }

  /**
   * This linked method gets all the RTrace decrements for the current node up until this point.
   */
  private getRTraceNodeDecrements(): number {
    return this.nodeDecrementCount;
  }

  /**
   * This linked method gets all the RTrace allocations for this entire test up until this point.
   */
  private getRTraceAllocations(): number {
    return this.allocationCount;
  }

  /**
   * This linked method gets all the RTrace frees for this entire test up until this point.
   */
  private getRTraceFrees(): number {
    return this.freeCount;
  }

  /**
   * This linked method gets all the RTrace increments for this TestNode up until this point.
   */
  private getRTraceNodeAllocations(): number {
    return this.nodeAllocationCount;
  }

  /**
   * This linked method gets all the RTrace frees for the current TestNode up until this point.
   */
  private getRTraceNodeFrees(): number {
    return this.nodeFreeCount;
  }

  /**
   * This linked method gets all the RTrace reallocations for the current TestContext.
   */
  private getRTraceReallocs(): number {
    return this.reallocationCount;
  }

  /**
   * This linked method gets all the RTrace reallocations for the current TestNode.
   */
  private getRTraceNodeReallocs(): number {
    return this.nodeReallocationCount;
  }


  /**
   * This linked method gets all the current RTrace allocations and adds them to an array.
   */
  private getRTraceBlocks(): number {
    return this.wasm!.__allocArray(
      this.wasm!.__getUsizeArrayId(),
      Array.from(this.blocks.keys()),
    );
  }

  /**
   * This linked method gets all the current RTrace allocations for the current TestNode.
   */
  private getRTraceNodeBlocks(): number {
    return this.wasm!.__allocArray(
      this.wasm!.__getUsizeArrayId(),
      Array.from(this.nodeBlocks),
    );
  }

  /**
   * Gets a string from the wasm module, unless the module string is null. Otherwise it returns
   * a default value.
   */
  private getString(pointer: number, defaultValue: string): string {
    return pointer === 0 ? defaultValue : this.wasm!.__getString(pointer);
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
    /* istanbul ignore next */
    if (this.nameSection)
      return this.nameSection.fromIndex(
        parseInt(this.wasm!.table!.get(index)!.name),
      );
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
    value: number, // usize | Box<T>
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

    if (
      reflectedTypeValue === ReflectedValueType.Integer ||
      reflectedTypeValue === ReflectedValueType.Boolean
    ) {
      reflectedValue.value = this.getInteger(value, size, signed === 1);
      // get long
    } else if (reflectedTypeValue === ReflectedValueType.String) {
      reflectedValue.value = this.getString(value, "");
    } else if (reflectedTypeValue === ReflectedValueType.Float) {
      reflectedValue.value = this.getFloat(value, size);
    } else if (reflectedTypeValue === ReflectedValueType.Function) {
      reflectedValue.value = this.funcName(value);
    } else {
      reflectedValue.value = value;
    }

    return this.reflectedValueCache.push(reflectedValue) - 1;
  }

  /**
   * Get a boxed integer of a given kind at a pointer location.
   *
   * @param {number} pointer - The pointer location of the number
   * @param {number} size - The size of the integer in bytes
   * @param {boolean} signed - If the number is signed
   */
  private getInteger(pointer: number, size: number, signed: boolean): number {
    const buffer = this.wasm!.memory.buffer;
    /* istanbul ignore next */
    if (pointer + size >= buffer.byteLength) {
      /* istanbul ignore next */
      this.targetNode.errors.push({
        message: `Cannot obtain ${
          signed ? "" : "un"
        }signed integer value at pointer ${pointer} of size ${size}: index out of bounds`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return 0;
    }

    switch (size) {
      case 1:
        if (signed) {
          return new Int8Array(buffer)[pointer];
        } else {
          return new Uint8Array(buffer)[pointer];
        }
      case 2:
        if (signed) {
          return new Int16Array(buffer)[pointer >>> 1];
        } else {
          return new Uint16Array(buffer)[pointer >>> 1];
        }
      case 4:
        if (signed) {
          return new Int32Array(buffer)[pointer >>> 2];
        } else {
          return new Uint32Array(buffer)[pointer >>> 2];
        }
      case 8:
        const long = new Long.fromBytesLE(
          new Uint8Array(buffer, pointer, 8),
          !signed,
        );
        return long.toString();
      /* istanbul ignore next */
      default:
        /* istanbul ignore next */
        this.targetNode.errors.push({
          message: `Cannot obtain an ${
            signed ? "" : "un"
          }signed integer at ${pointer} of size ${size}`,
          stackTrace: this.getLogStackTrace(),
          type: "ReflectedValue",
        });
        /* istanbul ignore next */
        return 0;
    }
  }

  /**
   * Get a boxed float of a given kind at a pointer location.
   *
   * @param {number} pointer - The pointer location of the number
   * @param {number} size - The size of the float in bytes.
   */
  private getFloat(pointer: number, size: number): number {
    const buffer = this.wasm!.memory.buffer;
    /* istanbul ignore next */
    if (pointer + size >= buffer.byteLength) {
      /* istanbul ignore next */
      this.targetNode.errors.push({
        message: `Cannot obtain a float value at pointer ${pointer} of size ${size}: index out of bounds`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return 0;
    }
    switch (size) {
      case 4:
        return new Float32Array(buffer)[pointer >>> 2];
      case 8:
        return new Float64Array(buffer)[pointer >>> 3];
      /* istanbul ignore next */
      default:
        // sanity checks
        /* istanbul ignore next */
        this.targetNode.errors.push({
          message: `Cannot obtain a float at ${pointer} of size ${size}`,
          stackTrace: this.getLogStackTrace(),
          type: "ReflectedValue",
        });
        /* istanbul ignore next */
        return 0;
    }
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
      this.targetNode.errors.push({
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
      this.targetNode.errors.push({
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
      this.targetNode.errors.push({
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
      this.targetNode.errors.push({
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
      this.targetNode.errors.push({
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
      this.targetNode.errors.push({
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
      this.targetNode.errors.push({
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
      this.targetNode.errors.push({
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
      this.targetNode.errors.push({
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
      this.targetNode.errors.push({
        message: `Cannot push a stack trace to ReflectedValue ${reflectedValueID}. ReflectedValue id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "ReflectedValue",
      });
      /* istanbul ignore next */
      return;
    }
    this.reflectedValueCache[reflectedValueID].stack = this.getLogStackTrace();
  }
}
