import { main } from "assemblyscript/cli/asc";
import {
  instantiateSync as instantiateBuffer,
  ASUtil,
} from "assemblyscript/lib/loader";
import { TestContext } from "../../src/test/TestContext";
import { EmptyReporter } from "../../src/reporter/EmptyReporter";
import { IAspectExports } from "../../src/util/IAspectExports";

interface ICreateModuleCallbackResult {
  result: {
    instance: WebAssembly.Instance;
    exports: ASUtil & IAspectExports;
  };
  context: TestContext;
}

type TestContextCallback = (
  err: Error | null,
  result?: ICreateModuleCallbackResult,
) => void;

export function createTestGroupFilterModule(
  linked: any,
  callback: TestContextCallback,
): void {
  let context: TestContext;
  let result: {
    instance: WebAssembly.Instance;
    exports: ASUtil & IAspectExports;
  };

  main(
    [
      "--debug",
      "--binaryFile",
      "output.wasm",
      "--explicitStart",
      "./assembly/jest-filter.ts",
      "../assembly/assembly/index.ts",
      "--transform",
      require.resolve("../../lib/transform"),
    ],
    {
      writeFile(fileName: string, contents: Uint8Array) {
        if (fileName === "output.wasm") {
          context = new TestContext({
            reporter: new EmptyReporter(),
            fileName: "assembly/jest-filter.ts",
          });
          result = instantiateBuffer<IAspectExports>(
            contents,
            context.createImports(linked),
          );
        }
      },
    },
    (err: Error | null) => {
      if (err) callback(err);
      else callback(null, { context, result });
      return 0;
    },
  );
}
