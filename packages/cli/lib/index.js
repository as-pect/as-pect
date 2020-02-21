(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./util/CommandLineArg", "./util/CommandLineArg"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var CommandLineArg_1 = require("./util/CommandLineArg");
    /**
     * @ignore
     *
     * Package version is always displayed, either for version or cli ascii art.
     */
    var pkg = require("../package.json");
    /**
     * This is the command line package version.
     */
    exports.version = pkg.version;
    var CommandLineArg_2 = require("./util/CommandLineArg");
    exports.parse = CommandLineArg_2.parse;
    exports.defaultCliArgs = CommandLineArg_2.defaultCliArgs;
    /**
     * This is the cli entry point and expects an array of arguments from the command line.
     *
     * @param {string[]} args - The arguments from the command line
     */
    function asp(args) {
        var splitIndex = args.indexOf("--");
        var hasCompilerArgs = splitIndex !== -1;
        var aspectArgs = hasCompilerArgs
            ? args.slice(0, splitIndex)
            : args;
        var compilerArgs = hasCompilerArgs
            ? args.slice(splitIndex + 1)
            : [];
        // parse the arguments
        var cliOptions = CommandLineArg_1.parse(aspectArgs);
        // Skip ascii art if asked for the version
        if (!cliOptions.version && !cliOptions.nologo) {
            var printAsciiArt = require("./util/asciiArt").printAsciiArt;
            printAsciiArt(pkg.version);
        }
        if (cliOptions.types) {
            var types = require("./types").types;
            types();
        }
        else if (cliOptions.init) {
            var init = require("./init").init;
            // init script
            init();
        }
        else if (cliOptions.version) {
            // display the version
            console.log(pkg.version);
        }
        else if (cliOptions.help) {
            // display the help file
            var help = require("./help").help;
            help();
        }
        else if (cliOptions.portable) {
            var portable = require("./portable").portable;
            portable();
        }
        else {
            // run the compiler and test suite
            var run = require("./run").run;
            run(cliOptions, compilerArgs);
        }
    }
    exports.asp = asp;
    if (typeof require != "undefined" && require.main == module) {
        asp(process.argv.slice(2));
    }
});
//# sourceMappingURL=index.js.map