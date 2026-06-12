import { createTestSessionConfig, formatTestSessionSummary } from "../src/TestSession.js";
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

  it("preserves the current --disclude option mapping for characterization", () => {
    const config = createConfig({ disclude: "skip" });

    expect(config.entryFilterRegexes).toEqual([]);
  });

  it("preserves the current --include option mapping for characterization", () => {
    expect(() => createConfig({ include: "assembly/setup.ts" })).toThrow(TypeError);
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
