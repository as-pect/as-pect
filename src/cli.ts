
import chalk from "chalk";
import path from "path";
import { IConfiguration } from "./util/IConfiguration";
import glob from "glob";
import yargsparser from "yargs-parser";

// import { TestRunner } from "./test/TestRunner";
import asc from "assemblyscript/cli/asc";
import { TestRunner } from "./test/TestRunner";
import fs from "fs";

const pkg = require("../package.json");

export default function asp(args: string[]) {
  const yargs = {
    argv: yargsparser(args),
  };

  if (!(yargs.argv.v || yargs.argv.version)) {
    console.log(chalk`{bold.bgWhite.black ${""
  }     ___   _____                       __  
      /   | / ___/      ____  ___  _____/ /_ 
    / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/ 
    / ___ |___/ /_____/ /_/ /  __/ /__/ /_   
  /_/  |_/____/     / .___/\\___/\\___/\\__/   
                    /_/                      }

  AS-pect Test suite runner {bgGreenBright.black [${pkg.version}]}
  `);
  }

  if (yargs.argv.i || yargs.argv.init) {
    console.log("");
    console.log(chalk`[Log] Initializing test suite files.`);
    console.log("");

    // Create the test folder
    const testFolder = path.join(process.cwd(), "assembly", "__tests__");
    if (!fs.existsSync(testFolder)) {
      console.log(chalk`[Log] Creating folder: assembly/__tests__`);
      fs.mkdirSync(testFolder);
    }

    const exampleFile = path.join(testFolder, "example.spec.ts");
    const exampleFileSource = path.join(__dirname, "..", "init", "example.spec.ts");
    if (!fs.existsSync(exampleFile)) {
      console.log(chalk`[Log] Creating file: assembly/__tests__/example.spec.ts`);
      fs.createReadStream(exampleFileSource, "utf-8")
        .pipe(fs.createWriteStream(exampleFile, "utf-8"));
    }

    const typesFileSource = path.join(__dirname, "..", "init", "as-pect.d.ts");
    const typesFile = path.join(testFolder, "as-pect.d.ts");
    if (!fs.existsSync(typesFile)) {
      console.log(chalk`[Log] Creating file: assembly/__tests__/as-pect.d.ts`);
      fs.createReadStream(typesFileSource, "utf-8")
        .pipe(fs.createWriteStream(typesFile, "utf-8"));
    }

    const configFile = path.join(process.cwd(), "as-pect.config.js");
    const configFileSource = path.join(__dirname, "..", "init", "as-pect.config.js");
    if (!fs.existsSync(configFile)) {
      console.log(chalk`[Log] Creating file: as-pect.config.js`);
      fs.createReadStream(configFileSource, "utf-8")
        .pipe(fs.createWriteStream(configFile, "utf-8"));
    }
  } else if (yargs.argv.v || yargs.argv.version) {
    console.log(pkg.version);
  } else if (yargs.argv.help || yargs.argv.h) {
    console.log(chalk`
  {bold.blueBright SYNTAX}
    {bold.green asp} --config as-pect.config.js
    {bold.green asp} -c as-pect.config.js
    {bold.green asp} --init
    {bold.green asp} -i
    {bold.green asp} --version
    {bold.green asp} -v

  {bold.blueBright OPTIONS}
    {bold.green --version, -v}         Prints the package version and exits.
    {bold.green --help, -h}            Prints this message and exits.
    {bold.green --config, -c}          Accepts a configuration file and runs the tests.
    {bold.green --init, -i}            Creates a test config, an assembly/__tests__ folder and exits.
  `);
  } else {
    const configurationPath = path.resolve(
      process.cwd(),
      (yargs.argv.c as string) || (yargs.argv.config as string) || "./as-pect.config.js",
    );
    console.log(chalk`{bgWhite.black [Log]} using configuration ${configurationPath}`);

    let configuration: IConfiguration | null = null;

    try {
      configuration = require(configurationPath);
    } catch (ex) {
      console.log("");
      console.log(chalk`{bgRedBright.black [Error]} There was a problem loading {bold [${configurationPath}]}.`);
      console.log(ex);
      process.exit(1);
    }

    if (!(typeof configuration === "object")) {
      console.log("");
      console.log(chalk`{bgRedBright.black [Error]} configuration at {bold [${configurationPath}]} is null or not an object.`);
      process.exit(1);
    }

    console.log(chalk`[Log] including files ${configuration!.include.join(", ")}`);
    console.log("");
    console.log("");

    let files: string[] = [];

    for (const pattern of configuration!.include) {
      files.push(...glob.sync(pattern));
    }
    const disclude: RegExp[] = configuration!.disclude || [];
    disclude.forEach(regexp => {
      files = files.filter(file => !regexp.test(file));
    });;

    let binaries: { [i: number]: Uint8Array } = {};

    const entryPath = path.join(__dirname, "../assembly/index.ts");
    const relativePath = path.relative(process.cwd(), entryPath);

    let failed = false;
    let count = files.length;
    const runner = new TestRunner();
    files.forEach((file: string, i: number) => {
      console.log(chalk`[Log] Compiling: ${file} ${(i + 1).toString()} / ${files.length.toString()}`);
      console.log("");
      asc.main([
        file, relativePath,
        "--validate",
        "--debug",
        "--measure",
        "--binaryFile", "output.wasm",
      ], {
        // @ts-ignore: this is fine
        stdout: process.stdout,
        // @ts-ignore: this is fine
        stderr: process.stderr,
        writeFile(name: string, contents: Uint8Array) {
          if (path.extname(name) === ".wasm") {
            binaries[i] = contents;
          }
        }
      }, function (error: Error): void {
        if (error) {
          console.log(chalk`{red [Error]} There was a compilation error when trying to create the wasm binary for file: ${file}.`);
          console.log(error);
          process.exit(1);
          return;
        }

        if (!binaries[i]) {
          console.log(chalk`{red [Error]} There was no output binary file: ${file}.`);
          process.exit(1);
          return;
        }

        runner.run(
          file,
          binaries[i],
          Object.assign({}, configuration!.imports),
          configuration!.reporter || void 0,
        );
        count -= 1;
        failed = failed || !runner.passed;

        if (count === 0 && failed) {
          process.exit(1);
        }
      });
    });
  }
}
