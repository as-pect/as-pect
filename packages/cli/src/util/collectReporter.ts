import { IReporter } from "@as-pect/core";
import { Options } from "./CommandLineArg.js";
import querystring from "querystring";
import chalk from "chalk";

/**
 * @ignore
 * This method inspects the command line arguments and returns the corresponding TestReporter.
 *
 * @param {Options} cliOptions - The command line arguments.
 */
export function collectReporter(cliOptions: Options): IReporter {
  const reporters: IReporter[] = [];

  if (cliOptions.csv) {
    const CSVReporter = require("@as-pect/csv-reporter");
    if (typeof cliOptions.csv === "string") {
      const options = querystring.parse(cliOptions.csv || "");
      reporters.push(new CSVReporter(options));
    } else {
      reporters.push(new CSVReporter());
    }
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using {yellow CSVReporter}\n`,
    );
  }

  if (cliOptions.json) {
    const JSONReporter = require("@as-pect/json-reporter");
    if (typeof cliOptions.json === "string") {
      const options = querystring.parse(cliOptions.json || "");
      reporters.push(new JSONReporter(options));
    } else {
      reporters.push(new JSONReporter());
    }
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using {yellow JSONReporter}\n`,
    );
  }

  if (cliOptions.verbose) {
    const VerboseReporter = require("@as-pect/core").VerboseReporter;
    const reporter = new VerboseReporter(
      typeof cliOptions.summary === "string"
        ? querystring.parse(cliOptions.summary || "")
        : {},
    );
    reporter.stdout = process.stdout;
    reporter.stderr = process.stderr;
    reporters.push(reporter);
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using {yellow VerboseReporter}\n`,
    );
  }

  if (cliOptions.reporter) {
    const url = require("url").parse(cliOptions.reporter);
    try {
      const reporterValue = require(url.pathname);
      const Reporter = reporterValue.default || reporterValue;
      const options = require("querystring").parse(url.query);
      if (typeof Reporter === "function") {
        reporters.push(new Reporter(options));
      } else {
        reporters.push(Reporter);
      }
    } catch (ex) {
      console.error(
        chalk`{red [Error]} Cannot find a reporter at {yellow ${url.pathname}}`,
      );
      console.error(ex);
      process.exit(1);
    }
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using custom reporter at: {yellow ${url.pathname}}\n`,
    );
  }
  /**
   * If there are no other reporters summary is the default.
   */
  if (cliOptions.summary || reporters.length == 0) {
    const SummaryReporter = require("@as-pect/core").SummaryReporter;
    const reporter = new SummaryReporter(
      typeof cliOptions.summary === "string"
        ? querystring.parse(cliOptions.summary || "")
        : { enableLogging: true },
    );
    reporter.stdout = process.stdout;
    reporter.stderr = process.stderr;
    reporters.push(reporter);
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using {yellow SummaryReporter}\n`,
    );
  }
  // If only one reporter return it, otherwise, combine them.
  if (reporters.length === 1) {
    return reporters[0];
  } else {
    const CombinationReporter = require("@as-pect/core").CombinationReporter;
    return new CombinationReporter(reporters);
  }
}
