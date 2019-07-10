declare module "help" {
    /**
     * This method prints the help text.
     */
    export function help(): void;
}
declare module "util/strings" {
    /**
     * Capitalize a word.
     *
     * @param {string} word - The word to be capitalized.
     */
    export function capitalize(word: string): string;
    /**
     * CamelCase a single string. Usually used with `dash-cased` words.
     *
     * @param {string} str - The string to be camelCased.
     * @param {string} from - The string seperator.
     */
    export function toCamelCase(str: string, from?: string): string;
}
declare module "util/CommandLineArg" {
    import { IPerformanceConfiguration } from "../../core/src/util/IPerformanceConfiguration";
    export type argType = "b" | "bs" | "s" | "S" | "I" | "i" | "F" | "f";
    export type ArgValue = string | number | boolean | string[] | number;
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
        portable: boolean;
        compiler: string;
        csv: string | boolean;
        json: string | boolean;
        verbose: string | boolean;
        summary: string | boolean;
        /** Tracks changes made by the cli options */
        changed: Set<string>;
        workers: number;
    }
    export class CommandLineArg implements ICommandLineArg {
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
    export type ArgMap = Map<string, CommandLineArg>;
    export function makeArgMap(args?: CommandLineArgs): ArgMap;
    export const Args: Map<string, CommandLineArg>;
    export function parse(commands: string[], args?: ArgMap): Options;
}
declare module "index" {
    /**
     * This is the cli entry point and expects an array of arguments from the command line.
     *
     * @param {string[]} args - The arguments from the command line
     */
    export function asp(args: string[]): void;
}
declare module "init" {
    /**
     * This method initializes a new test project. It is opinionated and reflects the needs of 99% of
     * AssemblyScript developers following the standard way of creating a new AssemblyScript project.
     */
    export function init(): void;
}
declare module "portable" {
    /**
     * This method creates a portable types file to the current testing directory located at
     * `./assembly/__tests__/` for the current project.
     */
    export function portable(): void;
}
declare module "util/collectReporter" {
    import { TestReporter } from "@as-pect/core";
    import { Options } from "util/CommandLineArg";
    /**
     * This method inspects the command line arguments and returns the corresponding TestReporter.
     *
     * @param {Options} cliOptions - The command line arguments.
     */
    export function collectReporter(cliOptions: Options): TestReporter;
}
declare module "util/getTestEntryFiles" {
    import { Options } from "util/CommandLineArg";
    /**
     * This method returns a `Set<string>` of entry files for the compiler to compile.
     *
     * @param {Options} cliOptions - The command line arguments.
     * @param {string[]} include - An array of globs provided by the configuration.
     * @param {RegExp[]} disclude - An array of RegExp provided by the configuration.
     */
    export function getTestEntryFiles(cliOptions: Options, include: string[], disclude: RegExp[]): Set<string>;
}
declare module "util/writeFile" {
    /**
     * This method promisifies the fs.writeFile function call, and is compatible with node 10.
     *
     * @param {string} file - The file location to write to.
     * @param {Uint8Array} contents - The file contents to write to the disk.
     */
    export function writeFile(file: string, contents: Uint8Array): Promise<void>;
}
declare module "worklets/ICommand" {
    export interface ICommand {
        type: string;
        props: any;
    }
}
declare module "run" {
    import { Options } from "util/CommandLineArg";
    /**
     * This method actually runs the test suites in sequential order synchronously.
     *
     * @param {Options} cliOptions - The command line arguments.
     * @param {string[]} compilerArgs - The `asc` compiler arguments.
     */
    export function run(cliOptions: Options, compilerArgs: string[]): void;
}
declare module "types" {
    /**
     * This method creates a types file to the current testing directory located at
     * `./assembly/__tests__/` for the current project.
     */
    export function types(): void;
}
declare module "util/asciiArt" {
    export function printAsciiArt(version: string): void;
}
declare module "worklets/compiler" { }
//# sourceMappingURL=as-pect.cli.amd.d.ts.map