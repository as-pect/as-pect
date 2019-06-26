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
    var _Args = {
        init: {
            description: "Create a test config, an assembly/__tests__ folder and exit.",
            type: "b",
            alias: { name: "i" },
            value: false,
        },
        config: {
            description: "Use a specified configuration",
            type: "s",
            alias: { name: "c" },
            value: "as-pect.config.js",
        },
        version: {
            description: "View the version.",
            type: "b",
            alias: { name: "v" },
            value: false,
        },
        help: {
            description: "Show this help screen.",
            type: "b",
            alias: { name: "h" },
            value: false,
        },
        types: {
            description: "Copy the types file to assembly/__tests__/as-pect.d.ts",
            type: "b",
            alias: { name: "t" },
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
        test: {
            description: "Run each test that matches this regex",
            type: "s",
            alias: [{ name: "tests", long: true }, { name: "t" }],
            value: "(:?)",
        },
        "output-binary": {
            description: "Create a (.wasm) file can contains all the tests to be run later.",
            type: "b",
            alias: { name: "o" },
            value: false,
        },
        norun: {
            description: "Skip running tests and output the compiler files.",
            type: "b",
            alias: { name: "n" },
            value: false,
        },
        nortrace: {
            description: "Skip rtrace reference counting calculations.",
            type: "b",
            alias: { name: "nr" },
            value: false,
        },
        reporter: {
            description: "Define the reporter to be used.",
            type: "s",
            value: "",
            options: [
                ["./path/to/reporter.js?queryString", "Use the default exported object from this module as the reporter."],
            ],
        },
        performance: {
            description: "Enable performance statistics for {bold every} test.",
            type: "b",
            value: false,
            parent: "performance",
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
        "round-decimal-places": {
            description: "Set the number of decimal places to round to.",
            type: "i",
            value: 3,
            parent: "performance",
        },
        "report-median": {
            description: "Enable/Disable reporting of the median time.",
            type: "b",
            value: true,
            parent: "performance",
        },
        "report-average": {
            description: "Enable/Disable reporting of the average time.",
            type: "b",
            value: true,
            parent: "performance",
        },
        "report-standard-deviation": {
            description: "Enable / Disable reporting of the standard deviation.",
            type: "b",
            value: false,
            parent: "performance",
        },
        "report-max": {
            description: "Enable/Disable reporting of the largest run time.",
            type: "b",
            value: false,
            parent: "performance",
        },
        "report-min": {
            description: "Enable/Disable reporting of the smallest run time.",
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
        compiler: {
            description: [
                "Path to folder relative to project root which contains",
                "{folder}/dist/asc for the compiler and {folder}/lib/loader for loader.",
            ],
            type: "s",
            value: "assemblyscript",
        },
        csv: {
            description: [
                "Use the csv reporter. It outputs test data to {testname}.spec.csv",
            ],
            type: "bs",
            value: false,
        },
        json: {
            description: [
                "Use the json reporter. It outputs test data to {testname}.spec.json",
            ],
            type: "bs",
            value: false,
        },
        summary: {
            description: [
                "Use the summary reporter. It outputs a summary of the test results to stdout.",
            ],
            type: "bs",
            value: false,
        },
        verbose: {
            description: [
                "Use the verbose reporter. It outputs all the test details to stdout.",
            ],
            type: "bs",
            value: false,
        },
    };
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
    exports.Args = makeArgMap(_Args);
    var reg = /(?:--([a-z][a-z\-]*)|(-[a-z][a-z\-]*))(?:=(.*))?/i;
    var invalidArg = /^[\-]/;
    function parse(commands, args) {
        if (args === void 0) { args = exports.Args; }
        var opts = {
            changed: new Set(),
        };
        args.forEach(function (arg) {
            var camelCase = strings_1.toCamelCase(arg.name);
            if (arg.parent) {
                if (!opts[arg.parent]) {
                    opts[arg.parent] = {};
                }
                if (arg.parent === arg.name) {
                    opts[arg.parent].enabled = arg.value;
                }
                else {
                    opts[arg.parent][camelCase] = arg.value;
                }
            }
            else {
                opts[camelCase] = arg.value;
            }
        });
        for (var i = 0; i < commands.length; i++) {
            //@ts-ignore
            var _a = commands[i].match(reg) || [], _ = _a[0], flag = _a[1], alias = _a[2], data = _a[3];
            if (flag) {
                if (!args.has(flag)) {
                    throw new Error("Flag " + flag + " doesn't exist.");
                }
            }
            else if (alias) {
                if (!args.has(alias)) {
                    throw new Error("Alias " + alias + " doesn't exist.");
                }
            }
            else {
                throw new Error("Command " + commands[i] + " is not valid.");
            }
            var arg = args.get(flag || alias);
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiQ29tbWFuZExpbmVBcmcuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi9zcmMvY2xpL3V0aWwvQ29tbWFuZExpbmVBcmcudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFDQSxxQ0FBd0M7SUEyQ3hDO1FBUUUsd0JBQW1CLElBQVksRUFBRSxPQUF3QjtZQUF0QyxTQUFJLEdBQUosSUFBSSxDQUFRO1lBQzdCLElBQUksQ0FBQyxXQUFXLEdBQUcsT0FBTyxDQUFDLFdBQVcsQ0FBQztZQUN2QyxJQUFJLENBQUMsSUFBSSxHQUFHLE9BQU8sQ0FBQyxJQUFJLENBQUM7WUFDekIsSUFBSSxDQUFDLEtBQUssR0FBRyxPQUFPLENBQUMsS0FBSyxDQUFDO1lBQzNCLElBQUksQ0FBQyxLQUFLLEdBQUcsT0FBTyxDQUFDLEtBQUssQ0FBQztZQUMzQixJQUFJLENBQUMsT0FBTyxHQUFHLE9BQU8sQ0FBQyxPQUFPLENBQUM7WUFDL0IsSUFBSSxDQUFDLE1BQU0sR0FBRyxPQUFPLENBQUMsTUFBTSxDQUFDO1FBQy9CLENBQUM7UUFDRCw4QkFBSyxHQUFMLFVBQU0sSUFBWTtZQUNoQixRQUFRLElBQUksQ0FBQyxJQUFJLEVBQUU7Z0JBQ2pCLEtBQUssR0FBRztvQkFDTixPQUFPLElBQUksQ0FBQztnQkFDZCxLQUFLLElBQUk7b0JBQ1AsT0FBTyxJQUFJLENBQUM7Z0JBQ2QsS0FBSyxHQUFHO29CQUNOLE9BQU8sSUFBSSxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsQ0FBQTtnQkFDeEIsS0FBSyxHQUFHO29CQUNOLElBQUksSUFBSSxLQUFLLE1BQU0sSUFBSSxJQUFJLEtBQUssT0FBTyxFQUFFO3dCQUN2QyxNQUFNLElBQUksS0FBSyxDQUFDLGVBQWEsSUFBSSxrQ0FBNkIsSUFBSSxDQUFDLElBQU0sQ0FBQyxDQUFDO3FCQUM1RTtvQkFDRCxPQUFPLE1BQU0sS0FBSyxJQUFJLENBQUM7Z0JBQ3pCLEtBQUssR0FBRztvQkFDTixPQUFP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