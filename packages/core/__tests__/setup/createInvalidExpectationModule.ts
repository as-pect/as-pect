import { main } from "assemblyscript/cli/asc";
import { instantiateSync as instantiateBuffer } from "assemblyscript/lib/loader";
import { TestContext } from "../../src/test/TestContext";
import EmptyReporter from "../../src/reporter/EmptyReporter";
import { IAspectExports } from "../../src/util/IAspectExports";

type TestContextCallback = (err: Error | null, result?: TestContext) => void;

export function createModule(linked: any, callback: TestContextCallback): void {
  let ctx: TestContext;
  main(
    [
      "--validate",
      "--debug",
      "--binaryFile",
      "output.wasm",
      "--explicitStart",
      "./assembly/jest-invalid-expectation.ts",
      "../assembly/assembly/index.ts",
      "--transform",
      require.resolve("../../lib/transform"),
    ],
    {
      writeFile(fileName: string, contents: Uint8Array) {
        if (fileName === "output.wasm") {
          ctx = new TestContext({
            reporter: new EmptyReporter(),
            fileName: "assembly/jest-invalid-expectation.ts",
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
