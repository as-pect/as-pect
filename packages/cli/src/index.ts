import { parse, ConfigurationFile, ConfigurationRequire } from "configinator";
import { cliConfig, resolveOptionByName } from "./util/configuration";
import glob from "glob";
import chalk from "chalk";
import { RuntimeContext } from "./util/RuntimeContext";
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
  const testFileGlobs = resolveOptionByName(configState, "include") as string[];
  const testFiles = new Set<string>();
  for (const testFileGlob of testFileGlobs) {
    for (const testFile of glob.sync(testFileGlob)) {
      testFiles.add(testFile);
    }
  }

  // included in compilation
  const addFileGlobs = resolveOptionByName(configState, "add") as string[];
  const addFiles = new Set<string>();
  for (const addFileGlob of addFileGlobs) {
    for (const addFile of glob.sync(addFileGlob)) {
      addFiles.add(addFile);
    }
  }

  // compilation target
  const target = resolveOptionByName(configState, "target") as string;

  // coverage
  const coverage = resolveOptionByName(configState, "coverage") as string[];
  const coverageJson = resolveOptionByName(configState, "coverage-json") as boolean;
  const coverageYaml = resolveOptionByName(configState, "coverage-yaml") as boolean;
  const coverageIgnore = resolveOptionByName(configState, "coverage-ignore") as string[];

  // reporters
  const verbose = resolveOptionByName(configState, "verbose") as boolean;
  const summary = resolveOptionByName(configState, "summary") as boolean;
  const reporter = resolveOptionByName(configState, "reporter") as ConfigurationRequire;
  const json = resolveOptionByName(configState, "json") as boolean;
  const csv = resolveOptionByName(configState, "csv") as boolean;

  const runtimeContext = new RuntimeContext({
    testFiles,
    testFileGlobs,
    addFiles,
    addFileGlobs,
    target,
    coverage,
    coverageIgnore,
    coverageJson,
    coverageYaml,
    verbose,
    summary,
    reporter,
    json,
    csv,
  });

  runtimeContext.run().then(() => {
    process.exit(runtimeContext.exitCode);
  });
}

if (typeof require != "undefined" && require.main == module) {
  const fs = require("fs");
  const path = require("path");

  asp(process.argv.slice(2), (file: string, basename: string): string | null => {
    const filePath = path.normalize(path.join(basename, file));
    try {
      return fs.readFileSync(filePath, "utf8");
    } catch (ex) {
      return null;
    }
  });
}