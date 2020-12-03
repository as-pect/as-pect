import { TestContext } from "../src";
import { VerboseReporterWrapper } from "./setup/VerboseReporterWrapper";
import { promises as fs } from "fs";
import { instantiate } from "assemblyscript/lib/loader/umd";
import { WASI } from "wasi";

test("snapshots", async () => {
  const reporter = new VerboseReporterWrapper();
  const binary = await fs.readFile("./assembly/jest-wasi.wasm");
  const wasi = new WASI({
    args: process.argv,
    env: process.env,
    preopens: {},
  });
  const ctx = new TestContext({
    reporter,
    binary,
    fileName: "./assembly/jest-wasi.ts",
    wasi,
  });
  wasi.start = jest.fn((instance: WebAssembly.Instance) => {
    const symbols = Object.getOwnPropertySymbols(wasi);
    const kStartedSymbol = symbols.filter((symbol) =>
      symbol.toString().toLowerCase().includes("started"),
    )[0];
    const setMemorySymbol = symbols.filter((symbol) =>
      symbol.toString().toLowerCase().includes("setmemory"),
    )[0];
    // @ts-ignore: symbol access mock
    wasi[setMemorySymbol](instance.exports.memory);
    // @ts-ignore: symbol access mock
    wasi[kStartedSymbol] = true;
    // @ts-ignore: _start is an exported function
    instance.exports._start();
  });
  ctx.run(await instantiate(binary, ctx.createImports()));
  expect(ctx).toBeDefined();
  expect(ctx.pass).toBeTruthy();
  for (const [name, values] of reporter.snapshots.entries()) {
    for (const value of values) {
      expect(value).toMatchSnapshot(name);
    }
  }
});
