import { HostValueType } from "@as-pect/assembly/assembly/internal/HostValueType";

export class HostValue {
  type: HostValueType = HostValueType.None;
  typeName: string | null = null;
  pointer: number = 0;
  typeId: number = 0;
  keys: HostValue[] | null = null;
  values: HostValue[] | null = null;
  offset: number = 0;
  value: number | string = 0;
  isNull: boolean = false;
  nullable: boolean = false;
  size: number = 0;
  signed: boolean = false;
  stack: string = "";
  negated: boolean = false;
}
