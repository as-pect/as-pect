import { TestReporter } from "../../test/TestReporter";
import { DefaultTestReporter } from "../../reporter/DefaultTestReporter";
import { EmptyReporter } from "../../reporter/EmptyReporter";
import { SummaryTestReporter } from "../../reporter/SummaryTestReporter";
import { IYargs } from "./IYargs";
import path from "path";

export function collectReporter(yargs: IYargs): TestReporter {
  const targetReporter: string = yargs.argv.reporter || yargs.argv.r;
  // get relative reporters
  if (targetReporter.startsWith(".")) {
    try {
      const result = require(path.join(process.cwd(), targetReporter));
      // if something is returned
      if (result) {
        if (typeof result === "function") { // instantiate it if it's a default exported class
          return new result();
        }
        if (typeof result.default === "function") {
          return new result.default();
        }
        else {
          return result.default || result;
        }
      }
      else {
        return new DefaultTestReporter();
      }
    }
    catch (ex) {
      console.error("Cannot find target reporter at", path.join(process.cwd(), targetReporter));
      console.error(ex);
      process.exit(1);
      // @ts-ignore: the process has exited
      return null;
    }
  }
  else if (targetReporter === "EmptyReporter") {
    return new EmptyReporter();
  }
  else if (targetReporter === "SummaryTestReporter") {
    return new SummaryTestReporter();
  }
  else {
    return new DefaultTestReporter();
  }
}
