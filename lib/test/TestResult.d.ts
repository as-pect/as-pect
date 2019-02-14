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
    actual: string;
    /**
     * The reported expected value description.
     */
    expected: string;
    /**
     * If the test failed, this is the message describing why the test failed.
     */
    message: string;
}
//# sourceMappingURL=TestResult.d.ts.map