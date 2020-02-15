import { HostValueType } from "@as-pect/assembly/assembly/internal/report/HostValueType";
export declare class HostValue {
    type: HostValueType;
    typeName: string | null;
    pointer: number;
    typeId: number;
    keys: HostValue[] | null;
    values: HostValue[] | null;
    offset: number;
    value: number | string;
    isNull: boolean;
    nullable: boolean;
    size: number;
    signed: boolean;
    stack: string;
}
