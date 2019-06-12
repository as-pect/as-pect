import { TestReporter } from "../../test/TestReporter";
import { DefaultTestReporter } from "../../reporter/DefaultTestReporter";
import { EmptyReporter } from "../../reporter/EmptyReporter";
import { SummaryTestReporter } from "../../reporter/SummaryTestReporter";
import { IYargs } from "./IYargs";
import path from "path";
import { CSVTestReporter } from "../../reporter/CSVTestReporter";
import { JSONTestReporter } from "../../reporter/JSONTestReporter";
import querystring from "querystring";
import chalk from "chalk";

/**
 * This method inspects the command line arguments and returns the corresponding TestReporter.
 *
 * @param {IYargs} yargs - The command line arguments.
 */
export function collectReporter(yargs: IYargs): TestReporter {
  const reporterInput: string = yargs.argv.reporter || yargs.argv.r;

  const result = /([a-z\.]+)(?:\?(.*))?/i.exec(reporterInput);
  const targetReporter = result ? result[1] : "";

  const options = querystring.parse(result ? result[2] || "" : "");

  // get relative reporters
  if (targetReporter.startsWith(".")) {
    try {
      const reporterPath = path.join(process.cwd(), targetReporter);
      const reporterResult = require(reporterPath);
      // if something is returned
      if (reporterResult) {
        if (typeof reporterResult === "function") { // instantiate it if it's a default exported class
          return new reporterResult(options);
        }
        if (typeof reporterResult.default === "function") {
          return new reporterResult.default();
        }
        else {
          return reporterResult.default || reporterResult;
        }
      }
      else {
        console.log(chalk`{bgBlack.yellow [Warning]} Cannot find reporter at {yellow ${reporterPath}}, defaulting to DefaultTestReporter.`);
        return new DefaultTestReporter(options);
      }
    }
    catch (ex) {
      console.log(chalk`{bgBlack.yellow [Error]} An error occured while trying to resolve a reporter at {yellow ${targetReporter}}.`);
      console.error(ex);
      process.exit(1);
      // @ts-ignore: the process has exited
      return null;
    }
  }
  else if (targetReporter === "EmptyReporter") {
    return new EmptyReporter(options);
  }
  else if (targetReporter === "SummaryTestReporter") {
    return new SummaryTestReporter(options);
  }
  else if (targetReporter === "CSVTestReporter") {
    return new CSVTestReporter(options);
  }
  else if (targetReporter === "JSONTestReporter") {
    return new JSONTestReporter(options);
  }
  else {
    return new DefaultTestReporter(options);
  }
}
