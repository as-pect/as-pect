import { TestGroup } from "./TestGroup";
export declare class TestSuite {
    /**
     * All the test groups in this test suite.
     */
    testGroups: TestGroup[];
    /**
     * The total number tests run in this test suite.
     */
    totalTests: number;
    /**
     * The total number test successes in this test suite.
     */
    successCount: number;
    /**
     * The total number of test fails in this test suite.
     */
    failCount: number;
    /**
     * The total number to todos left to complete in this test suite.
     */
    todoCount: number;
    /**
     * The test suite filename.
     */
    filename: string;
    /**
     * The total time it took for this test suite to run in milliseconds rounded to the nearest
     * thousandth.
     */
    time: number;
    /**
     * An indicator if the test suite passed.
     */
    pass: boolean;
}
//# sourceMappingURL=TestSuite.d.ts.map