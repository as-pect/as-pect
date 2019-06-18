import { IPerformanceConfiguration } from "../../util/IPerformanceConfiguration";
export declare type argType = "b" | "s" | "S" | "I" | "i" | "F" | "f";
export declare type ArgValue = string | number | boolean | string[] | number;
export interface Alias {
    name: string;
    long?: true;
}
export interface ICommandLineArg {
    description: string | string[];
    type: argType;
    alias?: Alias | Alias[];
    value: ArgValue;
    options?: [string, string][];
    parent?: string;
}
export interface Options {
    init: boolean;
    config: string;
    version: boolean;
    help: boolean;
    types: boolean;
    file: string;
    group: string;
    test: string;
    outputBinary: boolean;
    norun: boolean;
    nortrace: boolean;
    reporter: string;
    performance: IPerformanceConfiguration;
    compiler: string;
    /** Tracks changes made by the cli options */
    changed: Set<string>;
}
export declare class CommandLineArg implements ICommandLineArg {
    name: string;
    description: string | string[];
    type: argType;
    value: ArgValue;
    alias?: Alias | Alias[] | undefined;
    options?: [string, string][] | undefined;
    parent?: string;
    constructor(name: string, command: ICommandLineArg);
    parse(data: string): ArgValue;
}
export interface CommandLineArgs {
    [key: string]: ICommandLineArg;
}
export declare type ArgMap = Map<string, CommandLineArg>;
export declare function makeArgMap(args?: CommandLineArgs): ArgMap;
export declare const Args: Map<string, CommandLineArg>;
export declare function parse(commands: string[], args?: ArgMap): Options;
//# sourceMappingURL=CommandLineArg.d.ts.map