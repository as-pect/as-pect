import { HostValue } from "../../util/HostValue";
import { HostValueType } from "@as-pect/assembly/assembly/internal/HostValueType";
import chalk from "chalk";

class StringifyHostValueContext {
  public level: number = 0;
  public impliedTypeInfo: boolean = false;

  public keywordColor = (input: string) => chalk`{yellow ${input}}`;
  public stringColor = (input: string) => chalk`{cyan ${input}}`;
  public classNameColor = (input: string) => chalk`{white ${input}}`;
  public numberColor = (input: string) => chalk`{green ${input}}`;

  public constructor(
    public indent: number = 0,
    public maxPropertyCount: number = 50,
    public tab: number = 4,
  ) {}
}

export function stringifyHostValue(hostValue: HostValue, indent: number): string {
  return formatters[formatterIndexFor(hostValue.type, HostValueFormatType.Expanded)](
    hostValue,
    new StringifyHostValueContext(indent),
  );
}


type HostNameTypeFormatter = (hostValue: HostValue, ctx: StringifyHostValueContext) => string;

const enum HostValueFormatType {
  Expanded = 0,
  Inline = 1,
  Key = 2,
  Value = 3,
}

const formatters: HostNameTypeFormatter[] = [];
const emptyFormatter = () => "";
for (let i = 0; i < 14 * 4; i++) formatters.push(emptyFormatter);

const formatterIndexFor = (valueType: HostValueType, type: HostValueFormatType) => valueType * 4 + type;

const falsyFormatter = (hostValue: HostValue) => `${hostValue.negated ? "Not " : ""}Falsy`;
formatters[formatterIndexFor(HostValueType.Falsy, HostValueFormatType.Expanded)] = falsyFormatter;

const truthyFormatter = (hostValue: HostValue) => `${hostValue.negated ? "Not " : ""}Truthy`;
formatters[formatterIndexFor(HostValueType.Truthy, HostValueFormatType.Expanded)] = truthyFormatter;

const finiteFormatter = (hostValue: HostValue) => `${hostValue.negated ? "Not " : ""}Finite`;
formatters[formatterIndexFor(HostValueType.Finite, HostValueFormatType.Expanded)] = finiteFormatter;

function displayBooleanNoSpacing(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  return ctx.keywordColor(hostValue.value === 1 ? "true" : "false");
}

function displayBooleanWithSpacing(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  return " ".repeat(ctx.indent + ctx.tab * ctx.level) + ctx.keywordColor(hostValue.value === 1 ? "true" : "false");
}

// Booleans
formatters[formatterIndexFor(HostValueType.Boolean, HostValueFormatType.Expanded)] = displayBooleanWithSpacing;
formatters[formatterIndexFor(HostValueType.Boolean, HostValueFormatType.Inline)] = displayBooleanNoSpacing;
formatters[formatterIndexFor(HostValueType.Boolean, HostValueFormatType.Key)] = displayBooleanWithSpacing;
formatters[formatterIndexFor(HostValueType.Boolean, HostValueFormatType.Value)] = displayBooleanNoSpacing;

function displayClassNoSpacing(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  return ctx.classNameColor(`[${hostValue.typeName}]`);
}

function displayNumberWithSpacing(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  if (ctx.impliedTypeInfo || hostValue.typeName === "i32" || hostValue.typeName === "f64") {
    return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.numberColor(hostValue.value.toString());
  }
  return " ".repeat(ctx.indent + ctx.level * ctx.tab) + `${ctx.numberColor(hostValue.value.toString())} ${ctx.classNameColor(`as ${hostValue.typeName}`)}`;
}

function displayNumberNoSpacing(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  if (ctx.impliedTypeInfo || hostValue.typeName === "i32" || hostValue.typeName === "f64") {
    return ctx.numberColor(hostValue.value.toString());
  }
  return `${ctx.numberColor(hostValue.value.toString())} ${ctx.classNameColor(`as ${hostValue.typeName}`)}`;
}

// Floats
formatters[formatterIndexFor(HostValueType.Float, HostValueFormatType.Expanded)] = displayNumberWithSpacing;
formatters[formatterIndexFor(HostValueType.Float, HostValueFormatType.Inline)] = displayNumberNoSpacing;
formatters[formatterIndexFor(HostValueType.Float, HostValueFormatType.Key)] = displayNumberWithSpacing;
formatters[formatterIndexFor(HostValueType.Float, HostValueFormatType.Value)] = displayNumberNoSpacing;

// Integers
formatters[formatterIndexFor(HostValueType.Integer, HostValueFormatType.Expanded)] = displayNumberWithSpacing;
formatters[formatterIndexFor(HostValueType.Integer, HostValueFormatType.Inline)] = displayNumberNoSpacing;
formatters[formatterIndexFor(HostValueType.Integer, HostValueFormatType.Key)] = displayNumberWithSpacing;
formatters[formatterIndexFor(HostValueType.Integer, HostValueFormatType.Value)] = displayNumberNoSpacing;

function displayStringNoSpacing(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  return ctx.stringColor(`"${hostValue.value.toString().replace(/"/g, '\\"')}"`);
}

function displayStringWithSpacing(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.stringColor(`"${hostValue.value.toString().replace(/"/g, '\\"')}"`);
}

function displayNoQuoteStringWithSpacing(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.stringColor(`${hostValue.value.toString().replace(/"/g, '\\"')}`);
}

// Strings
formatters[formatterIndexFor(HostValueType.String, HostValueFormatType.Expanded)] = displayStringWithSpacing;
formatters[formatterIndexFor(HostValueType.String, HostValueFormatType.Inline)] = displayStringNoSpacing;
formatters[formatterIndexFor(HostValueType.String, HostValueFormatType.Key)] = displayNoQuoteStringWithSpacing;
formatters[formatterIndexFor(HostValueType.String, HostValueFormatType.Value)] = displayStringNoSpacing;

function displayFunctionExpanded(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.classNameColor(`[Function ${hostValue.pointer}: ${hostValue.value.toString()}]`);
}

const displayFuncNoNameNoPointer = (_: HostValue, ctx: StringifyHostValueContext) => ctx.classNameColor("[Function]");

function displayFunctionKey(_: HostValue, ctx: StringifyHostValueContext): string {
  return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.classNameColor(`[Function]`);
}

function displayFunctionValue(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  return ctx.classNameColor(`[Function ${hostValue.pointer}: ${hostValue.value.toString()}]`);
}


// Functions
formatters[formatterIndexFor(HostValueType.Function, HostValueFormatType.Expanded)] = displayFunctionExpanded;
formatters[formatterIndexFor(HostValueType.Function, HostValueFormatType.Inline)] = displayFuncNoNameNoPointer;
formatters[formatterIndexFor(HostValueType.Function, HostValueFormatType.Key)] = displayFunctionKey;
formatters[formatterIndexFor(HostValueType.Function, HostValueFormatType.Value)] = displayFunctionValue;

function displayClassExpanded(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  const spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
  const previousImpliedTypeInfo = ctx.impliedTypeInfo;
  ctx.impliedTypeInfo = false;
  if (hostValue.isNull) {
    if (previousImpliedTypeInfo) return `${spacing}null`;
    return `${spacing}${ctx.classNameColor(`<${hostValue.typeName}>`)} null`;
  }

  let body = "\n";
  ctx.level += 1;
  const length = Math.min(hostValue.keys!.length, ctx.maxPropertyCount);
  for (let i = 0; i < length; i++) {
    const key = hostValue.keys![i];
    const keyString = formatters[formatterIndexFor(key.type, HostValueFormatType.Key)](key, ctx);
    const value = hostValue.values![i];

    if (ctx.level < 5) {
      // render expanded value, but trim the whitespace on the left side
      const valueString = formatters[formatterIndexFor(value.type, HostValueFormatType.Expanded)](value, ctx)
        .trimLeft();
      body += `${keyString}: ${valueString},\n`
    } else {
      // render value
      const valueString = formatters[formatterIndexFor(value.type, HostValueFormatType.Value)](value, ctx);
      body += `${keyString}: ${valueString},\n`
    }
  }

  if (length > ctx.maxPropertyCount) body += `... +${length - ctx.maxPropertyCount} properties`;
  ctx.level -= 1;
  ctx.impliedTypeInfo = previousImpliedTypeInfo;
  if (previousImpliedTypeInfo) return `${spacing}{${body}${spacing}}`
  return `${spacing}${ctx.classNameColor(`${hostValue.typeName}`)} {${body}${spacing}}`;
}

function displayClassWithSpacing(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  return `${" ".repeat(ctx.level * ctx.tab + ctx.indent)}${ctx.classNameColor(`[${hostValue.typeName}]`)}`;
}

// Classes
formatters[formatterIndexFor(HostValueType.Class, HostValueFormatType.Expanded)] = displayClassExpanded;
formatters[formatterIndexFor(HostValueType.Class, HostValueFormatType.Inline)] = displayClassNoSpacing;
formatters[formatterIndexFor(HostValueType.Class, HostValueFormatType.Key)] = displayClassWithSpacing;
formatters[formatterIndexFor(HostValueType.Class, HostValueFormatType.Value)] = displayClassExpanded;

function displayArrayExpanded(hostValue: HostValue, ctx: StringifyHostValueContext): string {
  const spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
  const previousImpliedTypeInfo = ctx.impliedTypeInfo;
  ctx.impliedTypeInfo = true;

  if (ctx.level < 5 && hostValue.type === HostValueType.Array) {
    let body = "\n";
    ctx.level += 1;
    const length = Math.min(hostValue.values!.length, ctx.maxPropertyCount);
    for (let i = 0; i < length; i++) {
      const value = hostValue.values![i];

      // render expanded value, but trim the whitespace on the left side
      const valueString = formatters[formatterIndexFor(value.type, HostValueFormatType.Expanded)](value, ctx);
      body += `${valueString},\n`
    }
    if (length > ctx.maxPropertyCount) body += `... +${length - ctx.maxPropertyCount} values`;
    ctx.level -= 1;
    ctx.impliedTypeInfo = previousImpliedTypeInfo;
    if (previousImpliedTypeInfo) return `${spacing}[${body}${spacing}]`;
    return `${spacing}${ctx.classNameColor(`${hostValue.typeName}`)} [${body}${spacing}]`;
  } else {
    let body = spacing;
    if (!previousImpliedTypeInfo) body += ctx.classNameColor(hostValue.typeName!) + " ";
    body += "[";
    let i = 0;
    let length = hostValue.values!.length;
    for (; i < length; i++) {
      let value = hostValue.values![i];
      const result = formatters[formatterIndexFor(value.type, HostValueFormatType.Inline)](value, ctx) + ", ";
      if (body.length > 80) {
        break;
      }
      body += result;
    }
    if ((length - i) > 0) body += `... +${length - i} items`;
    body += "]";
    ctx.impliedTypeInfo = previousImpliedTypeInfo;
    // render value
    return body;
  }
}

// Array
formatters[formatterIndexFor(HostValueType.Array, HostValueFormatType.Expanded)] = displayArrayExpanded;
formatters[formatterIndexFor(HostValueType.Array, HostValueFormatType.Inline)] = displayArrayExpanded;
formatters[formatterIndexFor(HostValueType.Array, HostValueFormatType.Key)] = displayClassWithSpacing;
formatters[formatterIndexFor(HostValueType.Array, HostValueFormatType.Value)] = displayArrayExpanded;

// ArrayBuffer
formatters[formatterIndexFor(HostValueType.ArrayBuffer, HostValueFormatType.Expanded)] = displayArrayExpanded;
formatters[formatterIndexFor(HostValueType.ArrayBuffer, HostValueFormatType.Inline)] = displayArrayExpanded;
formatters[formatterIndexFor(HostValueType.ArrayBuffer, HostValueFormatType.Key)] = displayClassWithSpacing;
formatters[formatterIndexFor(HostValueType.ArrayBuffer, HostValueFormatType.Value)] = displayArrayExpanded;

// TypedArray
formatters[formatterIndexFor(HostValueType.TypedArray, HostValueFormatType.Expanded)] = displayArrayExpanded;
formatters[formatterIndexFor(HostValueType.TypedArray, HostValueFormatType.Inline)] = displayArrayExpanded;
formatters[formatterIndexFor(HostValueType.TypedArray, HostValueFormatType.Key)] = displayClassWithSpacing;
formatters[formatterIndexFor(HostValueType.TypedArray, HostValueFormatType.Value)] = displayArrayExpanded;
