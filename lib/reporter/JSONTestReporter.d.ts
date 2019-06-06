/// <reference types="node" />
import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { WriteStream } from "fs";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
/**
 * This class reports all relevant test statistics to a JSON file located at
 * `{testLocation}.spec.json`.
 */
export declare class JSONTestReporter extends TestReporter {
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
//# sourceMappingURL=JSONTestReporter.d.ts.map