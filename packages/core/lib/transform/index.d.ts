/// <reference types="assemblyscript/dist/assemblyscript" />
import { Parser } from "./assemblyscript";
declare const _default: {
    new (): {
        /**
         * This method results in a pure AST transform that inserts a strictEquals member
         * into each ClassDeclaration.
         *
         * @param {Parser} parser - The AssemblyScript parser.
         */
        afterParse(parser: Parser): void;
        readonly program: import("assemblyscript/src/program").Program;
        readonly baseDir: string;
        readonly stdout: import("assemblyscript/cli/asc").OutputStream;
        readonly stderr: import("assemblyscript/cli/asc").OutputStream;
        readonly log: {
            (message?: any, ...optionalParams: any[]): void;
            (message?: any, ...optionalParams: any[]): void;
        };
        writeFile(filename: string, contents: string | Uint8Array, baseDir: string): boolean;
        readFile(filename: string, baseDir: string): string | null;
        listFiles(dirname: string, baseDir: string): string[] | null;
        afterCompile?(module: import("assemblyscript/src/module").Module): void;
    };
};
export = _default;
//# sourceMappingURL=index.d.ts.map