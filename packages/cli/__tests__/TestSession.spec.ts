import { jest } from "@jest/globals";
import {
  accumulateTestSessionSnapshotStats,
  createTestSessionConfig,
  formatTestSessionSummary,
  TestSession,
  TestSessionDependencies,
} from "../src/TestSession.js";
import { IAspectConfig } from "../src/IAspectConfig.js";

const minimalWasmBinary = new Uint8Array([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00]);

const aspectConfig: IAspectConfig = {
  instantiate() {
    throw new Error("not used by these configuration tests");
  },
};

const createConfig = (options: Parameters<typeof createTestSessionConfig>[0]["options"], config = aspectConfig) =>
  createTestSessionConfig({
    args: [],
    aspectConfig: config,
    asconfigLocation: "./as-pect.asconfig.json",
    cwd: "/workspace",
    options,
  });

describe("Test session configuration", () => {
  it("uses the default include glob when no include options are supplied", () => {
    const config = createConfig({});

    expect(config.includeGlobs).toEqual(["assembly/__tests__/**/*.include.ts"]);
  });

  it("uses include globs from the as-pect config", () => {
    const config = createConfig({}, { ...aspectConfig, include: ["assembly/setup.ts"] });

    expect(config.includeGlobs).toEqual(["assembly/setup.ts"]);
  });

  it("maps --disclude into an entry filter", () => {
    const config = createConfig({ disclude: "skip" });

    expect(config.entryFilterRegexes).toHaveLength(1);
    expect(config.entryFilterRegexes[0].test("assembly/__tests__/skip.spec.ts")).toBe(true);
  });

  it("maps --include into comma-separated include globs", () => {
    const config = createConfig({ include: "assembly/setup.ts,assembly/env.ts" });

    expect(config.includeGlobs).toEqual(["assembly/setup.ts", "assembly/env.ts"]);
  });

  it("maps --no-run into compile-only output", () => {
    const config = createConfig({ run: false });

    expect(config.runTests).toBe(false);
    expect(config.outputBinary).toBe(true);
  });

  it("maps output and snapshot update options into session configuration", () => {
    const config = createConfig({ outputBinary: true, updateSnapshots: true });

    expect(config.outputBinary).toBe(true);
    expect(config.updateSnapshots).toBe(true);
  });

  it("maps memory options into a WebAssembly memory descriptor", () => {
    const config = createConfig({ memoryMax: "8", memorySize: "4" });

    expect(config.memory).toEqual({ initial: 4, maximum: 8 });
  });

  it("omits the maximum memory limit when --memory-max is -1", () => {
    const config = createConfig({ memoryMax: "-1", memorySize: "4" });

    expect(config.memory).toEqual({ initial: 4 });
  });

  it("rejects invalid memory options before execution", () => {
    expect(() => createConfig({ memorySize: "1.5" })).toThrow("--memory-size must be an integer");
    expect(() => createConfig({ memoryMax: "-2" })).toThrow("--memory-max must be a non-negative");
    expect(() => createConfig({ memoryMax: "3", memorySize: "4" })).toThrow(
      "--memory-max must be greater than or equal to --memory-size",
    );
  });
});

describe("Test session execution", () => {
  it("can compile without running tests or instantiating wasm", async () => {
    const writes = new Map<string, string | Uint8Array>();
    const readFileSync = jest.fn(() => "export const value = 1;");
    const readdirSync = jest.fn(() => ["z-dependency.ts", "dependency.d.ts", "a-dependency.ts"]);
    const instantiate = jest.fn();
    const compile = jest.fn(async (_args, io) => {
      io.readFile("entry.ts", "/workspace");
      io.readFile("entry.ts", "/workspace");
      expect(io.listFiles("assembly", "/workspace")).toEqual(["a-dependency.ts", "z-dependency.ts"]);
      expect(io.listFiles("assembly", "/workspace")).toEqual(["a-dependency.ts", "z-dependency.ts"]);
      io.writeFile("build/output.wasm", new Uint8Array([1, 2, 3]), "/workspace");
      io.writeFile("build/output.wat", "(module)", "/workspace");
      return { stats: { toString: () => "compiler stats" } };
    });
    const dependencies: Partial<TestSessionDependencies> = {
      compile,
      fileSystem: {
        access: jest.fn(async () => void 0),
        existsSync: jest.fn(() => false),
        mkdir: jest.fn(async () => void 0),
        readFile: jest.fn(async () => ""),
        readFileSync,
        readdirSync,
        writeFile: jest.fn(async (filePath: string, contents: string | Uint8Array) => {
          writes.set(filePath, contents);
        }),
      },
      glob: jest.fn(async (pattern) => (pattern.includes("*.spec.ts") ? ["assembly/__tests__/entry.spec.ts"] : [])),
    };

    const config = createTestSessionConfig({
      args: ["assembly/__tests__/*.spec.ts"],
      aspectConfig: { ...aspectConfig, instantiate },
      asconfigLocation: "./as-pect.asconfig.json",
      cwd: "/workspace",
      dependencies,
      options: { run: false },
    });

    const result = await new TestSession(config).run();

    expect(result.pass).toBe(true);
    expect(result.stats.tests).toBe(0);
    expect(instantiate).not.toHaveBeenCalled();
    expect(writes.get("assembly/__tests__/entry.spec.wasm")).toEqual(new Uint8Array([1, 2, 3]));
    expect(writes.get("assembly/__tests__/entry.spec.wat")).toBe("(module)");
    expect(readFileSync).toHaveBeenCalledTimes(1);
    expect(readdirSync).toHaveBeenCalledTimes(1);
  });

  it("waits for reporter flush completion before resolving", async () => {
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
        await new Promise<void>((resolveFlush) => {
          releaseFlush = resolveFlush;
        });
        events.push("flush:end");
      },
    };
    const collectReporter = jest.fn(async () => reporter);
    const compile = jest.fn(async (_args, io) => {
      io.writeFile("build/output.wasm", minimalWasmBinary, "/workspace");
      io.writeFile("build/output.wat", "(module)", "/workspace");
      return { stats: { toString: () => "compiler stats" } };
    });
    const instantiate = jest.fn(async (memory: WebAssembly.Memory) => ({
      exports: {
        _start() {},
        memory,
      },
      instance: {} as WebAssembly.Instance,
    }));
    const dependencies: Partial<TestSessionDependencies> = {
      collectReporter,
      compile,
      fileSystem: {
        access: jest.fn(async () => void 0),
        existsSync: jest.fn(() => false),
        mkdir: jest.fn(async () => void 0),
        readFile: jest.fn(async () => ""),
        readFileSync: jest.fn(() => ""),
        readdirSync: jest.fn(() => []),
        writeFile: jest.fn(async () => void 0),
      },
      glob: jest.fn(async (pattern) => (pattern.includes("*.spec.ts") ? ["assembly/__tests__/entry.spec.ts"] : [])),
    };

    const config = createTestSessionConfig({
      args: ["assembly/__tests__/*.spec.ts"],
      aspectConfig: { ...aspectConfig, instantiate },
      asconfigLocation: "./as-pect.asconfig.json",
      cwd: "/workspace",
      dependencies,
      options: {},
    });

    const result = new TestSession(config).run();
    let resolved = false;
    result.then(() => {
      resolved = true;
    });

    await flushStarted;
    await Promise.resolve();

    expect(resolved).toBe(false);
    expect(events).toEqual(["finish", "flush:start"]);

    releaseFlush();
    await expect(result).resolves.toMatchObject({ pass: true });

    expect(events).toEqual(["finish", "flush:start", "flush:end"]);
  });

  it("sorts discovered entries while preserving CLI and config glob precedence", async () => {
    const compile = jest.fn(async (_args, io) => {
      io.writeFile("build/output.wasm", new Uint8Array([1, 2, 3]), "/workspace");
      io.writeFile("build/output.wat", "(module)", "/workspace");
      return { stats: { toString: () => "compiler stats" } };
    });
    const dependencies: Partial<TestSessionDependencies> = {
      compile,
      fileSystem: {
        access: jest.fn(async () => void 0),
        existsSync: jest.fn(() => false),
        mkdir: jest.fn(async () => void 0),
        readFile: jest.fn(async () => ""),
        readFileSync: jest.fn(() => ""),
        readdirSync: jest.fn(() => []),
        writeFile: jest.fn(async () => void 0),
      },
      glob: jest.fn(async (pattern) => {
        switch (pattern) {
          case "assembly/__tests__/cli-*.spec.ts":
            return ["assembly/__tests__/cli-z.spec.ts", "assembly/__tests__/cli-a.spec.ts"];
          case "assembly/__tests__/focused-*.spec.ts":
            return ["assembly/__tests__/focused-b.spec.ts", "assembly/__tests__/focused-a.spec.ts"];
          case "assembly/config/*.spec.ts":
            return ["assembly/config/z.spec.ts", "assembly/config/a.spec.ts"];
          default:
            return [];
        }
      }),
    };

    const config = createTestSessionConfig({
      args: ["assembly/__tests__/cli-*.spec.ts", "assembly/__tests__/focused-*.spec.ts"],
      aspectConfig: { ...aspectConfig, entries: ["assembly/config/*.spec.ts"] },
      asconfigLocation: "./as-pect.asconfig.json",
      cwd: "/workspace",
      dependencies,
      options: { run: false },
    });

    await new TestSession(config).run();

    expect(compile.mock.calls.map((call) => call[0][0])).toEqual([
      "assembly/__tests__/cli-a.spec.ts",
      "assembly/__tests__/cli-z.spec.ts",
      "assembly/__tests__/focused-a.spec.ts",
      "assembly/__tests__/focused-b.spec.ts",
      "assembly/config/a.spec.ts",
      "assembly/config/z.spec.ts",
    ]);
  });

  it("sorts discovered include files before passing them to the compiler", async () => {
    const compile = jest.fn(async (_args, io) => {
      io.writeFile("build/output.wasm", new Uint8Array([1, 2, 3]), "/workspace");
      io.writeFile("build/output.wat", "(module)", "/workspace");
      return { stats: { toString: () => "compiler stats" } };
    });
    const dependencies: Partial<TestSessionDependencies> = {
      compile,
      fileSystem: {
        access: jest.fn(async () => void 0),
        existsSync: jest.fn(() => false),
        mkdir: jest.fn(async () => void 0),
        readFile: jest.fn(async () => ""),
        readFileSync: jest.fn(() => ""),
        readdirSync: jest.fn(() => []),
        writeFile: jest.fn(async () => void 0),
      },
      glob: jest.fn(async (pattern) => {
        switch (pattern) {
          case "assembly/__tests__/*.spec.ts":
            return ["assembly/__tests__/entry.spec.ts"];
          case "assembly/setup/*.include.ts":
            return ["assembly/setup/z.include.ts", "assembly/setup/a.include.ts", "assembly/setup/m.include.ts"];
          default:
            return [];
        }
      }),
    };

    const config = createTestSessionConfig({
      args: ["assembly/__tests__/*.spec.ts"],
      aspectConfig: { ...aspectConfig, include: ["assembly/setup/*.include.ts"] },
      asconfigLocation: "./as-pect.asconfig.json",
      cwd: "/workspace",
      dependencies,
      options: { run: false },
    });

    await new TestSession(config).run();

    expect(compile.mock.calls[0][0]).toEqual([
      "assembly/__tests__/entry.spec.ts",
      "assembly/setup/a.include.ts",
      "assembly/setup/m.include.ts",
      "assembly/setup/z.include.ts",
      "--config",
      "./as-pect.asconfig.json",
      "--target",
      "noCoverage",
    ]);
  });

  it.each([/skip/g, /assembly\/__tests__\/skip/y])(
    "applies %s entry disclude filters deterministically",
    async (discludeRegex) => {
      const compile = jest.fn(async (_args, io) => {
        io.writeFile("build/output.wasm", new Uint8Array([1, 2, 3]), "/workspace");
        io.writeFile("build/output.wat", "(module)", "/workspace");
        return { stats: { toString: () => "compiler stats" } };
      });
      const dependencies: Partial<TestSessionDependencies> = {
        compile,
        fileSystem: {
          access: jest.fn(async () => void 0),
          existsSync: jest.fn(() => false),
          mkdir: jest.fn(async () => void 0),
          readFile: jest.fn(async () => ""),
          readFileSync: jest.fn(() => ""),
          readdirSync: jest.fn(() => []),
          writeFile: jest.fn(async () => void 0),
        },
        glob: jest.fn(async (pattern) =>
          pattern.includes("*.spec.ts")
            ? [
                "assembly/__tests__/skip-one.spec.ts",
                "assembly/__tests__/skip-two.spec.ts",
                "assembly/__tests__/keep.spec.ts",
              ]
            : [],
        ),
      };

      const config = createTestSessionConfig({
        args: ["assembly/__tests__/*.spec.ts"],
        aspectConfig: { ...aspectConfig, disclude: [discludeRegex] },
        asconfigLocation: "./as-pect.asconfig.json",
        cwd: "/workspace",
        dependencies,
        options: { run: false },
      });

      await new TestSession(config).run();

      expect(compile).toHaveBeenCalledTimes(1);
      expect(compile.mock.calls[0][0][0]).toBe("assembly/__tests__/keep.spec.ts");
      expect(discludeRegex.lastIndex).toBe(0);
    },
  );
});

describe("Test session summary formatting", () => {
  it("formats the aggregate test session result", () => {
    const summary = formatTestSessionSummary({
      pass: true,
      stats: {
        addedSnapshots: 1,
        changedSnapshots: 2,
        groups: 2,
        pass: true,
        passedGroups: 2,
        passedSnapshots: 3,
        passedTests: 4,
        removedSnapshots: 1,
        tests: 4,
        totalSnapshots: 6,
      },
    });

    expect(summary).toContain("[Summary]");
    expect(summary).toContain("[Tests]: 4 / 4");
    expect(summary).toContain("[Groups]: 2 / 2");
    expect(summary).toContain("[Snapshots]: 3 / 6, Added 1, Changed 2, Removed 1");
    expect(summary).toContain("[Result]: ✔ Pass!");
  });

  it("labels changed and removed snapshot counts separately", () => {
    const summary = formatTestSessionSummary({
      pass: false,
      stats: {
        addedSnapshots: 0,
        changedSnapshots: 3,
        groups: 0,
        pass: false,
        passedGroups: 0,
        passedSnapshots: 1,
        passedTests: 0,
        removedSnapshots: 2,
        tests: 0,
        totalSnapshots: 6,
      },
    });

    expect(summary).toContain("Added 0, Changed 3, Removed 2");
  });
});

describe("Test session snapshot stats aggregation", () => {
  it("accumulates added, changed, removed, passed, and total snapshot counts", () => {
    const stats = {
      addedSnapshots: 1,
      changedSnapshots: 2,
      groups: 0,
      pass: true,
      passedGroups: 0,
      passedSnapshots: 3,
      passedTests: 0,
      removedSnapshots: 4,
      tests: 0,
      totalSnapshots: 5,
    };

    accumulateTestSessionSnapshotStats(stats, {
      addedSnapshots: 6,
      changedSnapshots: 7,
      passedSnapshots: 8,
      removedSnapshots: 9,
      totalSnapshots: 10,
    });

    expect(stats).toEqual({
      addedSnapshots: 7,
      changedSnapshots: 9,
      groups: 0,
      pass: true,
      passedGroups: 0,
      passedSnapshots: 11,
      passedTests: 0,
      removedSnapshots: 13,
      tests: 0,
      totalSnapshots: 15,
    });
  });
});
