import { instantiate } from "@assemblyscript/loader";
import { promises as fs } from "fs";
import stripAnsi from "strip-ansi";
import { Snapshot } from "@as-pect/snapshots";
import { SummaryReporter, TestContext, VerboseReporter } from "../src/index.js";
import { createWriter } from "./setup/ReporterTestUtils.js";

async function runReporterSmoke(
  reporterName: "SummaryReporter" | "VerboseReporter",
  wasmPath: string,
  snapshots?: Snapshot,
): Promise<string> {
  const binary = await fs.readFile(wasmPath);
  const reporter = reporterName === "SummaryReporter" ? new SummaryReporter() : new VerboseReporter();
  const writer = createWriter();
  reporter.stdout = writer;
  reporter.stderr = writer;

  const ctx = new TestContext({
    binary,
    reporter,
    fileName: wasmPath.replace(/^\.\//, "./"),
    snapshots,
  });

  ctx.run(await instantiate(binary, ctx.createImports()));

  return stripAnsi(writer.result);
}

describe.each(["SummaryReporter", "VerboseReporter"] as const)("%s wasm smoke coverage", (reporterName) => {
  test("reports a passing wasm suite", async () => {
    const output = await runReporterSmoke(reporterName, "./assembly/jest-reporter-pass.wasm");

    expect(output).toContain("./assembly/jest-reporter-pass.wasm");
    expect(output).toMatch(/PASS|Pass:/);
  });

  test("reports a failing wasm suite", async () => {
    const output = await runReporterSmoke(reporterName, "./assembly/jest-reporter-fail.wasm");

    expect(output).toContain("./assembly/jest-reporter-fail.wasm");
    expect(output).toMatch(/FAIL|Failed:|❌/);
    expect(output).toContain("something fails");
  });

  test("reports wasm snapshot changes", async () => {
    const output = await runReporterSmoke(
      reporterName,
      "./assembly/jest-reporter-snapshot.wasm",
      Snapshot.from(
        new Map<string, string>([
          ["a few snapshots!~first vec3[0]", "Vec3 {\n  x: 1.0,\n  y: 2.0,\n  z: 4.0,\n  a: 10.0\n}"],
          ["a few snapshots!~a string[0]", '"some string"'],
          ["a few snapshots!~some float value[0]", "3.14"],
          ["this!~is!~removed", "false"],
        ]),
      ),
    );

    expect(output).toContain("[Snapshot]: a few snapshots!~first vec3[0]");
    expect(output).toContain("- ");
    expect(output).toContain("+ ");
  });
});
