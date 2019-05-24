import { LogValue } from "../util/LogValue";
import { ILogTarget } from "../util/ILogTarget";
import { TestResult } from "./TestResult";
/**
 * This test group class is designed with a data oriented layout in mind. Each test property is
 * represented by an array.
 */
export declare class TestGroup implements ILogTarget {
    describePointers: number[];
    beforeEachPointers: number[];
    afterEachPointers: number[];
    beforeAllPointers: number[];
    afterAllPointers: number[];
    testFunctionPointers: number[];
    testNames: string[];
    testMessages: string[];
    testThrows: boolean[];
    tests: TestResult[];
    todoPointers: number[];
    todos: string[];
    logs: LogValue[];
    name: string;
    pass: boolean;
    reason: string;
    time: number;
    performanceEnabled: Array<boolean | undefined>;
    maxSamples: Array<number | undefined>;
    roundDecimalPlaces: Array<number | undefined>;
    maxTestRuntime: Array<number | undefined>;
    reportAverage: Array<boolean | undefined>;
    reportMedian: Array<boolean | undefined>;
    reportStandardDeviation: Array<boolean | undefined>;
    reportMax: Array<boolean | undefined>;
    reportMin: Array<boolean | undefined>;
    reportVariance: Array<boolean | undefined>;
    fork(): TestGroup;
}
//# sourceMappingURL=TestGroup.d.ts.map