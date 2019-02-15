import { Reporter } from "../reporter/Reporter";
export interface IConfiguration {
    /**
     * A string of globs to find the files that will be included in the test suite.
     */
    include: string[];
    /**
     * And array of regular expressions that are tested against the file names. If they match, the
     * files will be discluded.
     */
    disclude?: RegExp[];
    /**
     * If the test module requires a set of imports to be loaded, it can be set here.
     */
    imports?: any;
    /**
     * A custom reporter that extends the `Reporter` class, and is responsible for generating log
     * output.
     */
    reporter?: Reporter;
}
//# sourceMappingURL=IConfiguration.d.ts.map