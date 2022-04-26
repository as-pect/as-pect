import { parse } from "./util/CommandLineArg.js";
import { printAsciiArt } from './util/asciiArt.js';
import { types } from './types.js';
import { init } from './init.js';
import { help } from './help.js';
import { portable } from './portable.js';
import { run } from './run.js';


/**
 * @ignore
 *
 * Package version is always displayed, either for version or cli ascii art.
 */
import { readFileSync } from 'fs';
const pkg = JSON.parse(readFileSync('./package.json').toString());

/**
 * This is the command line package version.
 */
export const version = pkg.version;

export { parse, defaultCliArgs, Options } from "./util/CommandLineArg.js";

/**
 * This is the cli entry point and expects an array of arguments from the command line.
 *
 * @param {string[]} args - The arguments from the command line
 */
export function asp(args: string[]) {
  const splitIndex = args.indexOf("--");
  const hasCompilerArgs = splitIndex !== -1;
  const aspectArgs: string[] = hasCompilerArgs
    ? args.slice(0, splitIndex)
    : args;
  const compilerArgs: string[] = hasCompilerArgs
    ? args.slice(splitIndex + 1)
    : [];

  // parse the arguments
  const cliOptions = parse(aspectArgs);

  // Skip ascii art if asked for the version
  if (!cliOptions.version && !cliOptions.nologo) {
    printAsciiArt(pkg.version);
  }

  if (cliOptions.types) {
    types();
  } else if (cliOptions.init) {
    // init script
    init();
  } else if (cliOptions.version) {
    // display the version
    console.log(pkg.version);
  } else if (cliOptions.help) {
    // display the help file
    help();
  } else if (cliOptions.portable) {
    portable();
  } else {
    // run the compiler and test suite
    run(cliOptions, compilerArgs);
  }
}

if (typeof require != "undefined" && require.main == module) {
  asp(process.argv.slice(2));
}
