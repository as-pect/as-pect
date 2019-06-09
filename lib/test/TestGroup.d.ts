import { LogValue } from "../util/LogValue";
import { ILogTarget } from "../util/ILogTarget";
import { TestResult } from "./TestResult";
import { IWarning } from "./IWarning";
/**
 * This test group class is designed with a data oriented layout in mind. Each test property is
 * represented by an array.
 */
export declare class TestGroup implements ILogTarget {
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
    logs: LogValue[];
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
     * This method creates a new TestGroup that contains a reference to all of the current flow
     * functions of this `TestGroup`.
     */
    fork(): TestGroup;
    errors: IWarning[];
}
//# sourceMappingURL=TestGroup.d.ts.map