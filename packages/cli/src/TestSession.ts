import path from "path";
import { existsSync, promises as fs, readdirSync, readFileSync } from "fs";
import chalk from "chalk";
import { glob } from "glob";
import { main as asc } from "assemblyscript/dist/asc.js";
import { instantiate } from "@assemblyscript/loader";
import { TestContext, type IWritable } from "@as-pect/core";
import { Snapshot } from "@as-pect/snapshots";
import { IAspectConfig } from "./IAspectConfig.js";
import { collectReporter } from "./collectReporter.js";

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
  memoryMax?: string;
  memorySize?: string;
  outputBinary?: boolean;
  showStats?: boolean;
  summary?: boolean;
  test?: string;
  updateSnapshots?: boolean;
  verbose?: boolean;
  wasi?: string;
}

export interface TestSessionStats {
  addedSnapshots: number;
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
  entryFilterRegexes: RegExp[];
  groupRegex: RegExp;
  includeGlobs: string[];
  memoryMax: string;
  memorySize: string;
  options: TestSessionCliOptions;
  outputBinary: boolean;
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
  stderr?: NodeJS.WritableStream;
  stdout?: NodeJS.WritableStream;
}

function createInitialStats(): TestSessionStats {
  return {
    addedSnapshots: 0,
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

function withWasiPreview1(options: import("wasi").WASIOptions): import("wasi").WASIOptions {
  return { ...options, version: options.version ?? "preview1" } as import("wasi").WASIOptions;
}

export function createTestSessionConfig({
  args,
  aspectConfig,
  asconfigLocation,
  cwd,
  options,
  stderr = process.stderr,
  stdout = process.stdout,
}: CreateTestSessionConfigOptions): TestSessionConfig {
  const entryFilterRegexes = [] as RegExp[];

  // Preserve the current CLI option mapping during extraction. The commander option is named
  // `disclude`, but the existing CLI checks `disclue`; a later characterization slice can fix it.
  if (options.disclue) entryFilterRegexes.push(new RegExp(options.disclude!));
  if (aspectConfig.disclude) entryFilterRegexes.push(...aspectConfig.disclude);

  const includeGlobs = [] as string[];

  // Preserve the current CLI option mapping during extraction. The commander option is named
  // `include`, but the existing CLI reads `I`; a later characterization slice can fix it.
  if (options.include) includeGlobs.push(...options.I!.split(","));
  if (aspectConfig.include) includeGlobs.push(...aspectConfig.include);
  if (includeGlobs.length === 0) includeGlobs.push("assembly/__tests__/**/*.include.ts");

  return {
    args,
    aspectConfig,
    asconfigLocation,
    cwd,
    entryFilterRegexes,
    groupRegex: new RegExp(options.group || "(:?)"),
    includeGlobs,
    memoryMax: options.memoryMax || "-1",
    memorySize: options.memorySize || "10",
    options,
    outputBinary: Boolean(options.outputBinary || aspectConfig.outputBinary),
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
  }, Changed ${stats.removedSnapshots}
   [Result]: ${result.pass ? chalk.green(`✔ Pass!`) : chalk.red(`❌ Fail`)}

   `;
}

export async function runTestSession(config: TestSessionConfig): Promise<TestSessionResult> {
  const {
    args,
    aspectConfig,
    asconfigLocation,
    cwd,
    entryFilterRegexes,
    groupRegex,
    includeGlobs,
    memoryMax,
    memorySize,
    options,
    outputBinary,
    showStats,
    stderr,
    stdout,
    testRegex,
    updateSnapshots,
  } = config;

  const filterEntry = (str: string): boolean =>
    entryFilterRegexes.reduce((left, right) => left && !right.test(str), true);
  const includes = new Set<string>();
  const entries = new Set<string>();
  const fileMap = new Map<string, string>();
  const folderMap = new Map<string, string[]>();
  const stats = createInitialStats();

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

    const compiled = await asc(ascArgs, {
      readFile(filename, baseDir) {
        const filePath = path.join(baseDir, filename);
        if (fileMap.has(filePath)) return fileMap.get(filePath)!;
        try {
          const contents = readFileSync(filePath, "utf8");
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
          const files = readdirSync(folder).filter((file) => /^(?!.*\.d\.ts$).*\.ts$/.test(file));
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
      await fs.writeFile(baseName + ".wasm", binary);
      await fs.writeFile(baseName + ".wat", wat);
    }

    const snapshotPath = path.join(dir, "__snapshots__", basename + ".snap");
    const snapshotMode = updateSnapshots ? SnapshotMode.WriteSnapshots : SnapshotMode.CompareSnapshots;

    const snapshots =
      snapshotMode === SnapshotMode.CompareSnapshots && existsSync(snapshotPath)
        ? Snapshot.parse(await fs.readFile(snapshotPath, "utf8"))
        : void 0;

    let wasi: import("wasi").WASI | undefined = void 0;
    if (options.wasi) {
      const { WASI } = await import("wasi");
      const wasiRelativeLocation = options.wasi;
      const wasiLocation = path.join(cwd, wasiRelativeLocation);
      const wasiConfig = (await import("file://" + wasiLocation)).default;
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

    const descriptor = {
      initial: parseInt(memorySize),
    } as WebAssembly.MemoryDescriptor;
    if (memoryMax) {
      const maximum = parseInt(memoryMax);
      if (maximum !== -1) {
        descriptor.maximum = maximum;
      }
    }
    const memory = new WebAssembly.Memory(descriptor);

    const module = await aspectConfig.instantiate(
      memory,
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

      stats.totalSnapshots += snapshotStats.totalSnapshots;
      stats.passedSnapshots += snapshotStats.passedSnapshots;
      stats.removedSnapshots += snapshotStats.removedSnapshots;

      if (updatePlan.shouldWrite) {
        updatePlan.applyTo(expectedSnapshots);
        stats.addedSnapshots += updatePlan.addedSnapshots;
        await fs.writeFile(snapshotPath, expectedSnapshots.stringify(), "utf8");
      }
    } else {
      writeLog(stdout, "Creating Snapshots.");
      const snapshotDir = path.dirname(snapshotPath);
      try {
        await fs.access(snapshotDir);
      } catch (ex) {
        await fs.mkdir(snapshotDir);
      }

      if (ctx.rootNode.pass) {
        const output = ctx.snapshots.stringify();
        await fs.writeFile(snapshotPath, output, "utf8");
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
