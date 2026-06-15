import { jest } from "@jest/globals";
import { planTestSessionEntries } from "../src/TestSessionEntries.js";
import { createTestSessionProject } from "../src/TestSessionProject.js";

describe("Test session entry planning", () => {
  it("sorts, deduplicates, and filters entries from CLI args and config entries", async () => {
    const disclude = /skip/g;
    const glob = jest.fn(async (pattern: string) => {
      switch (pattern) {
        case "assembly/__tests__/cli-*.spec.ts":
          return [
            "assembly/__tests__/cli-z.spec.ts",
            "assembly/__tests__/cli-skip.spec.ts",
            "assembly/__tests__/cli-a.spec.ts",
            "assembly/__tests__/cli-a.spec.ts",
          ];
        case "assembly/shared/*.spec.ts":
          return ["assembly/shared/b.spec.ts", "assembly/shared/a.spec.ts"];
        case "assembly/config/*.spec.ts":
          return ["assembly/config/z.spec.ts", "assembly/config/skip.spec.ts", "assembly/config/a.spec.ts"];
        default:
          return [];
      }
    });

    const plan = await planTestSessionEntries({
      args: ["assembly/__tests__/cli-*.spec.ts", "assembly/shared/*.spec.ts"],
      configEntries: ["assembly/config/*.spec.ts", "assembly/shared/*.spec.ts"],
      entryFilterRegexes: [disclude],
      glob,
      includeGlobs: [],
    });

    expect(plan.entries).toEqual([
      "assembly/__tests__/cli-a.spec.ts",
      "assembly/__tests__/cli-z.spec.ts",
      "assembly/shared/a.spec.ts",
      "assembly/shared/b.spec.ts",
      "assembly/config/a.spec.ts",
      "assembly/config/z.spec.ts",
    ]);
    expect(disclude.lastIndex).toBe(0);
  });

  it("sorts and deduplicates include files globally", async () => {
    const glob = jest.fn(async (pattern: string) => {
      switch (pattern) {
        case "assembly/setup/*.include.ts":
          return ["assembly/setup/z.include.ts", "assembly/shared.include.ts"];
        case "assembly/env/*.include.ts":
          return ["assembly/env/b.include.ts", "assembly/shared.include.ts", "assembly/env/a.include.ts"];
        default:
          return [];
      }
    });

    const plan = await planTestSessionEntries({
      args: [],
      entryFilterRegexes: [],
      glob,
      includeGlobs: ["assembly/setup/*.include.ts", "assembly/env/*.include.ts"],
    });

    expect(plan.includeFiles).toEqual([
      "assembly/env/a.include.ts",
      "assembly/env/b.include.ts",
      "assembly/setup/z.include.ts",
      "assembly/shared.include.ts",
    ]);
  });

  it("uses empty config entries and include globs when none are supplied", async () => {
    const glob = jest.fn(async (pattern: string) =>
      pattern === "assembly/__tests__/*.spec.ts" ? ["z.ts", "a.ts"] : [],
    );

    const plan = await planTestSessionEntries({
      args: ["assembly/__tests__/*.spec.ts"],
      entryFilterRegexes: [],
      glob,
      includeGlobs: [],
    });

    expect(plan).toEqual({ entries: ["a.ts", "z.ts"], includeFiles: [] });
  });

  it("runs entry and include globs from the Test session project path", async () => {
    const glob = jest.fn(async (pattern: string) => {
      switch (pattern) {
        case "assembly/__tests__/*.spec.ts":
          return ["assembly/__tests__/entry.spec.ts"];
        case "assembly/setup/*.include.ts":
          return ["assembly/setup/env.include.ts"];
        default:
          return [];
      }
    });

    const plan = await planTestSessionEntries({
      args: ["assembly/__tests__/*.spec.ts"],
      entryFilterRegexes: [],
      glob,
      includeGlobs: ["assembly/setup/*.include.ts"],
      project: createTestSessionProject("/workspace/project"),
    });

    expect(plan).toEqual({
      entries: ["assembly/__tests__/entry.spec.ts"],
      includeFiles: ["assembly/setup/env.include.ts"],
    });
    expect(glob).toHaveBeenCalledWith("assembly/__tests__/*.spec.ts", { cwd: "/workspace/project" });
    expect(glob).toHaveBeenCalledWith("assembly/setup/*.include.ts", { cwd: "/workspace/project" });
  });
});
