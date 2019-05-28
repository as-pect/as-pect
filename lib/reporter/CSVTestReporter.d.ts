/// <reference types="node" />
import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { Stringifier } from "csv-stringify";
import { WriteStream } from "fs";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
export declare class CSVTestReporter extends TestReporter {
    protected output: Stringifier | null;
    protected fileName: WriteStream | null;
    onStart(suite: TestContext): void;
    onGroupStart(): void;
    onGroupFinish(): void;
    onFinish(): void;
    onTestStart(): void;
    onTestFinish(group: TestGroup, result: TestResult): void;
    onTodo(group: TestGroup, desc: string): void;
}
//# sourceMappingURL=CSVTestReporter.d.ts.map