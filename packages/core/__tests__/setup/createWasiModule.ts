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
        const ctx = new TestContext({
          reporter,
          fileName: "assembly/jest-log.ts",
          binary,
          wasi,
        });
        instantiate<IAspectExports>(
          binary,
          ctx.createImports(linked),
        ).then(result => {
          ctx.run(result);
          callback(null, ctx);
        });
      }
      return 0;
    },
  );
}
