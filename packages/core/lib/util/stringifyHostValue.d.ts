import { HostValue } from "./HostValue";
export declare type StringifyHostValueProps = {
    keywordFormatter: (prop: string) => string;
    stringFormatter: (prop: string) => string;
    classNameFormatter: (prop: string) => string;
    numberFormatter: (prop: string) => string;
    indent: number;
    tab: number;
    maxPropertyCount: number;
    maxLineLength: number;
};
export declare function stringifyHostValue(hostValue: HostValue, props: Partial<StringifyHostValueProps>): string;
