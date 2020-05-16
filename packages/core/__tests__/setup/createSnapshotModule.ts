import { main } from "assemblyscript/cli/asc";
import { instantiateSync as instantiateBuffer } from "assemblyscript/lib/loader";
import { TestContext } from "../../src/test/TestContext";
import { IAspectExports } from "../../src/util/IAspectExports";
import { IReporter } from "../../src";
import { Snapshot } from "@as-pect/snapshots";

type TestContextCallback = (err: Error | null, result?: TestContext) => void;

export function createSnapshotModule(
  linked: any,
  callback: TestContextCallback,
  reporter: IReporter,
): void {
  let ctx: TestContext;
  main(
    [
      "--debug",
      "--binaryFile",
      "output.wasm",
      "--explicitStart",
      "./assembly/jest-reporter-snapshot.ts",
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
            fileName: "assembly/jest-reporter-snapshot.ts",
            snapshots: Snapshot.from(
              new Map<string, string>([
                // modified
                [
                  "a few snapshots!~first vec3[0]",
                  "Vec3 {\n  x: 1.0,\n  y: 2.0,\n  z: 4.0,\n  a: 10.0\n}",
                ],
                // same
                ["a few snapshots!~a string[0]", '"some string"'],
                // added: ['a few snapshots!~some integer[0]', '504'],
                ["a few snapshots!~some float value[0]", "3.14"],
                // removed from module
                ["this!~is!~removed", "false"],
              ]),
            ),
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
