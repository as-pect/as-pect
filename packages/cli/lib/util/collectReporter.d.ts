import { TestReporter } from "@as-pect/core";
import { Options } from "./CommandLineArg";
/**
 * This method inspects the command line arguments and returns the corresponding TestReporter.
 *
 * @param {Options} cliOptions - The command line arguments.
 */
export declare function collectReporter(cliOptions: Options): TestReporter;
