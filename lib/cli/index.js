var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "path", "./util/CommandLineArg", "./util/asciiArt"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var path_1 = __importDefault(require("path"));
    var CommandLineArg_1 = require("./util/CommandLineArg");
    var asciiArt_1 = require("./util/asciiArt");
    /** Package version is always displayed, either for version or cli ascii art. */
    var pkg = require("../../package.json");
    /**
     * This is the cli entry point and expects an array of arguments from the command line.
     *
     * @param {string[]} args - The arguments from the command line
     */
    function asp(args) {
        var hasCompilerArgs = args.includes("--");
        var aspectArgs = hasCompilerArgs
            ? args.slice(0, args.indexOf("--"))
            : args;
        var compilerArgs = hasCompilerArgs
            ? args.slice(args.indexOf("--") + 1)
            : [];
        // parse the arguments
        var yargs = CommandLineArg_1.parse(aspectArgs);
        // Skip ascii art if asked for the version
        if (!yargs.version) {
            asciiArt_1.printAsciiArt(pkg.version);
        }
        var assemblyFolder = path_1.default.join(process.cwd(), "assembly");
        var testFolder = path_1.default.join(assemblyFolder, "__tests__");
        var typesFileSource = path_1.default.join(__dirname, "../../assembly/__tests__/as-pect.d.ts");
        var typesFile = path_1.default.join(testFolder, "as-pect.d.ts");
        if (yargs.types) {
            var types = require("./types").types;
            types(assemblyFolder, testFolder, typesFile, typesFileSource);
        }
        else if (yargs.init) {
            var init = require("./init").init;
            // init script
            init(assemblyFolder, testFolder, typesFile, typesFileSource);
        }
        else if (yargs.version) { // display the version
            console.log(pkg.version);
        }
        else if (yargs.help) { // display the help file
            var help = require("./help").help;
            help();
        }
        else { // run the compiler and test suite
            var run = require("./run").run;
            run(yargs, compilerArgs);
        }
    }
    exports.asp = asp;
    if (typeof require != 'undefined' && require.main == module) {
        asp(process.argv.slice(2));
    }
});
//# sourceMappingURL=index.js.map