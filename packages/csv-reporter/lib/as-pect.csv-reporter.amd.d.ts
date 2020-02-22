/// <reference types="node" />
declare module "index" {
    import { TestReporter, TestContext, TestGroup, TestResult } from "@as-pect/core";
    import { Stringifier } from "csv-stringify";
    import { WriteStream } from "fs";
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
//# sourceMappingURL=as-pect.csv-reporter.amd.d.ts.map