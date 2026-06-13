import { EmptyReporter } from "../src/reporter/EmptyReporter.js";
import { TestContext } from "../src/test/TestContext.js";
import { TestNodeType } from "../src/util/TestNodeType.js";

function runSyntheticRtraceSuite(): TestContext {
  const ctx = new TestContext({
    reporter: new EmptyReporter(),
    fileName: "synthetic-rtrace.wasm",
  });
  const imports = ctx.createImports();
  const strings = new Map<number, string>([
    [1, "collects temporary test garbage"],
    [2, "reports retained live blocks"],
  ]);
  const callbacks = new Map<number, () => void>();
  const liveBlocks = new Set<number>([100]);
  const blocks = (ctx.rtrace as unknown as { blocks: Map<number, unknown> }).blocks;

  const syncBlocks = (): void => {
    blocks.clear();
    for (const block of liveBlocks) blocks.set(block, { ptr: block });
  };

  callbacks.set(10, () => {
    liveBlocks.add(200);
  });
  callbacks.set(20, () => {
    liveBlocks.add(300);
  });
  syncBlocks();

  const wasm = {
    memory: new WebAssembly.Memory({ initial: 1 }),
    _start(): void {
      imports.__aspect.reportTestTypeNode(1, 10);
      imports.__aspect.reportTestTypeNode(2, 20);
    },
    __call(pointer: number): void {
      callbacks.get(pointer)?.();
    },
    __collect(): void {
      liveBlocks.delete(100); // stale block from before the first test
      liveBlocks.delete(200); // temporary block created by the first test
      syncBlocks();
    },
    __getString(pointer: number): string {
      return strings.get(pointer) ?? "";
    },
    __getArray(): number[] {
      return [];
    },
    __allocArray(): number {
      return 0;
    },
    __getUsizeArrayId(): number {
      return 0;
    },
    __disableRTrace(): void {},
  };

  ctx.run(wasm as never);
  return ctx;
}

describe("TestContext rtrace leak accounting", () => {
  it("reports live-block deltas after forcing collection around each test", () => {
    const ctx = runSyntheticRtraceSuite();
    const tests = ctx.rootNode.children.filter((node) => node.type === TestNodeType.Test);

    expect(tests.map((test) => test.name)).toEqual(["collects temporary test garbage", "reports retained live blocks"]);
    expect(tests.map((test) => test.rtraceDelta)).toEqual([0, 1]);
  });
});
