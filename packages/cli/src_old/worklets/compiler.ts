import { ICommand } from "./ICommand";
import { readdirSync, readFileSync } from "fs";
import { join, basename, dirname, extname } from "path";
import { parentPort, workerData } from "worker_threads";
import { writeFile } from "../util/writeFile";
import asc from "assemblyscript/dist/asc";

/**
 * @ignore
 *
 * This variable holds the fileMap for the compiler.
 */
const fileMap = new Map<string, string>();

/**
 * @ignore
 *
 * This variable holds the folderMap for the compiler.
 */
const folderMap = new Map<string, string[]>();

/**
 * @ignore
 *
 * Run a worklet command.
 * @param {ICommand} command - The command to run. (This is the compiler worklet command.)
 */
function run(command: ICommand) {
  let binary: Uint8Array;
  let filePromises: Promise<void>[] = [];

  asc.main(
    command.props.args,
    {
      stdout: process.stdout as any, // use any type to quelch error
      stderr: process.stderr as any,
      listFiles(dirname: string, baseDir: string): string[] {
        const folder = join(baseDir, dirname);
        if (folderMap.has(folder)) {
          return folderMap.get(folder)!;
        }

        try {
          const results = readdirSync(folder).filter((file: string) =>
            /^(?!.*\.d\.ts$).*\.ts$/.test(file),
          );
          folderMap.set(folder, results);
          return results;
        } catch (e) {
          return [];
        }
      },
      readFile(filename: string, baseDir: string) {
        const fileName = join(baseDir, filename);
        if (fileMap.has(fileName)) {
          return fileMap.get(fileName)!;
        }

        try {
          const contents = readFileSync(fileName, { encoding: "utf8" });
          fileMap.set(fileName, contents);
          return contents;
        } catch (e) {
          return null;
        }
      },
      writeFile(name: string, contents: Uint8Array) {
        const ext = extname(name);

        // get the wasm file
        if (ext === ".wasm") {
          binary = contents;
          if (!command.props.outputBinary) return;
        }
        const file = command.props.file;
        const outfileName = join(
          dirname(file),
          basename(file, extname(file)) + ext,
        );
        filePromises.push(writeFile(outfileName, contents));
      },
    },
    (error: any) =>
      Promise.all(filePromises)
        .then(() => {
          parentPort!.postMessage(
            {
              type: "Result",
              props: {
                error: error
                  ? {
                      message: error.message,
                      stack: error.stack,
                      name: error.name,
                    }
                  : null,
                binary,
                file: command.props.file,
              },
            } as ICommand,
            binary ? [binary.buffer] : [],
          );
        })
        .catch((error: any) => {
          parentPort!.postMessage({
            type: "Error",
            props: {
              error: error
                ? {
                    message: error.message,
                    stack: error.stack,
                    name: error.name,
                  }
                : null,
            },
          } as ICommand);
        }),
  );
}

parentPort!.on("message", run);
