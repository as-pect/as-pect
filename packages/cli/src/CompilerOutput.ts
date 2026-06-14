export interface CompilerOutput {
  binary: Uint8Array;
  wat: string;
}

export type CompilerOutputFiles = ReadonlyMap<string, string | Uint8Array>;

function formatAvailableOutputs(files: CompilerOutputFiles): string {
  const keys = Array.from(files.keys());
  return keys.length === 0 ? "none" : keys.join(", ");
}

function findOutputFile(files: CompilerOutputFiles, outputName: string): string | null {
  return Array.from(files.keys()).find((file) => file.endsWith(outputName)) ?? null;
}

export function extractCompilerOutput(files: CompilerOutputFiles): CompilerOutput {
  const wasmFile = findOutputFile(files, "output.wasm");
  if (!wasmFile) {
    throw new Error(
      `AssemblyScript compiler did not emit output.wasm. Available outputs: ${formatAvailableOutputs(files)}.`,
    );
  }

  const watFile = findOutputFile(files, "output.wat");
  if (!watFile) {
    throw new Error(
      `AssemblyScript compiler did not emit output.wat. Available outputs: ${formatAvailableOutputs(files)}.`,
    );
  }

  const binary = files.get(wasmFile);
  if (!(binary instanceof Uint8Array)) {
    throw new Error(`AssemblyScript compiler output.wasm must be a Uint8Array.`);
  }

  const wat = files.get(watFile);
  if (typeof wat !== "string") {
    throw new Error(`AssemblyScript compiler output.wat must be a string.`);
  }

  return { binary, wat };
}
