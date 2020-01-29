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
        memory_size: {
            description: "Set the initial size of imported memory in bytes.",
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiQ29tbWFuZExpbmVBcmcuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdXRpbC9Db21tYW5kTGluZUFyZy50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7OztJQUNBLHFDQUF3QztJQXdFeEM7Ozs7T0FJRztJQUNIO1FBUUUsd0JBQW1CLElBQVksRUFBRSxPQUF3QjtZQUF0QyxTQUFJLEdBQUosSUFBSSxDQUFRO1lBQzdCLElBQUksQ0FBQyxXQUFXLEdBQUcsT0FBTyxDQUFDLFdBQVcsQ0FBQztZQUN2QyxJQUFJLENBQUMsSUFBSSxHQUFHLE9BQU8sQ0FBQyxJQUFJLENBQUM7WUFDekIsSUFBSSxDQUFDLEtBQUssR0FBRyxPQUFPLENBQUMsS0FBSyxDQUFDO1lBQzNCLElBQUksQ0FBQyxLQUFLLEdBQUcsT0FBTyxDQUFDLEtBQUssQ0FBQztZQUMzQixJQUFJLENBQUMsT0FBTyxHQUFHLE9BQU8sQ0FBQyxPQUFPLENBQUM7WUFDL0IsSUFBSSxDQUFDLE1BQU0sR0FBRyxPQUFPLENBQUMsTUFBTSxDQUFDO1FBQy9CLENBQUM7UUFDRCw4QkFBSyxHQUFMLFVBQU0sSUFBWTtZQUNoQixRQUFRLElBQUksQ0FBQyxJQUFJLEVBQUU7Z0JBQ2pCLEtBQUssR0FBRztvQkFDTixPQUFPLElBQUksQ0FBQztnQkFDZCxLQUFLLElBQUk7b0JBQ1AsT0FBTyxJQUFJLENBQUM7Z0JBQ2QsS0FBSyxHQUFHO29CQUNOLE9BQU8sSUFBSSxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsQ0FBQztnQkFDekIsS0FBSyxHQUFHO29CQUNOLElBQUksSUFBSSxLQUFLLE1BQU0sSUFBSSxJQUFJLEtBQUssT0FBTyxFQUFFO3dCQUN2QyxNQUFNLElBQUksS0FBSyxDQUNiLGVBQWEsSUFBSSxrQ0FBNkIsSUFBSSxDQUFDLElBQU0sQ0FDMUQsQ0FBQztxQkFDSDtvQkFDRCxPQUFPLE1BQU0sS0FBSyxJQUFJLENBQUM7Z0JBQ3pCLEtBQUssR0FBRztvQkFD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