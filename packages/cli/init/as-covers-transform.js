// Coverage transform compatible with as-pect's AssemblyScript compiler.
// as-covers 0.5.0 still publishes its transform against AssemblyScript 0.25,
// so this wrapper keeps the as-covers runtime contract while using the active
// compiler's AST enums and only instrumenting project sources.
import {
  BlockStatement,
  ExpressionStatement,
  Node,
  NodeKind,
  Parser,
  Source,
  SourceKind,
  Token,
  Tokenizer,
} from "assemblyscript/dist/assemblyscript.js";
import { Transform } from "assemblyscript/dist/transform.js";

const ignoredRegex = /^[\t ]*\/\/ @as-covers: ignore.*$/gm;

function djb2Hash(str) {
  const points = Array.from(str);
  let h = 5381;
  for (let p = 0; p < points.length; p++) {
    h = ((h << 5) - h + points[p].codePointAt(0)) | 0;
  }
  return h;
}

function createPointID(file, line, col, type) {
  return djb2Hash(`${file}~${line}~${col}~${type}`);
}

class SourceLocationFinder {
  lineStarts = [0];

  constructor(sourceText) {
    this.sourceText = sourceText;
    for (let index = 0; index < sourceText.length; index++) {
      if (sourceText.charCodeAt(index) === 10) this.lineStarts.push(index + 1);
    }
  }

  fromIndex(index) {
    if (index < 0 || index >= this.sourceText.length || Number.isNaN(index)) {
      throw new RangeError(`Source index ${index} is out of range.`);
    }

    let low = 0;
    let high = this.lineStarts.length - 1;
    while (low < high) {
      const mid = Math.ceil((low + high) / 2);
      if ((this.lineStarts[mid] ?? 0) <= index) {
        low = mid;
      } else {
        high = mid - 1;
      }
    }

    return {
      line: low + 1,
      col: index - this.lineStarts[low] + 1,
    };
  }
}

class SimpleParser {
  static get parser() {
    return new Parser();
  }

  static getTokenizer(source, file = "index.ts") {
    return new Tokenizer(new Source(SourceKind.User, file, source));
  }

  static parseExpression(source) {
    const result = this.parser.parseExpression(this.getTokenizer(source));
    if (result == null) throw new Error(`Failed to parse the expression: '${source}'`);
    return result;
  }

  static parseStatement(source, topLevel = false) {
    const result = this.parser.parseStatement(this.getTokenizer(source), topLevel);
    if (result == null) throw new Error(`Failed to parse the statement: '${source}'`);
    return result;
  }
}

function isNode(value) {
  return Boolean(value && typeof value === "object" && typeof value.kind === "number" && value.range);
}

function applyRange(anchor, generated) {
  const stack = [generated];
  const seen = new Set();

  while (stack.length > 0) {
    const value = stack.pop();
    if (!isNode(value) || seen.has(value)) continue;
    seen.add(value);
    value.range = anchor.range;

    for (const key of Object.keys(value)) {
      if (key === "range") continue;
      const child = value[key];
      if (Array.isArray(child)) {
        for (const item of child) stack.push(item);
      } else {
        stack.push(child);
      }
    }
  }
}

class SourceInstrumentation {
  ignoredLines = new Set();
  declarations = [];

  constructor(source) {
    this.fileName = source.normalizedPath;
    this.linecol = new SourceLocationFinder(source.text);
    for (const ignored of source.text.matchAll(ignoredRegex)) {
      this.ignoredLines.add(this.linecol.fromIndex(ignored.index).line + 1);
    }
  }

  declarePoint(node, type, anchor = node) {
    const point = this.createPoint(node, type);
    if (!point) return null;
    this.declarations.push(this.coverDeclare(point, anchor));
    return point;
  }

  coverStatement(point, anchor, topLevel = false) {
    return this.parseStatement(`__cover(${point.id})`, anchor, topLevel);
  }

  coverBlock(point, anchor) {
    return this.parseStatement(`{__cover(${point.id})};`, anchor, true);
  }

  coverExpression(point, originalExpression, anchor) {
    const coverExpression = SimpleParser.parseExpression(`(__cover(${point.id}), $$REPLACE_ME)`);
    applyRange(anchor, coverExpression);
    coverExpression.expression.expressions[1] = originalExpression;
    return coverExpression;
  }

  prependDeclarations(source) {
    source.statements.unshift(...this.declarations);
  }

  createPoint(node, type) {
    const location = this.locationOf(node);
    if (this.ignoredLines.has(location.line)) return null;
    return {
      ...location,
      file: this.fileName,
      id: createPointID(this.fileName, location.line, location.col, type),
      type,
    };
  }

  locationOf(node) {
    const location = this.linecol.fromIndex(node.range.start);
    return {
      line: location.line,
      col: location.col,
    };
  }

  coverDeclare(point, anchor) {
    return this.parseStatement(
      `__coverDeclare("${point.file}", ${point.id}, ${point.line}, ${point.col}, ${point.type})`,
      anchor,
      true,
    );
  }

  parseStatement(source, anchor, topLevel = false) {
    const statement = SimpleParser.parseStatement(source, topLevel);
    applyRange(anchor, statement);
    return statement;
  }
}

function isDependencySource(source) {
  const sourcePath = source.normalizedPath || source.internalPath || "";
  const internalPath = source.internalPath || "";
  return (
    sourcePath.startsWith("~lib/") ||
    internalPath.startsWith("~lib/") ||
    sourcePath.includes("/node_modules/") ||
    sourcePath.includes("\\node_modules\\")
  );
}

class CoverTransform {
  visit(node) {
    if (!node) return;

    switch (node.kind) {
      case NodeKind.Source:
        this.visitSource(node);
        break;
      case NodeKind.Binary:
        this.visitBinaryExpression(node);
        break;
      case NodeKind.MethodDeclaration:
        this.visitMethodDeclaration(node);
        break;
      case NodeKind.Parameter:
        this.visitParameter(node);
        break;
      case NodeKind.FunctionDeclaration:
        this.visitFunctionDeclaration(node);
        break;
      case NodeKind.If:
        this.visitIfStatement(node);
        break;
      case NodeKind.For:
        this.visitForStatement(node);
        break;
      case NodeKind.While:
        this.visitWhileStatement(node);
        break;
      case NodeKind.Do:
        this.visitDoStatement(node);
        break;
      case NodeKind.Ternary:
        this.visitTernaryExpression(node);
        break;
      case NodeKind.SwitchCase:
        this.visitSwitchCase(node);
        break;
      case NodeKind.Block:
        this.visitBlockStatement(node);
        break;
      default:
        this.visitChildren(node);
        break;
    }
  }

  visitChildren(node) {
    for (const key of Object.keys(node)) {
      if (key === "range") continue;
      const child = node[key];
      if (Array.isArray(child)) {
        for (const item of [...child]) if (isNode(item)) this.visit(item);
      } else if (isNode(child)) {
        this.visit(child);
      }
    }
  }

  visitSource(source) {
    this.instrumentation = new SourceInstrumentation(source);
    for (const statement of [...source.statements]) this.visit(statement);
    this.instrumentation.prependDeclarations(source);
  }

  visitBinaryExpression(expr) {
    this.visitChildren(expr);
    switch (expr.operator) {
      case Token.Bar_Bar:
      case Token.Ampersand_Ampersand: {
        const rightExpression = expr.right;
        const rightPoint = this.instrumentation.declarePoint(rightExpression, "CoverType.Expression", expr);
        if (rightPoint) expr.right = this.instrumentation.coverExpression(rightPoint, rightExpression, expr);
        break;
      }
    }
  }

  visitMethodDeclaration(dec) {
    this.visitChildren(dec);
    if (dec.body) {
      const funcPoint = this.instrumentation.declarePoint(dec, "CoverType.Function");
      if (!funcPoint) return;
      dec.body.statements.unshift(this.instrumentation.coverStatement(funcPoint, dec, true));
    }
  }

  visitParameter(node) {
    if (node.initializer) this.visit(node.initializer);
    const initializer = node.initializer;
    if (initializer) {
      const parmPoint = this.instrumentation.declarePoint(initializer, "CoverType.Expression", node);
      if (parmPoint) node.initializer = this.instrumentation.coverExpression(parmPoint, initializer, node);
    }
  }

  visitFunctionDeclaration(dec) {
    this.visitChildren(dec);
    if (dec.body) {
      const funcPoint = this.instrumentation.declarePoint(dec, "CoverType.Function");
      if (!funcPoint) return;
      if (!(dec.body instanceof BlockStatement)) {
        if (!(dec.body instanceof ExpressionStatement)) {
          throw new TypeError("Expected function declaration body to be a block or expression");
        }
        const expr = dec.body.expression;
        dec.body = Node.createBlockStatement([Node.createReturnStatement(expr, expr.range)], expr.range);
      }
      dec.body.statements.unshift(this.instrumentation.coverStatement(funcPoint, dec, true));
    }
  }

  visitIfStatement(stmt) {
    if (stmt.condition) this.visit(stmt.condition);

    const ifTrue = stmt.ifTrue;
    if (ifTrue) {
      this.visit(ifTrue);
      if (ifTrue.kind !== NodeKind.Block) {
        const ifTruePoint = this.instrumentation.declarePoint(ifTrue, "CoverType.Expression");
        if (ifTruePoint) {
          const coverStatement = this.instrumentation.coverBlock(ifTruePoint, ifTrue);
          coverStatement.statements.push(ifTrue);
          stmt.ifTrue = coverStatement;
        }
      }
    }

    const ifFalse = stmt.ifFalse;
    if (ifFalse) {
      this.visit(ifFalse);
      if (ifFalse.kind !== NodeKind.Block) {
        const ifFalsePoint = this.instrumentation.declarePoint(ifFalse, "CoverType.Expression");
        if (ifFalsePoint) {
          const coverStatement = this.instrumentation.coverBlock(ifFalsePoint, ifFalse);
          coverStatement.statements.push(ifFalse);
          stmt.ifFalse = coverStatement;
        }
      }
    }
  }

  visitForStatement(stmt) {
    this.visitChildren(stmt);
    const bodyBlock = this.coverLoopBody(stmt.body);
    if (bodyBlock) stmt.body = bodyBlock;
  }

  visitWhileStatement(stmt) {
    this.visitChildren(stmt);
    const bodyBlock = this.coverLoopBody(stmt.body);
    if (bodyBlock) stmt.body = bodyBlock;
  }

  visitDoStatement(stmt) {
    this.visitChildren(stmt);
    const bodyBlock = this.coverLoopBody(stmt.body);
    if (bodyBlock) stmt.body = bodyBlock;
  }

  coverLoopBody(body) {
    if (!body || body.kind === NodeKind.Block) return null;
    const bodyPoint = this.instrumentation.declarePoint(body, "CoverType.Block");
    if (!bodyPoint) return null;
    const coverStatement = this.instrumentation.coverBlock(bodyPoint, body);
    coverStatement.statements.push(body);
    return coverStatement;
  }

  visitTernaryExpression(expr) {
    this.visitChildren(expr);
    const trueExpression = expr.ifThen;
    const falseExpression = expr.ifElse;
    const truePoint = this.instrumentation.declarePoint(trueExpression, "CoverType.Expression");
    if (truePoint) expr.ifThen = this.instrumentation.coverExpression(truePoint, trueExpression, trueExpression);
    const falsePoint = this.instrumentation.declarePoint(falseExpression, "CoverType.Expression");
    if (falsePoint) expr.ifElse = this.instrumentation.coverExpression(falsePoint, falseExpression, falseExpression);
  }

  visitSwitchCase(stmt) {
    const casePoint = this.instrumentation.declarePoint(stmt, "CoverType.Block");
    const caseCoverStatement = casePoint ? this.instrumentation.coverStatement(casePoint, stmt) : null;
    this.visitChildren(stmt);
    if (caseCoverStatement) stmt.statements.unshift(caseCoverStatement);
  }

  visitBlockStatement(node) {
    const blockPoint = this.instrumentation.declarePoint(node, "CoverType.Block");
    const coverStatement = blockPoint ? this.instrumentation.coverStatement(blockPoint, node) : null;
    this.visitChildren(node);
    if (coverStatement) node.statements.unshift(coverStatement);
  }
}

export default class AsPectCoversTransform extends Transform {
  afterParse(parser) {
    const transformer = new CoverTransform();
    for (const source of parser.sources) {
      if (!isDependencySource(source) && !source.isLibrary) transformer.visit(source);
    }
  }
}
