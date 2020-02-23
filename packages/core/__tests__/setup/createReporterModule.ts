import { main } from "assemblyscript/cli/asc";
import { instantiateSync as instantiateBuffer } from "assemblyscript/lib/loader";
import { TestContext } from "../../src/test/TestContext";
import { IAspectExports } from "../../src/util/IAspectExports";
import { TestReporter } from "../../src";

type TestContextCallback = (err: Error | null, result?: TestContext) => void;

export function createReporterModule(
  linked: any,
  callback: TestContextCallback,
  reporter: TestReporter,
): void {
  let ctx: TestContext;
  main(
    [
      "--validate",
      "--debug",
      "--binaryFile",
      "output.wasm",
      "--explicitStart",
      "./assembly/jest-reporter.ts",
      "../assembly/assembly/index.ts",
      "--use",
      "ASC_RTRACE=1",
      "--transform",
      require.resolve("../../lib/transform"),
    ],
    {
      writeFile(fileName: string, contents: Uint8Array) {
        if (fileName === "output.wasm") {
          ctx = new TestContext({
            reporter,
            fileName: "assembly/jest-reporter.ts",
            performanceConfiguration: { enabled: false },
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
