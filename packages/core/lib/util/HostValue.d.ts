import { HostValueType } from "@as-pect/assembly/assembly/internal/HostValueType";
import { StringifyHostValueProps } from "./stringifyHostValue";
export declare class HostValue {
    isManaged: boolean;
    isNull: boolean;
    keys: HostValue[] | null;
    negated: boolean;
    nullable: boolean;
    offset: number;
    pointer: number;
    signed: boolean;
    size: number;
    stack: string;
    type: HostValueType;
    typeId: number;
    typeName: string | null;
    value: number | string;
    values: HostValue[] | null;
    stringify(props: Partial<StringifyHostValueProps>): string;
}
