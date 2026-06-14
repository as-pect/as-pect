import process, { stdout } from "process";
import path from "path";
import { promises as fs } from "fs";
import url from "url";
import { printAsciiArt } from "./asciiArt.js";
import { ansi } from "./ansi.js";
import type { IAspectConfig } from "./IAspectConfig.js";
import { importLocalModule } from "./importLocalModule.js";

import { version as ascVersion } from "assemblyscript/dist/asc.js";
import { CliProgram } from "./CliProgram.js";
import { init } from "./init.js";
import { createTestSessionConfig, formatTestSessionSummary, SnapshotMode, TestSession } from "./TestSession.js";

export function createCliProgram(): CliProgram {
  return new CliProgram();
}

export const program = createCliProgram();

// const __filename = url.fileURLToPath(import.meta.url);
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));

export { SnapshotMode };
export type {
  AspectCreateImports,
  AspectImports,
  AspectInstantiate,
  AspectInstantiateResult,
  IAspectConfig,
} from "./IAspectConfig.js";

export function log(str: string): void {
  stdout.write(ansi.blackOnWhite("[Log]") + `${str}\n`);
}

export function warning(str: string): void {
  stdout.write(ansi.blackOnYellow("[Warning]") + `${str}\n`);
}

export async function asp(argv: string[]): Promise<void> {
  const opts = program.parse(argv).opts();
  const pkgLocation = path.join(__dirname, "../package.json");
  // get the current cli package version
  const pkg = JSON.parse(await fs.readFile(pkgLocation, "utf8"));
  const version = pkg.version;
  const args = program.args;
  const cwd = process.cwd();

  // We print the ascii art if the logo has not been disabled and this is not a version request.
  if (opts.logo !== false && !opts.version) {
    printAsciiArt();
  }

  if (opts.init) {
    await init();
    process.exit(0);
  }

  // always print the version and exit if v
  process.stdout.write(`⚡AS-pect⚡ Test suite runner ${ansi.boldBlackOnBrightGreen(`[${version}]`)}\n`);
  if (opts.version) {
    process.exit(0);
  }

  // First collect the as-pect.config.js
  const configRelativeLocation = opts.config;
  const configLocation = path.resolve(cwd, configRelativeLocation);
  const aspectConfig = (await importLocalModule<{ default: IAspectConfig }>(configLocation)).default;

  stdout.write(`Using config: ${configLocation}\n`);
  stdout.write(`ASC Version: ${ascVersion}\n`);

  let result;
  try {
    const session = new TestSession(
      createTestSessionConfig({
        args,
        aspectConfig,
        asconfigLocation: opts.asConfig,
        cwd,
        options: opts,
      }),
    );

    result = await session.run();
  } catch (ex) {
    console.error(ex);
    process.exit(1);
  }

  if (result.compilerError) {
    console.error(result.compilerError);
    process.exit(1);
  }

  if (result.coverageReport) {
    stdout.write(ansi.green("\nCoverage Report:\n\n"));
    stdout.write(result.coverageReport);
  }

  stdout.write(formatTestSessionSummary(result));

  if (!result.pass) {
    process.exit(1);
  }
}
