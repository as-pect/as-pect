const utf8Decoder = new TextDecoder("utf-8");

/**
 * A Buffer for reading wasm sections.
 */
export class WasmBuffer {
  /** Current offset in the buffer. */
  off: number = 0;

  constructor(public u8array: Uint8Array) {}

  /** Read 128LEB unsigned integers. */
  readVaruint(off: number = this.off) {
    var val = 0;
    var shl = 0;
    var pos = off;

    while (pos < this.u8array.length) {
      const byt = this.u8array[pos++];
      val |= (byt & 0x7f) << shl;
      if (!(byt & 0x80)) break;
      shl += 7;
    }

    this.off = pos;
    return val;
  }

  /**
   * Read a UTF8 string from the buffer either at the current offset or one passed in.
   * Updates the offset of the buffer.
   */
  readString(off: number = this.off): string {
    const name_len = this.readVaruint(off);
    const start = this.off;
    const end = Math.min(start + name_len, this.u8array.length);
    this.off = end;
    return utf8Decoder.decode(this.u8array.subarray(start, end));
  }

  /** Read a string at an offset without changing the buffere's offset. */
  peekString(off: number): string {
    const old_off = this.off;
    const str = this.readString(off);
    this.off = old_off;
    return str;
  }
}

/**
 * Utility class for reading the name sections of a wasm binary.
 * See https://github.com/WebAssembly/design/blob/master/BinaryEncoding.md#name-section
 */
export class NameSection {
  section: WasmBuffer;

  /** map of indexs to UTF8 pointers. */
  private funcNames: Map<number, number> = new Map();

  constructor(contents: Uint8Array) {
    const mod = new WebAssembly.Module(contents as BufferSource);
    const section = WebAssembly.Module.customSections(mod, "name")[0];
    this.section = new WasmBuffer(section ? new Uint8Array(section) : new Uint8Array());
    this.parseSection();
  }

  fromIndex(i: number): string {
    if (!this.funcNames.has(i)) return "Function " + i;
    return this.section.peekString(this.funcNames.get(i)!);
  }

  /** Parses the wasm name custom section. */
  private parseSection(): void {
    const sectionLength = this.section.u8array.length;

    while (this.off < sectionLength) {
      const kind = this.readVaruint();
      const end = Math.min(this.readVaruint() + this.off, sectionLength);

      if (kind == 1) {
        this.parseFunctionNames(end);
      }

      this.off = end;
    }
  }

  /** Parse the function-name subsection. */
  private parseFunctionNames(end: number): void {
    const count = this.readVaruint();
    let numRead = 0;

    while (numRead < count && this.off < end) {
      const index = this.readVaruint();
      if (this.off >= end) return;

      const ptr = this.off;
      const len = this.readVaruint();
      const nameEnd = this.off + len;
      if (nameEnd > end) return;

      this.funcNames.set(index, ptr);
      this.off = nameEnd;
      numRead++;
    }
  }

  /** Current offset */
  get off(): number {
    return this.section.off;
  }

  /** Update offset */
  set off(o: number) {
    this.section.off = o;
  }

  /** Reads a 128LEB  unsigned integer and updates the offset. */
  readVaruint(off: number = this.off): number {
    return this.section.readVaruint(off);
  }
}
