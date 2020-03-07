// import React from 'react'
// import ReactDOM from 'react-dom'
// import DomReporter from './index';
import { TestContext, EmptyReporter, IAspectExports, TestNode } from '@as-pect/core';
import { instantiate } from 'assemblyscript/lib/loader';

const getWasmBinary = async () => {
  const binary = await fetch("http://localhost:5000/lessThan.spec.wasm");
  const buffer = await binary.arrayBuffer();
  return new Uint8Array(buffer);
}

const fetchAndSetWasmBinary = async () => {
  const wasmBinary = await getWasmBinary();
  const ctx = new TestContext({
    fileName: "test.spec.ts", // the name of your module
    binary: wasmBinary, // the binary for test name collection
    /**
     * @todo implement reporter class
     */
    reporter: new EmptyReporter(),
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

fetchAndSetWasmBinary();

// ReactDOM.render(
//   // <DomReporter />,
//   <div>hi</div>,
//   document.getElementById('root'),
// );
