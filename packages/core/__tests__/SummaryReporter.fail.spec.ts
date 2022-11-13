import { SummaryReporterWrapper } from "./setup/SummaryReporterWrapper.js";
import { TestContext } from "../src/index.js";
import { promises as fs } from "fs";
import { instantiate } from "@assemblyscript/loader";

test("snapshots", async () => {
  const binary = await fs.readFile("./assembly/jest-reporter-fail.wasm");
  const reporter = new SummaryReporterWrapper();
  const ctx = new TestContext({
    binary,
    reporter,
    fileName: "./assembly/jest-reporter-fail.ts",
  });
  ctx.run(await instantiate(binary, ctx.createImports()));
  for (const [name, values] of reporter.snapshots.entries()) {
    for (const value of values) {
      expect(value).toMatchSnapshot(name);
    }
  }
});
