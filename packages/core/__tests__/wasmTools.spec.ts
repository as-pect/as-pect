import { NameSection, WasmBuffer } from "../src/util/wasmTools.js";

const textEncoder = new TextEncoder();

function encodeVaruint(value: number): number[] {
  const bytes: number[] = [];
  let remaining = value >>> 0;

  do {
    let byte = remaining & 0x7f;
    remaining >>>= 7;
    if (remaining !== 0) byte |= 0x80;
    bytes.push(byte);
  } while (remaining !== 0);

  return bytes;
}

function encodeName(value: string): number[] {
  const bytes = Array.from(textEncoder.encode(value));
  return [...encodeVaruint(bytes.length), ...bytes];
}

function createCustomSection(name: string, contents: number[]): number[] {
  const payload = [...encodeName(name), ...contents];
  return [0, ...encodeVaruint(payload.length), ...payload];
}

function createModuleWithNameSection(contents: number[]): Uint8Array {
  return Uint8Array.from([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, ...createCustomSection("name", contents)]);
}

function createModuleWithoutNameSection(): Uint8Array {
  return Uint8Array.from([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00]);
}

function createSubsection(kind: number, payload: number[]): number[] {
  return [kind, ...encodeVaruint(payload.length), ...payload];
}

function createFunctionNameSubsection(entries: [number, string][]): number[] {
  const payload = [
    ...encodeVaruint(entries.length),
    ...entries.flatMap(([index, name]) => [...encodeVaruint(index), ...encodeName(name)]),
  ];
  return createSubsection(1, payload);
}

describe("NameSection", () => {
  it("falls back to synthetic function names when the module has no name section", () => {
    const nameSection = new NameSection(createModuleWithoutNameSection());

    expect(nameSection.fromIndex(3)).toBe("Function 3");
  });

  it("falls back to synthetic function names when the name section is empty", () => {
    const nameSection = new NameSection(createModuleWithNameSection([]));

    expect(nameSection.fromIndex(2)).toBe("Function 2");
  });

  it("decodes function names as UTF-8", () => {
    const nameSection = new NameSection(
      createModuleWithNameSection(createFunctionNameSubsection([[0, "lambda λ rocket 🚀"]])),
    );

    expect(nameSection.fromIndex(0)).toBe("lambda λ rocket 🚀");
  });

  it("finds function names after other name subsections", () => {
    const moduleNameSubsection = createSubsection(0, encodeName("test-module"));
    const functionNameSubsection = createFunctionNameSubsection([[1, "namedFunction"]]);
    const nameSection = new NameSection(
      createModuleWithNameSection([...moduleNameSubsection, ...functionNameSubsection]),
    );

    expect(nameSection.fromIndex(1)).toBe("namedFunction");
  });

  it("ignores malformed function name records that extend past their subsection", () => {
    const malformedFunctionNameSubsection = createSubsection(1, [
      ...encodeVaruint(1),
      ...encodeVaruint(0),
      ...encodeVaruint(5),
      ...textEncoder.encode("ab"),
    ]);

    const nameSection = new NameSection(createModuleWithNameSection(malformedFunctionNameSubsection));

    expect(nameSection.fromIndex(0)).toBe("Function 0");
  });

  it("treats a stored name pointer of 0 as present", () => {
    const nameSection = new NameSection(createModuleWithoutNameSection());
    const internals = nameSection as unknown as { section: WasmBuffer; funcNames: Map<number, number> };
    internals.section = new WasmBuffer(Uint8Array.from(encodeName("zeroOffset")));
    internals.funcNames.set(7, 0);

    expect(nameSection.fromIndex(7)).toBe("zeroOffset");
  });
});
