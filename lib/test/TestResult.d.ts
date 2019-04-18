import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { ILogTarget } from "../util/ILogTarget";
export declare class TestResult implements ILogTarget {
    /**
     * The actual test's name or description.
     */
    name: string;
    /**
     * The indicator to see if the test passed.
     */
    pass: boolean;
    /**
     * The time in milliseconds indicating how long the test ran.
     */
    time: number;
    /**
     * The reported actual value description.
     */
    actual: ActualValue | null;
    /**
     * The reported expected value description.
     */
    expected: ActualValue | null;
    /**
     * If the test failed, this is the message describing why the test failed.
     */
    message: string;
    /**
     * A set of strings logged by the test itself.
     */
    logs: LogValue[];
    /**
     * The generated stack trace if the test errored.
     */
    stack: string | null;
    /**
     * This value is set to true if the test is expected to throw.
     */
    negated: boolean;
}
//# sourceMappingURL=TestResult.d.ts.map