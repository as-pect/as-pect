import { jest } from "@jest/globals";
import {
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
});

describe("Test session summary formatting", () => {
  it("formats the aggregate test session result", () => {
    const summary = formatTestSessionSummary({
      pass: true,
      stats: {
        addedSnapshots: 1,
        groups: 2,
        pass: true,
        passedGroups: 2,
        passedSnapshots: 3,
        passedTests: 4,
        removedSnapshots: 0,
        tests: 4,
        totalSnapshots: 3,
      },
    });

    expect(summary).toContain("[Summary]");
    expect(summary).toContain("[Tests]: 4 / 4");
    expect(summary).toContain("[Groups]: 2 / 2");
    expect(summary).toContain("[Snapshots]: 3 / 3, Added 1, Changed 0");
    expect(summary).toContain("[Result]: ✔ Pass!");
  });
});
