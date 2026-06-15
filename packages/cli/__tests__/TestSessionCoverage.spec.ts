import { jest } from "@jest/globals";
import { createTestSessionCoverage } from "../src/TestSessionCoverage.js";

class FakeCoverageRuntime {
  static instances: FakeCoverageRuntime[] = [];
  public installImports = jest.fn((imports: unknown) => ({ covered: imports }));
  public registerLoader = jest.fn();
  public stringify = jest.fn(() => "coverage report");

  public constructor(public readonly options: { files: string[] }) {
    FakeCoverageRuntime.instances.push(this);
  }
}

describe("Test session coverage setup", () => {
  beforeEach(() => {
    FakeCoverageRuntime.instances = [];
  });

  it("keeps coverage disabled without loading the coverage runtime", async () => {
    const loadCoverageRuntime = jest.fn<() => Promise<typeof FakeCoverageRuntime>>();

    const coverage = await createTestSessionCoverage({ coverageFiles: [], loadCoverageRuntime });
    const imports = { env: {} };

    expect(coverage.target).toBe("noCoverage");
    expect(coverage.installImports(imports)).toBe(imports);
    expect(coverage.stringifyReport()).toBeNull();
    expect(loadCoverageRuntime).not.toHaveBeenCalled();
  });

  it("loads coverage lazily, logs once, and wraps the coverage runtime", async () => {
    const log = jest.fn();
    const loadCoverageRuntime = jest.fn(async () => FakeCoverageRuntime);

    const coverage = await createTestSessionCoverage({
      coverageFiles: ["assembly/**/*.ts", "packages/**/*.ts"],
      loadCoverageRuntime,
      log,
    });
    const runtime = FakeCoverageRuntime.instances[0];

    expect(coverage.target).toBe("coverage");
    expect(log).toHaveBeenCalledWith("Using coverage: assembly/**/*.ts, packages/**/*.ts");
    expect(loadCoverageRuntime).toHaveBeenCalledTimes(1);
    expect(runtime.options).toEqual({ files: ["assembly/**/*.ts", "packages/**/*.ts"] });

    const imports = { env: {} };
    const module = { exports: {} };

    expect(coverage.installImports(imports)).toEqual({ covered: imports });
    coverage.registerLoader(module);

    expect(runtime.installImports).toHaveBeenCalledWith(imports);
    expect(runtime.registerLoader).toHaveBeenCalledWith(module);
    expect(coverage.stringifyReport()).toBe("coverage report");
  });
});
