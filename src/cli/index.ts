import { parse } from "./util/CommandLineArg";

/** Package version is always displayed, either for version or cli ascii art. */
const pkg = require("../../package.json");

/**
 * This is the cli entry point and expects an array of arguments from the command line.
 *
 * @param {string[]} args - The arguments from the command line
 */
export function asp(args: string[]) {
  const hasCompilerArgs = args.includes("--");
  const aspectArgs: string[] = hasCompilerArgs
    ? args.slice(0, args.indexOf("--"))
    : args;
  const compilerArgs: string[] = hasCompilerArgs
    ? args.slice(args.indexOf("--") + 1)
    : [];

  // parse the arguments
  const yargs = parse(aspectArgs);

  // Skip ascii art if asked for the version
  if (!yargs.version) {
    const printAsciiArt = require("./util/asciiArt").printAsciiArt;
    printAsciiArt(pkg.version);
  }

  if (yargs.types) {
    const types = require("./types").types;
    types();
  } else if (yargs.init) {
    const init = require("./init").init;
    // init script
    init();
  } else if (yargs.version) {
    // display the version
    console.log(pkg.version);
  } else if (yargs.help) {
    // display the help file
    const help = require("./help").help;
    help();
  } else if (yargs.portable) {
    const portable = require("./portable").portable;
    portable();
  } else {
    // run the compiler and test suite
    const run = require("./run").run;
    run(yargs, compilerArgs);
  }
}

if (typeof require != "undefined" && require.main == module) {
  asp(process.argv.slice(2));
}
