import program from "commander";
import chalk from "chalk";
import path from "path";
import { IConfiguration } from "./util/IConfiguration";
import glob from "glob";

// import { TestRunner } from "./test/TestRunner";
import asc from "assemblyscript/cli/asc";
import { TestRunner } from "./test/TestRunner";

const pkg = require("../package.json");

console.log(chalk`{bold.bgWhite.black ${""
}     ___   _____                       __  
    /   | / ___/      ____  ___  _____/ /_ 
   / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/ 
  / ___ |___/ /_____/ /_/ /  __/ /__/ /_   
 /_/  |_/____/     / .___/\\___/\\___/\\__/   
                  /_/                      } AS-pect Test suite runner {bgGreenBright.black [${pkg.version}]}
`);

function identity<T>(value: T): T { return value; }

program
  .version(pkg.version)
  .option("-c, --config", "The as-spect configuration location", identity, "as-spect.config.js")
  .parse(process.argv);

const configurationPath = path.resolve(process.cwd(), program.config);
console.log(chalk`{bgWhite.black [Log]} using configuration ${configurationPath}`);

let configuration: IConfiguration | null = null;

try {
  configuration = require(configurationPath);
} catch (ex) {
  console.log("");
  console.log(chalk`{bgRedBright.black [Error]} problem loading {bold [${configurationPath}]}.`);
  console.log(ex);
  process.exit(1);
}

if (!(typeof configuration === "object")) {
  console.log("");
  console.log(chalk`{bgRedBright.black [Error]} configuration at {bold [${configurationPath}]} is null or not an object.`);
  process.exit(1);
}

console.log(chalk`{bgWhite.black [Log]} including files ${configuration!.include.join(", ")}`);

const files: string[] = [];

for (const pattern of configuration!.include) {
  files.push(...glob.sync(pattern));
}

let binary: Uint8Array;

const entryPath = path.join(__dirname, "../assembly/index.ts");
const relativePath = path.relative(process.cwd(), entryPath);

asc.main([
  ...files, relativePath,
  "--validate",
  "--debug",
  "--measure",
  "--binaryFile", "output.wasm",
], {
  // @ts-ignore this is fine
  stdout: process.stdout,
  // @ts-ignore this is fine
  stderr: process.stderr,
  writeFile(name: string, contents: Uint8Array) {
    if (path.extname(name) === ".wasm") {
      binary = contents;
    }
  }
}, function (error: Error): void {
  if (error) {
    console.log(chalk`{bgRedBright.black [Error]} There was a compilation error when trying to create the wasm binary.`);
    console.log(error);
    process.exit(1);
    return;
  }

  if (!binary) {
    console.log(chalk`{bgRedBright.black [Error]} There was no output binary file.`);
    process.exit(1);
    return;
  }

  const runner = new TestRunner(binary, Object.assign({}, configuration!.imports));
  runner.run();

  if (runner.passed) {
    process.exit(0);
  } else {
    process.exit(1);
  }
});
