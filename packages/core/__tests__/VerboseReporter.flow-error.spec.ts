import { VerboseReporterWrapper } from "./setup/VerboseReporterWrapper";
import { TestContext } from "../src";
import { promises as fs } from "fs";
import { instantiate } from "@assemblyscript/loader";

test("snapshots", async () => {
  const binary = await fs.readFile("./assembly/jest-reporter-flow-error.wasm");
  const reporter = new VerboseReporterWrapper();
  const ctx = new TestContext({
    binary,
    reporter,
    fileName: "./assembly/jest-reporter-flow-error.ts",
  });
  ctx.run(await instantiate(binary, ctx.createImports()));
  for (const [name, values] of reporter.snapshots.entries()) {
    for (const value of values) {
      expect(value).toMatchSnapshot(name);
    }
  }
});
