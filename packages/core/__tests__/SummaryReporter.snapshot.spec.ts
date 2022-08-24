import { SummaryReporterWrapper } from "./setup/SummaryReporterWrapper.js";
import { TestContext } from "../src/index.js";
import { promises as fs } from "fs";
import { instantiate } from "@assemblyscript/loader";
import { Snapshot } from "@as-pect/snapshots";

test("snapshots", async () => {
  const binary = await fs.readFile("./assembly/jest-reporter-snapshot.wasm");
  const reporter = new SummaryReporterWrapper();
  const ctx = new TestContext({
    binary,
    reporter,
    fileName: "./assembly/jest-reporter-snapshot.ts",
    snapshots: Snapshot.from(
      new Map<string, string>([
        // modified
        [
          "a few snapshots!~first vec3[0]",
          "Vec3 {\n  x: 1.0,\n  y: 2.0,\n  z: 4.0,\n  a: 10.0\n}",
        ],
        // same
        ["a few snapshots!~a string[0]", '"some string"'],
        // added: ['a few snapshots!~some integer[0]', '504'],
        ["a few snapshots!~some float value[0]", "3.14"],
        // removed from module
        ["this!~is!~removed", "false"],
      ]),
    ),
  });
  ctx.run(await instantiate(binary, ctx.createImports()));
  for (const [name, values] of reporter.snapshots.entries()) {
    for (const value of values) {
      expect(value).toMatchSnapshot(name);
    }
  }
});
