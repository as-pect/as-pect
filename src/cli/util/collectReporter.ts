import { TestReporter } from "../../test/TestReporter";
import { Options } from "./CommandLineArg";
import querystring from "querystring";
import chalk from "chalk";
import SummaryReporter from "../../reporter/SummaryReporter";
import CombinationReporter from "../../reporter/CombinationReporter";

/**
 * This method inspects the command line arguments and returns the corresponding TestReporter.
 *
 * @param {Options} yargs - The command line arguments.
 */
export function collectReporter(yargs: Options): TestReporter {
  const reporters: TestReporter[] = [];

  if (yargs.csv) {
    const CSVReporter = require("../../reporter/CSVReporter").default;
    if (typeof yargs.csv === "string") {
      const options = querystring.parse(yargs.csv || "");
      reporters.push(new CSVReporter(options));
    } else {
      reporters.push(new CSVReporter());
    }
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using {yellow CSVReporter}\n`,
    );
  }

  if (yargs.json) {
    const JSONReporter = require("../../reporter/JSONReporter").default;
    if (typeof yargs.json === "string") {
      const options = querystring.parse(yargs.json || "");
      reporters.push(new JSONReporter(options));
    } else {
      reporters.push(new JSONReporter());
    }
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using {yellow JSONReporter}\n`,
    );
  }

  if (yargs.summary) {
    const SummaryReporter = require("../../reporter/SummaryReporter").default;
    if (typeof yargs.summary === "string") {
      const options = querystring.parse(yargs.summary || "");
      reporters.push(new SummaryReporter(options));
    } else {
      reporters.push(new SummaryReporter());
    }
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using {yellow SummaryReporter}\n`,
    );
  }

  if (yargs.verbose) {
    const VerboseReporter = require("../../reporter/VerboseReporter").default;
    if (typeof yargs.verbose === "string") {
      const options = querystring.parse(yargs.verbose || "");
      reporters.push(new VerboseReporter(options));
    } else {
      reporters.push(new VerboseReporter());
    }
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using {yellow VerboseReporter}\n`,
    );
  }

  if (yargs.reporter) {
    const url = require("url").parse(yargs.reporter);
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

  if (reporters.length === 0) {
    process.stdout.write(
      chalk`{bgWhite.black [Log]} Using {yellow SummaryReporter}\n`,
    );
    return new SummaryReporter({
      enableLogging: true,
    });
  } else {
    return new CombinationReporter(reporters);
  }
}
