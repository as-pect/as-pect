import { parse } from "./util/CommandLineArg";

/**
 * @ignore
 *
 * Package version is always displayed, either for version or cli ascii art.
 */
const pkg = require("../package.json");

/**
 * This is the command line package version.
 */
export const version = pkg.version;

export { parse, defaultCliArgs, Options } from "./util/CommandLineArg";

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
    const printAsciiArt = require("./util/asciiArt").printAsciiArt;
    printAsciiArt(pkg.version);
  }

  if (cliOptions.types) {
    const types = require("./types").types;
    types();
  } else if (cliOptions.init) {
    const init = require("./init").init;
    // init script
    init();
  } else if (cliOptions.initWasi) {
    const init = require("./init").init;

    init(true);
  } else if (cliOptions.version) {
    // display the version
    console.log(pkg.version);
  } else if (cliOptions.help) {
    // display the help file
    const help = require("./help").help;
    help();
  } else if (cliOptions.portable) {
    const portable = require("./portable").portable;
    portable();
  } else {
    // run the compiler and test suite
    const run = require("./run").run;
    run(cliOptions, compilerArgs);
  }
}

if (typeof require != "undefined" && require.main == module) {
  asp(process.argv.slice(2));
}
