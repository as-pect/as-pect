
import chalk from "chalk";
import path from "path";
import yargsparser from "yargs-parser";
// import { TestRunner } from "./test/TestRunner";

import { types } from "./types";
import { init } from "./init";
import { help } from "./help";
import { run } from "./run";

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
  const yargs = {
    argv: yargsparser(aspectArgs),
  };

  // Skip ascii art if asked for the version
  if (!(yargs.argv.v || yargs.argv.version)) {
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

  if (yargs.argv.t || yargs.argv.types) {
    types(assemblyFolder, testFolder, typesFile, typesFileSource);
  } else if (yargs.argv.i || yargs.argv.init) {
    // init script
    init(assemblyFolder, testFolder, typesFile, typesFileSource);
  } else if (yargs.argv.v || yargs.argv.version) { // display the version
    console.log(pkg.version);
  } else if (yargs.argv.help || yargs.argv.h) { // display the help file
    help();
  } else { // run the compiler and test suite
    run(yargs, compilerArgs);
  }
}
