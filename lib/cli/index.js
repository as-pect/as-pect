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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvY2xpL2luZGV4LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7O0lBQUEsOENBQXdCO0lBQ3hCLHdEQUE4QztJQUM5Qyw0Q0FBZ0Q7SUFFaEQsZ0ZBQWdGO0lBQ2hGLElBQU0sR0FBRyxHQUFHLE9BQU8sQ0FBQyxvQkFBb0IsQ0FBQyxDQUFDO0lBRTFDOzs7O09BSUc7SUFDSCxTQUFnQixHQUFHLENBQUMsSUFBYztRQUNoQyxJQUFNLGVBQWUsR0FBRyxJQUFJLENBQUMsUUFBUSxDQUFDLElBQUksQ0FBQyxDQUFDO1FBQzVDLElBQU0sVUFBVSxHQUFhLGVBQWU7WUFDMUMsQ0FBQyxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsQ0FBQyxFQUFFLElBQUksQ0FBQyxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUM7WUFDbkMsQ0FBQyxDQUFDLElBQUksQ0FBQztRQUNULElBQU0sWUFBWSxHQUFhLGVBQWU7WUFDNUMsQ0FBQyxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsSUFBSSxDQUFDLE9BQU8sQ0FBQyxJQUFJLENBQUMsR0FBRyxDQUFDLENBQUM7WUFDcEMsQ0FBQyxDQUFDLEVBQUUsQ0FBQztRQUVQLHNCQUFzQjtRQUN0QixJQUFNLEtBQUssR0FBRyxzQkFBSyxDQUFDLFVBQVUsQ0FBQyxDQUFDO1FBRWhDLDBDQUEwQztRQUMxQyxJQUFJLENBQUMsS0FBSyxDQUFDLE9BQU8sRUFBRTtZQUNsQix3QkFBYSxDQUFDLEdBQUcsQ0FBQyxPQUFPLENBQUMsQ0FBQztTQUM1QjtRQUVELElBQU0sY0FBYyxHQUFHLGNBQUksQ0FBQyxJQUFJLENBQUMsT0FBTyxDQUFDLEdBQUcsRUFBRSxFQUFFLFVBQVUsQ0FBQyxDQUFDO1FBQzVELElBQU0sVUFBVSxHQUFHLGNBQUksQ0FBQyxJQUFJLENBQUMsY0FBYyxFQUFFLFdBQVcsQ0FBQyxDQUFDO1FBQzFELElBQU0sZUFBZSxHQUFHLGNBQUksQ0FBQyxJQUFJLENBQUMsU0FBUyxFQUFFLHVDQUF1QyxDQUFDLENBQUM7UUFDdEYsSUFBTSxTQUFTLEdBQUcsY0FBSSxDQUFDLElBQUksQ0FBQyxVQUFVLEVBQUUsY0FBYyxDQUFDLENBQUM7UUFFeEQsSUFBSSxLQUFLLENBQUMsS0FBSyxFQUFFO1lBQ2YsSUFBTSxLQUFLLEdBQUcsT0FBTyxDQUFDLFNBQVMsQ0FBQyxDQUFDLEtBQUssQ0FBQztZQUN2QyxLQUFLLENBQUMsY0FBYyxFQUFFLFVBQVUsRUFBRSxTQUFTLEVBQUUsZUFBZSxDQUFDLENBQUM7U0FDL0Q7YUFBTSxJQUFJLEtBQUssQ0FBQyxJQUFJLEVBQUU7WUFDckIsSUFBTSxJQUFJLEdBQUcsT0FBTyxDQUFDLFFBQVEsQ0FBQyxDQUFDLElBQUksQ0FBQztZQUNwQyxjQUFjO1lBQ2QsSUFBSSxDQUFDLGNBQWMsRUFBRSxVQUFVLEVBQUUsU0FBUyxFQUFFLGVBQWUsQ0FBQyxDQUFDO1NBQzlEO2FBQU0sSUFBSSxLQUFLLENBQUMsT0FBTyxFQUFFLEVBQUUsc0JBQXNCO1lBQ2hELE9BQU8sQ0FBQyxHQUFHLENBQUMsR0FBRyxDQUFDLE9BQU8sQ0FBQyxDQUFDO1NBQzFCO2FBQU0sSUFBSSxLQUFLLENBQUMsSUFBSSxFQUFFLEVBQUUsd0JBQXdCO1lBQy9DLElBQU0sSUFBSSxHQUFHLE9BQU8sQ0FBQyxRQUFRLENBQUMsQ0FBQyxJQUFJLENBQUM7WUFDcEMsSUFBSSxFQUFFLENBQUM7U0FDUjthQUFNLEVBQUUsa0NBQWtDO1lBQ3pDLElBQU0sR0FBRyxHQUFHLE9BQU8sQ0FBQyxPQUFPLENBQUMsQ0FBQyxHQUFHLENBQUM7WUFDakMsR0FBRyxDQUFDLEtBQUssRUFBRSxZQUFZLENBQUMsQ0FBQztTQUMxQjtJQUNILENBQUM7SUF0Q0Qsa0JBc0NDO0lBRUQsSUFBSSxPQUFPLE9BQU8sSUFBSSxXQUFXLElBQUksT0FBTyxDQUFDLElBQUksSUFBRSxNQUFNLEVBQUU7UUFDekQsR0FBRyxDQUFDLE9BQU8sQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUE7S0FDM0IifQ==