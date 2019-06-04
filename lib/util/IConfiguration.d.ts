import { TestReporter } from "../test/TestReporter";
import { IPerformanceConfiguration } from "./IPerformanceConfiguration";
export interface ICompilerFlags {
    [flag: string]: string[];
}
export interface IConfiguration {
    /**
     * A set of globs that denote files that must be used for testing.
     */
    include?: string[];
    /**
     * A set of globs that denote files that must be added to every compilation.
     */
    add?: string[];
    /**
     * The compiler flags needed for this test suite. Do not forget that a binary file must be output.
     */
    flags?: ICompilerFlags;
    /**
     * A set of regular expressions that are tested against the file names. If they match, the
     * files will be discluded.
     */
    disclude?: RegExp[];
    /**
     * The web assembly imports required for testing your module.
     */
    imports?: any;
    /**
     * Set the default performance measurement values.
     */
    performance?: IPerformanceConfiguration;
    /**
     * A custom reporter that extends the `TestReporter` class, and is responsible for generating log
     * output.
     */
    reporter?: TestReporter;
    /**
     * A regular expression that instructs the TestContext to only run tests that match this regex.
     */
    testRegex?: RegExp;
    /**
     * A regular expression that instructs the TestContext to only run groups that match this regex.
     */
    groupRegex?: RegExp;
    /**
     * Specifies if a wasm binary should be output. Default is false.
     */
    outputBinary?: boolean;
}
//# sourceMappingURL=IConfiguration.d.ts.map