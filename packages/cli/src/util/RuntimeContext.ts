import { ConfigurationRequire, diag } from "configinator";
import { AspectDiagonstics } from "./diag";
import {
  CombinationReporter,
  IReporter,
  SummaryReporter,
  VerboseReporter,
} from "@as-pect/core";

const diagAny = diag as any;

export type RuntimeContextOptions {
  testFiles: Set<string>;
  testFileGlobs: string[];
  addFiles: Set<string>;
  addFileGlobs: string[];
  target: string;
  coverage: string[];
  coverageIgnore: string[];
  coverageJson: boolean;
  coverageYaml: boolean;
  verbose: boolean;
  summary: boolean;
  reporter: ConfigurationRequire;
  json: boolean;
  csv: boolean;
}

export class RuntimeContext {
  diagnostics: string[] = [];
  exitCode: number = 0;

  constructor(public options: RuntimeContextOptions) {
    // run diagonstics on the test state and validate that aspect can even run

    if (options.testFiles.size === 0) {
      this.diagnostics.push(diagAny(
        AspectDiagonstics.ASP_100_Invalid_Configuration_Include_Patterns_Matched_No_Tests,
        [JSON.stringify(options.testFileGlobs)],
      ));
      this.exitCode = 1;
      return this;
    }

    if (options.summary && options.verbose) {
      this.diagnostics.push(diagAny(
        AspectDiagonstics.ASP_101_Invalid_Configuration_Cannot_Use_Verbose_And_Summary_Together,
        [],
      ));
      this.exitCode = 1;
      return this;
    }
  }

  async run(): Promise<void> {
    // TODO: Implement running every test
  }
}
