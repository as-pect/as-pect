import { LogValue } from "../util/LogValue";
import { ILogTarget } from "../util/ILogTarget";
import { TestResult } from "./TestResult";
/**
 * This test group class is designed with a data oriented layout in mind. Each test property is
 * represented by an array.
 */
export declare class TestGroup implements ILogTarget {
    tests: TestResult[];
    todos: string[];
    logs: LogValue[];
    name: string;
    pass: boolean;
    reason: string;
    time: number;
    start: number;
    end: number;
}
//# sourceMappingURL=TestGroup.d.ts.map