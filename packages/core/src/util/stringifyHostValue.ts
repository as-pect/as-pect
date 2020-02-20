import { HostValue } from "./HostValue";
import { HostValueType } from "@as-pect/assembly/assembly/internal/HostValueType";
import chalk from "chalk";

class StringifyContext {
  public level: number = 0;
  public impliedTypeInfo: boolean = false;

  public seen: WeakSet<HostValue> = new WeakSet<HostValue>();

  public keywordFormatter: (prop: string) => string = chalk.yellow;
  public stringFormatter: (prop: string) => string = chalk.cyan;
  public classNameFormatter: (prop: string) => string = chalk.green;
  public numberFormatter: (prop: string) => string = chalk.white;

  public indent: number = 0;
  public maxPropertyCount: number = 50;
  public maxLineLength: number = 80;
  public maxExpandLevel: number = 3;
  public tab: number = 4;
}

export type StringifyHostValueProps = {
  keywordFormatter: (prop: string) => string;
  stringFormatter: (prop: string) => string;
  classNameFormatter: (prop: string) => string;
  numberFormatter: (prop: string) => string;
  indent: number;
  tab: number;
  maxPropertyCount: number;
  maxLineLength: number;
  maxExpandLevel: number;
};

export function stringifyHostValue(
  hostValue: HostValue,
  props: Partial<StringifyHostValueProps>,
): string {
  const context = new StringifyContext();
  context.keywordFormatter = props.keywordFormatter ?? context.keywordFormatter;
  context.stringFormatter = props.stringFormatter ?? context.stringFormatter;
  context.classNameFormatter =
    props.classNameFormatter ?? context.classNameFormatter;
  context.numberFormatter = props.numberFormatter ?? context.numberFormatter;
  context.indent = props.indent ?? context.indent;
  context.tab = props.tab ?? context.tab;
  context.maxPropertyCount = props.maxPropertyCount ?? context.maxPropertyCount;

  return formatters[
    formatterIndexFor(hostValue.type, HostValueFormatType.Expanded)
  ](hostValue, context);
}

type HostNameTypeFormatter = (
  hostValue: HostValue,
  ctx: StringifyContext,
) => string;

const enum HostValueFormatType {
  Expanded = 0,
  Inline = 1,
  Key = 2,
  Value = 3,
}

const formatters: HostNameTypeFormatter[] = [];
const emptyFormatter = () => "";
for (let i = 0; i < 14 * 4; i++) formatters.push(emptyFormatter);

const formatterIndexFor = (
  valueType: HostValueType,
  type: HostValueFormatType,
) => valueType * 4 + type;

const falsyFormatter = (hostValue: HostValue) =>
  `${hostValue.negated ? "Not " : ""}Falsy`;
formatters[
  formatterIndexFor(HostValueType.Falsy, HostValueFormatType.Expanded)
] = falsyFormatter;

const truthyFormatter = (hostValue: HostValue) =>
  `${hostValue.negated ? "Not " : ""}Truthy`;
formatters[
  formatterIndexFor(HostValueType.Truthy, HostValueFormatType.Expanded)
] = truthyFormatter;

const finiteFormatter = (hostValue: HostValue) =>
  `${hostValue.negated ? "Not " : ""}Finite`;
formatters[
  formatterIndexFor(HostValueType.Finite, HostValueFormatType.Expanded)
] = finiteFormatter;

function displayBooleanNoSpacing(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  return ctx.keywordFormatter(hostValue.value === 1 ? "true" : "false");
}

function displayBooleanWithSpacing(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  return (
    " ".repeat(ctx.indent + ctx.tab * ctx.level) +
    ctx.keywordFormatter(hostValue.value === 1 ? "true" : "false")
  );
}

// Booleans
formatters[
  formatterIndexFor(HostValueType.Boolean, HostValueFormatType.Expanded)
] = displayBooleanWithSpacing;
formatters[
  formatterIndexFor(HostValueType.Boolean, HostValueFormatType.Inline)
] = displayBooleanNoSpacing;
formatters[
  formatterIndexFor(HostValueType.Boolean, HostValueFormatType.Key)
] = displayBooleanWithSpacing;
formatters[
  formatterIndexFor(HostValueType.Boolean, HostValueFormatType.Value)
] = displayBooleanNoSpacing;

function displayClassNoSpacing(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  return ctx.classNameFormatter(`[${hostValue.typeName}]`);
}

function displayNumberWithSpacing(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  let numericString = hostValue.value.toString();
  if (
    hostValue.type === HostValueType.Float &&
    !/\.[0-9]/.test(numericString)
  ) {
    numericString += ".0";
  }
  if (
    ctx.impliedTypeInfo ||
    hostValue.typeName === "i32" ||
    hostValue.typeName === "f64"
  ) {
    return (
      " ".repeat(ctx.indent + ctx.level * ctx.tab) +
      ctx.numberFormatter(numericString)
    );
  }
  return (
    " ".repeat(ctx.indent + ctx.level * ctx.tab) +
    `${ctx.numberFormatter(numericString)} ${ctx.keywordFormatter(
      "as",
    )} ${ctx.classNameFormatter(hostValue.typeName!)}`
  );
}

function displayNumberNoSpacing(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  let numericString = hostValue.value.toString();
  if (
    hostValue.type === HostValueType.Float &&
    !/\.[0-9]/.test(numericString)
  ) {
    numericString += ".0";
  }
  if (
    ctx.impliedTypeInfo ||
    hostValue.typeName === "i32" ||
    hostValue.typeName === "f64"
  ) {
    return ctx.numberFormatter(numericString);
  }
  return `${ctx.numberFormatter(numericString)} ${ctx.classNameFormatter(
    `as ${hostValue.typeName}`,
  )}`;
}

// Floats
formatters[
  formatterIndexFor(HostValueType.Float, HostValueFormatType.Expanded)
] = displayNumberWithSpacing;
formatters[
  formatterIndexFor(HostValueType.Float, HostValueFormatType.Inline)
] = displayNumberNoSpacing;
formatters[
  formatterIndexFor(HostValueType.Float, HostValueFormatType.Key)
] = displayNumberWithSpacing;
formatters[
  formatterIndexFor(HostValueType.Float, HostValueFormatType.Value)
] = displayNumberNoSpacing;

// Integers
formatters[
  formatterIndexFor(HostValueType.Integer, HostValueFormatType.Expanded)
] = displayNumberWithSpacing;
formatters[
  formatterIndexFor(HostValueType.Integer, HostValueFormatType.Inline)
] = displayNumberNoSpacing;
formatters[
  formatterIndexFor(HostValueType.Integer, HostValueFormatType.Key)
] = displayNumberWithSpacing;
formatters[
  formatterIndexFor(HostValueType.Integer, HostValueFormatType.Value)
] = displayNumberNoSpacing;

function displayStringNoSpacing(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  return ctx.stringFormatter(
    `"${hostValue.value.toString().replace(/"/g, '\\"')}"`,
  );
}

function displayStringWithSpacing(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  return (
    " ".repeat(ctx.indent + ctx.level * ctx.tab) +
    ctx.stringFormatter(`"${hostValue.value.toString().replace(/"/g, '\\"')}"`)
  );
}

function displayNoQuoteStringWithSpacing(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  return (
    " ".repeat(ctx.indent + ctx.level * ctx.tab) +
    ctx.stringFormatter(`${hostValue.value.toString().replace(/"/g, '\\"')}`)
  );
}

// Strings
formatters[
  formatterIndexFor(HostValueType.String, HostValueFormatType.Expanded)
] = displayStringWithSpacing;
formatters[
  formatterIndexFor(HostValueType.String, HostValueFormatType.Inline)
] = displayStringNoSpacing;
formatters[
  formatterIndexFor(HostValueType.String, HostValueFormatType.Key)
] = displayNoQuoteStringWithSpacing;
formatters[
  formatterIndexFor(HostValueType.String, HostValueFormatType.Value)
] = displayStringNoSpacing;

function displayFunctionExpanded(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  return (
    " ".repeat(ctx.indent + ctx.level * ctx.tab) +
    ctx.classNameFormatter(
      `[Function ${hostValue.pointer}: ${hostValue.value.toString()}]`,
    )
  );
}

const displayFuncNoNameNoPointer = (_: HostValue, ctx: StringifyContext) =>
  ctx.classNameFormatter("[Function]");

// Functions
formatters[
  formatterIndexFor(HostValueType.Function, HostValueFormatType.Expanded)
] = displayFunctionExpanded;
formatters[
  formatterIndexFor(HostValueType.Function, HostValueFormatType.Inline)
] = displayFuncNoNameNoPointer;
formatters[
  formatterIndexFor(HostValueType.Function, HostValueFormatType.Key)
] = displayFunctionExpanded;
formatters[
  formatterIndexFor(HostValueType.Function, HostValueFormatType.Value)
] = displayFunctionExpanded;

function displayClassExpanded(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  const spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
  if (ctx.seen.has(hostValue))
    return spacing + ctx.classNameFormatter("[Circular Reference]");
  ctx.impliedTypeInfo = false;
  const previousImpliedTypeInfo = ctx.impliedTypeInfo;
  if (hostValue.isNull) {
    if (previousImpliedTypeInfo) return `${spacing}null`;
    return `${spacing}${ctx.classNameFormatter(`<${hostValue.typeName}>`)}null`;
  }

  ctx.seen.add(hostValue);
  let body = "\n";
  ctx.level += 1;
  const length = hostValue.keys!.length;
  const displayCount = Math.min(length, ctx.maxPropertyCount);
  for (let i = 0; i < displayCount; i++) {
    const key = hostValue.keys![i];
    const keyString = formatters[
      formatterIndexFor(key.type, HostValueFormatType.Key)
    ](key, ctx);
    const value = hostValue.values![i];
    const valueString =
      ctx.level < ctx.maxExpandLevel
        ? // render expanded value, but trim the whitespace on the left side
          formatters[
            formatterIndexFor(value.type, HostValueFormatType.Expanded)
          ](value, ctx).trimLeft()
        : // render value
          formatters[formatterIndexFor(value.type, HostValueFormatType.Inline)](
            value,
            ctx,
          );

    if (i === displayCount - 1) {
      // remove last trailing comma
      body += `${keyString}: ${valueString}\n`;
    } else {
      body += `${keyString}: ${valueString},\n`;
    }
  }

  if (length > ctx.maxPropertyCount)
    body += `${spacing}... +${length - ctx.maxPropertyCount} properties`;
  ctx.level -= 1;
  ctx.impliedTypeInfo = previousImpliedTypeInfo;
  ctx.seen.delete(hostValue);
  if (previousImpliedTypeInfo) return `${spacing}{${body}${spacing}}`;
  return `${spacing}${ctx.classNameFormatter(
    hostValue.typeName!,
  )} {${body}${spacing}}`;
}

function displayClassWithSpacing(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  return `${" ".repeat(
    ctx.level * ctx.tab + ctx.indent,
  )}${ctx.classNameFormatter(`[${hostValue.typeName}]`)}`;
}

// Classes
formatters[
  formatterIndexFor(HostValueType.Class, HostValueFormatType.Expanded)
] = displayClassExpanded;
formatters[
  formatterIndexFor(HostValueType.Class, HostValueFormatType.Inline)
] = displayClassNoSpacing;
formatters[
  formatterIndexFor(HostValueType.Class, HostValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(HostValueType.Class, HostValueFormatType.Value)
] = displayClassExpanded;

function displayArrayExpanded(
  hostValue: HostValue,
  ctx: StringifyContext,
): string {
  const spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
  if (ctx.seen.has(hostValue))
    return spacing + ctx.classNameFormatter("[Circular Reference]");

  ctx.seen.add(hostValue);
  const previousImpliedTypeInfo = ctx.impliedTypeInfo;
  ctx.impliedTypeInfo = true;

  if (ctx.level < ctx.maxExpandLevel && hostValue.type === HostValueType.Array) {
    // expanded only for arrays
    let body = "\n";
    ctx.level += 1;
    const length = Math.min(hostValue.values!.length, ctx.maxPropertyCount);
    for (let i = 0; i < length && i < ctx.maxPropertyCount; i++) {
      const value = hostValue.values![i];

      // render expanded value, but trim the whitespace on the left side
      const valueString = formatters[
        formatterIndexFor(value.type, HostValueFormatType.Expanded)
      ](value, ctx);
      if (i === length - 1) {
        // remove trailing comma
        body += `${valueString}\n`;
      } else {
        body += `${valueString},\n`;
      }
    }
    if (length >= ctx.maxPropertyCount)
      body += `${spacing}... +${length - ctx.maxPropertyCount} values`;
    ctx.level -= 1;
    ctx.impliedTypeInfo = previousImpliedTypeInfo;
    ctx.seen.delete(hostValue);
    if (previousImpliedTypeInfo) return `${spacing}[${body}${spacing}]`;
    return `${spacing}${ctx.classNameFormatter(
      `${hostValue.typeName}`,
    )} [${body}${spacing}]`;
  } else {
    // inline
    let body = spacing;
    if (!previousImpliedTypeInfo)
      body += ctx.classNameFormatter(hostValue.typeName!) + " ";

    body += "[";
    let i = 0;
    let length = hostValue.values!.length;
    for (; i < length; i++) {
      let value = hostValue.values![i];
      const result =
        formatters[formatterIndexFor(value.type, HostValueFormatType.Inline)](
          value,
          ctx,
        ) + ", ";
      if (body.length > ctx.maxLineLength) {
        break;
      }
      body += result;
    }
    if (length - i > 0) body += `... +${length - i} items`;
    body += "]";
    ctx.impliedTypeInfo = previousImpliedTypeInfo;
    ctx.seen.delete(hostValue);
    // render value
    return body;
  }
}

// Array
formatters[
  formatterIndexFor(HostValueType.Array, HostValueFormatType.Expanded)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(HostValueType.Array, HostValueFormatType.Inline)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(HostValueType.Array, HostValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(HostValueType.Array, HostValueFormatType.Value)
] = displayArrayExpanded;

// ArrayBuffer
formatters[
  formatterIndexFor(HostValueType.ArrayBuffer, HostValueFormatType.Expanded)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(HostValueType.ArrayBuffer, HostValueFormatType.Inline)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(HostValueType.ArrayBuffer, HostValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(HostValueType.ArrayBuffer, HostValueFormatType.Value)
] = displayArrayExpanded;

// TypedArray
formatters[
  formatterIndexFor(HostValueType.TypedArray, HostValueFormatType.Expanded)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(HostValueType.TypedArray, HostValueFormatType.Inline)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(HostValueType.TypedArray, HostValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(HostValueType.TypedArray, HostValueFormatType.Value)
] = displayArrayExpanded;

// Map
formatters[
  formatterIndexFor(HostValueType.Map, HostValueFormatType.Expanded)
] = displayClassExpanded;
formatters[
  formatterIndexFor(HostValueType.Map, HostValueFormatType.Inline)
] = displayClassNoSpacing;
formatters[
  formatterIndexFor(HostValueType.Map, HostValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(HostValueType.Map, HostValueFormatType.Value)
] = displayClassExpanded;