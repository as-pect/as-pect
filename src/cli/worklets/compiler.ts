import { parentPort, workerData } from "worker_threads";
import chalk from "chalk";
import path from "path";
import { ICommand } from "./ICommand";
import fs from "fs";
import { writeFile } from "../util/writeFile";

let asc: any;

try {
  /** Collect the assemblyscript module path. */
  const assemblyScriptFolder = workerData.compiler.startsWith(".")
    ? path.join(process.cwd(), workerData.compiler)
    : workerData.compiler;

  /** Next, obtain the compiler, and assert it has a main function. */
  asc = require(path.join(assemblyScriptFolder, "dist", "asc"));
  if (!asc) {
    throw new Error(`${workerData.compiler}/dist/asc has no exports.`);
  }
  if (!asc.main) {
    throw new Error(`${workerData.compiler}/dist/asc does not export a main() function.`);
  }
} catch (ex) {
  console.error(chalk`{bgRedBright.black [Error]} There was a problem loading {bold [${workerData.compiler}]}.`);
  console.error(ex);
  parentPort!.postMessage({
    type: "Error",
    props: {
      error: {
        message: (ex as Error).message,
        name: (ex as Error).name,
        stack: (ex as Error).stack,
      },
      binary: null,
      file: null,
    },
  });
}

let fileMap: Map<string, string> = new Map();
let folderMap: Map<string, string[]> = new Map();

function run(command: ICommand) {
  let binary: Uint8Array;
  let filePromises: Promise<void>[] = [];

  asc.main(command.props.args, {
    stdout: process.stdout as any, // use any type to quelch error
    stderr: process.stderr as any,
    listFiles(dirname: string, baseDir: string): string[] {
      const folder = path.join(baseDir, dirname);
      if (folderMap.has(folder)) {
        return folderMap.get(folder)!;
      }

      try {
        const results = fs.readdirSync(folder).filter(file => /^(?!.*\.d\.ts$).*\.ts$/.test(file));
        folderMap.set(folder, results);
        return results;
      } catch (e) {
        return [];
      }
    },
    readFile(filename: string, baseDir: string) {
      const fileName = path.join(baseDir, filename);
      if (fileMap.has(fileName)){
        return fileMap.get(fileName)!;
      }

      try {
        const contents = fs.readFileSync(fileName, { encoding: "utf8" });
        fileMap.set(fileName, contents);
        return contents;
      } catch (e) {
        return null;
      }
    },
    writeFile(name: string, contents: Uint8Array) {
      const ext = path.extname(name)

      // get the wasm file
      if (ext === ".wasm") {
        binary = contents;
        if (!command.props.outputBinary) return;
      }
      const file = command.props.file;
      const outfileName = path.join(path.dirname(file), path.basename(file, path.extname(file)) + ext);
      filePromises.push(writeFile(outfileName, contents));
    }
  }, (error: any) => Promise.all(filePromises)
    .then(() => {
      parentPort!.postMessage({
        type: "Result",
        props: {
          error: error ? {
            message: error.message,
            stack: error.stack,
            name: error.name,
          } : null,
          binary,
          file: command.props.file,
        },
      } as ICommand, binary ? [binary.buffer] : [])
    })
    .catch((error: any) => {
      parentPort!.postMessage({
        type: "Error",
        props: {
          error: error ? {
            message: error.message,
            stack: error.stack,
            name: error.name,
          } : null,
        },
      } as ICommand);
    }),
  );
}

parentPort!.on("message", run);
