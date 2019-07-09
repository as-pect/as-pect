import { main } from "assemblyscript/cli/asc";
import { instantiateBuffer } from "assemblyscript/lib/loader";
import { TestContext } from "../../src/test/TestContext";
import EmptyReporter from "../../src/reporter/EmptyReporter";
import { IAspectExports } from "../../src/util/IAspectExports";

type TestContextCallback = (err: Error | null, result?: TestContext) => void;

export function createPerformanceConfigurationModule(
  linked: any,
  callback: TestContextCallback,
): void {
  let ctx: TestContext;
  main(
    [
      "--validate",
      "--debug",
      "--binaryFile",
      "output.wasm",
      "--explicitStart",
      "./assembly/jest-performance-configuration.ts",
      "./assembly/index.ts",
    ],
    {
      writeFile(fileName: string, contents: Uint8Array) {
        if (fileName === "output.wasm") {
          ctx = new TestContext({
            reporter: new EmptyReporter(),
            fileName: "assembly/jest-performance-configuration.ts",
            performanceConfiguration: { enabled: false },
            nortrace: true,
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
