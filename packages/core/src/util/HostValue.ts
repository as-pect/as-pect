import { HostValueType } from "@as-pect/assembly/assembly/internal/HostValueType";
import { StringifyHostValueProps, stringifyHostValue } from "./stringifyHostValue";

export class HostValue {
  isManaged: boolean = false;
  isNull: boolean = false;
  keys: HostValue[] | null = null;
  negated: boolean = false;
  nullable: boolean = false;
  offset: number = 0;
  pointer: number = 0;
  signed: boolean = false;
  size: number = 0;
  stack: string = "";
  type: HostValueType = HostValueType.None;
  typeId: number = 0;
  typeName: string | null = null;
  value: number | string = 0;
  values: HostValue[] | null = null;

  stringify(props: Partial<StringifyHostValueProps>): string {
    return stringifyHostValue(this, props);
  }
}
