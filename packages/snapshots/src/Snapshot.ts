import { SnapshotDiff } from "./SnapshotDiff.js";
import { Lexer, createToken, CstParser, CstNode, ParserMethod, CstElement } from "chevrotain";

interface SnapshotSyntaxError {
  message: string;
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

const string_token = createToken({ name: "string_token", pattern: /`(\\`|[^`])*`/ });

const open_bracket = createToken({ name: "open_bracket", pattern: /\[/ });
const close_bracket = createToken({ name: "close_bracket", pattern: /\]/ });
const equals = createToken({ name: "equals", pattern: /=/ });
const semicolon = createToken({ name: "semicolon", pattern: /;/ });
const exports_token = createToken({ name: "exports_token", pattern: /exports/ });
const white_space = createToken({
  name: "WhiteSpace",
  pattern: /\s+/,
  group: Lexer.SKIPPED,
});
const allTokens = [exports_token, equals, string_token, open_bracket, close_bracket, white_space, semicolon];
const lexer = new Lexer(allTokens);

export class SnapshotParser extends CstParser {
  snapshots!: ParserMethod<unknown[], CstNode>;
  string!: ParserMethod<unknown[], CstNode>;
  ws!: ParserMethod<unknown[], CstNode>;

  constructor() {
    super(allTokens);
    const $ = this;

    $.RULE("snapshots", () => {
      $.SUBRULE(this.ws);
      $.MANY(() => {
        $.CONSUME(exports_token);
        $.CONSUME(open_bracket);
        $.CONSUME(string_token);
        $.CONSUME(close_bracket);
        $.SUBRULE1(this.ws);
        $.CONSUME(equals);
        $.SUBRULE2(this.ws);
        $.CONSUME1(string_token);
        $.SUBRULE3(this.ws);
        $.CONSUME(semicolon);
        $.SUBRULE4(this.ws);
      });
    });

    $.RULE("ws", () => {
      $.OPTION(() => {
        $.CONSUME(white_space);
      });
    });

    this.performSelfAnalysis();
  }
}

// TODO: Add parser combinator grammar here

export class Snapshot {
  public static parse(input: string): Snapshot {
    const result = new Snapshot();
    const tokenizedResult = lexer.tokenize(input);

    if (tokenizedResult.errors.length > 0) {
      throw new SnapshotParseError(tokenizedResult.errors, []);
    }

    const parser = new SnapshotParser();
    parser.input = tokenizedResult.tokens;
    const node = parser.snapshots();

    if (parser.errors.length > 0) {
      throw new SnapshotParseError([], parser.errors);
    }

    const stringTokens = node.children.string_token;
    if (!stringTokens) return result;

    for (let i = 0; i < stringTokens.length; i += 2) {
      const keyToken = stringTokens[i];
      const valueToken = stringTokens[i + 1];

      if (!valueToken) {
        throw new SnapshotParseError([], [{ message: "Snapshot entry is missing a value." }]);
      }

      const key = parseImageCSTElement(keyToken);
      const value = parseImageCSTElement(valueToken);
      result.values.set(key, value);
    }
    return result;
  }

  public static from(input: Map<string, string>): Snapshot {
    const snapshot = new Snapshot();
    snapshot.values = input;
    return snapshot;
  }

  values = new Map<string, string>();

  public add(key: string, value: string): this {
    let i = 0;
    while (true) {
      const snapshotKey = `${key}[${i}]`;
      if (!this.values.has(snapshotKey)) {
        this.values.set(snapshotKey, value);
        return this;
      }
      i++;
    }
  }

  public set(key: string, value: string): this {
    this.values.set(key, value);
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

export function parseImageCSTElement(element: CstElement): string {
  if (!("image" in element)) {
    throw new SnapshotParseError([], [{ message: "Expected a snapshot string token." }]);
  }

  return element.image.slice(1, -1).replace(/\\`/g, "`");
}
