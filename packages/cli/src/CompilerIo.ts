import path from "path";
import { sortDiscoveredPaths } from "./TestSessionEntries.js";

export interface AssemblyScriptCompilerIo {
  listFiles(dirname: string, baseDir: string): string[] | null;
  readFile(filename: string, baseDir: string): string | null;
  stderr: NodeJS.WritableStream;
  stdout: NodeJS.WritableStream;
  writeFile(filename: string, contents: string | Uint8Array, baseDir: string): void;
}

export interface CompilerIoFileSystem {
  readFileSync(path: string, encoding: BufferEncoding): string;
  readdirSync(path: string): string[];
}

export interface CompilerIoCache {
  fileContents: Map<string, string>;
  directoryListings: Map<string, string[]>;
}

export interface CreateCompilerIoAdapterOptions {
  cache?: CompilerIoCache;
  fileSystem: CompilerIoFileSystem;
  outputFiles?: Map<string, string | Uint8Array>;
  stderr: NodeJS.WritableStream;
  stdout: NodeJS.WritableStream;
}

export interface CompilerIoAdapter {
  io: AssemblyScriptCompilerIo;
  outputFiles: Map<string, string | Uint8Array>;
}

export function createCompilerIoCache(): CompilerIoCache {
  return {
    fileContents: new Map<string, string>(),
    directoryListings: new Map<string, string[]>(),
  };
}

function isAssemblyScriptSourceFile(file: string): boolean {
  return /^(?!.*\.d\.ts$).*\.ts$/.test(file);
}

export function createCompilerIoAdapter({
  cache = createCompilerIoCache(),
  fileSystem,
  outputFiles = new Map<string, string | Uint8Array>(),
  stderr,
  stdout,
}: CreateCompilerIoAdapterOptions): CompilerIoAdapter {
  return {
    outputFiles,
    io: {
      readFile(filename, baseDir) {
        const filePath = path.join(baseDir, filename);
        if (cache.fileContents.has(filePath)) return cache.fileContents.get(filePath)!;

        try {
          const contents = fileSystem.readFileSync(filePath, "utf8");
          cache.fileContents.set(filePath, contents);
          return contents;
        } catch (_ex) {
          return null;
        }
      },
      writeFile(filename, contents, _baseDir) {
        outputFiles.set(filename, contents);
      },
      listFiles(dirname, baseDir) {
        const directoryPath = path.join(baseDir, dirname);
        if (cache.directoryListings.has(directoryPath)) return cache.directoryListings.get(directoryPath)!;

        try {
          const files = sortDiscoveredPaths(fileSystem.readdirSync(directoryPath).filter(isAssemblyScriptSourceFile));
          cache.directoryListings.set(directoryPath, files);
          return files;
        } catch (_ex) {
          return null;
        }
      },
      stderr,
      stdout,
    },
  };
}
