import path from "path";
import { existsSync, promises as fs, readdirSync, readFileSync } from "fs";
import chalk from "chalk";
import { glob as defaultGlob } from "glob";
import { main as asc } from "assemblyscript/dist/asc.js";
import { instantiate } from "@assemblyscript/loader";
import { TestContext, type IWritable } from "@as-pect/core";
import { Snapshot, type SnapshotLifecycleStats } from "@as-pect/snapshots";
import { IAspectConfig } from "./IAspectConfig.js";
import { collectReporter } from "./collectReporter.js";
import { importLocalModule } from "./importLocalModule.js";

export const enum SnapshotMode {
  WriteSnapshots,
  CompareSnapshots,
}

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

export interface TestSessionStats {
  addedSnapshots: number;
  changedSnapshots: number;
  removedSnapshots: number;
  passedSnapshots: number;
  totalSnapshots: number;
  groups: number;
  passedGroups: number;
  tests: number;
  passedTests: number;
  pass: boolean;
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

type CompilerIo = {
  listFiles(dirname: string, baseDir: string): string[] | null;
  readFile(filename: string, baseDir: string): string | null;
  stderr: NodeJS.WritableStream;
  stdout: NodeJS.WritableStream;
  writeFile(filename: string, contents: string | Uint8Array, baseDir: string): void;
};

type CompilerResult = {
  error?: unknown;
  stats: { toString(): string };
};

export interface TestSessionFileSystem {
  access(path: string): Promise<void>;
  existsSync(path: string): boolean;
  mkdir(path: string): Promise<void>;
  readFile(path: string, encoding: BufferEncoding): Promise<string>;
  readFileSync(path: string, encoding: BufferEncoding): string;
  readdirSync(path: string): string[];
  writeFile(path: string, contents: string | Uint8Array, encoding?: BufferEncoding): Promise<void>;
}

export interface TestSessionDependencies {
  compile(args: string[], io: CompilerIo): Promise<CompilerResult>;
  fileSystem: TestSessionFileSystem;
  glob(pattern: string): Promise<string[]>;
}

const defaultDependencies: TestSessionDependencies = {
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

function createInitialStats(): TestSessionStats {
  return {
    addedSnapshots: 0,
    changedSnapshots: 0,
    removedSnapshots: 0,
    passedSnapshots: 0,
    totalSnapshots: 0,
    groups: 0,
    passedGroups: 0,
    tests: 0,
    passedTests: 0,
    pass: true,
  };
}

function writeLog(stdout: IWritable, str: string): void {
  stdout.write(chalk.bgWhite.black("[Log]") + `${str}\n`);
}

function regexMatches(regex: RegExp, value: string): boolean {
  regex.lastIndex = 0;
  try {
    return regex.test(value);
  } finally {
    regex.lastIndex = 0;
  }
}

function withWasiPreview1(options: import("wasi").WASIOptions): import("wasi").WASIOptions {
  return { ...options, version: options.version ?? "preview1" } as import("wasi").WASIOptions;
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

export function accumulateTestSessionSnapshotStats(
  testSessionStats: TestSessionStats,
  snapshotLifecycleStats: SnapshotLifecycleStats,
): void {
  testSessionStats.totalSnapshots += snapshotLifecycleStats.totalSnapshots;
  testSessionStats.passedSnapshots += snapshotLifecycleStats.passedSnapshots;
  testSessionStats.addedSnapshots += snapshotLifecycleStats.addedSnapshots;
  testSessionStats.changedSnapshots += snapshotLifecycleStats.changedSnapshots;
  testSessionStats.removedSnapshots += snapshotLifecycleStats.removedSnapshots;
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

  const filterEntry = (str: string): boolean =>
    entryFilterRegexes.reduce((left, right) => left && !regexMatches(right, str), true);
  const includes = new Set<string>();
  const entries = new Set<string>();
  const fileMap = new Map<string, string>();
  const folderMap = new Map<string, string[]>();
  const stats = createInitialStats();

  const { compile, fileSystem, glob } = dependencies;

  for (const arg of args.concat(aspectConfig.entries || [])) {
    const entryPoints = await glob(arg);
    for (const entryPoint of entryPoints) {
      if (filterEntry(entryPoint)) entries.add(entryPoint);
    }
  }

  for (const includedGlob of includeGlobs) {
    const includedFiles = await glob(includedGlob);
    for (const includedFile of includedFiles) {
      includes.add(includedFile);
    }
  }

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
    const files = new Map<string, string | Uint8Array>();
    const dir = path.dirname(entry);
    const basename = path.basename(entry, path.extname(entry));
    const ascArgs = [entry, ...includes, "--config", asconfigLocation, "--target", covers ? "coverage" : "noCoverage"];

    const compiled = await compile(ascArgs, {
      readFile(filename, baseDir) {
        const filePath = path.join(baseDir, filename);
        if (fileMap.has(filePath)) return fileMap.get(filePath)!;
        try {
          const contents = fileSystem.readFileSync(filePath, "utf8");
          fileMap.set(filePath, contents);
          return contents;
        } catch (ex) {
          return null;
        }
      },
      writeFile(filename, contents, _baseDir) {
        files.set(filename, contents);
      },
      listFiles(dirname, baseDir) {
        const folder = path.join(baseDir, dirname);
        if (folderMap.has(folder)) return folderMap.get(folder)!;

        try {
          const files = fileSystem.readdirSync(folder).filter((file) => /^(?!.*\.d\.ts$).*\.ts$/.test(file));
          folderMap.set(folder, files);
          return files;
        } catch (ex) {
          return null;
        }
      },
      stderr,
      stdout,
    });

    if (compiled.error) {
      return {
        compilerError: compiled.error,
        coverageReport: null,
        pass: false,
        stats,
      };
    }

    if (showStats) stdout.write(compiled.stats.toString());
    const outputFileKey = Array.from(files.keys()).filter((e) => e.endsWith("output.wasm"))[0]!;
    const outputWatFileKey = Array.from(files.keys()).filter((e) => e.endsWith("output.wat"))[0]!;
    const binary = files.get(outputFileKey)! as Uint8Array;
    const wat = files.get(outputWatFileKey)! as string;

    if (outputBinary) {
      const baseName = path.join(dir, path.basename(entry, path.extname(entry)));
      await fileSystem.writeFile(baseName + ".wasm", binary);
      await fileSystem.writeFile(baseName + ".wat", wat);
    }

    const snapshotPath = path.join(dir, "__snapshots__", basename + ".snap");
    const snapshotMode = updateSnapshots ? SnapshotMode.WriteSnapshots : SnapshotMode.CompareSnapshots;

    if (!runTests) continue;

    const snapshots =
      snapshotMode === SnapshotMode.CompareSnapshots && fileSystem.existsSync(snapshotPath)
        ? Snapshot.parse(await fileSystem.readFile(snapshotPath, "utf8"))
        : void 0;

    let wasi: import("wasi").WASI | undefined = void 0;
    if (options.wasi) {
      const { WASI } = await import("wasi");
      const wasiRelativeLocation = options.wasi;
      const wasiLocation = path.resolve(cwd, wasiRelativeLocation);
      const wasiConfig = (await importLocalModule<{ default: import("wasi").WASIOptions }>(wasiLocation)).default;
      wasi = new WASI(withWasiPreview1(wasiConfig));
    } else if (aspectConfig.wasi) {
      const { WASI } = await import("wasi");
      wasi = new WASI(withWasiPreview1(aspectConfig.wasi));
    }

    const reporter = await collectReporter(options, aspectConfig, { stderr, stdout });

    const ctx = new TestContext({
      reporter,
      binary,
      fileName: entry,
      groupRegex,
      snapshots,
      testRegex,
      wasi,
    });

    const wasmMemory = new WebAssembly.Memory(memory);

    const module = await aspectConfig.instantiate(
      wasmMemory,
      (...args: any[]) => (covers ? covers.installImports(ctx.createImports(...args)) : ctx.createImports(...args)),
      instantiate,
      binary,
    );

    covers?.registerLoader(module);
    ctx.run(module as any);
    stats.groups += ctx.groupCount;
    stats.tests += ctx.testCount;
    stats.passedGroups += ctx.groupPassCount;
    stats.passedTests += ctx.testPassCount;
    stats.pass = stats.pass && ctx.pass;

    if (snapshotMode === SnapshotMode.CompareSnapshots) {
      const expectedSnapshots = ctx.expectedSnapshots;
      const snapshotLifecycle = ctx.snapshotLifecycle!;
      const snapshotStats = snapshotLifecycle.stats;
      const updatePlan = snapshotLifecycle.updatePlan;

      accumulateTestSessionSnapshotStats(stats, snapshotStats);

      if (updatePlan.shouldWrite) {
        updatePlan.applyTo(expectedSnapshots);
        await fileSystem.writeFile(snapshotPath, expectedSnapshots.stringify(), "utf8");
      }
    } else {
      writeLog(stdout, "Creating Snapshots.");
      const snapshotDir = path.dirname(snapshotPath);
      try {
        await fileSystem.access(snapshotDir);
      } catch (ex) {
        await fileSystem.mkdir(snapshotDir);
      }

      if (ctx.rootNode.pass) {
        const output = ctx.snapshots.stringify();
        await fileSystem.writeFile(snapshotPath, output, "utf8");
      }
    }
  }

  return {
    compilerError: null,
    coverageReport: covers ? covers.stringify() : null,
    pass: stats.pass,
    stats,
  };
}
