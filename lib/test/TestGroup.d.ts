import { TestResult } from "./TestResult";
export declare class TestGroup {
    suiteNamePointer: number;
    beforeAll: number;
    beforeEach: number;
    testFunctionPointers: number[];
    testNamePointers: number[];
    success: number;
    fail: number;
    total: number;
    afterEach: number;
    afterAll: number;
    todoPointers: number[];
    name: string;
    pass: boolean;
    time: number;
    results: TestResult[];
    todos: string[];
    reason: string;
}
//# sourceMappingURL=TestGroup.d.ts.map