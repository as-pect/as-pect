/// <reference types="node" />
declare module "test/IWarning" {
    /**
     * This interface describes a warning object.
     */
    export interface IWarning {
        /** This is the type of the warning. */
        type: string;
        /** This is the generated warning message. */
        message: string;
        /** This is the stack trace. */
        stackTrace: string;
    }
}
declare module "util/HostValue" {
    import { HostValueType } from "../../assembly/assembly/internal/HostValueType";
    export class HostValue {
        type: HostValueType;
        typeName: string | null;
        pointer: number;
        typeId: number;
        keys: HostValue[] | null;
        values: HostValue[] | null;
        offset: number;
        value: number | string;
        isNull: boolean;
        nullable: boolean;
        size: number;
        signed: boolean;
        stack: string;
        negated: boolean;
    }
}
declare module "util/ILogTarget" {
    import { IWarning } from "test/IWarning";
    import { HostValue } from "util/HostValue";
    /**
     * This interface describes the shape of an object that can contain log values, warnings, and errors.
     */
    export interface ILogTarget {
        logs: HostValue[];
        errors: IWarning[];
        warnings: IWarning[];
    }
}
declare module "test/PerformanceLimits" {
    /**
     * @ignore
     * This enum is a set of compile time constants that represent the performance limits to prevent
     * unsafe statistics gathering.
     */
    export const enum PerformanceLimits {
        MaxSamples = 10000,
        MaxTestRuntime = 5000,
        MinimumDecimalPlaces = 0,
        MaximumDecimalPlaces = 8
    }
}
declare module "math/mean" {
    /**
     * @ignore
     * This method calculates the average of the input set of numbers.
     *
     * @param {number[]} input - The set of numbers to be averaged.
     */
    export function mean(input: number[]): number;
}
declare module "math/round" {
    /**
     * @ignore
     * This method rounds a number value to a number of decimal places.
     *
     * @param {number} input - The number to be rounded.
     * @param {number} places - The number of decimal places used for rounding.
     */
    export function round(input: number, places: number): number;
}
declare module "math/median" {
    /**
     * @ignore
     * This method calculates the median of the input set of numbers.
     *
     * @param {number[]} input - The set of numbers used to calculate the median.
     */
    export function median(input: number[]): number;
}
declare module "math/variance" {
    /**
     * @ignore
     * This method calculates the statistical variance between the average of the set of numbers
     * and each number provided in the set. This is useful for calculating the standard deviation.
     *
     * @param {number[]} input - The set of numbers used to calculate the variance.
     */
    export function variance(input: number[]): number;
}
declare module "test/TestResult" {
    import { ILogTarget } from "util/ILogTarget";
    import { IWarning } from "test/IWarning";
    import { HostValue } from "util/HostValue";
    /**
     * This is the data class that contains all the data about each `test()` or `it()` function defined
     * in the `AssemblyScript` module.
     */
    export class TestResult implements ILogTarget {
        /** This is the test function pointer. */
        functionPointer: number;
        /** The actual test's name or description. */
        name: string;
        /** The indicator to see if the test passed. */
        pass: boolean;
        /** The indicated to see if a test actually ran. */
        ran: boolean;
        /** The time in milliseconds indicating how long the test ran for each run. */
        times: number[];
        /** The reported actual value description. */
        actual: HostValue | null;
        /** The reported expected value description. */
        expected: HostValue | null;
        /** If the test failed, this is the message describing why the test failed. */
        message: string;
        /** A set of strings logged by the test itself. */
        logs: HostValue[];
        /** The generated stack trace if the test errored. */
        stack: string | null;
        /** This value is set to true if the test is expected to throw. */
        negated: boolean;
        /** This value indicates if performance statistics were collected for this test. */
        performance: boolean;
        /** This value indicates the maximum number of samples to collect. */
        maxSamples: number;
        /** This value indicates the maximum test runtime. */
        maxRuntime: number;
        /** The number of decimal places used for rounding. */
        decimalPlaces: number;
        /** This value indicates if an average should be calculated */
        calculateAverageValue: boolean;
        /** This value indicates if an average was calculated. */
        hasAverage: boolean;
        /** This is the average (mean) value. */
        average: number;
        /** This value indicates if a max value should be calculated. */
        calculateMaxValue: boolean;
        /** This value indicates if a max was calculated. */
        hasMax: boolean;
        /** This is the max time. */
        max: number;
        /** This value indicates if a median value should be calculated. */
        calculateMedianValue: boolean;
        /** This value indicates if a median value was calculated. */
        hasMedian: boolean;
        /** This is the calculated median time. */
        median: number;
        /** This value indicated if a min value should be calculated. */
        calculateMinValue: boolean;
        /** This value indicates if a min value was calculated. */
        hasMin: boolean;
        /** This is the calculated min time. */
        min: number;
        /** This value indicates if a standard deviation value should be calculated. */
        calculateStandardDeviationValue: boolean;
        /** This value indicates if a standard deviation value was calculated. */
        hasStdDev: boolean;
        /** This is the calculated standard deviation of the times collected. */
        stdDev: number;
        /** This value indicates if the variance should be calculated. */
        calculateVarianceValue: boolean;
        /** A boolean indicating if the variance was calcluated. */
        hasVariance: boolean;
        /** The raw variance calculation before rounding was applied. */
        rawVariance: number;
        /** This value indicates the calculated variance used for standard deviation calculations. */
        variance: number;
        /** This is the timestamp for when the test started in milliseconds. */
        start: number;
        /** This is the timestamp for when the test ended in milliseconds. */
        end: number;
        /** This is the run time for the test in milliseconds. */
        runTime: number;
        /**
         * Caclculate the average value of the collected times.
         */
        calculateAverage(): void;
        /**
         * Calculate the max time of the collected times.
         */
        calculateMax(): void;
        /**
         * Calculate the median value of the collected times.
         */
        calculateMedian(): void;
        /**
         * Calculate the min value of the collected times.
         */
        calculateMin(): void;
        /**
         * Calculate the standard deviation of the collected times.
         */
        calculateStandardDeviation(): void;
        /**
         * Calculate the variance.
         */
        calculateVariance(): void;
        /**
         * If the test group did not error, this is the number of allocations that occurred durring the
         * the test's exection.
         */
        allocationCount: number;
        /**
         * If the test group did not error, this is the number of deallocations that occurred durring the
         * the test's exection.
         */
        freeCount: number;
        /**
         * If the test group did not error, this is the number of block decrements that occurred during
         * the test's exection.
         */
        decrementCount: number;
        /**
         * If the test group did not error, this is the number of block increments that occurred during
         * the test's exection.
         */
        incrementCount: number;
        /**
         * If the test did not error, this is the number of block increments that occurred during
         * the test's exection.
         */
        reallocationCount: number;
        /**
         * This is the number of allocations currently on the heap when the `TestResult` execution starts.
         */
        rtraceStart: number;
        /**
         * If the test group completed, this is the number of allocations currently on the heap when the
         * `TestResult` execution ends.
         */
        rtraceEnd: number;
        /**
         * If the test group completed, this is the delta number of allocations that occured during the
         * `TestResult` execution.
         */
        rtraceDelta: number;
        /**
         * A set of errors that were reported for this test.
         */
        errors: IWarning[];
        /**
         * A set of warnings that were reported for this test.
         */
        warnings: IWarning[];
    }
}
declare module "test/TestGroup" {
    import { ILogTarget } from "util/ILogTarget";
    import { TestResult } from "test/TestResult";
    import { IWarning } from "test/IWarning";
    import { HostValue } from "util/HostValue";
    /**
     * This test group class is designed with a data oriented layout in mind. Each test property is
     * represented by an array.
     */
    export class TestGroup implements ILogTarget {
        /**
         * This is the set of function pointers that will be called before each test.
         */
        beforeEachPointers: number[];
        /**
         * This is the set of function pointers that will be called after each test.
         */
        afterEachPointers: number[];
        /**
         * This is the set of function pointers that will be called before each describe block.
         */
        beforeAllPointers: number[];
        /**
         * This is the set of function pointers that will be called after each describe block.
         */
        afterAllPointers: number[];
        /**
         * This is the list of tests that the `TestContext` ran for this group.
         */
        tests: TestResult[];
        /**
         * This is a list of "todos" that were collected for this group.
         */
        todos: string[];
        /**
         * This is the set of log values that were collected before and after the tests ran.
         */
        logs: HostValue[];
        /**
         * This is the name of the test.
         */
        name: string;
        /**
         * This is a value indicating if the group's tests passed successfully.
         */
        pass: boolean;
        /**
         * This is the reason that the group's tests did not pass.
         */
        reason: string;
        /**
         * This is how long the group ran in ms.
         */
        time: number;
        /**
         * A value indicating if this test group should run.
         */
        willRun: boolean;
        /**
         * The group start time.
         */
        start: number;
        /**
         * The group end time.
         */
        end: number;
        /**
         * If the test group did not error, this is the number of allocations that occurred durring the
         * the group's exection.
         */
        allocationCount: number;
        /**
         * If the test group did not error, this is the number of deallocations that occurred durring the
         * the group's exection.
         */
        freeCount: number;
        /**
         * If the test group did not error, this is the number of block decrements that occurred during
         * the group's exection.
         */
        decrementCount: number;
        /**
         * If the test group did not error, this is the number of block increments that occurred during
         * the group's exection.
         */
        incrementCount: number;
        /**
         * If the test group did not error, this is the number of block reallocations that occurred during
         * the group's exection.
         */
        reallocationCount: number;
        /**
         * This is the number of allocations currently on the heap when the `TestGroup` execution starts.
         */
        rtraceStart: number;
        /**
         * If the test group completed, this is the number of allocations currently on the heap when the
         * `TestGroup` execution ends.
         */
        rtraceEnd: number;
        /**
         * If the test group completed, this is the delta number of allocations that occured during the
         * `TestGroup` execution.
         */
        rtraceDelta: number;
        /**
         * The parent describe context that contains callbacks that also apply to this context.
         */
        parent: TestGroup | null;
        children: TestGroup[];
        /**
         * This method creates a new TestGroup that contains a reference to all of the current flow
         * functions of this `TestGroup`.
         */
        fork(): TestGroup;
        errors: IWarning[];
        /**
         * A set of warnings that were reported for this test.
         */
        warnings: IWarning[];
    }
}
declare module "util/IWriteable" {
    /**
     * This interface is a utitily used to describe the shape of something that has a `write()` method.
     */
    export interface IWritable {
        /** This method is used for writing string contents to something that is writable. */
        write(chunk: string): void;
    }
}
declare module "reporter/util/stringifyHostValue" {
    import { HostValue } from "util/HostValue";
    export function stringifyHostValue(hostValue: HostValue, indent: number): string;
}
declare module "reporter/VerboseReporter" {
    import { TestGroup } from "test/TestGroup";
    import { TestResult } from "test/TestResult";
    import { TestContext } from "test/TestContext";
    import { TestReporter } from "test/TestReporter";
    import { IWritable } from "util/IWriteable";
    import { HostValue } from "util/HostValue";
    /**
     * This is the default test reporter class for the `asp` command line application. It will pipe
     * all relevant details about each tests to the `stdout` WriteStream.
     */
    export default class VerboseReporter extends TestReporter {
        protected stdout: IWritable | null;
        constructor(_options?: any);
        /**
         * This method reports a starting TestContext. This method can be called many times, but may
         * be instantiated once
         *
         * @param {TestContext} suite - The test context being started.
         */
        onStart(suite: TestContext): void;
        /**
         * This method reports a TestGroup is starting.
         *
         * @param {TestGroup} group - The started test group.
         */
        onGroupStart(group: TestGroup): void;
        /**
         * This method reports a completed TestGroup.
         *
         * @param {TestGroup} group - The finished TestGroup.
         */
        onGroupFinish(group: TestGroup): void;
        /** This method is a stub for onTestStart(). */
        onTestStart(_group: TestGroup, _test: TestResult): void;
        /**
         * This method reports a completed test.
         *
         * @param {TestGroup} _group - The TestGroup that the TestResult belongs to.
         * @param {TestResult} test - The finished TestResult
         */
        onTestFinish(_group: TestGroup, test: TestResult): void;
        /**
         * This method reports that a TestContext has finished.
         *
         * @param {TestContext} suite - The finished test context.
         */
        onFinish(suite: TestContext): void;
        /**
         * This method reports a todo to stdout.
         *
         * @param {TestGroup} _group - The test group the todo belongs to.
         * @param {string} todo - The todo.
         */
        onTodo(_group: TestGroup, todo: string): void;
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {HostValue} logValue - A value to be logged to the console
         */
        onLog(logValue: HostValue): void;
    }
}
declare module "util/timeDifference" {
    /**
     * @ignore
     * This method calculates the start and end time difference, rounding off to the nearest thousandth
     * of a millisecond.
     *
     * @param {number} end - The end time.
     * @param {number} start - The start time.
     * @returns {number} - The difference of the two times rounded to the nearest three decimal places.
     */
    export const timeDifference: (end: number, start: number) => number;
}
declare module "util/IAspectExports" {
    /**
     * This is the shape of the exported functions provided by the `as-pect` test suite.
     */
    export interface IAspectExports {
        /**
         * This method calls a function pointer that matches the `() => void` type.
         *
         * @param {number} pointer - The function pointer.
         */
        __call(pointer: number): void;
        /**
         * This method is called when the tests are ready to run.
         */
        __ready(): void;
        /**
         * This method notifies the `wasm` module to conditionally ignore `log<T>(value: T)` values
         * because a performance test is running.
         *
         * @param {1 | 0} value - A value indicating if calls to `log()` should be ignored.
         */
        __ignoreLogs(value: 1 | 0): void;
        /**
         * This method disables rtrace calls for the current test context.
         */
        __disableRTrace(): void;
        /**
         * This method returns the `usize[]` of the current module.
         */
        __getUsizeArrayId(): number;
        /** The exported web assembly memory. For compatibility with docs, this is explicit. */
        readonly memory: {
            readonly buffer: ArrayBuffer;
        };
        /** Explicit start function for version 0.8.1. or below. */
        __start(): void;
        /** Explicit start function. */
        _start(): void;
        /** Reads (copies) the value of a string from the module's memory. */
        __getString(ref: number): string;
        /** Allocates a new array in the module's memory and returns a reference (pointer) to it. */
        __allocArray(id: number, values: number[]): number;
        /** Reads (copies) the values of an array from the module's memory. */
        __getArray(ref: number): number[];
        /** Forces a cycle collection. Only relevant if objects potentially forming reference cycles are used. */
        __collect(): void;
        /** The WebAssembly function Table. */
        readonly table?: WebAssembly.Table;
    }
}
declare module "util/IPerformanceConfiguration" {
    /**
     * This is the interface for performance configuration provided to the TestContext object, before
     * tests are run.
     */
    export interface IPerformanceConfiguration {
        [key: string]: number | boolean;
        /** Enable performance statistics gathering. */
        enabled: boolean;
        /** Set the minimum number of samples to run for each test in milliseconds. */
        maxSamples: number;
        /** Set the maximum test run time in milliseconds. */
        maxTestRunTime: number;
        /** Report the median time in the default reporter. */
        reportMedian: boolean;
        /** Report the average time in milliseconds. */
        reportAverage: boolean;
        /** Report the standard deviation. */
        reportStandardDeviation: boolean;
        /** Report the maximum run time in milliseconds. */
        reportMax: boolean;
        /** Report the minimum run time in milliseconds. */
        reportMin: boolean;
        /** Report the variance. */
        reportVariance: boolean;
        /** Set the number of decimal places to round to. */
        roundDecimalPlaces: number;
    }
    /** This method creates a default performance configuration. */
    export function createDefaultPerformanceConfiguration(): IPerformanceConfiguration;
}
declare module "util/wasmTools" {
    /**
     * A Buffer for reading wasm sections.
     */
    export class WasmBuffer {
        u8array: Uint8Array;
        /** Current offset in the buffer. */
        off: number;
        constructor(u8array: Uint8Array);
        /** Read 128LEB unsigned integers. */
        readVaruint(off?: number): number;
        /**
         * Read a UTF8 string from the buffer either at the current offset or one passed in.
         * Updates the offset of the buffer.
         */
        readString(off?: number): string;
        /** Read a string at an offset without changing the buffere's offset. */
        peekString(off: number): string;
    }
    /**
     * Utility class for reading the name sections of a wasm binary.
     * See https://github.com/WebAssembly/design/blob/master/BinaryEncoding.md#name-section
     */
    export class NameSection {
        section: WasmBuffer;
        /** map of indexs to UTF8 pointers. */
        private funcNames;
        constructor(contents: Uint8Array);
        fromIndex(i: number): string;
        /** Parses */
        private parseSection;
        /** Current offset */
        get off(): number;
        /** Update offset */
        set off(o: number);
        /** Reads a 128LEB  unsigned integer and updates the offset. */
        readVaruint(off?: number): number;
    }
}
declare module "test/TestCollector" {
    import { IAspectExports } from "util/IAspectExports";
    import { TestGroup } from "test/TestGroup";
    import { ILogTarget } from "util/ILogTarget";
    import { IWarning } from "test/IWarning";
    import { IPerformanceConfiguration } from "util/IPerformanceConfiguration";
    import { NameSection } from "util/wasmTools";
    import { HostValue } from "util/HostValue";
    /**
     * @ignore
     * This is a collection of all the parameters required for intantiating a TestCollector.
     */
    export interface ITestCollectorParameters {
        /** A provided performance configuration. */
        performanceConfiguration?: Partial<IPerformanceConfiguration>;
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
        binary?: Uint8Array;
    }
    /**
     * @ignore
     * This is an internal class that is responsible for collecting all the tests in a test binary.
     */
    export class TestCollector {
        protected wasm: IAspectExports | null;
        protected nameSection: NameSection | null;
        private groupStack;
        /** A collection of `TestGroup` objects that ran tests after `testContext.run(wasm)` was called. */
        testGroups: TestGroup[];
        /** The root `TestGroup` object. */
        topLevelGroup: TestGroup | null;
        protected logTarget: ILogTarget;
        /** A set of errors that were collected during the testing process. */
        errors: IWarning[];
        /** A set of warnings that were collected during the testing process. */
        warnings: IWarning[];
        /** The name of the AssemblyScript test file. */
        fileName: string;
        protected stack: string;
        protected message: string;
        protected actual: HostValue | null;
        protected expected: HostValue | null;
        private performanceEnabledValue;
        private maxSamplesValue;
        private maxTestRunTimeValue;
        private roundDecimalPlacesValue;
        private recordAverageValue;
        private recordMedianValue;
        private recordStdDevValue;
        private recordMaxValue;
        private recordMinValue;
        private recordVariance;
        private performanceConfiguration;
        /**
         * This value is used to detect if an `expect()` function call was used outside of a test
         * function. If a reportExpected or reportActual function is called before the `context.run()`
         * method is called, it should prevent the `run()` method from running the tests and report a
         * failure.
         */
        protected ready: boolean;
        /**
         * These are the test and group filters for the binary. They must be provided before collection
         * begins.
         */
        protected testRegex: RegExp;
        protected groupRegex: RegExp;
        /**
         * RTrace is a funciton that helps with debugging reference counting and can be used to find
         * leaks. If it is enabled, it will be included automatically by the bootstrap in the
         * assemblyscript imports.
         */
        protected rtraceEnabled: boolean;
        /**
         * A collection of host values used to help cache and aid in the creation
         * of nested host values.
         */
        private hostValueCache;
        private rtraceLabels;
        constructor(props?: ITestCollectorParameters);
        /**
         * Call this method to start the `__main()` method provided by the `as-pect` exports to start the
         * process of test collection.
         */
        protected collectTests(): void;
        /**
         * This method creates a WebAssembly imports object with all the TestContext functions
         * bound to the TestContext.
         *
         * @param {any[]} imports - Every import item specified.
         */
        createImports(...imports: any[]): any;
        /**
         * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
         */
        private debug;
        /**
         * This is a web assembly utility function that wraps a function call in a try catch block to
         * report success or failure.
         *
         * @param {number} pointer - The function pointer to call. It must accept no parameters and return
         * void.
         * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
         * returns 0.
         */
        protected tryCall(pointer: number): 1 | 0;
        /**
         * This web assembly linked function creates a test group. It's called when the test suite calls
         * the describe("test", callback) function from within AssemblyScript. It receives a pointer to
         * the description of the tests, forks the top level test group, pushes the suiteName to a list,
         * then pushes the forked group to the top of the test context stack.
         *
         * @param {number} suiteNamePointer
         */
        private reportDescribe;
        /**
         * This web assembly linked function finishes a test group. It's called when the test suite calls
         * the describe("test", callback) function from within AssemblyScript. It pops the current
         * test group from the test context stack and pushes it to the final test group list.
         */
        private reportEndDescribe;
        /**
         * This web assembly linked function sets the group's "beforeEach" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test.
         */
        private reportBeforeEach;
        /**
         * This web assembly linked function adds the group's "beforeAll" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test in the
         * current context.
         */
        private reportBeforeAll;
        /**
         * This web assembly linked function sets the group's "afterEach" callback pointer.
         *
         * @param {number} callbackPointer - The callback that should run before each test group.
         */
        private reportAfterEach;
        /**
         * This web assembly linked function adds the group's "afterAll" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test in the
         * current context.
         */
        private reportAfterAll;
        /**
         * This web assembly linked function creates a test from the callback and the testNamePointer in
         * the current group. It assumes that the group has already been created with the describe
         * function. It is called when `it("description", callback)` or `test("description", callback)`
         * is called.
         *
         * @param {number} testNamePointer - The test's name pointer.
         * @param {number} callback - The test's function.
         */
        private reportTest;
        /**
         * This web assembly linked function is responsible for reporting tests that are expected
         * to fail. This is useful for verifying that specific application states will throw.
         *
         * @param {number} testNamePointer - The test's name pointer.
         * @param {number} callback - The test's function.
         * @param {number} message - The message associated with this test if it does not throw.
         */
        private reportNegatedTest;
        /**
         * This function reports a single "todo" item in a test suite.
         *
         * @param {number} todoPointer - The todo description string pointer.
         */
        private reportTodo;
        /**
         * This function overrides the provided AssemblyScript `env.abort()` function to catch abort
         * reasons.
         *
         * @param {number} reasonPointer - This points to the message value that causes the expectation to
         * fail.
         * @param {number} _fileNamePointer - The file name that reported the error. (Ignored)
         * @param {number} _line - The line that reported the error. (Ignored)
         * @param {number} _col - The column that reported the error. (Ignored)
         */
        private abort;
        /**
         * This web assembly linked function modifies the state machine to enable
         * performance for the following test.
         *
         * @param {1 | 0} value - A value indicating if performance should be enabled.
         */
        private performanceEnabled;
        /**
         * This web assembly linked function modifies the state machine to set the maximum number of
         * samples for the following test.
         *
         * @param {number} value - The maximum number of samples to collect for the following test.
         */
        private maxSamples;
        /**
         * This web assembly linked function modifies the state machine to set the maximum amount of
         * time to run the following test in milliseconds
         *
         * @param {number} value - The maximum number of milliseconds to run the following test.
         */
        private maxTestRunTime;
        /**
         * This web assembly linked function modifies the state machine to set the number of decimal places
         * to round all the statistics to.
         *
         * @param {number} value - The number of decimal places to round to.
         */
        private roundDecimalPlaces;
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * an average run time.
         *
         * @param {1 | 0} value - A boolean indicating if the average should be reported.
         */
        private reportAverage;
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * an median run time.
         *
         * @param {1 | 0} value - A boolean indicating if the median should be reported.
         */
        private reportMedian;
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * a standard deviation calculation on the run times.
         *
         * @param {1 | 0} value - A boolean indicating if the standard deviation should be reported.
         */
        private reportStdDev;
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the maximum run time for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the max should be reported.
         */
        private reportMax;
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the minimum run time for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the min should be reported.
         */
        private reportMin;
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the variance of the run times for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the min should be reported.
         */
        private reportVariance;
        /**
         * This method reports to the TestContext that an expect function call was used outside of the
         * intended test functions.
         */
        private reportInvalidExpectCall;
        /**
         * Gets an error stack trace.
         */
        protected getErrorStackTrace(ex: Error): string;
        /**
         * Reset all the performance values to the configured values.
         */
        private resetPerformanceValues;
        /**
         * Gets a log stack trace.
         */
        private getLogStackTrace;
        /**
         * This method returns the current rtrace count.
         */
        private getRTraceCount;
        /**
         * This method starts a new rtrace count label.
         *
         * @param {number} label - The RTrace label.
         */
        private startRTrace;
        /**
         * This method ends an RTrace label and returns the difference between the current and the
         * starting reference counts.
         *
         * @param {number} label - The RTrace label.
         * @returns {number}
         */
        private endRTrace;
        /**
         * This is the current number of net allocations that occurred during `TestContext` execution.
         */
        allocationCount: number;
        /**
         * This is the current number of net allocations that occured during `TestGroup` execution.
         */
        protected groupAllocationCount: number;
        /**
         * This is the current number of net allocations that occured during `TestResult` execution.
         */
        protected testAllocationCount: number;
        /**
         * This is the current number of net dellocations that occurred during `TestContext` execution.
         */
        freeCount: number;
        /**
         * This is the current number of net allocations that occured during `TestGroup` execution.
         */
        protected groupFreeCount: number;
        /**
         * This is the current number of net allocations that occured during `TestGroup` execution.
         */
        protected testFreeCount: number;
        /**
         * This is the current number of net increments that occurred during `TestContext` execution.
         */
        protected incrementCount: number;
        /**
         * This is the current number of net increments that occurred during `TestGroup` execution.
         */
        protected groupIncrementCount: number;
        /**
         * This is the current number of net increments that occurred during `TestResult` execution.
         */
        protected testIncrementCount: number;
        /**
         * This is the current number of net decrements that occurred during `TestContext` execution.
         */
        protected decrementCount: number;
        /**
         * This is the current number of net decrements that occurred during `TestGroup` execution.
         */
        protected groupDecrementCount: number;
        /**
         * This is the current number of net decrements that occurred during `TestResult` execution.
         */
        protected testDecrementCount: number;
        /**
         * This is the current number of net reallocations during the `TestContext` execution.
         */
        protected reallocationCount: number;
        /**
         * This is the current number of net reallocations during the `TestGroup` execution.
         */
        protected groupReallocationCount: number;
        /**
         * This is the current number of net reallocations during the `TestResult` execution.
         */
        protected testReallocationCount: number;
        /**
         * This map is responsible for keeping track of which blocks are currently allocated by their id.
         */
        protected blocks: Map<number, number>;
        /**
         * This set contains all the blocks currently allocated for the current test.
         */
        protected testBlocks: Set<number>;
        /**
         * This set contains all the blocks currently allocated for the current group.
         */
        protected groupBlocks: Set<number>;
        /**
         * This method is called when a memory block is allocated on the heap.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        private onalloc;
        /**
         * This method is called when a memory block is deallocated from the heap.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        private onfree;
        /**
         * This method is called when a memory block reference count is incremented.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        private onincrement;
        /**
         * This method is called when a memory block reference count is decremented.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        private ondecrement;
        private onrealloc;
        /**
         * This method reports an error to the current logTarget and the `TestContext`.
         *
         * @param {IWarning} error - The error being reported.
         */
        protected pushError(error: IWarning): void;
        protected pushWarning(warning: IWarning): void;
        /**
         * This linked method gets all the RTrace increments for this entire test up until this point.
         */
        private getRTraceIncrements;
        /**
         * This linked method gets all the RTrace decrements for this entire test up until this point.
         */
        private getRTraceDecrements;
        /**
         * This linked method gets all the RTrace increments for the current group up until this point.
         */
        private getRTraceGroupIncrements;
        /**
         * This linked method gets all the RTrace decrements for the current group up until this point.
         */
        private getRTraceGroupDecrements;
        /**
         * This linked method gets all the RTrace increments for the current test up until this point.
         */
        private getRTraceTestIncrements;
        /**
         * This linked method gets all the RTrace decrements for the current test up until this point.
         */
        private getRTraceTestDecrements;
        /**
         * This linked method gets all the RTrace allocations for this entire test up until this point.
         */
        private getRTraceAllocations;
        /**
         * This linked method gets all the RTrace frees for this entire test up until this point.
         */
        private getRTraceFrees;
        /**
         * This linked method gets all the RTrace increments for this entire test up until this point.
         */
        private getRTraceGroupAllocations;
        /**
         * This linked method gets all the RTrace frees for the current group up until this point.
         */
        private getRTraceGroupFrees;
        /**
         * This linked method gets all the RTrace allocations for the current test up until this point.
         */
        private getRTraceTestAllocations;
        /**
         * This linked method gets all the RTrace allocations for the current test up until this point.
         */
        private getRTraceTestFrees;
        /**
         * This linked method gets all the RTrace reallocations for the current TestContext.
         */
        private getRTraceReallocs;
        /**
         * This linked method gets all the RTrace reallocations for the current TestGroup.
         */
        private getRTraceGroupReallocs;
        /**
         * This linked method gets all the RTrace reallocations for the current TestResult.
         */
        private getRTraceTestReallocs;
        /**
         * This linked method gets all the current RTrace allocations and adds them to an array.
         */
        private getRTraceBlocks;
        /**
         * This linked method gets all the current RTrace allocations for the current group.
         */
        private getRTraceGroupBlocks;
        /**
         * This linked method gets all the current RTrace allocations for the current test.
         */
        private getRTraceTestBlocks;
        /**
         * Gets a string from the wasm module, unless the module string is null. Otherwise it returns
         * a default value.
         */
        private getString;
        /**
         * An override implementation of the AssemblyScript trace function.
         *
         * @param {number} strPointer - The trace string.
         * @param {number} count - The number of arguments to be traced.
         * @param {number[]} args - The traced arguments.
         */
        private trace;
        /**
         * Retrieve the function name of a given web assembly function.
         *
         * @param {number} index - The function index
         */
        private funcName;
        private createHostValue;
        /**
         * Get a boxed integer of a given kind at a pointer location.
         *
         * @param {number} pointer - The pointer location of the number
         * @param {number} size - The size of the integer in bytes
         * @param {boolean} signed - If the number is signed
         */
        private getInteger;
        /**
         * Get a boxed float of a given kind at a pointer location.
         *
         * @param {number} pointer - The pointer location of the number
         * @param {number} size - The size of the float in bytes.
         */
        private getFloat;
        /**
         * Log a host value.
         *
         * @param {number} id - The HostValue id
         */
        private logHostValue;
        /**
         * Report an actual host value.
         *
         * @param {number} id - The HostValue id
         */
        private reportActualHostValue;
        /**
         * Report an expected host value.
         *
         * @param {number} id - The HostValue id
         */
        private reportExpectedHostValue;
        /**
         * Push a host value to a given host value.
         *
         * @param {number} hostValueID - The target host value parent.
         * @param {number} valueID - The target host value to be pushed.
         */
        private pushHostObjectValue;
        /**
         * Push a host value key to a given host value.
         *
         * @param {number} hostValueID - The target host value parent.
         * @param {number} keyId - The target host value key to be pushed.
         */
        private pushHostObjectKey;
        /**
         * Clear the expected value.
         */
        private clearExpected;
        /**
         * Clear the actual value.
         */
        private clearActual;
        /**
         * Report an expected truthy value, and if it's negated.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        private reportExpectedTruthy;
        /**
         * Report an expected truthy value, and if it's negated.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        private reportExpectedFalsy;
        /**
         * Report an expected finite value, and if it's negated.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        private reportExpectedFinite;
        /**
         * Attaches a stack trace to the given hostValue by it's id.
         *
         * @param {number} hostValueID - The given host value.
         */
        private attachStackTraceToHostValue;
    }
}
declare module "test/TestContext" {
    import { TestReporter } from "test/TestReporter";
    import { IAspectExports } from "util/IAspectExports";
    import { TestCollector, ITestCollectorParameters } from "test/TestCollector";
    import { IWritable } from "util/IWriteable";
    export interface ITestContextParameters extends ITestCollectorParameters {
        reporter?: TestReporter;
        stdout?: IWritable;
        stderr?: IWritable;
    }
    export class TestContext extends TestCollector {
        time: number;
        pass: boolean;
        startupTime: number;
        reporter: TestReporter;
        stdout: IWritable | null;
        stderr: IWritable | null;
        private endGroup;
        constructor(props?: ITestContextParameters);
        /**
         * Run the tests on the wasm module.
         */
        run(wasm: IAspectExports): void;
        private runGroup;
        /**
         * Run a given test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current run group.
         * @param {number} testIndex - The current test index.
         */
        private runTest;
        /**
         * Run the current test once and collect statistics.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         * @param {number} testIndex - The current test index.
         */
        private runTestCall;
        /**
         * Run the afterEach callbacks before running the test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         */
        private runAfterEach;
        /**
         * Run the beforeEach callbacks before running the test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         */
        private runBeforeEach;
        /**
         * Run the beforeAll callbacks with the given runContext and group. This
         * method only calls the current group's beforeAll callbacks.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         */
        private runAfterAll;
        /**
         * Run the beforeAll callbacks with the given runContext and group. This
         * method only calls the current group's beforeAll callbacks.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         */
        private runBeforeAll;
    }
}
declare module "test/TestReporter" {
    import { TestContext } from "test/TestContext";
    import { TestGroup } from "test/TestGroup";
    import { TestResult } from "test/TestResult";
    /**
     * This is the abstract shape of a `TestReporter`. It can be extended to create a `TestReporter`.
     */
    export abstract class TestReporter {
        /**
         * A function that is called when a test suite starts.
         *
         * @param {TestSuite} suite - The started test suite.
         */
        abstract onStart(suite: TestContext): void;
        /**
         * A function that is called when a test group starts.
         *
         * @param {TestGroup} group - The started test group.
         */
        abstract onGroupStart(group: TestGroup): void;
        /**
         * A function that is called when a test group ends.
         *
         * @param {TestGroup} group - The ended test group.
         */
        abstract onGroupFinish(group: TestGroup): void;
        /**
         * A function that is called when a test starts.
         *
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The generated test result reference that will be used for the test.
         */
        abstract onTestStart(group: TestGroup, result: TestResult): void;
        /**
         * A function that is called when a test ends.
         *
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The generated test result reference.
         */
        abstract onTestFinish(group: TestGroup, result: TestResult): void;
        /**
         * A function that is called when a test suite ends.
         *
         * @param {TestSuite} suite - The ended test suite.
         */
        abstract onFinish(suite: TestContext): void;
        /**
         * A function that is called when a test group reports a "todo" item.
         *
         * @param {TestGroup} group - The current test group.
         * @param {string} todo - The todo description.
         */
        abstract onTodo(group: TestGroup, todo: string): void;
    }
}
declare module "reporter/CombinationReporter" {
    import { TestReporter } from "test/TestReporter";
    import { TestContext } from "test/TestContext";
    import { TestGroup } from "test/TestGroup";
    import { TestResult } from "test/TestResult";
    /**
     * This reporter is used to combine a set of reporters into a single reporter object. It uses
     * forEach() to call each reporter's function when each method is called.
     */
    export default class CombinationReporter extends TestReporter {
        protected reporters: TestReporter[];
        constructor(reporters: TestReporter[]);
        onFinish(suite: TestContext): void;
        onGroupFinish(group: TestGroup): void;
        onGroupStart(group: TestGroup): void;
        onStart(suite: TestContext): void;
        onTestStart(group: TestGroup, result: TestResult): void;
        onTestFinish(group: TestGroup, result: TestResult): void;
        onTodo(group: TestGroup, todo: string): void;
    }
}
declare module "reporter/CSVReporter" {
    import { TestReporter } from "test/TestReporter";
    import { TestContext } from "test/TestContext";
    import { Stringifier } from "csv-stringify";
    import { WriteStream } from "fs";
    import { TestGroup } from "test/TestGroup";
    import { TestResult } from "test/TestResult";
    /**
     * This class is responsible for creating a csv file located at {testName}.spec.csv. It will
     * contain a set of tests with relevant pass and fail information.
     */
    export default class CSVReporter extends TestReporter {
        protected output: Stringifier | null;
        protected fileName: WriteStream | null;
        constructor(_options?: any);
        onStart(suite: TestContext): void;
        onGroupStart(): void;
        onGroupFinish(): void;
        onFinish(): void;
        onTestStart(): void;
        onTestFinish(group: TestGroup, result: TestResult): void;
        onTodo(group: TestGroup, desc: string): void;
    }
}
declare module "reporter/EmptyReporter" {
    import { TestReporter } from "test/TestReporter";
    /**
     * This class can be used as a stub reporter to interface with the `TestContext` in the browser.
     * It will not report any information about the tests.
     */
    export default class EmptyReporter extends TestReporter {
        constructor(_options?: any);
        onFinish(): void;
        onGroupFinish(): void;
        onGroupStart(): void;
        onStart(): void;
        onTestFinish(): void;
        onTestStart(): void;
        onTodo(): void;
    }
}
declare module "reporter/JSONReporter" {
    import { TestReporter } from "test/TestReporter";
    import { TestContext } from "test/TestContext";
    import { WriteStream } from "fs";
    import { TestGroup } from "test/TestGroup";
    import { TestResult } from "test/TestResult";
    /**
     * This class reports all relevant test statistics to a JSON file located at
     * `{testLocation}.spec.json`.
     */
    export default class JSONReporter extends TestReporter {
        constructor(_options?: any);
        protected file: WriteStream | null;
        private first;
        onStart(suite: TestContext): void;
        onGroupStart(): void;
        onGroupFinish(): void;
        onFinish(): void;
        onTestStart(): void;
        onTestFinish(group: TestGroup, result: TestResult): void;
        onTodo(group: TestGroup, desc: string): void;
    }
}
declare module "reporter/SummaryReporter" {
    import { TestReporter } from "test/TestReporter";
    import { TestContext } from "test/TestContext";
    import { HostValue } from "util/HostValue";
    /**
     * This test reporter should be used when logging output and test validation only needs happen on
     * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
     * process.
     */
    export default class SummaryReporter extends TestReporter {
        private enableLogging;
        constructor(options?: any);
        onStart(): void;
        onGroupStart(): void;
        onGroupFinish(): void;
        onTestStart(): void;
        onTestFinish(): void;
        onTodo(): void;
        private stdout;
        /**
         * This method reports a test context is finished running.
         *
         * @param {TestContext} suite - The finished test suite.
         */
        onFinish(suite: TestContext): void;
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {HostValue} logValue - A value to be logged to the console
         */
        onLog(logValue: HostValue): void;
    }
}
declare module "index" {
    import CombinationReporter from "reporter/CombinationReporter";
    import CSVReporter from "reporter/CSVReporter";
    import EmptyReporter from "reporter/EmptyReporter";
    import JSONReporter from "reporter/JSONReporter";
    import SummaryReporter from "reporter/SummaryReporter";
    import VerboseReporter from "reporter/VerboseReporter";
    export { CombinationReporter };
    export { CSVReporter };
    export { EmptyReporter };
    export { JSONReporter };
    export { SummaryReporter };
    export { VerboseReporter };
    export * from "test/IWarning";
    export * from "test/TestContext";
    export * from "test/TestGroup";
    export * from "test/TestReporter";
    export * from "test/TestResult";
    export * from "util/IAspectExports";
    export * from "util/ILogTarget";
    export * from "util/IPerformanceConfiguration";
    export * from "util/HostValue";
}
declare module "transform/createGenericTypeParameter" {
    import { Range, TypeNode } from "assemblyscript";
    /**
     * This method makes a generic named parameter.
     *
     * @param {string} name - The name of the type.
     * @param {Range} range - The range given for the type parameter.
     */
    export function createGenericTypeParameter(name: string, range: Range): TypeNode;
}
declare module "transform/createAddHostValueKeyValuePairsMember" {
    import { FunctionDeclaration, ClassDeclaration } from "assemblyscript";
    export function createAddHostValueKeyValuePairsMember(classDeclaration: ClassDeclaration): FunctionDeclaration;
}
declare module "transform/createStrictEqualsMember" {
    import { ClassDeclaration, FunctionDeclaration } from "assemblyscript";
    /**
     * This method creates a single FunctionDeclaration that allows Reflect.equals
     * to validate normal class member values.
     *
     * @param {ClassDeclaration} classDeclaration - The class that requires a new function.
     */
    export function createStrictEqualsMember(classDeclaration: ClassDeclaration): FunctionDeclaration;
}
declare module "transform/emptyTransformer" {
    import { Parser } from "assemblyscript";
    const _default: {
        new (): {
            /**
             * This method results in a pure AST transform that inserts a strictEquals member
             * into each ClassDeclaration.
             *
             * @param {Parser} parser - The AssemblyScript parser.
             */
            afterParse(_: Parser): void;
            readonly program: import("assemblyscript").Program;
            readonly baseDir: string;
            readonly stdout: import("assemblyscript/cli/asc").OutputStream;
            readonly stderr: import("assemblyscript/cli/asc").OutputStream;
            readonly log: {
                (message?: any, ...optionalParams: any[]): void;
                (message?: any, ...optionalParams: any[]): void;
            };
            writeFile(filename: string, contents: string | Uint8Array, baseDir: string): boolean;
            readFile(filename: string, baseDir: string): string | null;
            listFiles(dirname: string, baseDir: string): string[] | null;
            afterCompile?(module: import("assemblyscript").Module): void;
        };
    };
    export = _default;
}
declare module "transform/index" {
    import { Parser } from "assemblyscript";
    const _default_1: {
        new (): {
            /**
             * This method results in a pure AST transform that inserts a strictEquals member
             * into each ClassDeclaration.
             *
             * @param {Parser} parser - The AssemblyScript parser.
             */
            afterParse(parser: Parser): void;
            readonly program: import("assemblyscript").Program;
            readonly baseDir: string;
            readonly stdout: import("assemblyscript/cli/asc").OutputStream;
            readonly stderr: import("assemblyscript/cli/asc").OutputStream;
            readonly log: {
                (message?: any, ...optionalParams: any[]): void;
                (message?: any, ...optionalParams: any[]): void;
            };
            writeFile(filename: string, contents: string | Uint8Array, baseDir: string): boolean;
            readFile(filename: string, baseDir: string): string | null;
            listFiles(dirname: string, baseDir: string): string[] | null;
            afterCompile?(module: import("assemblyscript").Module): void;
        };
    };
    export = _default_1;
}
//# sourceMappingURL=as-pect.core.amd.d.ts.map