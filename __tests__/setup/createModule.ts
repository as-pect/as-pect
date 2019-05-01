import { main } from "assemblyscript/cli/asc";
import { instantiateBuffer } from "assemblyscript/lib/loader";
import { TestContext } from "../../src/test/TestContext";
import { EmptyReporter } from "../../src/reporter/EmptyReporter";


type TestContextCallback = (err: Error | null, result?: TestContext) => void;

export function createModule(linked: any, callback: TestContextCallback): void {
  let ctx: TestContext;
  main([
    "--validate",
    "--debug",
    "--binaryFile", "output.wasm",
    "./assembly/jest.ts",
    "./assembly/index.ts",
  ], {
    writeFile(fileName: string, contents: Uint8Array) {
      if (fileName === "output.wasm") {
        ctx = new TestContext(new EmptyReporter(), "assembly/jest.ts", { enabled: false });
        const result = instantiateBuffer(contents, ctx.createImports(linked));
        ctx.run(result);
      }
    }
  }, (err: Error | null) => {
    if (err) callback(err);
    else callback(null, ctx);
    return 0;
  });
}
