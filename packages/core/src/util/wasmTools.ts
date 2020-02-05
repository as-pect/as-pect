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
    var byt;
    var pos = off;
    do {
      byt = this.u8array[pos++];
      val |= (byt & 0x7f) << shl;
      if (!(byt & 0x80)) break;
      shl += 7;
    } while (true);
    this.off = pos;
    return val;
  }

  /**
   * Read a UTF8 string from the buffer either at the current offset or one passed in.
   * Updates the offset of the buffer.
   */
  readString(off: number = this.off): string {
    const name_len = this.readVaruint(off);
    this.off += name_len;
    //@ts-ignore
    return String.fromCharCodes(
      this.u8array.slice(this.off - name_len, this.off),
    );
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
    const mod = new WebAssembly.Module(contents);
    const section = WebAssembly.Module.customSections(mod, "name")[0];
    this.section = new WasmBuffer(new Uint8Array(section));
    this.parseSection();
  }

  fromIndex(i: number): string {
    const ptr = this.funcNames.get(i);
    if (!ptr) return "Function " + i;
    return this.section.peekString(ptr);
  }

  /** Parses */
  private parseSection(): void {
    const off = this.off;
    const kind = this.readVaruint();
    if (kind != 1) {
      this.off = off;
      return;
    }
    const end = this.readVaruint() + this.off;
    const count = this.readVaruint();
    let numRead = 0;
    while (numRead < count && this.off < end) {
      const index = this.readVaruint();
      this.funcNames.set(index, this.off);
      const len = this.readVaruint();
      this.off += len;
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
