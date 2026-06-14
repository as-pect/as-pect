import { TestContext } from "../src/index.js";
import { VerboseReporterWrapper } from "./setup/VerboseReporterWrapper.js";
import { promises as fs } from "fs";
import { instantiate } from "@assemblyscript/loader";
import { WASI } from "wasi";
import { jest } from "@jest/globals";

test("snapshots", async () => {
  const reporter = new VerboseReporterWrapper();
  const binary = await fs.readFile("./assembly/jest-wasi.wasm");
  const wasi = new WASI({
    version: "preview1",
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
  const outputs = Array.from(reporter.snapshots.entries()).flatMap(([name, values]) =>
    values.map((value) => ({ name, value })),
  );

  expect(outputs).toEqual(
    expect.arrayContaining([
      expect.objectContaining({
        name: "onTestFinish  output",
        value: expect.stringContaining("[Log]: 100 as u16"),
      }),
      expect.objectContaining({
        name: "onFinish ./assembly/jest-wasi.ts",
        value: expect.stringContaining("[Result]: ✔ PASS"),
      }),
    ]),
  );
  expect(outputs.find((output) => output.name === "onFinish ./assembly/jest-wasi.ts")?.value).toContain(
    "[Snapshot]: 0 total, 0 added, 0 removed, 0 different",
  );
});
