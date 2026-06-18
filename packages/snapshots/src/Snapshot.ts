import { SnapshotDiff } from "./SnapshotDiff.js";

interface SnapshotSyntaxError {
  message: string;
}

export interface SnapshotStringElement {
  image: string;
}

export class SnapshotParseError extends Error {
  public readonly lexerErrors: string[];
  public readonly parserErrors: string[];

  constructor(lexerErrors: SnapshotSyntaxError[], parserErrors: SnapshotSyntaxError[]) {
    const details = [...lexerErrors, ...parserErrors].map((error) => error.message);
    super(
      details.length > 0
        ? `Failed to parse snapshot file:\n${details.map((detail) => `- ${detail}`).join("\n")}`
        : "Failed to parse snapshot file.",
    );
    this.name = "SnapshotParseError";
    this.lexerErrors = lexerErrors.map((error) => error.message);
    this.parserErrors = parserErrors.map((error) => error.message);
  }
}

export class SnapshotParser {
  private position = 0;
  public readonly lexerErrors: SnapshotSyntaxError[] = [];
  public readonly parserErrors: SnapshotSyntaxError[] = [];

  constructor(private readonly input: string) {}

  public parse(): Map<string, string> {
    const values = new Map<string, string>();

    this.skipWhitespace();
    while (!this.isAtEnd()) {
      const entry = this.parseSnapshotEntry();
      if (!entry) break;

      values.set(entry.key, normalizeSnapshotValue(entry.value));
      this.skipWhitespace();
    }

    return values;
  }

  private parseSnapshotEntry(): { key: string; value: string } | null {
    if (!this.consumeLiteral("exports")) return null;
    this.skipWhitespace();

    if (!this.consumeLiteral("[")) return null;
    this.skipWhitespace();

    const key = this.parseSnapshotString();
    if (key === null) return null;
    this.skipWhitespace();

    if (!this.consumeLiteral("]")) return null;
    this.skipWhitespace();

    if (!this.consumeLiteral("=")) return null;
    this.skipWhitespace();

    const value = this.parseSnapshotString();
    if (value === null) return null;
    this.skipWhitespace();

    if (!this.consumeLiteral(";")) return null;
    return { key, value };
  }

  private consumeLiteral(literal: string): boolean {
    if (this.input.startsWith(literal, this.position)) {
      this.position += literal.length;
      return true;
    }

    this.parserErrors.push({ message: `Expected ${JSON.stringify(literal)} at offset ${this.position}.` });
    return false;
  }

  private parseSnapshotString(): string | null {
    if (this.input[this.position] !== "`") {
      this.parserErrors.push({ message: `Expected a snapshot string at offset ${this.position}.` });
      return null;
    }

    const start = this.position;
    this.position++;

    while (!this.isAtEnd()) {
      const char = this.input[this.position];

      if (char === "\\" && this.input[this.position + 1] === "`") {
        this.position += 2;
        continue;
      }

      if (char === "`") {
        this.position++;
        return parseSnapshotStringImage(this.input.slice(start, this.position));
      }

      this.position++;
    }

    this.lexerErrors.push({ message: `Unterminated snapshot string starting at offset ${start}.` });
    return null;
  }

  private skipWhitespace(): void {
    while (!this.isAtEnd() && /\s/.test(this.input[this.position])) {
      this.position++;
    }
  }

  private isAtEnd(): boolean {
    return this.position >= this.input.length;
  }
}

export class Snapshot {
  public static parse(input: string): Snapshot {
    const result = new Snapshot();
    const parser = new SnapshotParser(input);
    result.values = parser.parse();

    if (parser.lexerErrors.length > 0) {
      throw new SnapshotParseError(parser.lexerErrors, []);
    }

    if (parser.parserErrors.length > 0) {
      throw new SnapshotParseError([], parser.parserErrors);
    }

    return result;
  }

  public static from(input: Map<string, string>): Snapshot {
    const snapshot = new Snapshot();
    snapshot.values = new Map(Array.from(input, ([key, value]) => [key, normalizeSnapshotValue(value)]));
    return snapshot;
  }

  values = new Map<string, string>();

  public add(key: string, value: string): this {
    let i = 0;
    while (true) {
      const snapshotKey = `${key}[${i}]`;
      if (!this.values.has(snapshotKey)) {
        this.values.set(snapshotKey, normalizeSnapshotValue(value));
        return this;
      }
      i++;
    }
  }

  public set(key: string, value: string): this {
    this.values.set(key, normalizeSnapshotValue(value));
    return this;
  }

  public diff(other: Snapshot): SnapshotDiff {
    return new SnapshotDiff(this, other);
  }

  public stringify(): string {
    return (
      Array.from(this.values.entries())
        .map(([key, value]) => `exports[\`${escapeSnapshotString(key)}\`] = \`${escapeSnapshotString(value)}\`;`)
        .join("\n\n") + "\n"
    );
  }
}

function escapeSnapshotString(input: string): string {
  return input.replace(/`/g, "\\`");
}

function normalizeSnapshotValue(value: string): string {
  return value.replace(/\r\n?/g, "\n");
}

function parseSnapshotStringImage(image: string): string {
  return image.slice(1, -1).replace(/\\`/g, "`");
}

export function parseImageCSTElement(element: unknown): string {
  if (!isSnapshotStringElement(element)) {
    throw new SnapshotParseError([], [{ message: "Expected a snapshot string token." }]);
  }

  return parseSnapshotStringImage(element.image);
}

function isSnapshotStringElement(element: unknown): element is SnapshotStringElement {
  return typeof element === "object" && element !== null && "image" in element && typeof element.image === "string";
}
