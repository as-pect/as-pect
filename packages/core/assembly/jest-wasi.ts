import { wasi_crypto } from "@assemblyscript/wasi-shim/assembly/wasi_crypto";

test("output", () => {
  let values = new Uint8Array(100);
  wasi_crypto.getRandomValues(values);
  log(<u16>values.length);
});
