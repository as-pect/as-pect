import { mkdir, mkdtemp, readFile, rm } from "fs/promises";
import { join, relative } from "path";
import { collectReporter } from "../src/collectReporter.js";
import { createTestSessionProject } from "../src/TestSessionProject.js";
import type { IAspectConfig } from "../src/IAspectConfig.js";
import type { SuiteReport, SuiteResultReport } from "@as-pect/core";

const aspectConfig: IAspectConfig = {
  instantiate() {
    throw new Error("not used by reporter collection tests");
  },
};

function testResult(): Extract<SuiteResultReport, { type: "test" }> {
  return {
    type: "test",
    groupName: "math",
    name: "adds values",
    ran: true,
    negated: false,
    pass: true,
    runtime: 3,
    message: null,
    stackTrace: null,
    rtraceDelta: 0,
    logs: [],
    actual: "3",
    expected: "3",
    actualValue: null,
    expectedValue: null,
  };
}

function report(fileName: string): SuiteReport {
  return {
    fileName,
    hasResults: true,
    rootRuntime: 12,
    results: [testResult()],
    errors: [],
    snapshotChanges: [],
  } as SuiteReport;
}

describe("reporter collection", () => {
  it("creates the CTRF JSON reporter when --ctrf is selected", async () => {
    const tempDir = await mkdtemp(join(process.cwd(), "tmp-cli-ctrf-reporter-"));
    const fileName = join(relative(process.cwd(), tempDir), "entry.spec.ts");

    try {
      const reporter = await collectReporter({ ctrf: true }, aspectConfig);
      reporter.onReportFinish?.({ report: report(fileName) });
      await reporter.onFlush?.();

      const ctrf = JSON.parse(await readFile(join(tempDir, "entry.spec.ctrf.json"), "utf8"));
      expect(ctrf).toMatchObject({
        reportFormat: "CTRF",
        results: {
          tool: { name: "as-pect" },
          tests: [{ name: "adds values", status: "passed" }],
        },
      });
    } finally {
      await rm(tempDir, { recursive: true, force: true });
    }
  });

  it("creates the JUnit XML reporter when --junit is selected", async () => {
    const tempDir = await mkdtemp(join(process.cwd(), "tmp-cli-junit-reporter-"));
    const fileName = join(relative(process.cwd(), tempDir), "entry.spec.ts");

    try {
      const reporter = await collectReporter({ junit: true }, aspectConfig);
      reporter.onReportFinish?.({ report: report(fileName) });
      await reporter.onFlush?.();

      const xml = await readFile(join(tempDir, "entry.spec.xml"), "utf8");
      expect(xml).toContain('<testsuite name="tmp-cli-junit-reporter-');
      expect(xml).toContain('<testcase classname="math" name="adds values" time="0.003"/>');
    } finally {
      await rm(tempDir, { recursive: true, force: true });
    }
  });

  it("anchors built-in file-backed reporters to the Test session project path", async () => {
    const tempDir = await mkdtemp(join(process.cwd(), "tmp-cli-junit-root-"));
    const sourceDir = join(tempDir, "assembly", "__tests__");

    try {
      await mkdir(sourceDir, { recursive: true });
      const reporter = await collectReporter(
        { junit: true, ctrf: true },
        aspectConfig,
        { stderr: process.stderr, stdout: process.stdout },
        createTestSessionProject(tempDir),
      );
      reporter.onReportFinish?.({ report: report("assembly/__tests__/entry.spec.ts") });
      await reporter.onFlush?.();

      const xml = await readFile(join(sourceDir, "entry.spec.xml"), "utf8");
      const ctrf = JSON.parse(await readFile(join(sourceDir, "entry.spec.ctrf.json"), "utf8"));
      expect(xml).toContain('<testsuite name="assembly/__tests__/entry.spec.ts"');
      expect(ctrf.results.tests[0].filePath).toBe("assembly/__tests__/entry.spec.ts");
    } finally {
      await rm(tempDir, { recursive: true, force: true });
    }
  });
});
