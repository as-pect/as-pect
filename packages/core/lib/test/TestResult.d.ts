import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { ILogTarget } from "../util/ILogTarget";
import { IWarning } from "./IWarning";
/**
 * This is the data class that contains all the data about each `test()` or `it()` function defined
 * in the `AssemblyScript` module.
 */
export declare class TestResult implements ILogTarget {
    /** This is the test function pointer. */
    functionPointer: number;
    /** The actual test's name or description. */
    name: string;
    /** The indicator to see if the test passed. */
    pass: boolean;
    /** The indicated to see if a test actually ran. */
    ran: boolean;
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
    /** This value indicates the maximum number of samples to collect. */
    maxSamples: number;
    /** This value indicates the maximum test runtime. */
    maxRuntime: number;
    /** The number of decimal places used for rounding. */
    decimalPlaces: number;
    /** This value indicates if an average should be calculated */
    calculateAverageValue: boolean;
    /** This value indicates if an average was calculated. */
    hasAverage: boolean;
    /** This is the average (mean) value. */
    average: number;
    /** This value indicates if a max value should be calculated. */
    calculateMaxValue: boolean;
    /** This value indicates if a max was calculated. */
    hasMax: boolean;
    /** This is the max time. */
    max: number;
    /** This value indicates if a median value should be calculated. */
    calculateMedianValue: boolean;
    /** This value indicates if a median value was calculated. */
    hasMedian: boolean;
    /** This is the calculated median time. */
    median: number;
    /** This value indicated if a min value should be calculated. */
    calculateMinValue: boolean;
    /** This value indicates if a min value was calculated. */
    hasMin: boolean;
    /** This is the calculated min time. */
    min: number;
    /** This value indicates if a standard deviation value should be calculated. */
    calculateStandardDeviationValue: boolean;
    /** This value indicates if a standard deviation value was calculated. */
    hasStdDev: boolean;
    /** This is the calculated standard deviation of the times collected. */
    stdDev: number;
    /** This value indicates if the variance should be calculated. */
    calculateVarianceValue: boolean;
    /** A boolean indicating if the variance was calcluated. */
    hasVariance: boolean;
    /** The raw variance calculation before rounding was applied. */
    rawVariance: number;
    /** This value indicates the calculated variance used for standard deviation calculations. */
    variance: number;
    /** This is the timestamp for when the test started in milliseconds. */
    start: number;
    /** This is the timestamp for when the test ended in milliseconds. */
    end: number;
    /** This is the run time for the test in milliseconds. */
    runTime: number;
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
    /**
     * Calculate the variance.
     */
    calculateVariance(): void;
    /**
     * If the test group did not error, this is the number of allocations that occurred durring the
     * the test's exection.
     */
    allocationCount: number;
    /**
     * If the test group did not error, this is the number of deallocations that occurred durring the
     * the test's exection.
     */
    freeCount: number;
    /**
     * If the test group did not error, this is the number of block decrements that occurred during
     * the test's exection.
     */
    decrementCount: number;
    /**
     * If the test group did not error, this is the number of block increments that occurred during
     * the test's exection.
     */
    incrementCount: number;
    /**
     * This is the number of allocations currently on the heap when the `TestResult` execution starts.
     */
    rtraceStart: number;
    /**
     * If the test group completed, this is the number of allocations currently on the heap when the
     * `TestResult` execution ends.
     */
    rtraceEnd: number;
    /**
     * If the test group completed, this is the delta number of allocations that occured during the
     * `TestResult` execution.
     */
    rtraceDelta: number;
    /**
     * A set of errors that were reported for this test.
     */
    errors: IWarning[];
    /**
     * A set of warnings that were reported for this test.
     */
    warnings: IWarning[];
}
