
import chalk from "chalk";
import path from "path";
import { parse } from "./util/IYargs";
// import { TestRunner } from "./test/TestRunner";

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
    console.log(chalk`{bold.bgWhite.black ${""
  }       ___   _____                       __
      /   | / ___/      ____  ___  _____/ /_
     / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/
    / ___ |___/ /_____/ /_/ /  __/ /__/ /_
   /_/  |_/____/     / .___/\\___/\\___/\\__/
                    /_/                        }

  ⚡AS-pect⚡ Test suite runner {bgGreenBright.black [${pkg.version}]}
  `);
  }

  const assemblyFolder = path.join(process.cwd(), "assembly");
  const testFolder = path.join(assemblyFolder, "__tests__");
  const typesFileSource = path.join(__dirname, "../../assembly/__tests__/as-pect.d.ts");
  const typesFile = path.join(testFolder, "as-pect.d.ts");

  if (yargs.types) {
    const types = require("./types").types;
    types(assemblyFolder, testFolder, typesFile, typesFileSource);
  } else if (yargs.init) {
    const init = require("./init").init;
    // init script
    init(assemblyFolder, testFolder, typesFile, typesFileSource);
  } else if (yargs.version) { // display the version
    console.log(pkg.version);
  } else if (yargs.help) { // display the help file
    const help = require("./help").help;
    help();
  } else { // run the compiler and test suite
    const run = require("./run").run;
    run(yargs, compilerArgs);
  }
}

if (typeof require != 'undefined' && require.main==module) {
  asp(process.argv.slice(2))
}
