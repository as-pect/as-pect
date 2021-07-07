import { parse, ConfigurationFile, ConfigurationOptionValue } from "configinator";
import { cliConfig, resolveOptionByName } from "./util/configuration";
import chalk from "chalk";
const pkg = require("../package.json");

const getFileName = (e: ConfigurationFile) => e.filename;
export function asp(args: string[], readFileSync: (file: string, basename: string) => string | null): void {
  const configState = parse(args, cliConfig, {
    cwd: process.cwd(),
    readFileSync,
  });

  if (configState.diagnostics.length > 0) {
    for (const diag of configState.diagnostics) {
      console.log(chalk`{red [CLI Error]}: ${diag}`);
    }
    process.exit(1);
  }

  if (resolveOptionByName(configState, "version")) {
    console.log(chalk`{yellow [Version]}: ${pkg.version}`);
    process.exit(0);
  }

  if (!resolveOptionByName(configState, "nologo")) {
    const printAsciiArt = require("./util/asciiArt").printAsciiArt;
    printAsciiArt(pkg.version);
  }

  if (resolveOptionByName(configState, "types")) {
    const types = require("./types").types;
    types();
    process.exit(0);
  }

  if (resolveOptionByName(configState, "portable")) {
    const portable = require("./portable").portable;
    portable();
    process.exit(0);
  }

  // need to collect the entry points
  const includeOptionValue = resolveOptionByName(configState, "include") as ConfigurationFile[];
  const testFiles = new Set<string>(includeOptionValue.map(getFileName));

  const addOptionValue = resolveOptionByName(configState, "add") as ConfigurationFile[];
  const addFiles = new Set<string>(addOptionValue.map(getFileName));

  
}

if (typeof require != "undefined" && require.main == module) {
  const fs = require("fs");
  const path = require("path");

  asp(process.argv.slice(2), (file: string, basename: string): string | null => {
    const thePath = path.normalize(path.join(basename, file));
    try {
      return fs.readFileSync(thePath, "utf8");
    } catch (ex) {
      return null;
    }
  });
}