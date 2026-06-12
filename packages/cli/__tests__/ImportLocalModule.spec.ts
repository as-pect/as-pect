import { promises as fs } from "fs";
import path from "path";
import { collectReporter } from "../src/collectReporter.js";
import { importLocalModule, toLocalModuleSpecifier } from "../src/importLocalModule.js";
import type { IAspectConfig } from "../src/IAspectConfig.js";

const aspectConfig: IAspectConfig = {
  instantiate() {
    throw new Error("not used by these import tests");
  },
};
const reporterMarkerKey = "__asPectReporterImportMarker";

async function createTempDirectory(): Promise<string> {
  return fs.mkdtemp(path.join(process.cwd(), ".tmp-cli-import-"));
}

async function writeReporterModule(modulePath: string, markerValue: string): Promise<void> {
  await fs.writeFile(
    modulePath,
    `export default {
      stdout: null,
      stderr: null,
      onEnter() {},
      onExit() {},
      onFinish() {
        const key = "${reporterMarkerKey}";
        globalThis[key] = [...(globalThis[key] || []), "${markerValue}"];
      }
    };
`,
    "utf8",
  );
}

describe("local module imports", () => {
  let tempDirectory = "";
  const originalCwd = process.cwd();

  beforeEach(async () => {
    tempDirectory = await createTempDirectory();
  });

  afterEach(async () => {
    process.chdir(originalCwd);
    delete (globalThis as Record<string, unknown>)[reporterMarkerKey];
    await fs.rm(tempDirectory, { force: true, recursive: true });
  });

  it("builds a file URL that escapes path characters with URL meaning", () => {
    const modulePath = path.join(tempDirectory, "config #é space.mjs");
    const specifier = toLocalModuleSpecifier(modulePath);

    expect(specifier).toContain("%20");
    expect(specifier).toContain("%23");
    expect(specifier).toContain("%C3%A9");
    expect(specifier).not.toContain("#é space");
  });

  it("imports local modules whose paths contain spaces, URL-significant characters, and non-ASCII text", async () => {
    const modulePath = path.join(tempDirectory, "config #é space.mjs");
    await fs.writeFile(modulePath, "export default { loaded: true };\n", "utf8");

    const module = await importLocalModule<{ default: { loaded: boolean } }>(modulePath);

    expect(module.default.loaded).toBe(true);
  });

  it("uses safe local imports for custom reporter file paths", async () => {
    const moduleName = "reporter #é space.mjs";
    await writeReporterModule(path.join(tempDirectory, moduleName), "special path reporter");
    process.chdir(tempDirectory);
    const stdout = { write(_str: string) {} };
    const stderr = { write(_str: string) {} };

    const reporter = await collectReporter({ reporter: `./${moduleName}` }, aspectConfig, { stdout, stderr });

    reporter.onFinish({} as never);

    expect((globalThis as Record<string, unknown>)[reporterMarkerKey]).toEqual(["special path reporter"]);
    expect(reporter.stdout).toBe(stdout);
    expect(reporter.stderr).toBe(stderr);
  });

  it("preserves existing custom reporter behavior for local project files without a relative prefix", async () => {
    const moduleName = "project-reporter.mjs";
    await writeReporterModule(path.join(tempDirectory, moduleName), "local project reporter");
    process.chdir(tempDirectory);

    const reporter = await collectReporter({ reporter: moduleName }, aspectConfig);

    reporter.onFinish({} as never);

    expect((globalThis as Record<string, unknown>)[reporterMarkerKey]).toEqual(["local project reporter"]);
  });

  it("imports custom reporters from package module specifiers relative to the project", async () => {
    const packageDirectory = path.join(tempDirectory, "node_modules", "aspect-test-reporter");
    await fs.mkdir(packageDirectory, { recursive: true });
    await fs.writeFile(
      path.join(packageDirectory, "package.json"),
      JSON.stringify({ name: "aspect-test-reporter", type: "module", exports: "./index.mjs" }),
      "utf8",
    );
    await writeReporterModule(path.join(packageDirectory, "index.mjs"), "package reporter");
    process.chdir(tempDirectory);

    const reporter = await collectReporter({ reporter: "aspect-test-reporter" }, aspectConfig);

    reporter.onFinish({} as never);

    expect((globalThis as Record<string, unknown>)[reporterMarkerKey]).toEqual(["package reporter"]);
  });

  it("combines config and CLI reporters in config-first order", async () => {
    await writeReporterModule(path.join(tempDirectory, "config-reporter.mjs"), "config reporter");
    await writeReporterModule(path.join(tempDirectory, "cli-reporter.mjs"), "cli reporter");
    process.chdir(tempDirectory);

    const reporter = await collectReporter(
      { reporter: "./cli-reporter.mjs" },
      { ...aspectConfig, reporter: "./config-reporter.mjs" },
    );

    reporter.onFinish({} as never);

    expect((globalThis as Record<string, unknown>)[reporterMarkerKey]).toEqual(["config reporter", "cli reporter"]);
  });

  it("identifies the custom reporter module that failed to import", async () => {
    process.chdir(tempDirectory);

    await expect(collectReporter({ reporter: "missing-as-pect-reporter" }, aspectConfig)).rejects.toThrow(
      /missing-as-pect-reporter/,
    );
  });
});
