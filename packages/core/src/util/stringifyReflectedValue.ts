import { ReflectedValue } from "./ReflectedValue";
import { ReflectedValueType } from "@as-pect/assembly/assembly/internal/ReflectedValueType";
import chalk from "chalk";

class StringifyContext {
  public level: number = 0;
  public impliedTypeInfo: boolean = false;

  public seen: WeakSet<ReflectedValue> = new WeakSet<ReflectedValue>();

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

export type StringifyReflectedValueProps = {
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

export function stringifyReflectedValue(
  reflectedValue: ReflectedValue,
  props: Partial<StringifyReflectedValueProps>,
): string {
  const context = new StringifyContext();
  /* istanbul ignore next */
  if (props.keywordFormatter) context.keywordFormatter = props.keywordFormatter;
  /* istanbul ignore next */
  if (props.stringFormatter) context.stringFormatter = props.stringFormatter;
  /* istanbul ignore next */
  if (props.classNameFormatter) context.classNameFormatter = props.classNameFormatter;
  /* istanbul ignore next */
  if (props.numberFormatter) context.numberFormatter = props.numberFormatter;
  /* istanbul ignore next */
  if (typeof props.indent === "number") context.indent = props.indent;
  /* istanbul ignore next */
  if (typeof props.tab === "number") context.tab = props.tab;
  /* istanbul ignore next */
  if (typeof props.maxPropertyCount === "number") context.maxPropertyCount = props.maxPropertyCount;

  return formatters[
    formatterIndexFor(reflectedValue.type, ReflectedValueFormatType.Expanded)
  ](reflectedValue, context);
}

type ReflectedNameTypeFormatter = (
  reflectedValue: ReflectedValue,
  ctx: StringifyContext,
) => string;

const enum ReflectedValueFormatType {
  Expanded = 0,
  Inline = 1,
  Key = 2,
  Value = 3,
}

const formatters: ReflectedNameTypeFormatter[] = [];
/* istanbul ignore next */
const emptyFormatter = () => "";
for (let i = 0; i < 14 * 4; i++) formatters.push(emptyFormatter);

const formatterIndexFor = (
  valueType: ReflectedValueType,
  type: ReflectedValueFormatType,
) => valueType * 4 + type;

const falsyFormatter = (reflectedValue: ReflectedValue) =>
  `${reflectedValue.negated ? "Not " : ""}Falsy`;
formatters[
  formatterIndexFor(ReflectedValueType.Falsy, ReflectedValueFormatType.Expanded)
] = falsyFormatter;

const truthyFormatter = (reflectedValue: ReflectedValue) =>
  `${reflectedValue.negated ? "Not " : ""}Truthy`;
formatters[
  formatterIndexFor(ReflectedValueType.Truthy, ReflectedValueFormatType.Expanded)
] = truthyFormatter;

const finiteFormatter = (reflectedValue: ReflectedValue) =>
  `${reflectedValue.negated ? "Not " : ""}Finite`;
formatters[
  formatterIndexFor(ReflectedValueType.Finite, ReflectedValueFormatType.Expanded)
] = finiteFormatter;

function displayBooleanNoSpacing(
  reflectedValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  return ctx.keywordFormatter(reflectedValue.value === 1 ? "true" : "false");
}

function displayBooleanWithSpacing(
  reflectedValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  return (
    " ".repeat(ctx.indent + ctx.tab * ctx.level) +
    ctx.keywordFormatter(reflectedValue.value === 1 ? "true" : "false")
  );
}

// Booleans
formatters[
  formatterIndexFor(ReflectedValueType.Boolean, ReflectedValueFormatType.Expanded)
] = displayBooleanWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Boolean, ReflectedValueFormatType.Inline)
] = displayBooleanNoSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Boolean, ReflectedValueFormatType.Key)
] = displayBooleanWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Boolean, ReflectedValueFormatType.Value)
] = displayBooleanNoSpacing;

function displayClassNoSpacing(
  reflectedValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  return ctx.classNameFormatter(`[${reflectedValue.typeName}]`);
}

function displayNumberWithSpacing(
  reflectedValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  let numericString = reflectedValue.value.toString();
  if (
    reflectedValue.type === ReflectedValueType.Float &&
    !/\.[0-9]/.test(numericString)
  ) {
    numericString += ".0";
  }
  if (
    ctx.impliedTypeInfo ||
    reflectedValue.typeName === "i32" ||
    reflectedValue.typeName === "f64"
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
    )} ${ctx.classNameFormatter(reflectedValue.typeName!)}`
  );
}

function displayNumberNoSpacing(
  reflectedValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  let numericString = reflectedValue.value.toString();
  if (
    reflectedValue.type === ReflectedValueType.Float &&
    !/\.[0-9]/.test(numericString)
  ) {
    numericString += ".0";
  }
  if (
    ctx.impliedTypeInfo ||
    reflectedValue.typeName === "i32" ||
    reflectedValue.typeName === "f64"
  ) {
    return ctx.numberFormatter(numericString);
  }
  return `${ctx.numberFormatter(numericString)} ${ctx.classNameFormatter(
    `as ${reflectedValue.typeName}`,
  )}`;
}

// Floats
formatters[
  formatterIndexFor(ReflectedValueType.Float, ReflectedValueFormatType.Expanded)
] = displayNumberWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Float, ReflectedValueFormatType.Inline)
] = displayNumberNoSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Float, ReflectedValueFormatType.Key)
] = displayNumberWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Float, ReflectedValueFormatType.Value)
] = displayNumberNoSpacing;

// Integers
formatters[
  formatterIndexFor(ReflectedValueType.Integer, ReflectedValueFormatType.Expanded)
] = displayNumberWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Integer, ReflectedValueFormatType.Inline)
] = displayNumberNoSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Integer, ReflectedValueFormatType.Key)
] = displayNumberWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Integer, ReflectedValueFormatType.Value)
] = displayNumberNoSpacing;

function displayStringNoSpacing(
  reflectedValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  return ctx.stringFormatter(
    `"${reflectedValue.value.toString().replace(/"/g, '\\"')}"`,
  );
}

function displayStringWithSpacing(
  hostValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  return (
    " ".repeat(ctx.indent + ctx.level * ctx.tab) +
    ctx.stringFormatter(`"${hostValue.value.toString().replace(/"/g, '\\"')}"`)
  );
}

function displayNoQuoteStringWithSpacing(
  hostValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  return (
    " ".repeat(ctx.indent + ctx.level * ctx.tab) +
    ctx.stringFormatter(`${hostValue.value.toString().replace(/"/g, '\\"')}`)
  );
}

// Strings
formatters[
  formatterIndexFor(ReflectedValueType.String, ReflectedValueFormatType.Expanded)
] = displayStringWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.String, ReflectedValueFormatType.Inline)
] = displayStringNoSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.String, ReflectedValueFormatType.Key)
] = displayNoQuoteStringWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.String, ReflectedValueFormatType.Value)
] = displayStringNoSpacing;

function displayFunctionExpanded(
  hostValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  return (
    " ".repeat(ctx.indent + ctx.level * ctx.tab) +
    ctx.classNameFormatter(
      `[Function ${hostValue.pointer}: ${hostValue.value.toString()}]`,
    )
  );
}

const displayFuncNoNameNoPointer = (_: ReflectedValue, ctx: StringifyContext) =>
  ctx.classNameFormatter("[Function]");

// Functions
formatters[
  formatterIndexFor(ReflectedValueType.Function, ReflectedValueFormatType.Expanded)
] = displayFunctionExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.Function, ReflectedValueFormatType.Inline)
] = displayFuncNoNameNoPointer;
formatters[
  formatterIndexFor(ReflectedValueType.Function, ReflectedValueFormatType.Key)
] = displayFunctionExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.Function, ReflectedValueFormatType.Value)
] = displayFunctionExpanded;

function displayClassExpanded(
  hostValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  const spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
  if (ctx.seen.has(hostValue))
    return spacing + ctx.classNameFormatter("[Circular Reference]");

  const previousImpliedTypeInfo = ctx.impliedTypeInfo;
  ctx.impliedTypeInfo = false;
  if (hostValue.isNull) {
    if (previousImpliedTypeInfo) {
      return `${spacing}null`;
    } else {
      return `${spacing}${ctx.classNameFormatter(`<${hostValue.typeName}>`)}null`;
    }
  }

  ctx.seen.add(hostValue);
  let body = "\n";
  ctx.level += 1;
  const length = hostValue.keys!.length;
  const displayCount = Math.min(length, ctx.maxPropertyCount);
  for (let i = 0; i < displayCount; i++) {
    const key = hostValue.keys![i];
    const keyString = formatters[
      formatterIndexFor(key.type, ReflectedValueFormatType.Key)
    ](key, ctx);
    const value = hostValue.values![i];
    const valueString =
      ctx.level < ctx.maxExpandLevel
        ? // render expanded value, but trim the whitespace on the left side
          formatters[
            formatterIndexFor(value.type, ReflectedValueFormatType.Expanded)
          ](value, ctx).trimLeft()
        : // render value
          formatters[formatterIndexFor(value.type, ReflectedValueFormatType.Inline)](
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
  if (previousImpliedTypeInfo) {
    return `${spacing}{${body}${spacing}}`;
  } else {
    return `${spacing}${ctx.classNameFormatter(
      hostValue.typeName!,
    )} {${body}${spacing}}`;
  }
}

function displayClassWithSpacing(
  hostValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  return `${" ".repeat(
    ctx.level * ctx.tab + ctx.indent,
  )}${ctx.classNameFormatter(`[${hostValue.typeName}]`)}`;
}

// Classes
formatters[
  formatterIndexFor(ReflectedValueType.Class, ReflectedValueFormatType.Expanded)
] = displayClassExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.Class, ReflectedValueFormatType.Inline)
] = displayClassNoSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Class, ReflectedValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Class, ReflectedValueFormatType.Value)
] = displayClassExpanded;

function displayArrayExpanded(
  hostValue: ReflectedValue,
  ctx: StringifyContext,
): string {
  const spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
  if (ctx.seen.has(hostValue))
    return spacing + ctx.classNameFormatter("[Circular Reference]");

  ctx.seen.add(hostValue);
  const previousImpliedTypeInfo = ctx.impliedTypeInfo;
  ctx.impliedTypeInfo = true;

  if (ctx.level < ctx.maxExpandLevel && hostValue.type === ReflectedValueType.Array) {
    // expanded only for arrays
    let body = "\n";
    ctx.level += 1;
    const length = Math.min(hostValue.values!.length, ctx.maxPropertyCount);
    for (let i = 0; i < length && i < ctx.maxPropertyCount; i++) {
      const value = hostValue.values![i];

      // render expanded value, but trim the whitespace on the left side
      const valueString = formatters[
        formatterIndexFor(value.type, ReflectedValueFormatType.Expanded)
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
        formatters[formatterIndexFor(value.type, ReflectedValueFormatType.Inline)](
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
  formatterIndexFor(ReflectedValueType.Array, ReflectedValueFormatType.Expanded)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.Array, ReflectedValueFormatType.Inline)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.Array, ReflectedValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Array, ReflectedValueFormatType.Value)
] = displayArrayExpanded;

// ArrayBuffer
formatters[
  formatterIndexFor(ReflectedValueType.ArrayBuffer, ReflectedValueFormatType.Expanded)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.ArrayBuffer, ReflectedValueFormatType.Inline)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.ArrayBuffer, ReflectedValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.ArrayBuffer, ReflectedValueFormatType.Value)
] = displayArrayExpanded;

// TypedArray
formatters[
  formatterIndexFor(ReflectedValueType.TypedArray, ReflectedValueFormatType.Expanded)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.TypedArray, ReflectedValueFormatType.Inline)
] = displayArrayExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.TypedArray, ReflectedValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.TypedArray, ReflectedValueFormatType.Value)
] = displayArrayExpanded;

// Map
formatters[
  formatterIndexFor(ReflectedValueType.Map, ReflectedValueFormatType.Expanded)
] = displayClassExpanded;
formatters[
  formatterIndexFor(ReflectedValueType.Map, ReflectedValueFormatType.Inline)
] = displayClassNoSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Map, ReflectedValueFormatType.Key)
] = displayClassWithSpacing;
formatters[
  formatterIndexFor(ReflectedValueType.Map, ReflectedValueFormatType.Value)
] = displayClassExpanded;