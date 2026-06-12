import type { IAspectConfig } from "./IAspectConfig.js";
import { CombinationReporter, SummaryReporter, VerboseReporter, type IReporter, type IWritable } from "@as-pect/core";
import { cwd } from "process";
import type { OptionValues } from "commander";
import path from "path";
import process from "process";
import { importLocalModule } from "./importLocalModule.js";

async function importCustomReporter(reporterRelativeLocation: string): Promise<IReporter> {
  const reporterLocation = path.resolve(cwd(), reporterRelativeLocation);
  try {
    return (await importLocalModule<{ default: IReporter }>(reporterLocation)).default;
  } catch (ex) {
    throw new Error(`An error occured while trying to import: ${reporterLocation}`, { cause: ex });
  }
}

/** Collect up the reporter asynchronously because modules could be imported. */
export async function getReporter(opts: OptionValues, aspectConfig: IAspectConfig): Promise<IReporter> {
  const reporters = [] as IReporter[];
  if (aspectConfig.reporter) {
    reporters.push(await importCustomReporter(aspectConfig.reporter));
  }

  if (typeof opts.reporter === "string") {
    reporters.push(await importCustomReporter(opts.reporter));
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
