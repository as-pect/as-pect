import { main } from "assemblyscript/cli/asc";
import { instantiateSync as instantiateBuffer } from "assemblyscript/lib/loader";
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
  let ctx: TestContext;
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
          const wasi = new WASI({
            args: process.argv,
            env: process.env,
          });
          ctx = new TestContext({
            reporter,
            fileName: "assembly/jest-log.ts",
            binary: contents,
            wasi,
          });
          const result = instantiateBuffer<IAspectExports>(
            contents,
            ctx.createImports(linked),
          );
          ctx.run(result);
        }
      },
    },
    (err: Error | null) => {
      if (err) callback(err);
      else callback(null, ctx);
      return 0;
    },
  );
}
