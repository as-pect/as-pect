import { extractCompilerOutput } from "../src/CompilerOutput.js";

describe("Compiler output extraction", () => {
  it("finds wasm and wat compiler outputs", () => {
    const binary = new Uint8Array([1, 2, 3]);
    const output = extractCompilerOutput(
      new Map<string, string | Uint8Array>([
        ["build/debug/output.wat", "(module)"],
        ["build/debug/output.wasm", binary],
      ]),
    );

    expect(output).toEqual({ binary, wat: "(module)" });
  });

  it("throws a useful error when wasm output is missing", () => {
    expect(() => extractCompilerOutput(new Map([["build/debug/output.wat", "(module)"]]))).toThrow(
      "AssemblyScript compiler did not emit output.wasm",
    );
  });

  it("throws a useful error when wat output is missing", () => {
    expect(() => extractCompilerOutput(new Map([["build/debug/output.wasm", new Uint8Array([1])]]))).toThrow(
      "AssemblyScript compiler did not emit output.wat",
    );
  });
});
