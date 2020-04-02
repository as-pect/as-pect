import { TestContext, EmptyReporter, IAspectExports, TestNode } from '@as-pect/core';
import { instantiate } from 'assemblyscript/lib/loader';
import { DomReporter } from '../reporter/DomReporter';

self.onmessage = async ({ data: wasmBinary }: MessageEvent) => {
  const ctx = new TestContext({
    fileName: "test.spec.ts", // the name of your module
    binary: wasmBinary, // the binary for test name collection
    /**
     * @todo implement reporter class
     */
    // @ts-ignore: self is instanceof Worker
    reporter: new DomReporter(self),
  });
  
  if (!WebAssembly.validate(wasmBinary)) console.error('the binary is not valid');

  const imports = ctx.createImports({
    env: {
      memory:  new WebAssembly.Memory({ initial: 256 }),
      table: new WebAssembly.Table({ initial: 0, element: 'anyfunc' }),
      memoryBase: 0,
      tableBase: 0,
    }
  });
  const wasm = await instantiate<IAspectExports>(wasmBinary, imports);
  ctx.run(wasm);
};
