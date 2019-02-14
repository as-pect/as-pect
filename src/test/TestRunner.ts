import { TestSuite } from "./TestSuite";
import { TestGroup } from "./TestGroup";

import { ASUtil, instantiateBuffer } from "assemblyscript/lib/loader";
import { TestResult } from "./TestResult";
import { Reporter } from "../reporter/Reporter";
import { DefaultReporter } from "../reporter/DefaultReporter";
const { performance } = require('perf_hooks');

const hex = (value: number) => {
  var result: string = value.toString(16);
  if (result.length === 1) return "0" + result;
  return result;
};

export class TestRunner {
  constructor() {

  }

  public reason: string = "";
  public suite: TestSuite | null = null;
  public actual: string = "";
  public expected: string = "";
  public passed: boolean = true;
  public wasm: ASUtil | null = null;

  createImports(imports: any = {}): any {
    imports.env = {
      abort: this.abort.bind(this),
    };
    imports.__aspect = {
      clearExpected: this.clearExpected.bind(this),
      tryCall: this.tryCall.bind(this),
      reportDescribe: this.reportDescribe.bind(this),
      reportTest: this.reportTest.bind(this),
      reportBeforeEach: this.reportBeforeEach.bind(this),
      reportBeforeAll: this.reportBeforeAll.bind(this),
      reportAfterEach: this.reportAfterEach.bind(this),
      reportAfterAll: this.reportAfterAll.bind(this),
      reportTodo: this.reportTodo.bind(this),
      reportActualNull: this.reportActualNull.bind(this),
      reportExpectedNull: this.reportExpectedNull.bind(this),
      reportActualValue: this.reportActualValue.bind(this),
      reportExpectedValue: this.reportExpectedValue.bind(this),
      reportActualReference: this.reportActualReference.bind(this),
      reportExpectedReference: this.reportExpectedReference.bind(this),
      reportActualString: this.reportActualString.bind(this),
      reportExpectedString: this.reportExpectedString.bind(this),
    };
    return imports;
  }

  run(filename: string, buffer: Uint8Array, imports: any = {}, reporter: Reporter = new DefaultReporter()): void {
    var start = 0;
    var end = 0;
    var groupstart = 0;
    var groupend = 0;
    var teststart = 0;
    var testend = 0;
    this.passed = true;
    this.suite = new TestSuite();
    this.wasm = instantiateBuffer(buffer, this.createImports(imports));

    this.suite.filename = filename;
    reporter.onStart(this.suite);
    start = performance.now();

    groupLoop:
    for (const group of this.suite.groups) {
      // set the group name
      const groupName = this.wasm.getString(group.describe);
      group.name = groupName;
      group.pass = true;

      reporter.onGroupStart(group);

      // start the timer
      groupstart = performance.now();

      // run beforeAll
      const beforeAllResult = this.tryCall(group.beforeAll);

      // if the callback throws an error
      if (beforeAllResult === 0) {
        groupend = performance.now();
        group.pass = false;
        group.reason = `Test suite ${groupName} failed in beforeAll callback.`;
        this.passed = false;
        continue;
      }

      // for each test function
      for (let i = 0; i < group.testFunctionPointers.length; i++) {

        // create a new test result
        const result = new TestResult();
        const testname = this.wasm.getString(group.testNamePointers[i]);
        result.description = testname;

        // run beforeEach
        const beforeEachResult = this.tryCall(group.beforeEach);
        if (beforeEachResult === 0) {
          groupend = performance.now();
          group.pass = false;
          group.reason = `Test suite ${groupName} failed in beforeEach callback.`;
          this.passed = false;
          continue groupLoop;
        }

        reporter.onTestStart(group, result);

        // start the test
        teststart = performance.now();

        // run the test
        const testCallResult = this.tryCall(group.testFunctionPointers[i]);

        // the test is ended
        testend = performance.now();
        group.total++;
        this.suite.total++;

        // calculate test time
        const testtime = Math.round((testend - teststart) * 1000) / 1000;

        // the test passed!
        if (testCallResult === 1) {
          result.pass = true;
          result.time = testtime;
          group.success++;
          this.suite.success++;
        } else { // the test failed
          result.pass = false;
          result.reason = this.reason;
          result.actual = this.actual;
          result.expected = this.expected;
          group.fail++;
          this.suite.fail++;
          this.passed = false;
        }

        // run afterEach
        const afterEachResult = this.tryCall(group.afterEach);
        if (afterEachResult === 0) {
          groupend = performance.now();
          group.pass = false;
          group.reason = `Test suite ${groupName} failed in afterEach callback.`;
          this.passed = false;
          continue groupLoop;
        }

        reporter.onTestFinish(group, result);
      }

      // run afterAll
      const afterAllResult = this.tryCall(group.afterAll);
      if (afterAllResult === 0) {
        groupend = performance.now();
        group.pass = false;
        group.reason = `Test suite ${groupName} failed in afterAll callback.`;
        this.passed = false;
        continue groupLoop;
      }

      groupend = performance.now();

      const grouptime = Math.round((groupend - groupstart) * 1000) / 1000;
      group.reason = `Test suite ${groupName} passed successfully.`;
      group.time = grouptime;

      reporter.onGroupFinish(group);
    }

    end = performance.now();
    this.suite.time = Math.round((end - start) * 1000) / 1000;
    this.suite.passed = this.passed;
    reporter.onFinish(this.suite);
  }
  tryCall(pointer: number): 1 | 0 {
    if (pointer === -1) return 1;

    var func = this.wasm!.getFunction(pointer);
    try {
      func();
    } catch (ex){
      return 0;
    }
    return 1;
  }
  reportDescribe(suiteName: number): void {
    const group = new TestGroup();
    group.describe = suiteName;
    this.suite!.groups.push(group);
  }
  reportTest(testName: number, callback: number): void {
    var group = this.suite!.groups[this.suite!.groups.length - 1];
    group.testFunctionPointers.push(callback);
    group.testNamePointers.push(testName);
  }
  reportBeforeEach(cb: number): void {
    var group = this.suite!.groups[this.suite!.groups.length - 1];
    group.beforeEach = cb;
  }
  reportBeforeAll(cb: number): void {
    var group = this.suite!.groups[this.suite!.groups.length - 1];
    group.beforeAll = cb;
  }
  reportAfterEach(cb: number): void {
    var group = this.suite!.groups[this.suite!.groups.length - 1];
    group.afterEach = cb;
  }

  reportAfterAll(cb: number): void {
    var group = this.suite!.groups[this.suite!.groups.length - 1];
    group.afterAll = cb;
  }

  reportTodo(value: number): void {
    var group = this.suite!.groups[this.suite!.groups.length -1];
    group.todoPointers.push(value);
  }

  reportActualString(value: number): void {
    this.actual = `"${this.wasm!.getString(value)}`;
  }

  reportExpectedString(value: number, negated: 1 | 0): void {
    this.expected = (negated === 1 ? "not " : "") + `"${this.wasm!.getString(value)}`;
  }

  reportActualNull(): void {
    this.actual = "null";
  }

  reportExpectedNull(negated: 1 | 0): void {
    this.expected = (negated === 1 ? "not " : "") + "null";
  }

  reportActualValue(value: number): void {
    this.actual = value.toString();
  }

  reportExpectedValue(value: number, negated: 0 | 1): void {
    this.expected = (negated === 1 ? "not " : "") + value.toString();
  }

  reportActualReference(value: number, offset: number): void {
    this.actual = Array.from(this.wasm!.U8.slice(value, value + offset)).map(hex).join(" ");
  }

  reportExpectedReference(value: number, offset: number, negated: 1 | 0): void {
    this.expected = (negated === 1 ? "not " : "" )
      + Array.from(this.wasm!.U8.slice(value, value + offset)).map(hex).join(" ");
  }

  clearExpected(): void {
    this.expected = "";
    this.actual = "";
  }

  abort(reasonPointer: number, _fileNamePointer: number, _c: number, _d: number): void {
    this.reason = this.wasm!.getString(reasonPointer);
  }
}
