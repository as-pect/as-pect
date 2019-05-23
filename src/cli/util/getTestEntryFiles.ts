import glob from "glob";
import { IYargs } from "./IYargs";

export function getTestEntryFiles(yargs: IYargs, include: string[], disclude: RegExp[]): Set<string> {
  const testEntryFiles = new Set<string>();
  const fileRegexArg = yargs.argv.file || yargs.argv.f || ".*";
  const fileRegex: RegExp = new RegExp(fileRegexArg);
  // for each pattern to be included
  for (const pattern of include) {
    // push all the resulting files so that each file gets tested individually
    entry: for (const entry of glob.sync(pattern)) {
      // test for discludes
      for (const test of disclude) {
        if (test.test(entry))
          continue entry;
      }
      // if the fileRegex matches the test, add it to the entry file Set
      if (fileRegex.test(entry))
        testEntryFiles.add(entry);
    }
  }

  return testEntryFiles
}
