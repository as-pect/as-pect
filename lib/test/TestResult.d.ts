import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
export declare class TestResult {
    /**
     * The actual test's name or description.
     */
    testName: string;
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
    log: LogValue[];
    /**
     * The generated stack trace if the test errored.
     */
    stack: string | null;
}
//# sourceMappingURL=TestResult.d.ts.map