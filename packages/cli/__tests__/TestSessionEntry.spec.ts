import { jest } from "@jest/globals";
import { createCompilerIoCache } from "../src/CompilerIo.js";
import { runTestSessionEntry } from "../src/TestSessionEntry.js";
import { IAspectConfig } from "../src/IAspectConfig.js";
import { TestSessionDependencies } from "../src/TestSession.js";
import { ReflectedValueType } from "../../core/src/util/ReflectedValueType.js";

const minimalWasmBinary = new Uint8Array([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00]);

const createNoopFileSystem = (): TestSessionDependencies["fileSystem"] => ({
  access: jest.fn(async () => void 0),
  existsSync: jest.fn(() => false),
  mkdir: jest.fn(async () => void 0),
  readFile: jest.fn(async () => ""),
  readFileSync: jest.fn(() => ""),
  readdirSync: jest.fn(() => []),
  writeFile: jest.fn(async () => void 0),
});

const createEntryOptions = (overrides: Partial<Parameters<typeof runTestSessionEntry>[0]> = {}) => {
  const instantiate = jest.fn<IAspectConfig["instantiate"]>(async (memory) => ({
    exports: { memory, _start() {} },
    instance: {} as WebAssembly.Instance,
  }));
  const aspectConfig: IAspectConfig = { instantiate };
  const stdout = { write: jest.fn() } as unknown as NodeJS.WritableStream;
  const stderr = { write: jest.fn() } as unknown as NodeJS.WritableStream;

  return {
    aspectConfig,
    asconfigLocation: "./as-pect.asconfig.json",
    collectReporter: jest.fn(async () => ({ stderr: null, stdout: null, onEnter() {}, onExit() {}, onFinish() {} })),
    compile: jest.fn(async (_args, io) => {
      io.writeFile("build/output.wasm", minimalWasmBinary, "/workspace");
      io.writeFile("build/output.wat", "(module)", "/workspace");
      return { stats: { toString: () => "compiler stats" } };
    }),
    compilerIoCache: createCompilerIoCache(),
    cwd: "/workspace",
    entry: "assembly/__tests__/entry.spec.ts",
    fileSystem: createNoopFileSystem(),
    groupRegex: /(:?)/,
    includeFiles: [],
    memory: { initial: 1 },
    options: {},
    outputBinary: false,
    runTests: true,
    showStats: false,
    stderr,
    stdout,
    testRegex: /(:?)/,
    updateSnapshots: false,
    ...overrides,
  };
};

describe("Test session entry", () => {
  it("writes compile-only binary outputs and skips wasm execution", async () => {
    const writes = new Map<string, string | Uint8Array>();
    const fileSystem = {
      ...createNoopFileSystem(),
      writeFile: jest.fn(async (filePath: string, contents: string | Uint8Array) => {
        writes.set(filePath, contents);
      }),
    };
    const options = createEntryOptions({ fileSystem, outputBinary: true, runTests: false });

    const result = await runTestSessionEntry(options);

    expect(result).toEqual({ compilerError: null, suiteStatsFacts: null });
    expect(options.aspectConfig.instantiate).not.toHaveBeenCalled();
    expect(writes.get("assembly/__tests__/entry.spec.wasm")).toEqual(minimalWasmBinary);
    expect(writes.get("assembly/__tests__/entry.spec.wat")).toBe("(module)");
  });

  it("writes outputBinary artifacts when wasm execution is enabled", async () => {
    const writes = new Map<string, string | Uint8Array>();
    const fileSystem = {
      ...createNoopFileSystem(),
      writeFile: jest.fn(async (filePath: string, contents: string | Uint8Array) => {
        writes.set(filePath, contents);
      }),
    };
    const options = createEntryOptions({ fileSystem, outputBinary: true, runTests: true });

    const result = await runTestSessionEntry(options);

    expect(result).toEqual({ compilerError: null, suiteStatsFacts: null });
    expect(options.aspectConfig.instantiate).toHaveBeenCalledTimes(1);
    expect(writes.get("assembly/__tests__/entry.spec.wasm")).toEqual(minimalWasmBinary);
    expect(writes.get("assembly/__tests__/entry.spec.wat")).toBe("(module)");
  });

  it("collects a reporter for an executed entry and returns suite facts", async () => {
    const strings = new Map([
      [1, "matched group"],
      [2, "matched test"],
    ]);
    const reporter = { stderr: null, stdout: null, onEnter() {}, onExit() {}, onFinish() {} };
    const collectReporter = jest.fn(async () => reporter);
    const instantiate = jest.fn<IAspectConfig["instantiate"]>(async (memory, createImports) => {
      const imports = createImports({ env: { memory } }) as any;
      return {
        exports: {
          memory,
          _start() {
            imports.__aspect.reportGroupTypeNode(1, 10);
          },
          __call(pointer: number) {
            if (pointer === 10) imports.__aspect.reportTestTypeNode(2, 20);
          },
          __getString(pointer: number) {
            return strings.get(pointer) ?? "";
          },
        },
        instance: {} as WebAssembly.Instance,
      };
    });
    const options = createEntryOptions({
      aspectConfig: { instantiate },
      collectReporter,
      options: { verbose: true },
    });

    const result = await runTestSessionEntry(options);

    expect(collectReporter).toHaveBeenCalledWith(options.options, options.aspectConfig, {
      stderr: options.stderr,
      stdout: options.stdout,
    });
    expect(result).toMatchObject({
      compilerError: null,
      suiteStatsFacts: {
        groups: 2,
        hasResults: true,
        pass: true,
        passedGroups: 2,
        passedTests: 1,
        tests: 1,
      },
    });
  });

  it("returns snapshot lifecycle stats when update mode writes snapshots", async () => {
    const strings = new Map([
      [1, "snapshots"],
      [2, "current value"],
      [3, "i32"],
    ]);
    const writes = new Map<string, string | Uint8Array>();
    const fileSystem = {
      ...createNoopFileSystem(),
      writeFile: jest.fn(async (filePath: string, contents: string | Uint8Array) => {
        writes.set(filePath, contents);
      }),
    };
    const instantiate = jest.fn<IAspectConfig["instantiate"]>(async (memory, createImports) => {
      const imports = createImports({ env: { memory } }) as any;
      return {
        exports: {
          memory,
          _start() {
            imports.__aspect.reportTestTypeNode(1, 10);
          },
          __call(pointer: number) {
            if (pointer !== 10) return;
            const value = imports.__aspect.createReflectedNumber(1, 4, ReflectedValueType.Integer, 3, 7);
            imports.__aspect.reportExpectedSnapshot(value, 2);
          },
          __getString(pointer: number) {
            return strings.get(pointer) ?? "";
          },
        },
        instance: {} as WebAssembly.Instance,
      };
    });
    const options = createEntryOptions({
      aspectConfig: { instantiate },
      fileSystem,
      updateSnapshots: true,
    });

    const result = await runTestSessionEntry(options);

    expect(writes.get("assembly/__tests__/__snapshots__/entry.spec.snap")).toBe(
      "exports[`snapshots[0]!~current value[0]`] = `7`;\n",
    );
    expect(result).toMatchObject({
      compilerError: null,
      suiteStatsFacts: {
        pass: true,
        snapshotStats: {
          addedSnapshots: 1,
          changedSnapshots: 0,
          passedSnapshots: 1,
          removedSnapshots: 0,
          totalSnapshots: 1,
        },
      },
    });
  });

  it("waits for reporter flush completion after a suite run", async () => {
    const events: string[] = [];
    let releaseFlush!: () => void;
    let resolveFlushStarted!: () => void;
    const flushStarted = new Promise<void>((resolve) => {
      resolveFlushStarted = resolve;
    });
    const reporter = {
      stderr: null,
      stdout: null,
      onEnter() {},
      onExit() {},
      onFinish() {
        events.push("finish");
      },
      async onFlush() {
        events.push("flush:start");
        resolveFlushStarted();
        await new Promise<void>((resolve) => {
          releaseFlush = resolve;
        });
        events.push("flush:end");
      },
    };
    const options = createEntryOptions({ collectReporter: jest.fn(async () => reporter) });

    const result = runTestSessionEntry(options);
    let resolved = false;
    result.then(() => {
      resolved = true;
    });

    await flushStarted;
    await Promise.resolve();

    expect(resolved).toBe(false);
    expect(events).toEqual(["finish", "flush:start"]);

    releaseFlush();
    await expect(result).resolves.toMatchObject({ compilerError: null });

    expect(events).toEqual(["finish", "flush:start", "flush:end"]);
  });
});
