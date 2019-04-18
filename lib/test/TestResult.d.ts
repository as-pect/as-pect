import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { ILogTarget } from "../util/ILogTarget";
/**
 * This is the data class that contains all the data about each `test()` or `it()` function defined
 * in the `AssemblyScript` module.
 */
export declare class TestResult implements ILogTarget {
    /** The actual test's name or description. */
    name: string;
    /** The indicator to see if the test passed. */
    pass: boolean;
    /** The time in milliseconds indicating how long the test ran for each run. */
    times: number[];
    /** The reported actual value description. */
    actual: ActualValue | null;
    /** The reported expected value description. */
    expected: ActualValue | null;
    /** If the test failed, this is the message describing why the test failed. */
    message: string;
    /** A set of strings logged by the test itself. */
    logs: LogValue[];
    /** The generated stack trace if the test errored. */
    stack: string | null;
    /** This value is set to true if the test is expected to throw. */
    negated: boolean;
    /** This value indicates if performance statistics were collected for this test. */
    performance: boolean;
    /** This value indicates if an average was calculated. */
    hasAverage: boolean;
    /** This is the average (mean) value. */
    average: number;
    /** This value indicates if a max was calculated. */
    hasMax: boolean;
    /** This is the max time. */
    max: number;
    /** This value indicates if a median value was calculated. */
    hasMedian: boolean;
    /** This is the calculated median time. */
    median: number;
    /** This value indicates if a min value was calculated. */
    hasMin: boolean;
    /** This is the calculated min time. */
    min: number;
    /** This value indicates if a standard deviation value was calculated. */
    hasStdDev: boolean;
    /** This is the calculated standard deviation of the times collected. */
    stdDev: number;
    /**
     * Caclculate the average value of the collected times.
     */
    calculateAverage(): void;
    /**
     * Calculate the max time of the collected times.
     */
    calculateMax(): void;
    /**
     * Calculate the median value of the collected times.
     */
    calculateMedian(): void;
    /**
     * Calculate the min value of the collected times.
     */
    calculateMin(): void;
    /**
     * Calculate the standard deviation of the collected times.
     */
    calculateStandardDeviation(): void;
}
//# sourceMappingURL=TestResult.d.ts.map