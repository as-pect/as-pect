import { HostValue } from "../../util/HostValue";
import { HostValueType } from "@as-pect/assembly/assembly/internal/HostValueType";

class StringifyHostValueContext {
  public level: number = 0;
  public constructor(
    public indent: number,
  ) {}
}

export function stringifyHostValue(hostValue: HostValue, indent: number): string {
  return traverseHostValue(hostValue, new StringifyHostValueContext(indent));
}

function traverseHostValue(hostValue: HostValue, ctx: StringifyHostValueContext): any {
  switch (hostValue.type) {
    case HostValueType.String: {
      return `${" ".repeat(ctx.indent + 2 * ctx.level)}${hostValue.negated ? "Not " : ""}"${hostValue.value.toString().replace(/"/g, "\\\"")}"`;
    }
    case HostValueType.Falsy: {
      return `${" ".repeat(ctx.indent + 2 * ctx.level)}${hostValue.negated ? "Not " : ""}Falsy`;
    }
    case HostValueType.Truthy: {
      return `${" ".repeat(ctx.indent + 2 * ctx.level)}${hostValue.negated ? "Not " : ""}Truthy`;
    }
    case HostValueType.Finite: {
      return `${" ".repeat(ctx.indent + 2 * ctx.level)}${hostValue.negated ? "Not " : ""}Finite`;
    }
    case HostValueType.Integer:
    case HostValueType.Float: {
      return `${" ".repeat(ctx.indent + 2 * ctx.level)}${hostValue.negated ? "Not " : ""}<${hostValue.typeName}>${hostValue.value}`;
    }
  }
}
