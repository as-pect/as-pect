import { Options } from './CommandLineArg';
/**
 * This method returns a `Set<string>` of entry files for the compiler to compile.
 *
 * @param {Options} yargs - The command line arguments.
 * @param {string[]} include - An array of globs provided by the configuration.
 * @param {RegExp[]} disclude - An array of RegExp provided by the configuration.
 */
export declare function getTestEntryFiles(yargs: Options, include: string[], disclude: RegExp[]): Set<string>;
//# sourceMappingURL=getTestEntryFiles.d.ts.map