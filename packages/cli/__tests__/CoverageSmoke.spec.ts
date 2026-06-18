import path from "path";
import { fileURLToPath } from "url";
import { mkdir, mkdtemp, rm, writeFile } from "fs/promises";
import type { IAspectConfig } from "../src/IAspectConfig.js";
import { createTestSessionConfig, TestSession } from "../src/TestSession.js";

const packageRoot = fileURLToPath(new URL("..", import.meta.url));
const workspaceRoot = path.resolve(packageRoot, "../..");
const smokeRoot = path.join(workspaceRoot, ".tmp-node-test");

function toPosixPath(filePath: string): string {
  return filePath.split(path.sep).join(path.posix.sep);
}

function relativeAsconfigPath(from: string, to: string): string {
  const relative = toPosixPath(path.relative(from, to));
  return relative.startsWith(".") ? relative : `./${relative}`;
}

function createWritable(chunks: string[]): NodeJS.WritableStream {
  return {
    write(chunk: string | Uint8Array): boolean {
      chunks.push(String(chunk));
      return true;
    },
  } as unknown as NodeJS.WritableStream;
}

describe("coverage smoke", () => {
  it("compiles with the coverage target and reports coverage when coverage is requested", async () => {
    await mkdir(smokeRoot, { recursive: true });
    const projectDir = await mkdtemp(path.join(smokeRoot, "coverage-"));

    try {
      await mkdir(path.join(projectDir, "assembly", "__tests__"), { recursive: true });
      const nodeModules = relativeAsconfigPath(projectDir, path.join(workspaceRoot, "node_modules"));

      await writeFile(
        path.join(projectDir, "asconfig.json"),
        JSON.stringify(
          {
            options: { runtime: "stub" },
          },
          null,
          2,
        ),
      );
      await writeFile(
        path.join(projectDir, "as-pect.asconfig.json"),
        JSON.stringify(
          {
            targets: {
              coverage: {
                lib: [`${nodeModules}/@as-covers/assembly/index.ts`],
                transform: [`${nodeModules}/@as-pect/cli/init/as-covers-transform.js`, "@as-pect/transform"],
              },
              noCoverage: {
                transform: ["@as-pect/transform"],
              },
            },
            options: {
              exportMemory: true,
              outFile: "output.wasm",
              textFile: "output.wat",
              bindings: "raw",
              exportStart: "_start",
              exportRuntime: true,
              use: ["RTRACE=1"],
              debug: true,
              exportTable: true,
            },
            extends: "./asconfig.json",
            entries: [`${nodeModules}/@as-pect/assembly/assembly/index.ts`],
          },
          null,
          2,
        ),
      );
      await writeFile(
        path.join(projectDir, "assembly", "__tests__", "coverage.spec.ts"),
        `function coveredBranch(value: bool): i32 {\n` +
          `  if (value) return 1;\n` +
          `  return 2;\n` +
          `}\n\n` +
          `describe("coverage smoke", () => {\n` +
          `  it("runs the covered branch", () => {\n` +
          `    expect<i32>(coveredBranch(true)).toBe(1);\n` +
          `  });\n` +
          `});\n`,
      );

      const aspectConfig: IAspectConfig = {
        coverage: ["assembly/**/*.ts"],
        entries: ["assembly/__tests__/**/*.spec.ts"],
        async instantiate(_memory, createImports, instantiate, binary) {
          return instantiate(binary, createImports({}));
        },
      };
      const stdoutChunks: string[] = [];
      const stderrChunks: string[] = [];
      const session = new TestSession(
        createTestSessionConfig({
          args: [],
          aspectConfig,
          asconfigLocation: "./as-pect.asconfig.json",
          cwd: projectDir,
          options: {},
          stderr: createWritable(stderrChunks),
          stdout: createWritable(stdoutChunks),
        }),
      );

      const originalCwd = process.cwd();
      let result;
      try {
        process.chdir(projectDir);
        result = await session.run();
      } finally {
        process.chdir(originalCwd);
      }
      if (result.compilerError) throw result.compilerError;

      expect(result.compilerError).toBeNull();
      expect(result.pass).toBe(true);
      expect(result.stats.tests).toBe(1);
      expect(stdoutChunks.join("")).toContain("Using coverage: assembly/**/*.ts");
      expect(result.coverageReport).toEqual(expect.stringContaining("coverage.spec.ts"));
      expect(result.coverageReport).toEqual(expect.stringContaining("Total"));
      expect(result.coverageReport).not.toContain("│ total │ N/A");
      expect(stderrChunks.join("")).toBe("");
    } finally {
      await rm(projectDir, { force: true, recursive: true });
    }
  }, 30000);
});
