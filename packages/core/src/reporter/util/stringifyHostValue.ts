import { HostValue } from "../../util/HostValue";
import { HostValueType } from "@as-pect/assembly/assembly/internal/report/HostValueType";

export function stringifyHostValue(hostValue: HostValue, indent: number): string {
  return traverseHostValue(hostValue, indent);
}

function traverseHostValue(hostValue: HostValue, indent: number, level: number = 0): any {
  switch (hostValue.type) {
    case HostValueType.String: {
      return `${" ".repeat(indent + 2 * level)}${hostValue.negated ? "Not " : ""}"${hostValue.value.toString().replace(/"/g, "\\\"")}"`;
    }
    case HostValueType.Falsy: {
      return `${" ".repeat(indent + 2 * level)}${hostValue.negated ? "Not " : ""}Falsy`;
    }
    case HostValueType.Truthy: {
      return `${" ".repeat(indent + 2 * level)}${hostValue.negated ? "Not " : ""}Truthy`;
    }
    case HostValueType.Finite: {
      return `${" ".repeat(indent + 2 * level)}${hostValue.negated ? "Not " : ""}Finite`;
    }
    case HostValueType.Integer:
    case HostValueType.Float: {
      return `${" ".repeat(indent + 2 * level)}${hostValue.negated ? "Not " : ""}<${hostValue.typeName}>${hostValue.value}`;
    }
  }
}
