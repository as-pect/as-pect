import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
/**
 * This reporter is used to combine a set of reporters into a single reporter object. It uses
 * forEach() to call each reporter's function when each method is called.
 */
export default class CombinationReporter extends TestReporter {
    protected reporters: TestReporter[];
    constructor(reporters: TestReporter[]);
    onFinish(suite: TestContext): void;
    onGroupFinish(group: TestGroup): void;
    onGroupStart(group: TestGroup): void;
    onStart(suite: TestContext): void;
    onTestStart(group: TestGroup, result: TestResult): void;
    onTestFinish(group: TestGroup, result: TestResult): void;
    onTodo(group: TestGroup, todo: string): void;
}
