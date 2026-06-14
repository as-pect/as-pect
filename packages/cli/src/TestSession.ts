import { existsSync, promises as fs, readdirSync, readFileSync } from "fs";
import chalk from "chalk";
import { glob as defaultGlob } from "glob";
import { main as asc } from "assemblyscript/dist/asc.js";
import { type IWritable } from "@as-pect/core";
import type { IAspectConfig } from "./IAspectConfig.js";
import { collectReporter as defaultCollectReporter, type ReporterOutput } from "./collectReporter.js";
import { createCompilerIoCache, type AssemblyScriptCompilerIo } from "./CompilerIo.js";
import { planTestSessionEntries } from "./TestSessionEntries.js";
import { runTestSessionEntry, type TestSessionEntryCompilerResult } from "./TestSessionEntry.js";
import {
  accumulateTestSessionSuiteStats,
  createInitialTestSessionStats,
  type TestSessionStats,
} from "./TestSessionStats.js";

export { accumulateTestSessionSnapshotStats } from "./TestSessionStats.js";
export type { TestSessionStats } from "./TestSessionStats.js";
export { SnapshotMode } from "./TestSessionSnapshots.js";

export interface TestSessionCliOptions {
  [key: string]: unknown;
  csv?: boolean;
  disclude?: string;
  disclue?: string;
  group?: string;
  I?: string;
  include?: string;
  json?: boolean;
  memoryMax?: string | number;
  memorySize?: string | number;
  outputBinary?: boolean;
  reporter?: string | boolean;
  run?: boolean;
  showStats?: boolean;
  summary?: boolean;
  test?: string;
  updateSnapshots?: boolean;
  verbose?: boolean;
  wasi?: string;
}

export interface TestSessionConfig {
  args: string[];
  aspectConfig: IAspectConfig;
  asconfigLocation: string;
  cwd: string;
  dependencies: TestSessionDependencies;
  entryFilterRegexes: RegExp[];
  groupRegex: RegExp;
  includeGlobs: string[];
  memory: WebAssembly.MemoryDescriptor;
  options: TestSessionCliOptions;
  outputBinary: boolean;
  runTests: boolean;
  showStats: boolean;
  stderr: NodeJS.WritableStream;
  stdout: NodeJS.WritableStream;
  testRegex: RegExp;
  updateSnapshots: boolean;
}

export interface TestSessionSuccess {
  coverageReport: string | null;
  compilerError: null;
  pass: boolean;
  stats: TestSessionStats;
}

export interface TestSessionCompileFailure {
  compilerError: unknown;
  coverageReport: null;
  pass: false;
  stats: TestSessionStats;
}

export type TestSessionResult = TestSessionSuccess | TestSessionCompileFailure;

export interface TestSessionFileSystem {
  access(path: string): Promise<void>;
  existsSync(path: string): boolean;
  mkdir(path: string): Promise<void>;
  readFile(path: string, encoding: BufferEncoding): Promise<string>;
  readFileSync(path: string, encoding: BufferEncoding): string;
  readdirSync(path: string): string[];
  writeFile(path: string, contents: string | Uint8Array, encoding?: BufferEncoding): Promise<void>;
}

export type TestSessionReporterCollector = (
  options: TestSessionCliOptions,
  aspectConfig: IAspectConfig,
  output: ReporterOutput,
) => ReturnType<typeof defaultCollectReporter>;

export interface TestSessionDependencies {
  collectReporter?: TestSessionReporterCollector;
  compile(args: string[], io: AssemblyScriptCompilerIo): Promise<TestSessionEntryCompilerResult>;
  fileSystem: TestSessionFileSystem;
  glob(pattern: string): Promise<string[]>;
}

const defaultDependencies: TestSessionDependencies = {
  collectReporter: defaultCollectReporter,
  compile: asc,
  fileSystem: {
    access: fs.access,
    existsSync,
    mkdir: fs.mkdir,
    readFile: fs.readFile,
    readFileSync,
    readdirSync,
    writeFile: fs.writeFile,
  },
  glob: defaultGlob,
};

export class TestSession {
  public constructor(private readonly config: TestSessionConfig) {}

  public async run(): Promise<TestSessionResult> {
    return runTestSession(this.config);
  }
}

export interface CreateTestSessionConfigOptions {
  args: string[];
  aspectConfig: IAspectConfig;
  asconfigLocation: string;
  cwd: string;
  options: TestSessionCliOptions;
  dependencies?: Partial<TestSessionDependencies>;
  stderr?: NodeJS.WritableStream;
  stdout?: NodeJS.WritableStream;
}

function writeLog(stdout: IWritable, str: string): void {
  stdout.write(chalk.bgWhite.black("[Log]") + `${str}\n`);
}

function parseMemoryPageOption(
  optionName: string,
  value: string | number | undefined,
  defaultValue: number,
  allowUnspecified: boolean,
): number {
  const valueToParse = value ?? defaultValue;
  const parsedValue = typeof valueToParse === "number" ? valueToParse : Number(valueToParse);

  if (!Number.isInteger(parsedValue)) {
    throw new Error(`${optionName} must be an integer number of WebAssembly memory pages.`);
  }

  if (allowUnspecified && parsedValue === -1) {
    return parsedValue;
  }

  if (parsedValue < 0) {
    throw new Error(`${optionName} must be a non-negative number of WebAssembly memory pages.`);
  }

  return parsedValue;
}

function createMemoryDescriptor(options: TestSessionCliOptions): WebAssembly.MemoryDescriptor {
  const initial = parseMemoryPageOption("--memory-size", options.memorySize, 10, false);
  const maximum = parseMemoryPageOption("--memory-max", options.memoryMax, -1, true);

  if (maximum === -1) {
    return { initial };
  }

  if (maximum < initial) {
    throw new Error("--memory-max must be greater than or equal to --memory-size.");
  }

  return { initial, maximum };
}

export function createTestSessionConfig({
  args,
  aspectConfig,
  asconfigLocation,
  cwd,
  dependencies,
  options,
  stderr = process.stderr,
  stdout = process.stdout,
}: CreateTestSessionConfigOptions): TestSessionConfig {
  const entryFilterRegexes = [] as RegExp[];

  if (options.disclude) entryFilterRegexes.push(new RegExp(options.disclude));
  if (aspectConfig.disclude) entryFilterRegexes.push(...aspectConfig.disclude);

  const includeGlobs = [] as string[];

  if (options.include) includeGlobs.push(...options.include.split(","));
  if (aspectConfig.include) includeGlobs.push(...aspectConfig.include);
  if (includeGlobs.length === 0) includeGlobs.push("assembly/__tests__/**/*.include.ts");

  return {
    args,
    aspectConfig,
    asconfigLocation,
    cwd,
    dependencies: { ...defaultDependencies, ...dependencies },
    entryFilterRegexes,
    groupRegex: new RegExp(options.group || "(:?)"),
    includeGlobs,
    memory: createMemoryDescriptor(options),
    options,
    outputBinary: Boolean(options.outputBinary || aspectConfig.outputBinary || options.run === false),
    runTests: options.run !== false,
    showStats: Boolean(options.showStats),
    stderr,
    stdout,
    testRegex: new RegExp(options.test || "(:?)"),
    updateSnapshots: Boolean(options.updateSnapshots),
  };
}

export function formatTestSessionSummary(result: Pick<TestSessionResult, "pass" | "stats">): string {
  const { stats } = result;
  return `
  [Summary]
    [Tests]: ${chalk.green(stats.passedTests)} / ${stats.tests}
   [Groups]: ${chalk.green(stats.passedGroups)} / ${stats.groups}
[Snapshots]: ${chalk.green(stats.passedSnapshots)} / ${stats.totalSnapshots}, Added ${
    stats.addedSnapshots
  }, Changed ${stats.changedSnapshots}, Removed ${stats.removedSnapshots}
   [Result]: ${result.pass ? chalk.green(`✔ Pass!`) : chalk.red(`❌ Fail`)}

   `;
}

export async function runTestSession(config: TestSessionConfig): Promise<TestSessionResult> {
  const {
    args,
    aspectConfig,
    asconfigLocation,
    cwd,
    dependencies,
    entryFilterRegexes,
    groupRegex,
    includeGlobs,
    memory,
    options,
    outputBinary,
    runTests,
    showStats,
    stderr,
    stdout,
    testRegex,
    updateSnapshots,
  } = config;

  const compilerIoCache = createCompilerIoCache();
  const stats = createInitialTestSessionStats();

  const { compile, fileSystem, glob } = dependencies;
  const collectReporter = dependencies.collectReporter ?? defaultCollectReporter;

  const { entries, includeFiles } = await planTestSessionEntries({
    args,
    configEntries: aspectConfig.entries,
    entryFilterRegexes,
    glob,
    includeGlobs,
  });

  if (aspectConfig.coverage) {
    writeLog(stdout, `Using code coverage: ${aspectConfig.coverage.join(", ")}`);
  }

  let covers: import("@as-covers/glue").Covers | null = null;
  const coverageFiles = aspectConfig.coverage || [];
  if (coverageFiles.length !== 0) {
    writeLog(stdout, "Using coverage: " + coverageFiles.join(", "));
    const Covers = (await import("@as-covers/glue")).Covers;
    covers = new Covers({ files: coverageFiles });
  }

  for (const entry of entries) {
    const entryResult = await runTestSessionEntry({
      aspectConfig,
      asconfigLocation,
      collectReporter,
      compile,
      compilerIoCache,
      coverage: covers,
      cwd,
      entry,
      fileSystem,
      groupRegex,
      includeFiles,
      log: (message) => writeLog(stdout, message),
      memory,
      options,
      outputBinary,
      runTests,
      showStats,
      stderr,
      stdout,
      testRegex,
      updateSnapshots,
    });

    if (entryResult.compilerError) {
      return {
        compilerError: entryResult.compilerError,
        coverageReport: null,
        pass: false,
        stats,
      };
    }

    if (entryResult.suiteStatsFacts) {
      accumulateTestSessionSuiteStats(stats, entryResult.suiteStatsFacts);
    }
  }

  return {
    compilerError: null,
    coverageReport: covers ? covers.stringify() : null,
    pass: stats.pass,
    stats,
  };
}
