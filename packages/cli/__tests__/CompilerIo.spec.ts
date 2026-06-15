import { jest } from "@jest/globals";
import { createCompilerIoAdapter } from "../src/CompilerIo.js";

const stderr = { write: jest.fn() } as any;
const stdout = { write: jest.fn() } as any;

const createFileSystem = () => ({
  readFileSync: jest.fn((_path: string, _encoding: BufferEncoding) => "file contents"),
  readdirSync: jest.fn((_path: string) => ["z.ts", "types.d.ts", "a.ts", "notes.md"]),
});

describe("Compiler IO adapter", () => {
  it("caches readFile contents by resolved file path", () => {
    const fileSystem = createFileSystem();
    const { io } = createCompilerIoAdapter({ fileSystem, stderr, stdout });

    expect(io.readFile("entry.ts", "/workspace")).toBe("file contents");
    expect(io.readFile("entry.ts", "/workspace")).toBe("file contents");

    expect(fileSystem.readFileSync).toHaveBeenCalledTimes(1);
    expect(fileSystem.readFileSync).toHaveBeenCalledWith("/workspace/entry.ts", "utf8");
  });

  it("caches listFiles results by resolved directory path", () => {
    const fileSystem = createFileSystem();
    const { io } = createCompilerIoAdapter({ fileSystem, stderr, stdout });

    expect(io.listFiles("assembly", "/workspace")).toEqual(["a.ts", "z.ts"]);
    expect(io.listFiles("assembly", "/workspace")).toEqual(["a.ts", "z.ts"]);

    expect(fileSystem.readdirSync).toHaveBeenCalledTimes(1);
    expect(fileSystem.readdirSync).toHaveBeenCalledWith("/workspace/assembly");
  });

  it("uses absolute compiler paths without joining them to the compiler base directory", () => {
    const fileSystem = createFileSystem();
    const { io } = createCompilerIoAdapter({ fileSystem, stderr, stdout });

    expect(io.readFile("/workspace/project/entry.ts", "/ambient")).toBe("file contents");
    expect(io.listFiles("/workspace/project/assembly", "/ambient")).toEqual(["a.ts", "z.ts"]);

    expect(fileSystem.readFileSync).toHaveBeenCalledWith("/workspace/project/entry.ts", "utf8");
    expect(fileSystem.readdirSync).toHaveBeenCalledWith("/workspace/project/assembly");
  });

  it("returns null for missing files and directories", () => {
    const fileSystem = {
      readFileSync: jest.fn(() => {
        throw new Error("missing file");
      }),
      readdirSync: jest.fn(() => {
        throw new Error("missing directory");
      }),
    };
    const { io } = createCompilerIoAdapter({ fileSystem, stderr, stdout });

    expect(io.readFile("missing.ts", "/workspace")).toBeNull();
    expect(io.listFiles("missing", "/workspace")).toBeNull();
  });

  it("captures compiler writes without touching the filesystem", () => {
    const fileSystem = createFileSystem();
    const { io, outputFiles } = createCompilerIoAdapter({ fileSystem, stderr, stdout });
    const binary = new Uint8Array([1, 2, 3]);

    io.writeFile("build/output.wasm", binary, "/workspace");
    io.writeFile("build/output.wat", "(module)", "/workspace");

    expect(outputFiles.get("build/output.wasm")).toBe(binary);
    expect(outputFiles.get("build/output.wat")).toBe("(module)");
  });
});
