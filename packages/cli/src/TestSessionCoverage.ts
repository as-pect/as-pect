import type { AspectImports } from "./IAspectConfig.js";

export type TestSessionCoverageTarget = "coverage" | "noCoverage";

export interface TestSessionCoverage {
  readonly target: TestSessionCoverageTarget;
  installImports(imports: AspectImports): AspectImports;
  registerLoader(module: unknown): void;
  stringifyReport(): string | null;
}

interface CoverageRuntime {
  installImports(imports: AspectImports): unknown;
  registerLoader(module: unknown): void;
  stringify(): string;
}

export type CoverageRuntimeConstructor = new (options: { files: string[] }) => CoverageRuntime;
export type LoadCoverageRuntime = () => Promise<CoverageRuntimeConstructor>;

export interface CreateTestSessionCoverageOptions {
  coverageFiles?: string[];
  loadCoverageRuntime?: LoadCoverageRuntime;
  log?: (message: string) => void;
}

async function loadDefaultCoverageRuntime(): Promise<CoverageRuntimeConstructor> {
  const coverageModule = await import("@as-covers/glue");
  return coverageModule.Covers as CoverageRuntimeConstructor;
}

export const noTestSessionCoverage: TestSessionCoverage = {
  target: "noCoverage",
  installImports(imports: AspectImports): AspectImports {
    return imports;
  },
  registerLoader(_module: unknown): void {},
  stringifyReport(): string | null {
    return null;
  },
};

export async function createTestSessionCoverage({
  coverageFiles = [],
  loadCoverageRuntime = loadDefaultCoverageRuntime,
  log,
}: CreateTestSessionCoverageOptions): Promise<TestSessionCoverage> {
  if (coverageFiles.length === 0) return noTestSessionCoverage;

  log?.(`Using coverage: ${coverageFiles.join(", ")}`);
  const CoverageRuntime = await loadCoverageRuntime();
  const coverageRuntime = new CoverageRuntime({ files: coverageFiles });

  return {
    target: "coverage",
    installImports(imports: AspectImports): AspectImports {
      return coverageRuntime.installImports(imports) as AspectImports;
    },
    registerLoader(module: unknown): void {
      coverageRuntime.registerLoader(module);
    },
    stringifyReport(): string | null {
      return coverageRuntime.stringify();
    },
  };
}
