import { LogValue } from "../util/LogValue";
import { ILogTarget } from "../util/ILogTarget";
import { TestResult } from "./TestResult";
export declare class TestGroup implements ILogTarget {
    describePointers: number[];
    beforeEachPointers: number[];
    afterEachPointers: number[];
    beforeAllPointers: number[];
    afterAllPointers: number[];
    testFunctionPointers: number[];
    testNamePointers: number[];
    testMessagePointers: number[];
    testThrows: boolean[];
    tests: TestResult[];
    todos: number[];
    logs: LogValue[];
    name: string;
    pass: boolean;
    reason: string;
    time: number;
    fork(): TestGroup;
}
//# sourceMappingURL=TestGroup.d.ts.map