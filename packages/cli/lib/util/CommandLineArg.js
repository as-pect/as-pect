(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./strings"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var strings_1 = require("./strings");
    /**
     * @ignore
     *
     * This class represents a definition for a command line argument.
     */
    var CommandLineArg = /** @class */ (function () {
        function CommandLineArg(name, command) {
            this.name = name;
            this.description = command.description;
            this.type = command.type;
            this.value = command.value;
            this.alias = command.alias;
            this.options = command.options;
            this.parent = command.parent;
        }
        CommandLineArg.prototype.parse = function (data) {
            switch (this.type) {
                case "s":
                    return data;
                case "bs":
                    return data;
                case "S":
                    return data.split(",");
                case "b":
                    if (data !== "true" && data !== "false") {
                        throw new Error("Bad value " + data + " for boolean for argument " + this.name);
                    }
                    return "true" === data;
                case "i":
                    return parseInt(data);
                case "f":
                    return parseFloat(data);
                default:
                    throw new Error("Type " + this.type + " is not implemented yet");
            }
        };
        return CommandLineArg;
    }());
    exports.CommandLineArg = CommandLineArg;
    /**
     * @ignore
     * The definition for the as-pect/cli arguments.
     */
    var _Args = {
        compiler: {
            description: [
                "Path to folder relative to project root which contains",
                "{folder}/dist/asc for the compiler and {folder}/lib/loader for loader.",
            ],
            type: "s",
            value: "assemblyscript",
        },
        config: {
            description: "Use a specified configuration",
            type: "s",
            alias: { name: "c" },
            value: "as-pect.config.js",
        },
        csv: {
            description: "Use the csv reporter. It outputs test data to {testname}.spec.csv",
            type: "bs",
            value: false,
        },
        file: {
            description: "Run the tests of each file that matches this regex.",
            type: "s",
            alias: [{ name: "files", long: true }, { name: "f" }],
            value: ".",
        },
        group: {
            description: "Run each describe block that matches this regex",
            type: "s",
            alias: [{ name: "groups", long: true }, { name: "g" }],
            value: "(:?)",
        },
        help: {
            description: "Show this help screen.",
            type: "b",
            alias: { name: "h" },
            value: false,
        },
        init: {
            description: "Create a test config, an assembly/__tests__ folder and exit.",
            type: "b",
            alias: { name: "i" },
            value: false,
        },
        json: {
            description: [
                "Use the json reporter. It outputs test data to {testname}.spec.json",
            ],
            type: "bs",
            value: false,
        },
        "memory-max": {
            description: "Set the maximum amount of memory pages the wasm module can use.",
            type: "i",
            value: -1,
        },
        "memory-size": {
            description: "Set the initial wasm memory size in pages [64kb each].",
            type: "i",
            alias: { name: "m" },
            value: 10
        },
        "max-samples": {
            description: "Set the maximum number of samples to run for each test.",
            type: "i",
            value: 10000,
            parent: "performance",
        },
        "max-test-run-time": {
            description: "Set the maximum test run time in milliseconds.",
            type: "i",
            value: 2000,
            parent: "performance",
        },
        nologo: {
            description: "Suppress ASCII art from being printed.",
            type: "b",
            alias: { name: "nl" },
            value: false
        },
        nortrace: {
            description: "Skip rtrace reference counting calculations.",
            type: "b",
            alias: { name: "nr" },
            value: false,
        },
        norun: {
            description: "Skip running tests and output the compiler files.",
            type: "b",
            alias: { name: "n" },
            value: false,
        },
        "output-binary": {
            description: "Create a (.wasm) file can contains all the tests to be run later.",
            type: "b",
            alias: { name: "o" },
            value: false,
        },
        performance: {
            description: "Enable performance statistics for {bold every} test.",
            type: "b",
            value: false,
            parent: "performance",
        },
        portable: {
            description: "Add the portable jest/as-pect types to your project.",
            type: "b",
            value: false,
        },
        "report-average": {
            description: "Enable/Disable reporting of the average time.",
            type: "b",
            value: true,
            parent: "performance",
        },
        "report-max": {
            description: "Enable/Disable reporting of the largest run time.",
            type: "b",
            value: false,
            parent: "performance",
        },
        "report-median": {
            description: "Enable/Disable reporting of the median time.",
            type: "b",
            value: true,
            parent: "performance",
        },
        "report-min": {
            description: "Enable/Disable reporting of the smallest run time.",
            type: "b",
            value: false,
            parent: "performance",
        },
        "report-standard-deviation": {
            description: "Enable / Disable reporting of the standard deviation.",
            type: "b",
            value: false,
            parent: "performance",
        },
        "report-variance": {
            description: "Enable/Disable reporting of the variance.",
            type: "b",
            value: false,
            parent: "performance",
        },
        reporter: {
            description: "Define the reporter to be used.",
            type: "s",
            value: "",
            options: [
                [
                    "./path/to/reporter.js?queryString",
                    "Use the default exported object from this module as the reporter.",
                ],
            ],
        },
        "round-decimal-places": {
            description: "Set the number of decimal places to round to.",
            type: "i",
            value: 3,
            parent: "performance",
        },
        summary: {
            description: [
                "Use the summary reporter. It outputs a summary of the test results to stdout.",
            ],
            type: "bs",
            value: false,
        },
        test: {
            description: "Run each test that matches this regex",
            type: "s",
            alias: [{ name: "tests", long: true }, { name: "t" }],
            value: "(:?)",
        },
        types: {
            description: "Copy the types file to assembly/__tests__/as-pect.d.ts",
            type: "b",
            value: false,
        },
        verbose: {
            description: [
                "Use the verbose reporter. It outputs all the test details to stdout.",
            ],
            type: "bs",
            value: false,
        },
        version: {
            description: "View the version.",
            type: "b",
            alias: { name: "v" },
            value: false,
        },
        workers: {
            description: "An experimental flag that enables parallel compilation in Worker worklets.",
            type: "i",
            alias: { name: "w" },
            value: 0,
        },
    };
    /**
     * @ignore
     * Take a CommandLineArgs object and turn it into an ArgMap.
     *
     * @param args
     */
    function makeArgMap(args) {
        if (args === void 0) { args = _Args; }
        var res = new Map();
        Object.getOwnPropertyNames(args).forEach(function (element) {
            var arg = new CommandLineArg(element, _Args[element]);
            res.set(element, arg);
            var aliases = _Args[element].alias;
            if (aliases) {
                (Array.isArray(aliases) ? aliases : [aliases]).forEach(function (alias) {
                    // short aliases have a `-` prefix to disguish them
                    var name = (!alias.long ? "-" : "") + alias.name;
                    res.set(name, arg);
                });
            }
        });
        return res;
    }
    exports.makeArgMap = makeArgMap;
    /**
     * This is the set of stored command line arguments for the asp command line.
     */
    exports.defaultCliArgs = makeArgMap(_Args);
    /**
     * @ignore
     */
    var reg = /(?:--([a-z][a-z\-]*)|(-[a-z][a-z\-]*))(?:=(.*))?/i;
    /**
     * @ignore
     */
    var invalidArg = /^[\-]/;
    /**
     * This method parses command line options like the `asp` command does. It takes an optional
     * second parameter to modify the command line arguments used.
     *
     * @param {string[]} commands - The command line arguments.
     * @param {ArgMap} cliArgs - The set of parsable arguments.
     */
    function parse(commands, cliArgs) {
        if (cliArgs === void 0) { cliArgs = exports.defaultCliArgs; }
        var opts = {
            changed: new Set(),
        };
        cliArgs.forEach(function (arg) {
            var camelCase = strings_1.toCamelCase(arg.name);
            if (arg.parent) {
                var parent_1 = opts[arg.parent] || {};
                if (arg.parent === arg.name) {
                    parent_1.enabled = arg.value;
                }
                else {
                    parent_1[camelCase] = arg.value;
                }
                opts[arg.parent] = parent_1;
            }
            else {
                opts[camelCase] = arg.value;
            }
        });
        for (var i = 0; i < commands.length; i++) {
            //@ts-ignore
            var _a = commands[i].match(reg) || [], _ = _a[0], flag = _a[1], alias = _a[2], data = _a[3];
            if (flag) {
                if (!cliArgs.has(flag)) {
                    throw new Error("Flag " + flag + " doesn't exist.");
                }
            }
            else if (alias) {
                if (!cliArgs.has(alias)) {
                    throw new Error("Alias " + alias + " doesn't exist.");
                }
            }
            else {
                throw new Error("Command " + commands[i] + " is not valid.");
            }
            var arg = cliArgs.get(flag || alias);
            var value = void 0;
            if (data) {
                // Data from =(.*)
                value = arg.parse(data);
            }
            else if (arg.type === "bs") {
                // boolean flag or string, do not parse further
                value = true;
            }
            else if (arg.type === "b") {
                // boolean flag
                value = true;
            }
            else {
                if (i >= commands.length - 1) {
                    throw new Error("Command line ended without last argument.");
                }
                if (commands[i + 1].match(invalidArg)) {
                    throw new Error("Passed value " + commands[i + i] + " is invalid.");
                }
                i += 1; // increment index
                value = arg.parse(commands[i]); // Parse data
            }
            var name_1 = strings_1.toCamelCase(arg.name);
            if (arg.parent) {
                if (arg.parent == name_1) {
                    name_1 = "enabled";
                }
                opts[arg.parent][name_1] = value;
                opts.changed.add(arg.parent + "." + name_1);
            }
            else {
                opts[name_1] = value;
                opts.changed.add(name_1);
            }
        }
        return opts;
    }
    exports.parse = parse;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiQ29tbWFuZExpbmVBcmcuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdXRpbC9Db21tYW5kTGluZUFyZy50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7OztJQUNBLHFDQUF3QztJQXlFeEM7Ozs7T0FJRztJQUNIO1FBUUUsd0JBQW1CLElBQVksRUFBRSxPQUF3QjtZQUF0QyxTQUFJLEdBQUosSUFBSSxDQUFRO1lBQzdCLElBQUksQ0FBQyxXQUFXLEdBQUcsT0FBTyxDQUFDLFdBQVcsQ0FBQztZQUN2QyxJQUFJLENBQUMsSUFBSSxHQUFHLE9BQU8sQ0FBQyxJQUFJLENBQUM7WUFDekIsSUFBSSxDQUFDLEtBQUssR0FBRyxPQUFPLENBQUMsS0FBSyxDQUFDO1lBQzNCLElBQUksQ0FBQyxLQUFLLEdBQUcsT0FBTyxDQUFDLEtBQUssQ0FBQztZQUMzQixJQUFJLENBQUMsT0FBTyxHQUFHLE9BQU8sQ0FBQyxPQUFPLENBQUM7WUFDL0IsSUFBSSxDQUFDLE1BQU0sR0FBRyxPQUFPLENBQUMsTUFBTSxDQUFDO1FBQy9CLENBQUM7UUFDRCw4QkFBSyxHQUFMLFVBQU0sSUFBWTtZQUNoQixRQUFRLElBQUksQ0FBQyxJQUFJLEVBQUU7Z0JBQ2pCLEtBQUssR0FBRztvQkFDTixPQUFPLElBQUksQ0FBQztnQkFDZCxLQUFLLElBQUk7b0JBQ1AsT0FBTyxJQUFJLENBQUM7Z0JBQ2QsS0FBSyxHQUFHO29CQUNOLE9BQU8sSUFBSSxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsQ0FBQztnQkFDekIsS0FBSyxHQUFHO29CQUNOLElBQUksSUFBSSxLQUFLLE1BQU0sSUFBSSxJQUFJLEtBQUssT0FBTyxFQUFFO3dCQUN2QyxNQUFNLElBQUksS0FBSyxDQUNiLGVBQWEsSUFBSSxrQ0FBNkIsSUFBSSxDQUFDLElBQU0sQ0FDMUQsQ0FBQztxQkFDSDtvQkFDRCxPQUFPLE1BQU0sS0FBSyxJQUFJLENBQUM7Z0JBQ3pCLEtBQUssR0FBRztvQkFD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