import type { IAspectConfig } from "./IAspectConfig.js";
import { CombinationReporter, SummaryReporter, VerboseReporter, type IReporter, type IWritable } from "@as-pect/core";
import { existsSync } from "fs";
import path from "path";
import process, { cwd } from "process";
import { fileURLToPath, pathToFileURL } from "url";
import { importLocalModule } from "./importLocalModule.js";

function isExplicitLocalSpecifier(reporterLocation: string): boolean {
  return (
    reporterLocation.startsWith("./") ||
    reporterLocation.startsWith("../") ||
    reporterLocation === "." ||
    reporterLocation === ".." ||
    path.isAbsolute(reporterLocation) ||
    reporterLocation.startsWith("file:")
  );
}

function resolveReporterLocalPath(reporterLocation: string): string | null {
  if (reporterLocation.startsWith("file:")) {
    return fileURLToPath(reporterLocation);
  }

  const candidatePath = path.resolve(cwd(), reporterLocation);
  if (isExplicitLocalSpecifier(reporterLocation) || existsSync(candidatePath)) {
    return candidatePath;
  }

  return null;
}

async function importReporterModule(reporterLocation: string): Promise<IReporter> {
  const localPath = resolveReporterLocalPath(reporterLocation);
  if (localPath) {
    try {
      return (await importLocalModule<{ default: IReporter }>(localPath)).default;
    } catch (ex) {
      throw new Error(
        `An error occurred while trying to import custom reporter "${reporterLocation}" from ${localPath}`,
        {
          cause: ex,
        },
      );
    }
  }

  try {
    const parentUrl = pathToFileURL(path.join(cwd(), "package.json")).href;
    const moduleSpecifier = import.meta.resolve(reporterLocation, parentUrl);
    return (await import(moduleSpecifier)).default as IReporter;
  } catch (ex) {
    throw new Error(`An error occurred while trying to import custom reporter module "${reporterLocation}"`, {
      cause: ex,
    });
  }
}

export interface CliReporterOptions {
  csv?: boolean;
  json?: boolean;
  junit?: boolean;
  reporter?: string | boolean;
  summary?: boolean;
  verbose?: boolean;
}

/** Collect up the reporter asynchronously because modules could be imported. */
export async function getReporter(opts: CliReporterOptions, aspectConfig: IAspectConfig): Promise<IReporter> {
  const reporters = [] as IReporter[];
  if (aspectConfig.reporter) {
    reporters.push(await importReporterModule(aspectConfig.reporter));
  }

  if (typeof opts.reporter === "string") {
    reporters.push(await importReporterModule(opts.reporter));
  }

  if (opts.json) {
    const JSONReporter = (await import("@as-pect/json-reporter")).default;
    reporters.push(new JSONReporter());
  }

  if (opts.csv) {
    const CSVReporter = (await import("@as-pect/csv-reporter")).default;
    reporters.push(new CSVReporter());
  }

  if (opts.junit) {
    const JUnitReporter = (await import("@as-pect/junit-reporter")).default;
    reporters.push(new JUnitReporter());
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
  opts: CliReporterOptions,
  aspectConfig: IAspectConfig,
  output: ReporterOutput = { stderr: process.stderr, stdout: process.stdout },
): Promise<IReporter> {
  const reporter = await getReporter(opts, aspectConfig);
  reporter.stdout = output.stdout;
  reporter.stderr = output.stderr;
  return reporter;
}
