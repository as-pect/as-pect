/// <reference types="node" />
declare module "index" {
    import { TestReporter, TestContext, TestResult, TestGroup } from "@as-pect/core";
    import { WriteStream } from "fs";
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
//# sourceMappingURL=as-pect.json-reporter.amd.d.ts.map