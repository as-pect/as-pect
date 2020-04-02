import ReactDOM from 'react-dom';
import React from 'react';
import { DomReporter } from './app';

const getWasmBinary = async () => {
  const binary = await fetch("http://localhost:8080/lessThan.spec.wasm");
  const buffer = await binary.arrayBuffer();
  return new Uint8Array(buffer);
}

(async () => {
  const binary = await getWasmBinary();

  ReactDOM.render(
    <DomReporter binary={binary} />,
    document.getElementById('root'),
  );
})();
