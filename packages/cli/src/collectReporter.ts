import { IAspectConfig } from "./IAspectConfig.js";
import { IReporter, CombinationReporter, SummaryReporter, VerboseReporter, IWritable } from "@as-pect/core";
import { cwd } from "process";
import { OptionValues } from "commander";
import path from "path";
import process from "process";

/** Collect up the reporter asynchronously because modules could be imported. */
export async function getReporter(opts: OptionValues, aspectConfig: IAspectConfig): Promise<IReporter> {
  const reporters = [] as IReporter[];
  if (aspectConfig.reporter) {
    const reporterRelativeLocation = aspectConfig.reporter;
    const reporterLocation = path.join(cwd(), reporterRelativeLocation);
    try {
      const reporter = (await import("file://" + reporterLocation)).default as IReporter;
      reporters.push(reporter);
    } catch (ex) {
      throw new Error(`An error occured while trying to import: ${reporterLocation}`, { cause: ex });
    }
  }

  if (opts.json) {
    const JSONReporter = (await import("@as-pect/json-reporter")).default;
    reporters.push(new JSONReporter());
  }

  if (opts.csv) {
    const CSVReporter = (await import("@as-pect/csv-reporter")).default;
    reporters.push(new CSVReporter());
  }

  if (opts.summary) {
    const reporter = new SummaryReporter();
    reporters.push(reporter);
  } else if (opts.verbose) {
    const reporter = new VerboseReporter();
    reporters.push(reporter);
  }

  if (reporters.length === 0) {
    return new SummaryReporter();
  }

  return new CombinationReporter(reporters);
}

export interface ReporterOutput {
  stderr: IWritable;
  stdout: IWritable;
}

export async function collectReporter(
  opts: OptionValues,
  aspectConfig: IAspectConfig,
  output: ReporterOutput = { stderr: process.stderr, stdout: process.stdout },
): Promise<IReporter> {
  const reporter = await getReporter(opts, aspectConfig);
  reporter.stdout = output.stdout;
  reporter.stderr = output.stderr;
  return reporter;
}
