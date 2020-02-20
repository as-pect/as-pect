import { HostValue } from "./HostValue";
export declare type StringifyHostValueProps = {
    keywordColor: (prop: string) => string;
    stringColor: (prop: string) => string;
    classNameColor: (prop: string) => string;
    numberColor: (prop: string) => string;
    indent: number;
    tab: number;
    maxPropertyCount: number;
};
export declare function stringifyHostValue(hostValue: HostValue, props: Partial<StringifyHostValueProps>): string;
