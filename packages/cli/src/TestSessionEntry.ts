import path from "path";
import { instantiate } from "@assemblyscript/loader";
import { SuiteReport, TestContext } from "@as-pect/core";
import type { AspectCreateImports, AspectImports, IAspectConfig } from "./IAspectConfig.js";
import type { ReporterOutput } from "./collectReporter.js";
import { createCompilerIoAdapter, type AssemblyScriptCompilerIo, type CompilerIoCache } from "./CompilerIo.js";
import { extractCompilerOutput } from "./CompilerOutput.js";
import { planTestSessionSnapshots, SnapshotMode } from "./TestSessionSnapshots.js";
import type { TestSessionSuiteStatsFacts } from "./TestSessionStats.js";
import { createTestSessionWasi } from "./TestSessionWasi.js";
import type { TestSessionCliOptions, TestSessionFileSystem, TestSessionReporterCollector } from "./TestSession.js";

export interface TestSessionEntryCompilerResult {
  error?: unknown;
  stats: { toString(): string };
}

export type TestSessionEntryCompiler = (
  args: string[],
  io: AssemblyScriptCompilerIo,
) => Promise<TestSessionEntryCompilerResult>;

export interface TestSessionCoverage {
  installImports(imports: AspectImports): unknown;
  registerLoader(module: unknown): void;
}

export interface RunTestSessionEntryOptions {
  aspectConfig: IAspectConfig;
  asconfigLocation: string;
  collectReporter: TestSessionReporterCollector;
  compile: TestSessionEntryCompiler;
  compilerIoCache: CompilerIoCache;
  coverage?: TestSessionCoverage | null;
  cwd: string;
  entry: string;
  fileSystem: TestSessionFileSystem;
  groupRegex: RegExp;
  includeFiles: string[];
  log?: (message: string) => void;
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

export interface TestSessionEntryResult {
  compilerError: unknown | null;
  suiteStatsFacts: TestSessionSuiteStatsFacts | null;
}

function createSuiteStatsFacts(suiteReport: SuiteReport): TestSessionSuiteStatsFacts {
  return {
    groups: suiteReport.groupCount,
    hasResults: suiteReport.hasResults,
    pass: suiteReport.pass,
    passedGroups: suiteReport.groupPassCount,
    passedTests: suiteReport.testPassCount,
    tests: suiteReport.testCount,
  };
}

function createReporterOutput(stderr: NodeJS.WritableStream, stdout: NodeJS.WritableStream): ReporterOutput {
  return { stderr, stdout };
}

export async function runTestSessionEntry({
  aspectConfig,
  asconfigLocation,
  collectReporter,
  compile,
  compilerIoCache,
  coverage,
  cwd,
  entry,
  fileSystem,
  groupRegex,
  includeFiles,
  log,
  memory,
  options,
  outputBinary,
  runTests,
  showStats,
  stderr,
  stdout,
  testRegex,
  updateSnapshots,
}: RunTestSessionEntryOptions): Promise<TestSessionEntryResult> {
  const { io: compilerIo, outputFiles } = createCompilerIoAdapter({
    cache: compilerIoCache,
    fileSystem,
    stderr,
    stdout,
  });
  const dir = path.dirname(entry);
  const ascArgs = [
    entry,
    ...includeFiles,
    "--config",
    asconfigLocation,
    "--target",
    coverage ? "coverage" : "noCoverage",
  ];

  const compiled = await compile(ascArgs, compilerIo);

  if (compiled.error) {
    return {
      compilerError: compiled.error,
      suiteStatsFacts: null,
    };
  }

  if (showStats) stdout.write(compiled.stats.toString());
  const { binary, wat } = extractCompilerOutput(outputFiles);

  if (outputBinary) {
    const baseName = path.join(dir, path.basename(entry, path.extname(entry)));
    await fileSystem.writeFile(baseName + ".wasm", binary);
    await fileSystem.writeFile(baseName + ".wat", wat);
  }

  if (!runTests) {
    return {
      compilerError: null,
      suiteStatsFacts: null,
    };
  }

  const snapshotPlan = await planTestSessionSnapshots({
    entry,
    fileSystem,
    log,
    updateSnapshots,
  });
  const snapshots = snapshotPlan.expectedSnapshots;

  const wasi = await createTestSessionWasi({
    cliWasi: options.wasi,
    configWasi: aspectConfig.wasi,
    cwd,
  });

  const reporter = await collectReporter(options, aspectConfig, createReporterOutput(stderr, stdout));

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
  const createImports: AspectCreateImports = (...imports: AspectImports[]) => {
    const testImports = ctx.createImports(...imports) as AspectImports;
    return coverage ? (coverage.installImports(testImports) as AspectImports) : testImports;
  };

  const module = await aspectConfig.instantiate(wasmMemory, createImports, instantiate, binary);

  coverage?.registerLoader(module);
  ctx.run(module as any);
  await reporter.onFlush?.();

  const suiteReport = SuiteReport.from(ctx);
  if (!suiteReport.hasResults) {
    return {
      compilerError: null,
      suiteStatsFacts: null,
    };
  }

  const suiteStatsFacts = createSuiteStatsFacts(suiteReport);

  if (snapshotPlan.mode === SnapshotMode.CompareSnapshots) {
    const expectedSnapshots = ctx.expectedSnapshots;
    const snapshotLifecycle = ctx.snapshotLifecycle!;
    const updatePlan = snapshotLifecycle.updatePlan;

    await snapshotPlan.applySnapshotWrites({ expectedSnapshots, updatePlan });
    return {
      compilerError: null,
      suiteStatsFacts: { ...suiteStatsFacts, snapshotStats: snapshotLifecycle.stats },
    };
  }

  {
    const expectedSnapshots = ctx.expectedSnapshots;
    const snapshotLifecycle = ctx.snapshotLifecycle!;
    const updatePlan = snapshotLifecycle.updatePlan;

    await snapshotPlan.applySnapshotWrites({ expectedSnapshots, rootPassed: ctx.rootNode.pass, updatePlan });
    return {
      compilerError: null,
      suiteStatsFacts: { ...suiteStatsFacts, snapshotStats: snapshotLifecycle.stats },
    };
  }
}
