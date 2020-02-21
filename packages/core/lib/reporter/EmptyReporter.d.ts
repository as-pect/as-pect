import { TestReporter } from "../test/TestReporter";
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
//# sourceMappingURL=EmptyReporter.d.ts.map