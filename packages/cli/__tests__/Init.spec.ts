import { join } from "path";
import { applyInitPlan, createInitPlan, InitFileSystemState, InitPlanFileSystem } from "../src/init.js";

const cwd = "/workspace";
const templateDirectory = "/templates";

function createFileSystemState(existingPaths: string[]): InitFileSystemState {
  const existing = new Set(existingPaths);
  return {
    exists(path: string): boolean {
      return existing.has(path);
    },
  };
}

describe("CLI init plan", () => {
  it("plans the full default test setup for an empty project", () => {
    const plan = createInitPlan({ cwd, fileSystem: createFileSystemState([]), templateDirectory });

    expect(plan.creates).toEqual([
      { displayPath: "./assembly/", path: join(cwd, "assembly"), type: "directory" },
      { displayPath: "./assembly/__tests__/", path: join(cwd, "assembly", "__tests__"), type: "directory" },
      {
        displayPath: "./assembly/__tests__/example.spec.ts",
        path: join(cwd, "assembly", "__tests__", "example.spec.ts"),
        sourcePath: join(templateDirectory, "example.spec.ts"),
        type: "file",
      },
      {
        displayPath: "./assembly/__tests__/as-pect.d.ts",
        path: join(cwd, "assembly", "__tests__", "as-pect.d.ts"),
        sourcePath: join(templateDirectory, "init-types.d.ts"),
        type: "file",
      },
      {
        displayPath: "./as-pect.config.js",
        path: join(cwd, "as-pect.config.js"),
        sourcePath: join(templateDirectory, "as-pect.config.js"),
        type: "file",
      },
      {
        displayPath: "./as-pect.asconfig.json",
        path: join(cwd, "as-pect.asconfig.json"),
        sourcePath: join(templateDirectory, "as-pect.asconfig.json"),
        type: "file",
      },
    ]);
    expect(plan.skips).toEqual([]);
  });

  it("skips an existing assembly folder while planning missing init files", () => {
    const plan = createInitPlan({
      cwd,
      fileSystem: createFileSystemState([join(cwd, "assembly")]),
      templateDirectory,
    });

    expect(plan.skips).toEqual([
      { displayPath: "./assembly/", path: join(cwd, "assembly"), reason: "already-exists", type: "directory" },
    ]);
    expect(plan.creates.map((create) => create.displayPath)).toEqual([
      "./assembly/__tests__/",
      "./assembly/__tests__/example.spec.ts",
      "./assembly/__tests__/as-pect.d.ts",
      "./as-pect.config.js",
      "./as-pect.asconfig.json",
    ]);
  });

  it("preserves current behavior when the test folder already exists", () => {
    const plan = createInitPlan({
      cwd,
      fileSystem: createFileSystemState([join(cwd, "assembly"), join(cwd, "assembly", "__tests__")]),
      templateDirectory,
    });

    expect(plan.creates.map((create) => create.displayPath)).toEqual([
      "./assembly/__tests__/as-pect.d.ts",
      "./as-pect.config.js",
      "./as-pect.asconfig.json",
    ]);
    expect(plan.skips).toEqual([
      { displayPath: "./assembly/", path: join(cwd, "assembly"), reason: "already-exists", type: "directory" },
      {
        displayPath: "./assembly/__tests__/",
        path: join(cwd, "assembly", "__tests__"),
        reason: "already-exists",
        type: "directory",
      },
      {
        displayPath: "./assembly/__tests__/example.spec.ts",
        path: join(cwd, "assembly", "__tests__", "example.spec.ts"),
        reason: "test-directory-already-exists",
        type: "file",
      },
    ]);
  });

  it("does not overwrite existing config files", () => {
    const plan = createInitPlan({
      cwd,
      fileSystem: createFileSystemState([join(cwd, "as-pect.config.js"), join(cwd, "as-pect.asconfig.json")]),
      templateDirectory,
    });

    expect(plan.creates.map((create) => create.displayPath)).not.toContain("./as-pect.config.js");
    expect(plan.creates.map((create) => create.displayPath)).not.toContain("./as-pect.asconfig.json");
    expect(plan.skips).toEqual([
      {
        displayPath: "./as-pect.config.js",
        path: join(cwd, "as-pect.config.js"),
        reason: "already-exists",
        type: "file",
      },
      {
        displayPath: "./as-pect.asconfig.json",
        path: join(cwd, "as-pect.asconfig.json"),
        reason: "already-exists",
        type: "file",
      },
    ]);
  });

  it("applies creates through the filesystem adapter and injected writer", async () => {
    const plan = createInitPlan({ cwd, fileSystem: createFileSystemState([]), templateDirectory });
    const templateContents = new Map([
      [join(templateDirectory, "example.spec.ts"), "example spec"],
      [join(templateDirectory, "init-types.d.ts"), "types"],
      [join(templateDirectory, "as-pect.config.js"), "config"],
      [join(templateDirectory, "as-pect.asconfig.json"), "asconfig"],
    ]);
    const createdDirectories: string[] = [];
    const writtenFiles = new Map<string, string>();
    const output: string[] = [];
    const fileSystem: InitPlanFileSystem = {
      async mkdir(path: string): Promise<void> {
        createdDirectories.push(path);
      },
      async readFile(path: string): Promise<string> {
        const contents = templateContents.get(path);
        if (contents === undefined) throw new Error(`Missing template: ${path}`);
        return contents;
      },
      async writeFile(path: string, contents: string): Promise<void> {
        writtenFiles.set(path, contents);
      },
    };

    await applyInitPlan(plan, { fileSystem, writer: { write: (text) => output.push(text) } });

    expect(createdDirectories).toEqual([join(cwd, "assembly"), join(cwd, "assembly", "__tests__")]);
    expect(writtenFiles).toEqual(
      new Map([
        [join(cwd, "assembly", "__tests__", "example.spec.ts"), "example spec"],
        [join(cwd, "assembly", "__tests__", "as-pect.d.ts"), "types"],
        [join(cwd, "as-pect.config.js"), "config"],
        [join(cwd, "as-pect.asconfig.json"), "asconfig"],
      ]),
    );
    expect(output.join("")).toContain("Creating folder:");
    expect(output.join("")).toContain("./assembly/");
    expect(output.join("")).toContain("Creating file:");
    expect(output.join("")).toContain("./as-pect.asconfig.json");
  });
});
