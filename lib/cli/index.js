var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "chalk", "path", "yargs-parser", "./types", "./init", "./help", "./run"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
    var path_1 = __importDefault(require("path"));
    var yargs_parser_1 = __importDefault(require("yargs-parser"));
    // import { TestRunner } from "./test/TestRunner";
    var types_1 = require("./types");
    var init_1 = require("./init");
    var help_1 = require("./help");
    var run_1 = require("./run");
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
        var yargs = {
            argv: yargs_parser_1.default(aspectArgs),
        };
        // Skip ascii art if asked for the version
        if (!(yargs.argv.v || yargs.argv.version)) {
            console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bold.bgWhite.black ", "       ___   _____                       __    \n      /   | / ___/      ____  ___  _____/ /_   \n     / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/   \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_     \n   /_/  |_/____/     / .___/\\___/\\___/\\__/     \n                    /_/                        }\n\n  \u26A1AS-pect\u26A1 Test suite runner {bgGreenBright.black [", "]}\n  "], ["{bold.bgWhite.black ",
                "       ___   _____                       __    \n      /   | / ___/      ____  ___  _____/ /_   \n     / /| | \\\\__ \\\\______/ __ \\\\/ _ \\\\/ ___/ __/   \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_     \n   /_/  |_/____/     / .___/\\\\___/\\\\___/\\\\__/     \n                    /_/                        }\n\n  \u26A1AS-pect\u26A1 Test suite runner {bgGreenBright.black [", "]}\n  "])), "", pkg.version));
        }
        var assemblyFolder = path_1.default.join(process.cwd(), "assembly");
        var testFolder = path_1.default.join(assemblyFolder, "__tests__");
        var typesFileSource = path_1.default.join(__dirname, "../../assembly/__tests__/as-pect.d.ts");
        var typesFile = path_1.default.join(testFolder, "as-pect.d.ts");
        if (yargs.argv.t || yargs.argv.types) {
            types_1.types(assemblyFolder, testFolder, typesFile, typesFileSource);
        }
        else if (yargs.argv.i || yargs.argv.init) {
            // init script
            init_1.init(assemblyFolder, testFolder, typesFile, typesFileSource);
        }
        else if (yargs.argv.v || yargs.argv.version) { // display the version
            console.log(pkg.version);
        }
        else if (yargs.argv.help || yargs.argv.h) { // display the help file
            help_1.help();
        }
        else { // run the compiler and test suite
            run_1.run(yargs, compilerArgs);
        }
    }
    exports.asp = asp;
    var templateObject_1;
});
//# sourceMappingURL=index.js.map