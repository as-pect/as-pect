import process from "process";
import path from "path";
import { promises as fs } from "fs";
import url from "url";
import { format } from "util";
import { printAsciiArt } from "./asciiArt.js";
import { ansi } from "./ansi.js";
import type { IAspectConfig } from "./IAspectConfig.js";
import { importLocalModule } from "./importLocalModule.js";

import { version as ascVersion } from "assemblyscript/dist/asc.js";
import { CliProgram } from "./CliProgram.js";
import { type CliShell, processCliShell } from "./CliShell.js";
import { init } from "./init.js";
import { createTestSessionConfig, formatTestSessionSummary, SnapshotMode, TestSession } from "./TestSession.js";

export function createCliProgram(shell: CliShell = processCliShell): CliProgram {
  return new CliProgram(shell);
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
  processCliShell.stdout.write(ansi.blackOnWhite("[Log]") + `${str}\n`);
}

export function warning(str: string): void {
  processCliShell.stdout.write(ansi.blackOnYellow("[Warning]") + `${str}\n`);
}

function writeError(shell: CliShell, error: unknown): void {
  shell.stderr.write(`${format(error)}\n`);
}

export async function asp(argv: string[], shell: CliShell = processCliShell): Promise<void> {
  program.configureShell(shell);
  const opts = program.parse(argv).opts();
  const pkgLocation = path.join(__dirname, "../package.json");
  // get the current cli package version
  const pkg = JSON.parse(await fs.readFile(pkgLocation, "utf8"));
  const version = pkg.version;
  const args = program.args;
  const cwd = process.cwd();

  // We print the ascii art if the logo has not been disabled and this is not a version request.
  if (opts.logo !== false && !opts.version) {
    printAsciiArt(shell.stdout);
  }

  if (opts.init) {
    await init({ writer: shell.stdout });
    shell.exit(0);
  }

  // always print the version and exit if v
  shell.stdout.write(`⚡AS-pect⚡ Test suite runner ${ansi.boldBlackOnBrightGreen(`[${version}]`)}\n`);
  if (opts.version) {
    shell.exit(0);
  }

  let result;
  try {
    // First collect the as-pect.config.js
    const configRelativeLocation = opts.config;
    const configLocation = path.resolve(cwd, configRelativeLocation);
    const aspectConfig = (await importLocalModule<{ default: IAspectConfig }>(configLocation)).default;

    shell.stdout.write(`Using config: ${configLocation}\n`);
    shell.stdout.write(`ASC Version: ${ascVersion}\n`);

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
    writeError(shell, ex);
    shell.exit(1);
  }

  if (result.compilerError) {
    writeError(shell, result.compilerError);
    shell.exit(1);
  }

  if (result.coverageReport) {
    shell.stdout.write(ansi.green("\nCoverage Report:\n\n"));
    shell.stdout.write(result.coverageReport);
  }

  shell.stdout.write(formatTestSessionSummary(result));

  if (!result.pass) {
    shell.exit(1);
  }
}
