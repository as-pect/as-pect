import glob from "glob";
import { Options } from "./CommandLineArg";

/**
 * @ignore
 * This method returns a `Set<string>` of entry files for the compiler to compile.
 *
 * @param {Options} cliOptions - The command line arguments.
 * @param {string[]} include - An array of globs provided by the configuration.
 * @param {RegExp[]} disclude - An array of RegExp provided by the configuration.
 */
export function getTestEntryFiles(
  cliOptions: Options,
  include: string[],
  disclude: RegExp[],
): Set<string> {
  const testEntryFiles = new Set<string>();
  const fileRegexArg = cliOptions.file;
  const fileRegex: RegExp = new RegExp(fileRegexArg);
  // for each pattern to be included
  for (const pattern of include) {
    // push all the resulting files so that each file gets tested individually
    entry: for (const entry of glob.sync(pattern)) {
      // test for discludes
      for (const test of disclude) {
        if (test.test(entry)) continue entry;
      }
      // if the fileRegex matches the test, add it to the entry file Set
      if (fileRegex.test(entry)) testEntryFiles.add(entry);
    }
  }

  return testEntryFiles;
}
