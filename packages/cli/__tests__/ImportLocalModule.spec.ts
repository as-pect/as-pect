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
    await fs.writeFile(
      path.join(tempDirectory, moduleName),
      `export default {
        stdout: null,
        stderr: null,
        onEnter() {},
        onExit() {},
        onFinish() {
          globalThis.${reporterMarkerKey} = "special path reporter";
        }
      };\n`,
      "utf8",
    );
    process.chdir(tempDirectory);
    const stdout = { write(_str: string) {} };
    const stderr = { write(_str: string) {} };

    const reporter = await collectReporter({ reporter: `./${moduleName}` }, aspectConfig, { stdout, stderr });

    reporter.onFinish({} as never);

    expect((globalThis as Record<string, unknown>)[reporterMarkerKey]).toBe("special path reporter");
    expect(reporter.stdout).toBe(stdout);
    expect(reporter.stderr).toBe(stderr);
  });
});
