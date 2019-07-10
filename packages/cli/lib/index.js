(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./util/CommandLineArg"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var CommandLineArg_1 = require("./util/CommandLineArg");
    /** Package version is always displayed, either for version or cli ascii art. */
    var pkg = require("../package.json");
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
        var cliOptions = CommandLineArg_1.parse(aspectArgs);
        // Skip ascii art if asked for the version
        if (!cliOptions.version) {
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi9zcmMvaW5kZXgudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBQSx3REFBOEM7SUFFOUMsZ0ZBQWdGO0lBQ2hGLElBQU0sR0FBRyxHQUFHLE9BQU8sQ0FBQyxpQkFBaUIsQ0FBQyxDQUFDO0lBRXZDOzs7O09BSUc7SUFDSCxTQUFnQixHQUFHLENBQUMsSUFBYztRQUNoQyxJQUFNLGVBQWUsR0FBRyxJQUFJLENBQUMsUUFBUSxDQUFDLElBQUksQ0FBQyxDQUFDO1FBQzVDLElBQU0sVUFBVSxHQUFhLGVBQWU7WUFDMUMsQ0FBQyxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsQ0FBQyxFQUFFLElBQUksQ0FBQyxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUM7WUFDbkMsQ0FBQyxDQUFDLElBQUksQ0FBQztRQUNULElBQU0sWUFBWSxHQUFhLGVBQWU7WUFDNUMsQ0FBQyxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsSUFBSSxDQUFDLE9BQU8sQ0FBQyxJQUFJLENBQUMsR0FBRyxDQUFDLENBQUM7WUFDcEMsQ0FBQyxDQUFDLEVBQUUsQ0FBQztRQUVQLHNCQUFzQjtRQUN0QixJQUFNLFVBQVUsR0FBRyxzQkFBSyxDQUFDLFVBQVUsQ0FBQyxDQUFDO1FBRXJDLDBDQUEwQztRQUMxQyxJQUFJLENBQUMsVUFBVSxDQUFDLE9BQU8sRUFBRTtZQUN2QixJQUFNLGFBQWEsR0FBRyxPQUFPLENBQUMsaUJBQWlCLENBQUMsQ0FBQyxhQUFhLENBQUM7WUFDL0QsYUFBYSxDQUFDLEdBQUcsQ0FBQyxPQUFPLENBQUMsQ0FBQztTQUM1QjtRQUVELElBQUksVUFBVSxDQUFDLEtBQUssRUFBRTtZQUNwQixJQUFNLEtBQUssR0FBRyxPQUFPLENBQUMsU0FBUyxDQUFDLENBQUMsS0FBSyxDQUFDO1lBQ3ZDLEtBQUssRUFBRSxDQUFDO1NBQ1Q7YUFBTSxJQUFJLFVBQVUsQ0FBQyxJQUFJLEVBQUU7WUFDMUIsSUFBTSxJQUFJLEdBQUcsT0FBTyxDQUFDLFFBQVEsQ0FBQyxDQUFDLElBQUksQ0FBQztZQUNwQyxjQUFjO1lBQ2QsSUFBSSxFQUFFLENBQUM7U0FDUjthQUFNLElBQUksVUFBVSxDQUFDLE9BQU8sRUFBRTtZQUM3QixzQkFBc0I7WUFDdEIsT0FBTyxDQUFDLEdBQUcsQ0FBQyxHQUFHLENBQUMsT0FBTyxDQUFDLENBQUM7U0FDMUI7YUFBTSxJQUFJLFVBQVUsQ0FBQyxJQUFJLEVBQUU7WUFDMUIsd0JBQXdCO1lBQ3hCLElBQU0sSUFBSSxHQUFHLE9BQU8sQ0FBQyxRQUFRLENBQUMsQ0FBQyxJQUFJLENBQUM7WUFDcEMsSUFBSSxFQUFFLENBQUM7U0FDUjthQUFNLElBQUksVUFBVSxDQUFDLFFBQVEsRUFBRTtZQUM5QixJQUFNLFFBQVEsR0FBRyxPQUFPLENBQUMsWUFBWSxDQUFDLENBQUMsUUFBUSxDQUFDO1lBQ2hELFFBQVEsRUFBRSxDQUFDO1NBQ1o7YUFBTTtZQUNMLGtDQUFrQztZQUNsQyxJQUFNLEdBQUcsR0FBRyxPQUFPLENBQUMsT0FBTyxDQUFDLENBQUMsR0FBRyxDQUFDO1lBQ2pDLEdBQUcsQ0FBQyxVQUFVLEVBQUUsWUFBWSxDQUFDLENBQUM7U0FDL0I7SUFDSCxDQUFDO0lBeENELGtCQXdDQztJQUVELElBQUksT0FBTyxPQUFPLElBQUksV0FBVyxJQUFJLE9BQU8sQ0FBQyxJQUFJLElBQUksTUFBTSxFQUFFO1FBQzNELEdBQUcsQ0FBQyxPQUFPLENBQUMsSUFBSSxDQUFDLEtBQUssQ0FBQyxDQUFDLENBQUMsQ0FBQyxDQUFDO0tBQzVCIn0=