import { jest } from "@jest/globals";
import {
  accumulateTestSessionSnapshotStats,
  createTestSessionConfig,
  formatTestSessionSummary,
  TestSession,
  TestSessionDependencies,
} from "../src/TestSession.js";
import { IAspectConfig } from "../src/IAspectConfig.js";

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
    const readdirSync = jest.fn(() => ["dependency.ts", "dependency.d.ts"]);
    const instantiate = jest.fn();
    const compile = jest.fn(async (_args, io) => {
      io.readFile("entry.ts", "/workspace");
      io.readFile("entry.ts", "/workspace");
      io.listFiles("assembly", "/workspace");
      io.listFiles("assembly", "/workspace");
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
        totalSnapshots: 3,
      },
    });

    expect(summary).toContain("[Summary]");
    expect(summary).toContain("[Tests]: 4 / 4");
    expect(summary).toContain("[Groups]: 2 / 2");
    expect(summary).toContain("[Snapshots]: 3 / 3, Added 1, Changed 2, Removed 1");
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
