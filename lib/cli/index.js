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
            var printAsciiArt = require("./util/asciiArt").printAsciiArt;
            printAsciiArt(pkg.version);
        }
        if (yargs.types) {
            var types = require("./types").types;
            types();
        }
        else if (yargs.init) {
            var init = require("./init").init;
            // init script
            init();
        }
        else if (yargs.version) {
            // display the version
            console.log(pkg.version);
        }
        else if (yargs.help) {
            // display the help file
            var help = require("./help").help;
            help();
        }
        else if (yargs.portable) {
            var portable = require("./portable").portable;
            portable();
        }
        else {
            // run the compiler and test suite
            var run = require("./run").run;
            run(yargs, compilerArgs);
        }
    }
    exports.asp = asp;
    if (typeof require != "undefined" && require.main == module) {
        asp(process.argv.slice(2));
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvY2xpL2luZGV4LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBQUEsd0RBQThDO0lBRTlDLGdGQUFnRjtJQUNoRixJQUFNLEdBQUcsR0FBRyxPQUFPLENBQUMsb0JBQW9CLENBQUMsQ0FBQztJQUUxQzs7OztPQUlHO0lBQ0gsU0FBZ0IsR0FBRyxDQUFDLElBQWM7UUFDaEMsSUFBTSxlQUFlLEdBQUcsSUFBSSxDQUFDLFFBQVEsQ0FBQyxJQUFJLENBQUMsQ0FBQztRQUM1QyxJQUFNLFVBQVUsR0FBYSxlQUFlO1lBQzFDLENBQUMsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDLENBQUMsRUFBRSxJQUFJLENBQUMsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDO1lBQ25DLENBQUMsQ0FBQyxJQUFJLENBQUM7UUFDVCxJQUFNLFlBQVksR0FBYSxlQUFlO1lBQzVDLENBQUMsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsSUFBSSxDQUFDLEdBQUcsQ0FBQyxDQUFDO1lBQ3BDLENBQUMsQ0FBQyxFQUFFLENBQUM7UUFFUCxzQkFBc0I7UUFDdEIsSUFBTSxLQUFLLEdBQUcsc0JBQUssQ0FBQyxVQUFVLENBQUMsQ0FBQztRQUVoQywwQ0FBMEM7UUFDMUMsSUFBSSxDQUFDLEtBQUssQ0FBQyxPQUFPLEVBQUU7WUFDbEIsSUFBTSxhQUFhLEdBQUcsT0FBTyxDQUFDLGlCQUFpQixDQUFDLENBQUMsYUFBYSxDQUFDO1lBQy9ELGFBQWEsQ0FBQyxHQUFHLENBQUMsT0FBTyxDQUFDLENBQUM7U0FDNUI7UUFFRCxJQUFJLEtBQUssQ0FBQyxLQUFLLEVBQUU7WUFDZixJQUFNLEtBQUssR0FBRyxPQUFPLENBQUMsU0FBUyxDQUFDLENBQUMsS0FBSyxDQUFDO1lBQ3ZDLEtBQUssRUFBRSxDQUFDO1NBQ1Q7YUFBTSxJQUFJLEtBQUssQ0FBQyxJQUFJLEVBQUU7WUFDckIsSUFBTSxJQUFJLEdBQUcsT0FBTyxDQUFDLFFBQVEsQ0FBQyxDQUFDLElBQUksQ0FBQztZQUNwQyxjQUFjO1lBQ2QsSUFBSSxFQUFFLENBQUM7U0FDUjthQUFNLElBQUksS0FBSyxDQUFDLE9BQU8sRUFBRTtZQUN4QixzQkFBc0I7WUFDdEIsT0FBTyxDQUFDLEdBQUcsQ0FBQyxHQUFHLENBQUMsT0FBTyxDQUFDLENBQUM7U0FDMUI7YUFBTSxJQUFJLEtBQUssQ0FBQyxJQUFJLEVBQUU7WUFDckIsd0JBQXdCO1lBQ3hCLElBQU0sSUFBSSxHQUFHLE9BQU8sQ0FBQyxRQUFRLENBQUMsQ0FBQyxJQUFJLENBQUM7WUFDcEMsSUFBSSxFQUFFLENBQUM7U0FDUjthQUFNLElBQUksS0FBSyxDQUFDLFFBQVEsRUFBRTtZQUN6QixJQUFNLFFBQVEsR0FBRyxPQUFPLENBQUMsWUFBWSxDQUFDLENBQUMsUUFBUSxDQUFDO1lBQ2hELFFBQVEsRUFBRSxDQUFDO1NBQ1o7YUFBTTtZQUNMLGtDQUFrQztZQUNsQyxJQUFNLEdBQUcsR0FBRyxPQUFPLENBQUMsT0FBTyxDQUFDLENBQUMsR0FBRyxDQUFDO1lBQ2pDLEdBQUcsQ0FBQyxLQUFLLEVBQUUsWUFBWSxDQUFDLENBQUM7U0FDMUI7SUFDSCxDQUFDO0lBeENELGtCQXdDQztJQUVELElBQUksT0FBTyxPQUFPLElBQUksV0FBVyxJQUFJLE9BQU8sQ0FBQyxJQUFJLElBQUksTUFBTSxFQUFFO1FBQzNELEdBQUcsQ0FBQyxPQUFPLENBQUMsSUFBSSxDQUFDLEtBQUssQ0FBQyxDQUFDLENBQUMsQ0FBQyxDQUFDO0tBQzVCIn0=