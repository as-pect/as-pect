import { main } from "assemblyscript/cli/asc";
import { instantiate } from "assemblyscript/lib/loader";
import { TestContext } from "../../src/test/TestContext";
import { IAspectExports } from "../../src/util/IAspectExports";
import { WASI } from "wasi";
import { IReporter } from "../../src";

type TestContextCallback = (err: Error | null, result?: TestContext) => void;

export function createWasiModule(
  linked: any,
  reporter: IReporter,
  callback: TestContextCallback,
): void {
  let binary: Uint8Array;
  main(
    [
      "--debug",
      "--binaryFile",
      "output.wasm",
      "./assembly/jest-wasi.ts",
      "../assembly/assembly/index.ts",
      "--exportTable",
      "--explicitStart",
      "--use",
      "ASC_RTRACE=1",
      "--transform",
      require.resolve("../../lib/transform"),
    ],
    {
      writeFile(fileName: string, contents: Uint8Array) {
        if (fileName === "output.wasm") {
          binary = contents;
        }
      },
    },
    (err: Error | null) => {
      if (err) callback(err);
      else {
        const wasi = new WASI({
          args: process.argv,
          env: process.env,
          preopens: {},
        });

        /**
         * The wasi.start function runs in a seperate vm, so it's required
         * to mock the start function manually, or the test will fail an
         * instanceof check. Specifically, WebAssembly.Instance will be
         * a different class in the VM.
         */
        wasi.start = jest.fn((instance: WebAssembly.Instance) => {
          const symbols = Object.getOwnPropertySymbols(wasi);
          const kStartedSymbol = symbols.filter((symbol) =>
            symbol.toString().includes("kStarted"),
          )[0];
          const setMemorySymbol = symbols.filter((symbol) =>
            symbol.toString().includes("setMemory"),
          )[0];

          // @ts-ignore: symbol access mock
          wasi[setMemorySymbol](instance.exports.memory);
          // @ts-ignore: symbol access mock
          wasi[kStartedSymbol] = true;
          // @ts-ignore: _start is an exported function
          instance.exports._start();
        });
        const ctx = new TestContext({
          reporter,
          fileName: "assembly/jest-log.ts",
          binary,
          wasi,
        });
        instantiate<IAspectExports>(binary, ctx.createImports(linked)).then(
          (result) => {
            ctx.run(result);
            callback(null, ctx);
          },
        );
      }
      return 0;
    },
  );
}
