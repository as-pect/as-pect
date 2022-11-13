import { SnapshotDiff } from "./SnapshotDiff.js";
import { Lexer, createToken, CstParser, CstNode, ParserMethod, CstElement } from "chevrotain";

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
    let result = new Snapshot();
    const tokenizedResult = lexer.tokenize(input);
    const parser = new SnapshotParser();
    parser.input = tokenizedResult.tokens;
    const node = parser.snapshots();
    if (!node.children.string_token) return result;

    for (let i = 0; i < node.children.string_token.length; i += 2) {
      let first = parseImageCSTElement(node.children.string_token[i]);
      let second = parseImageCSTElement(node.children.string_token[i + 1]);
      result.values.set(first, second);
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

  public diff(other: Snapshot): SnapshotDiff {
    return new SnapshotDiff(this, other);
  }

  public stringify(): string {
    return (
      Array.from(this.values.entries())
        .map(([key, value]) => `exports[\`${key.replace("`", "\\`")}\`] = \`${value.replace("`", "\\`")}\`;`)
        .join("\n\n") + "\n"
    );
  }
}

export function parseImageCSTElement(element: CstElement): string {
  // @ts-ignore
  const image = element.image as string;
  return image.slice(1, -1).replace("\\`", "`");
}
