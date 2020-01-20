"use strict";
var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
var __spreadArrays = (this && this.__spreadArrays) || function () {
    for (var s = 0, i = 0, il = arguments.length; i < il; i++) s += arguments[i].length;
    for (var r = Array(s), k = 0, i = 0; i < il; i++)
        for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++)
            r[k] = a[j];
    return r;
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
define("help", ["require", "exports", "chalk"], function (require, exports, chalk_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_1 = __importDefault(chalk_1);
    /**
     * @ignore
     *
     * This method prints the help text.
     */
    function help() {
        console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["\n  {bold.blueBright SYNTAX}\n    {bold.green asp} --init                          Create a test config, an assembly/__tests__ folder and exit.\n    {bold.green asp} -i\n    {bold.green asp} --config=as-pect.config.js      Use a specified configuration\n    {bold.green asp} -c as-pect.config.js\n    {bold.green asp} --version                       View the version.\n    {bold.green asp} -v\n    {bold.green asp} --help                          Show this help screen.\n    {bold.green asp} -h\n    {bold.green asp} --types                         Copy the types file to assembly/__tests__/as-pect.d.ts\n    {bold.green asp} -t\n    {bold.green asp} --nologo                        Suppress ASCII art from printing.\n    {bold.green asp} --compiler                      Path to folder relative to project root which contains\n                                        {italic.magenta folder}/dist/asc for the compiler and {italic.magenta folder}/lib/loader for loader. {yellow (Default: assemblyscript)}\n\n\n  {bold.blueBright TEST OPTIONS}\n    {bold.green --file=[regex]}                       Run the tests of each file that matches this regex. {yellow (Default: /./)}\n      {bold.green --files=[regex]}\n      {bold.green -f=[regex]}\n\n    {bold.green --group=[regex]}                      Run each describe block that matches this regex {yellow (Default: /(:?)/)}\n      {bold.green --groups=[regex]}\n      {bold.green -g=[regex]}\n\n    {bold.green --test=[regex]}                       Run each test that matches this regex {yellow (Default: /(:?)/)}\n      {bold.green --tests=[regex]}\n      {bold.green -t=[regex]}\n\n    {bold.green --output-binary}                      Create a (.wasm) file can contains all the tests to be run later.\n      {bold.green -o}\n\n    {bold.green --norun}                              Skip running tests and output the compiler files.\n      {bold.green -n}\n\n    {bold.green --nortrace}                           Skip rtrace reference counting calculations.\n      {bold.green -nr}\n\n    {bold.green asp} --workers 3                      Enable the experimental worker worklets {yellow (default: 0 {gray [disabled]})}\n      {bold.green asp} -w\n\n  {bold.blueBright REPORTER OPTIONS}\n    --summary                            Use the summary reporter. {yellow (This is the default if no reporter is specified.)}\n    --verbose                            Use a more verbose reporter.\n    --csv                                Use the csv reporter (output results to csv files.)\n    --json                               Use the json reporter (output results to json files.)\n    --reporter                           Define a custom reporter (path or module)\n\n  {bold.blueBright PERFORMANCE OPTIONS}\n    {bold.green --performance}                        Enable performance statistics for {bold every} test. {yellow (Default: false)}\n    {bold.green --max-samples=[number]}               Set the maximum number of samples to run for each test. {yellow (Default: 10000 samples)}\n    {bold.green --max-test-run-time=[number]}         Set the maximum test run time in milliseconds. {yellow (Default: 2000ms)}\n    {bold.green --round-decimal-places=[number]}      Set the number of decimal places to round to. {yellow (Default: 3)}\n    {bold.green --report-median(=false)?}             Enable/Disable reporting of the median time. {yellow (Default: true)}\n    {bold.green --report-average(=false)?}            Enable/Disable reporting of the average time. {yellow (Default: true)}\n    {bold.green --report-standard-deviation(=false)?} Enable/Disable reporting of the standard deviation. {yellow (Default: false)}\n    {bold.green --report-max(=false)?}                Enable/Disable reporting of the largest run time. {yellow (Default: false)}\n    {bold.green --report-min(=false)?}                Enable/Disable reporting of the smallest run time. {yellow (Default: false)}\n    {bold.green --report-variance(=false)?}           Enable/Disable reporting of the variance. {yellow (Default: false)}\n  "], ["\n  {bold.blueBright SYNTAX}\n    {bold.green asp} --init                          Create a test config, an assembly/__tests__ folder and exit.\n    {bold.green asp} -i\n    {bold.green asp} --config=as-pect.config.js      Use a specified configuration\n    {bold.green asp} -c as-pect.config.js\n    {bold.green asp} --version                       View the version.\n    {bold.green asp} -v\n    {bold.green asp} --help                          Show this help screen.\n    {bold.green asp} -h\n    {bold.green asp} --types                         Copy the types file to assembly/__tests__/as-pect.d.ts\n    {bold.green asp} -t\n    {bold.green asp} --nologo                        Suppress ASCII art from printing.\n    {bold.green asp} --compiler                      Path to folder relative to project root which contains\n                                        {italic.magenta folder}/dist/asc for the compiler and {italic.magenta folder}/lib/loader for loader. {yellow (Default: assemblyscript)}\n\n\n  {bold.blueBright TEST OPTIONS}\n    {bold.green --file=[regex]}                       Run the tests of each file that matches this regex. {yellow (Default: /./)}\n      {bold.green --files=[regex]}\n      {bold.green -f=[regex]}\n\n    {bold.green --group=[regex]}                      Run each describe block that matches this regex {yellow (Default: /(:?)/)}\n      {bold.green --groups=[regex]}\n      {bold.green -g=[regex]}\n\n    {bold.green --test=[regex]}                       Run each test that matches this regex {yellow (Default: /(:?)/)}\n      {bold.green --tests=[regex]}\n      {bold.green -t=[regex]}\n\n    {bold.green --output-binary}                      Create a (.wasm) file can contains all the tests to be run later.\n      {bold.green -o}\n\n    {bold.green --norun}                              Skip running tests and output the compiler files.\n      {bold.green -n}\n\n    {bold.green --nortrace}                           Skip rtrace reference counting calculations.\n      {bold.green -nr}\n\n    {bold.green asp} --workers 3                      Enable the experimental worker worklets {yellow (default: 0 {gray [disabled]})}\n      {bold.green asp} -w\n\n  {bold.blueBright REPORTER OPTIONS}\n    --summary                            Use the summary reporter. {yellow (This is the default if no reporter is specified.)}\n    --verbose                            Use a more verbose reporter.\n    --csv                                Use the csv reporter (output results to csv files.)\n    --json                               Use the json reporter (output results to json files.)\n    --reporter                           Define a custom reporter (path or module)\n\n  {bold.blueBright PERFORMANCE OPTIONS}\n    {bold.green --performance}                        Enable performance statistics for {bold every} test. {yellow (Default: false)}\n    {bold.green --max-samples=[number]}               Set the maximum number of samples to run for each test. {yellow (Default: 10000 samples)}\n    {bold.green --max-test-run-time=[number]}         Set the maximum test run time in milliseconds. {yellow (Default: 2000ms)}\n    {bold.green --round-decimal-places=[number]}      Set the number of decimal places to round to. {yellow (Default: 3)}\n    {bold.green --report-median(=false)?}             Enable/Disable reporting of the median time. {yellow (Default: true)}\n    {bold.green --report-average(=false)?}            Enable/Disable reporting of the average time. {yellow (Default: true)}\n    {bold.green --report-standard-deviation(=false)?} Enable/Disable reporting of the standard deviation. {yellow (Default: false)}\n    {bold.green --report-max(=false)?}                Enable/Disable reporting of the largest run time. {yellow (Default: false)}\n    {bold.green --report-min(=false)?}                Enable/Disable reporting of the smallest run time. {yellow (Default: false)}\n    {bold.green --report-variance(=false)?}           Enable/Disable reporting of the variance. {yellow (Default: false)}\n  "]))));
    }
    exports.help = help;
    var templateObject_1;
});
define("util/strings", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * @ignore
     * Capitalize a word.
     *
     * @param {string} word - The word to be capitalized.
     */
    function capitalize(word) {
        return word[0].toLocaleUpperCase() + word.substring(1);
    }
    exports.capitalize = capitalize;
    /**
     * @ignore
     * CamelCase a single string. Usually used with `dash-cased` words.
     *
     * @param {string} str - The string to be camelCased.
     * @param {string} from - The string seperator.
     */
    function toCamelCase(str, from) {
        if (from === void 0) { from = "-"; }
        return str
            .split(from)
            .map(function (word, idx) { return (idx > 0 ? capitalize(word) : word); })
            .join("");
    }
    exports.toCamelCase = toCamelCase;
});
define("util/CommandLineArg", ["require", "exports", "util/strings"], function (require, exports, strings_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
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
define("index", ["require", "exports", "util/CommandLineArg", "util/CommandLineArg"], function (require, exports, CommandLineArg_1, CommandLineArg_2) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
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
define("init", ["require", "exports", "chalk", "fs", "path"], function (require, exports, chalk_2, fs_1, path_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_2 = __importDefault(chalk_2);
    /**
     * @ignore
     *
     * This method initializes a new test project. It is opinionated and reflects the needs of 99% of
     * AssemblyScript developers following the standard way of creating a new AssemblyScript project.
     */
    function init() {
        var assemblyFolder = path_1.join(process.cwd(), "assembly");
        var testFolder = path_1.join(assemblyFolder, "__tests__");
        var typesFileSource = require.resolve("@as-pect/cli/init/init-types.d.ts");
        var typesFile = path_1.join(testFolder, "as-pect.d.ts");
        console.log("");
        console.log(chalk_2.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgWhite.black [Log]} Initializing test suite files."], ["{bgWhite.black [Log]} Initializing test suite files."]))));
        console.log("");
        // create the assembly folder if it doesn't exist
        if (!fs_1.existsSync(assemblyFolder)) {
            console.log(chalk_2.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"]))));
            fs_1.mkdirSync(assemblyFolder);
        }
        // Create the test folder if it doesn't exist
        if (!fs_1.existsSync(testFolder)) {
            console.log(chalk_2.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"]))));
            fs_1.mkdirSync(testFolder);
            // create the example file only if the __tests__ folder does not exist
            var exampleFile = path_1.join(testFolder, "example.spec.ts");
            var exampleFileSource = path_1.join(__dirname, "../init/example.spec.ts");
            if (!fs_1.existsSync(exampleFile)) {
                console.log(chalk_2.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/example.spec.ts}"], ["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/example.spec.ts}"]))));
                fs_1.createReadStream(exampleFileSource, "utf-8").pipe(fs_1.createWriteStream(exampleFile, "utf-8"));
            }
        }
        // create the types file if it doesn't exist for typescript tooling users
        if (!fs_1.existsSync(typesFile)) {
            console.log(chalk_2.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/as-pect.d.ts}"], ["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/as-pect.d.ts}"]))));
            fs_1.createReadStream(typesFileSource, "utf-8").pipe(fs_1.createWriteStream(typesFile, "utf-8"));
        }
        // create the default configuration file
        var configFile = path_1.join(process.cwd(), "as-pect.config.js");
        var configFileSource = path_1.join(__dirname, "../init/as-pect.config.js");
        if (!fs_1.existsSync(configFile)) {
            console.log(chalk_2.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow ./as-pect.config.js}"], ["{bgWhite.black [Log]} Creating file: {yellow ./as-pect.config.js}"]))));
            fs_1.createReadStream(configFileSource, "utf-8").pipe(fs_1.createWriteStream(configFile, "utf-8"));
        }
    }
    exports.init = init;
    var templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7;
});
define("portable", ["require", "exports", "chalk", "fs", "path"], function (require, exports, chalk_3, fs_2, path_2) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_3 = __importDefault(chalk_3);
    /**
     * @ignore
     *
     * This method creates a portable types file to the current testing directory located at
     * `./assembly/__tests__/` for the current project.
     */
    function portable() {
        var assemblyFolder = path_2.join(process.cwd(), "assembly");
        var testFolder = path_2.join(assemblyFolder, "__tests__");
        var typesFileSource = require.resolve("@as-pect/cli/init/portable-types.d.ts");
        var typesFile = path_2.join(testFolder, "as-pect.d.ts");
        console.log("");
        console.log(chalk_3.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["{bgWhite.black [Log]} Initializing portable types."], ["{bgWhite.black [Log]} Initializing portable types."]))));
        console.log("");
        // Create the assembly folder if it doesn't exist
        if (!fs_2.existsSync(assemblyFolder)) {
            console.log(chalk_3.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"]))));
            fs_2.mkdirSync(assemblyFolder);
        }
        // Create the test folder if it doesn't exist
        if (!fs_2.existsSync(testFolder)) {
            console.log(chalk_3.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"]))));
            fs_2.mkdirSync(testFolder);
        }
        // Always create the types file
        console.log(chalk_3.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/as-pect.d.ts}"], ["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/as-pect.d.ts}"]))));
        fs_2.createReadStream(typesFileSource, "utf-8").pipe(fs_2.createWriteStream(typesFile, "utf-8"));
    }
    exports.portable = portable;
    var templateObject_8, templateObject_9, templateObject_10, templateObject_11;
});
define("util/IConfiguration", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
});
define("util/collectReporter", ["require", "exports", "@as-pect/core", "querystring", "chalk"], function (require, exports, core_1, querystring_1, chalk_4) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    querystring_1 = __importDefault(querystring_1);
    chalk_4 = __importDefault(chalk_4);
    /**
     * @ignore
     * This method inspects the command line arguments and returns the corresponding TestReporter.
     *
     * @param {Options} cliOptions - The command line arguments.
     */
    function collectReporter(cliOptions) {
        var reporters = [];
        if (cliOptions.csv) {
            var CSVReporter = require("@as-pect/core").CSVReporter;
            if (typeof cliOptions.csv === "string") {
                var options = querystring_1.default.parse(cliOptions.csv || "");
                reporters.push(new CSVReporter(options));
            }
            else {
                reporters.push(new CSVReporter());
            }
            process.stdout.write(chalk_4.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow CSVReporter}\n"], ["{bgWhite.black [Log]} Using {yellow CSVReporter}\\n"]))));
        }
        if (cliOptions.json) {
            var JSONReporter = require("@as-pect/core").JSONReporter;
            if (typeof cliOptions.json === "string") {
                var options = querystring_1.default.parse(cliOptions.json || "");
                reporters.push(new JSONReporter(options));
            }
            else {
                reporters.push(new JSONReporter());
            }
            process.stdout.write(chalk_4.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow JSONReporter}\n"], ["{bgWhite.black [Log]} Using {yellow JSONReporter}\\n"]))));
        }
        if (cliOptions.summary) {
            var SummaryReporter_1 = require("@as-pect/core").SummaryReporter;
            if (typeof cliOptions.summary === "string") {
                var options = querystring_1.default.parse(cliOptions.summary || "");
                reporters.push(new SummaryReporter_1(options));
            }
            else {
                reporters.push(new SummaryReporter_1());
            }
            process.stdout.write(chalk_4.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow SummaryReporter}\n"], ["{bgWhite.black [Log]} Using {yellow SummaryReporter}\\n"]))));
        }
        if (cliOptions.verbose) {
            var VerboseReporter = require("@as-pect/core").VerboseReporter;
            if (typeof cliOptions.verbose === "string") {
                var options = querystring_1.default.parse(cliOptions.verbose || "");
                reporters.push(new VerboseReporter(options));
            }
            else {
                reporters.push(new VerboseReporter());
            }
            process.stdout.write(chalk_4.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow VerboseReporter}\n"], ["{bgWhite.black [Log]} Using {yellow VerboseReporter}\\n"]))));
        }
        if (cliOptions.reporter) {
            var url = require("url").parse(cliOptions.reporter);
            try {
                var reporterValue = require(url.pathname);
                var Reporter = reporterValue.default || reporterValue;
                var options = require("querystring").parse(url.query);
                if (typeof Reporter === "function") {
                    reporters.push(new Reporter(options));
                }
                else {
                    reporters.push(Reporter);
                }
            }
            catch (ex) {
                console.error(chalk_4.default(templateObject_16 || (templateObject_16 = __makeTemplateObject(["{red [Error]} Cannot find a reporter at {yellow ", "}"], ["{red [Error]} Cannot find a reporter at {yellow ", "}"])), url.pathname));
                console.error(ex);
                process.exit(1);
            }
            process.stdout.write(chalk_4.default(templateObject_17 || (templateObject_17 = __makeTemplateObject(["{bgWhite.black [Log]} Using custom reporter at: {yellow ", "}\n"], ["{bgWhite.black [Log]} Using custom reporter at: {yellow ", "}\\n"])), url.pathname));
        }
        if (reporters.length === 0) {
            process.stdout.write(chalk_4.default(templateObject_18 || (templateObject_18 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow SummaryReporter}\n"], ["{bgWhite.black [Log]} Using {yellow SummaryReporter}\\n"]))));
            return new core_1.SummaryReporter({
                enableLogging: true,
            });
        }
        else {
            return new core_1.CombinationReporter(reporters);
        }
    }
    exports.collectReporter = collectReporter;
    var templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18;
});
define("util/getTestEntryFiles", ["require", "exports", "glob"], function (require, exports, glob_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    glob_1 = __importDefault(glob_1);
    /**
     * @ignore
     * This method returns a `Set<string>` of entry files for the compiler to compile.
     *
     * @param {Options} cliOptions - The command line arguments.
     * @param {string[]} include - An array of globs provided by the configuration.
     * @param {RegExp[]} disclude - An array of RegExp provided by the configuration.
     */
    function getTestEntryFiles(cliOptions, include, disclude) {
        var testEntryFiles = new Set();
        var fileRegexArg = cliOptions.file;
        var fileRegex = new RegExp(fileRegexArg);
        // for each pattern to be included
        for (var _i = 0, include_1 = include; _i < include_1.length; _i++) {
            var pattern = include_1[_i];
            // push all the resulting files so that each file gets tested individually
            entry: for (var _a = 0, _b = glob_1.default.sync(pattern); _a < _b.length; _a++) {
                var entry = _b[_a];
                // test for discludes
                for (var _c = 0, disclude_1 = disclude; _c < disclude_1.length; _c++) {
                    var test_1 = disclude_1[_c];
                    if (test_1.test(entry))
                        continue entry;
                }
                // if the fileRegex matches the test, add it to the entry file Set
                if (fileRegex.test(entry))
                    testEntryFiles.add(entry);
            }
        }
        return testEntryFiles;
    }
    exports.getTestEntryFiles = getTestEntryFiles;
});
define("util/writeFile", ["require", "exports", "fs"], function (require, exports, fs_3) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * @ignore
     * This method promisifies the fs.writeFile function call, and is compatible with node 10.
     *
     * @param {string} file - The file location to write to.
     * @param {Uint8Array} contents - The file contents to write to the disk.
     */
    function writeFile(file, contents) {
        return new Promise(function (resolve, reject) {
            fs_3.writeFile(file, contents, function (err) {
                if (err)
                    reject(err);
                else
                    resolve();
            });
        });
    }
    exports.writeFile = writeFile;
});
define("worklets/ICommand", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
});
define("run", ["require", "exports", "fs", "perf_hooks", "path", "chalk", "@as-pect/core", "glob", "util/collectReporter", "util/getTestEntryFiles", "util/writeFile", "@as-pect/core/lib/util/timeDifference"], function (require, exports, fs, perf_hooks_1, path, chalk_5, core_2, glob_2, collectReporter_1, getTestEntryFiles_1, writeFile_1, timeDifference_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    fs = __importStar(fs);
    path = __importStar(path);
    chalk_5 = __importDefault(chalk_5);
    glob_2 = __importDefault(glob_2);
    /**
     * @ignore
     * This method actually runs the test suites in sequential order synchronously.
     *
     * @param {Options} cliOptions - The command line arguments.
     * @param {string[]} compilerArgs - The `asc` compiler arguments.
     */
    function run(cliOptions, compilerArgs) {
        var start = perf_hooks_1.performance.now();
        var worklets = [];
        /** Collect the assemblyscript module path. */
        var assemblyScriptFolder = cliOptions.compiler.startsWith(".")
            ? path.join(process.cwd(), cliOptions.compiler)
            : cliOptions.compiler;
        /**
         * Create the compiler worklets if the worker flag is not 0.
         */
        if (cliOptions.workers !== 0) {
            var Worker_1 = require("worker_threads").Worker;
            if (!isFinite(cliOptions.workers)) {
                console.error(chalk_5.default(templateObject_19 || (templateObject_19 = __makeTemplateObject(["{red [Error]} Invalid worker configuration: {yellow ", "}"], ["{red [Error]} Invalid worker configuration: {yellow ", "}"])), cliOptions.workers.toString()));
                process.exit(1);
            }
            var workletPath = require.resolve("./worklets/compiler");
            for (var i = 0; i < cliOptions.workers; i++) {
                var worklet = new Worker_1(workletPath, {
                    workerData: {
                        assemblyScriptFolder: assemblyScriptFolder,
                    },
                });
                worklets.push(worklet);
            }
            console.log(chalk_5.default(templateObject_20 || (templateObject_20 = __makeTemplateObject(["{bgWhite.black [Log]} Using experimental compiler worklets: {yellow ", " worklets}"], ["{bgWhite.black [Log]} Using experimental compiler worklets: {yellow ", " worklets}"])), worklets.length.toString()));
        }
        /**
         * Instead of using `import`, the strategy is to encourage node to start the testing process
         * as soon as possible. Calling require and measuring the performance of compiler loading shows
         * developers a meaningful explaination of why it takes a few seconds for the software to start
         * running.
         */
        console.log(chalk_5.default(templateObject_21 || (templateObject_21 = __makeTemplateObject(["{bgWhite.black [Log]} Loading asc compiler"], ["{bgWhite.black [Log]} Loading asc compiler"]))));
        var asc;
        var instantiateSync;
        var parse;
        var exportTable = false;
        try {
            var folderUsed = "cli";
            try {
                /** Next, obtain the compiler, and assert it has a main function. */
                asc = require(path.join(assemblyScriptFolder, "cli", "asc"));
            }
            catch (ex) {
                try {
                    folderUsed = "dist";
                    asc = require(path.join(assemblyScriptFolder, "dist", "asc"));
                }
                catch (ex) {
                    throw ex;
                }
            }
            if (!asc) {
                throw new Error(cliOptions.compiler + "/" + folderUsed + "/asc has no exports.");
            }
            if (!asc.main) {
                throw new Error(cliOptions.compiler + "/" + folderUsed + "/asc does not export a main() function.");
            }
            /** Next, collect the loader, and assert it has an instantiateSync method. */
            var loader = require(path.join(assemblyScriptFolder, "lib", "loader"));
            if (!loader) {
                throw new Error(cliOptions.compiler + "/lib/loader has no exports.");
            }
            if (!loader.instantiateSync) {
                throw new Error(cliOptions.compiler + "/lib/loader does not export an instantiateSync() method.");
            }
            instantiateSync = loader.instantiateSync;
            /** Finally, collect the cli options from assemblyscript. */
            var options = require(path.join(assemblyScriptFolder, "cli", "util", "options"));
            if (!options) {
                throw new Error(cliOptions.compiler + "/cli/util/options exports null");
            }
            if (!options.parse) {
                throw new Error(cliOptions.compiler + "/cli/util/options does not export a parse() method.");
            }
            if (asc.options.exportTable) {
                exportTable = true;
            }
            parse = options.parse;
        }
        catch (ex) {
            console.error(chalk_5.default(templateObject_22 || (templateObject_22 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), cliOptions.compiler));
            console.error(ex);
            process.exit(1);
        }
        console.log(chalk_5.default(templateObject_23 || (templateObject_23 = __makeTemplateObject(["{bgWhite.black [Log]} Compiler loaded in {yellow ", "ms}."], ["{bgWhite.black [Log]} Compiler loaded in {yellow ",
            "ms}."])), timeDifference_1.timeDifference(perf_hooks_1.performance.now(), start).toString()));
        // obtain the configuration file
        var configurationPath = path.resolve(process.cwd(), cliOptions.config);
        console.log(chalk_5.default(templateObject_24 || (templateObject_24 = __makeTemplateObject(["{bgWhite.black [Log]} Using configuration {yellow ", "}"], ["{bgWhite.black [Log]} Using configuration {yellow ", "}"])), configurationPath));
        var configuration = {};
        try {
            configuration = require(configurationPath) || {};
        }
        catch (ex) {
            console.error("");
            console.error(chalk_5.default(templateObject_25 || (templateObject_25 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), configurationPath));
            console.error(ex);
            process.exit(1);
        }
        // configuration must be an object
        if (!configuration) {
            console.error(chalk_5.default(templateObject_26 || (templateObject_26 = __makeTemplateObject(["{bgRedBright.black [Error]} Configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} Configuration at {bold [", "]} is null or not an object."])), configurationPath));
            process.exit(1);
        }
        var include = configuration.include || [
            "assembly/__tests__/**/*.spec.ts",
        ];
        var add = configuration.add || [
            "assembly/__tests__/**/*.include.ts",
        ];
        // parse passed cli compiler arguments and determine if there are any bad arguments.
        if (compilerArgs.length > 0) {
            var output = parse(compilerArgs, asc.options);
            // if there are any unknown flags, report them and exit 1
            if (output.unknown.length > 0) {
                console.error(chalk_5.default(templateObject_27 || (templateObject_27 = __makeTemplateObject(["{bgRedBright.black [Error]} Unknown compiler arguments {bold.yellow [", "]}."], ["{bgRedBright.black [Error]} Unknown compiler arguments {bold.yellow [",
                    "]}."])), output.unknown.join(", ")));
                process.exit(1);
            }
        }
        // Create the compiler flags
        var flags = Object.assign({}, configuration.flags, {
            "--validate": [],
            "--debug": [],
            "--binaryFile": ["output.wasm"],
            "--explicitStart": [],
        });
        /**
         * Check to see if rtrace is disabled.
         */
        if (cliOptions.nortrace) {
            configuration.nortrace = true;
        }
        /** RTrace is enabled, and the --use ASC_RTRACE=1 cli option must be present. */
        if (!configuration.nortrace) {
            if (!flags["--use"] || flags["--use"].includes("ASC_RTRACE=1") || !compilerArgs.includes("ASC_RTRACE=1")) {
                if (!flags["--use"]) {
                    flags["--use"] = ["ASC_RTRACE=1"];
                    // inspect to see if the flag is used already
                }
                else if (!flags["--use"].includes("ASC_RTRACE=1")) {
                    flags["--use"].push("--use", "ASC_RTRACE=1");
                }
            }
        }
        if (exportTable) {
            flags["--exportTable"] = [];
        }
        /** It's useful to notify the user that optimizations will make test compile times slower. */
        if (flags.hasOwnProperty("-O3") ||
            flags.hasOwnProperty("-O2") ||
            flags.hasOwnProperty("--optimize") ||
            compilerArgs.includes("-O3") ||
            compilerArgs.includes("-O2") ||
            compilerArgs.includes("--optimize")) {
            console.log(chalk_5.default(templateObject_28 || (templateObject_28 = __makeTemplateObject(["{yellow [Warning]} Using optimizations. This may result in slow test compilation times."], ["{yellow [Warning]} Using optimizations. This may result in slow test compilation times."]))));
        }
        var disclude = configuration.disclude || [];
        // if a reporter is specified in cli arguments, override configuration
        var reporter = configuration.reporter || collectReporter_1.collectReporter(cliOptions);
        if (configuration.performance) {
            Object.getOwnPropertyNames(configuration.performance).forEach(function (option) {
                if (cliOptions.changed.has("performance." + option)) {
                    cliOptions.performance[option] = configuration.performance[option];
                }
            });
        }
        var performanceConfiguration = cliOptions.performance;
        // include all the file globs
        console.log(chalk_5.default(templateObject_29 || (templateObject_29 = __makeTemplateObject(["{bgWhite.black [Log]} Including files: ", ""], ["{bgWhite.black [Log]} Including files: ", ""])), include.join(", ")));
        // Create the test and group matchers
        var testRegex = new RegExp(cliOptions.test, "i");
        configuration.testRegex = testRegex;
        console.log(chalk_5.default(templateObject_30 || (templateObject_30 = __makeTemplateObject(["{bgWhite.black [Log]} Running tests that match: {yellow ", "}"], ["{bgWhite.black [Log]} Running tests that match: {yellow ", "}"])), testRegex.source));
        var groupRegex = new RegExp(cliOptions.group, "i");
        configuration.groupRegex = groupRegex;
        console.log(chalk_5.default(templateObject_31 || (templateObject_31 = __makeTemplateObject(["{bgWhite.black [Log]} Running groups that match: {yellow ", "}"], ["{bgWhite.black [Log]} Running groups that match: {yellow ", "}"])), groupRegex.source));
        /**
         * Check to see if the binary files should be written to the fileSystem.
         */
        var outputBinary = !!(cliOptions.outputBinary || configuration.outputBinary);
        if (outputBinary) {
            console.log(chalk_5.default(templateObject_32 || (templateObject_32 = __makeTemplateObject(["{bgWhite.black [Log]} Outputing Binary *.wasm files."], ["{bgWhite.black [Log]} Outputing Binary *.wasm files."]))));
        }
        /**
         * If rtrace is enabled, add `--use ASC_RTRACE=1` to the command line parameters.
         */
        if (configuration.nortrace) {
            console.log(chalk_5.default(templateObject_33 || (templateObject_33 = __makeTemplateObject(["{bgWhite.black [Log]} Reference Tracing is disabled."], ["{bgWhite.black [Log]} Reference Tracing is disabled."]))));
        }
        /**
         * Check to see if the tests should be run in the first place.
         */
        var runTests = !cliOptions.norun;
        if (!runTests) {
            console.log(chalk_5.default(templateObject_34 || (templateObject_34 = __makeTemplateObject(["{bgWhite.black [Log]} Not running tests, only outputting files."], ["{bgWhite.black [Log]} Not running tests, only outputting files."]))));
        }
        if (compilerArgs.length > 0) {
            console.log(chalk_5.default(templateObject_35 || (templateObject_35 = __makeTemplateObject(["{bgWhite.black [Log]} Adding compiler arguments: "], ["{bgWhite.black [Log]} Adding compiler arguments: "]))) +
                compilerArgs.join(" "));
        }
        var addedTestEntryFiles = new Set();
        /** Get all the test entry files. */
        var testEntryFiles = getTestEntryFiles_1.getTestEntryFiles(cliOptions, include, disclude);
        for (var _i = 0, add_1 = add; _i < add_1.length; _i++) {
            var pattern = add_1[_i];
            // push all the added files to the added entry point list
            for (var _a = 0, _b = glob_2.default.sync(pattern); _a < _b.length; _a++) {
                var entry = _b[_a];
                addedTestEntryFiles.add(entry);
            }
        }
        // must include the assembly/index.ts file located in the assembly package
        var entryPath = require.resolve("@as-pect/assembly/assembly/index.ts");
        var relativeEntryPath = path.relative(process.cwd(), entryPath);
        // add the relativeEntryPath of as-pect to the list of compiled files for each test
        addedTestEntryFiles.add(relativeEntryPath);
        // Create a test runner, and run each test
        var count = testEntryFiles.size;
        // create the array of compiler flags from the flags object
        var flagList = Object.entries(flags).reduce(function (args, _a) {
            var flag = _a[0], options = _a[1];
            return args.concat(flag, options);
        }, []).concat(compilerArgs);
        var testCount = 0;
        var successCount = 0;
        var groupSuccessCount = 0;
        var groupCount = 0;
        var errors = [];
        var filePromises = [];
        var failed = false;
        var folderMap = new Map();
        var fileMap = new Map();
        console.log(chalk_5.default(templateObject_36 || (templateObject_36 = __makeTemplateObject(["{bgWhite.black [Log]} Effective command line args:"], ["{bgWhite.black [Log]} Effective command line args:"]))));
        console.log(chalk_5.default(templateObject_37 || (templateObject_37 = __makeTemplateObject(["  {green [TestFile.ts]} {yellow ", "} ", ""], ["  {green [TestFile.ts]} {yellow ",
            "} ", ""])), Array.from(addedTestEntryFiles).join(" "), flagList.join(" ")));
        // add a line seperator between the next line and this line
        console.log("");
        var finalCompilerArguments = __spreadArrays(Array.from(addedTestEntryFiles), flagList);
        function runBinary(error, file, binary) {
            // if there are any compilation errors, stop the test suite
            if (error) {
                console.error(chalk_5.default(templateObject_38 || (templateObject_38 = __makeTemplateObject(["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."], ["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."])), file));
                console.error(error);
                return process.exit(1);
            }
            // if the binary wasn't emitted, stop the test suite
            if (!binary) {
                console.error(chalk_5.default(templateObject_39 || (templateObject_39 = __makeTemplateObject(["{red [Error]} There was no output binary file: ", ". Did you forget to emit the binary with {yellow --binaryFile}?"], ["{red [Error]} There was no output binary file: ", ". Did you forget to emit the binary with {yellow --binaryFile}?"])), file));
                return process.exit(1);
            }
            if (runTests) {
                // create a test runner
                var runner = new core_2.TestContext({
                    fileName: file,
                    groupRegex: configuration.groupRegex,
                    testRegex: configuration.testRegex,
                    performanceConfiguration: performanceConfiguration,
                    reporter: reporter,
                    binary: binary
                });
                // detect custom imports
                var customImportFileLocation = path.resolve(path.join(path.dirname(file), path.basename(file, path.extname(file)) + ".imports.js"));
                var imports = runner.createImports((fs.existsSync(customImportFileLocation)
                    ? require(customImportFileLocation)
                    : configuration.imports) || {});
                // instantiate the module
                var wasm = instantiateSync(binary, imports);
                if (runner.errors.length > 0) {
                    errors.push.apply(errors, runner.errors);
                }
                else {
                    // call run buffer because it's already compiled
                    runner.run(wasm);
                    testCount += runner.testGroups.reduce(function (left, right) { return left + right.tests.length; }, 0);
                    successCount += runner.testGroups.reduce(function (left, right) { return left + right.tests.filter(function (e) { return e.pass; }).length; }, 0);
                    groupCount += runner.testGroups.length;
                    groupSuccessCount = runner.testGroups.reduce(function (left, right) { return left + (right.pass ? 1 : 0); }, groupSuccessCount);
                    errors.push.apply(errors, runner.errors); // if there are any runtime allocation errors add them
                }
            }
            count -= 1;
            // if any tests failed, and they all ran, exit(1)
            if (count === 0) {
                if (runTests) {
                    var end = perf_hooks_1.performance.now();
                    failed = testCount !== successCount || errors.length > 0;
                    var result = failed ? chalk_5.default(templateObject_40 || (templateObject_40 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"]))) : chalk_5.default(templateObject_41 || (templateObject_41 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"])));
                    console.log("~".repeat(Math.max(process.stdout.columns - 10, 10)));
                    for (var _i = 0, errors_1 = errors; _i < errors_1.length; _i++) {
                        var error_1 = errors_1[_i];
                        console.log(chalk_5.default(templateObject_42 || (templateObject_42 = __makeTemplateObject(["\n [Error]: {red ", "}: ", "\n [Stack]: {yellow ", "}\n"], ["\n [Error]: {red ", "}: ", "\n [Stack]: {yellow ", "}\n"])), error_1.type, error_1.message, error_1.stackTrace.split("\n").join("\n            ")));
                    }
                    console.log(chalk_5.default(templateObject_43 || (templateObject_43 = __makeTemplateObject(["\n  [Result]: ", "\n   [Files]: ", " total\n  [Groups]: ", " count, ", " pass\n   [Tests]: ", " pass, ", " fail, ", " total\n    [Time]: ", "ms"], ["\n  [Result]: ", "\n   [Files]: ", " total\n  [Groups]: ", " count, ", " pass\n   [Tests]: ", " pass, ",
                        " fail, ", " total\n    [Time]: ", "ms"])), result, testEntryFiles.size.toString(), groupCount.toString(), groupSuccessCount.toString(), successCount.toString(), (testCount - successCount).toString(), testCount.toString(), timeDifference_1.timeDifference(end, start).toString()));
                    if (worklets.length > 0) {
                        for (var _a = 0, worklets_1 = worklets; _a < worklets_1.length; _a++) {
                            var worklet = worklets_1[_a];
                            worklet.terminate();
                        }
                    }
                }
                Promise.all(filePromises).then(function () {
                    if (failed)
                        process.exit(1);
                });
            }
            return 0;
        }
        if (worklets.length > 0) {
            var i = 0;
            var length_1 = worklets.length;
            for (var _c = 0, _d = Array.from(testEntryFiles); _c < _d.length; _c++) {
                var entry = _d[_c];
                var workload = {
                    type: "compile",
                    props: {
                        file: entry,
                        args: __spreadArrays([entry], finalCompilerArguments),
                        outputBinary: outputBinary,
                    },
                };
                worklets[i % length_1].postMessage(workload);
            }
            worklets.forEach(function (worklet) {
                worklet.on("message", function (e) {
                    runBinary(e.props.error, e.props.file, e.props.binary);
                });
            });
        }
        else {
            // for each file, synchronously run each test
            Array.from(testEntryFiles).forEach(function (file) {
                var binary;
                asc.main(__spreadArrays([file], finalCompilerArguments), {
                    stdout: process.stdout,
                    stderr: process.stderr,
                    listFiles: function (dirname, baseDir) {
                        var folder = path.join(baseDir, dirname);
                        if (folderMap.has(folder)) {
                            return folderMap.get(folder);
                        }
                        try {
                            var results = fs
                                .readdirSync(folder)
                                .filter(function (file) { return /^(?!.*\.d\.ts$).*\.ts$/.test(file); });
                            folderMap.set(folder, results);
                            return results;
                        }
                        catch (e) {
                            return [];
                        }
                    },
                    readFile: function (filename, baseDir) {
                        var fileName = path.join(baseDir, filename);
                        if (fileMap.has(fileName)) {
                            return fileMap.get(fileName);
                        }
                        try {
                            var contents = fs.readFileSync(fileName, { encoding: "utf8" });
                            fileMap.set(fileName, contents);
                            return contents;
                        }
                        catch (e) {
                            return null;
                        }
                    },
                    writeFile: function (name, contents, baseDir) {
                        if (baseDir === void 0) { baseDir = "."; }
                        var ext = path.extname(name);
                        // get the wasm file
                        if (ext === ".wasm") {
                            binary = contents;
                            if (!outputBinary)
                                return;
                        }
                        else if (ext === ".ts") {
                            filePromises.push(writeFile_1.writeFile(path.join(baseDir, name), contents));
                            return;
                        }
                        var outfileName = path.join(path.dirname(file), path.basename(file, path.extname(file)) + ext);
                        filePromises.push(writeFile_1.writeFile(outfileName, contents));
                    },
                }, function (error) { return runBinary(error, file, binary); });
            });
        }
    }
    exports.run = run;
    var templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28, templateObject_29, templateObject_30, templateObject_31, templateObject_32, templateObject_33, templateObject_34, templateObject_35, templateObject_36, templateObject_37, templateObject_38, templateObject_39, templateObject_40, templateObject_41, templateObject_42, templateObject_43;
});
require("../lib/index.js").asp(process.argv.slice(2));
define("types", ["require", "exports", "chalk", "fs", "path"], function (require, exports, chalk_6, fs_4, path_3) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_6 = __importDefault(chalk_6);
    /**
     * @ignore
     *
     * This method creates a types file to the current testing directory located at
     * `./assembly/__tests__/` for the current project.
     */
    function types() {
        var assemblyFolder = path_3.join(process.cwd(), "assembly");
        var testFolder = path_3.join(assemblyFolder, "__tests__");
        var typesFileSource = require.resolve("@as-pect/cli/init/init-types.d.ts");
        var typesFile = path_3.join(testFolder, "as-pect.d.ts");
        console.log("");
        console.log(chalk_6.default(templateObject_44 || (templateObject_44 = __makeTemplateObject(["{bgWhite.black [Log]} Initializing types."], ["{bgWhite.black [Log]} Initializing types."]))));
        console.log("");
        // Create the assembly folder if it doesn't exist
        if (!fs_4.existsSync(assemblyFolder)) {
            console.log(chalk_6.default(templateObject_45 || (templateObject_45 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"]))));
            fs_4.mkdirSync(assemblyFolder);
        }
        // Create the test folder if it doesn't exist
        if (!fs_4.existsSync(testFolder)) {
            console.log(chalk_6.default(templateObject_46 || (templateObject_46 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"]))));
            fs_4.mkdirSync(testFolder);
        }
        // Always create the types file
        console.log(chalk_6.default(templateObject_47 || (templateObject_47 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/as-pect.d.ts}"], ["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/as-pect.d.ts}"]))));
        fs_4.createReadStream(typesFileSource, "utf-8").pipe(fs_4.createWriteStream(typesFile, "utf-8"));
    }
    exports.types = types;
    var templateObject_44, templateObject_45, templateObject_46, templateObject_47;
});
define("util/asciiArt", ["require", "exports", "chalk"], function (require, exports, chalk_7) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_7 = __importDefault(chalk_7);
    /**
     * @ignore
     *
     * This method prints the ascii art.
     * @param {string} version - The cli version
     */
    function printAsciiArt(version) {
        console.log(chalk_7.default(templateObject_48 || (templateObject_48 = __makeTemplateObject(["{bold.bgWhite.black ", "       ___   _____                       __    \n      /   | / ___/      ____  ___  _____/ /_   \n     / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/   \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_     \n   /_/  |_/____/     / .___/\\___/\\___/\\__/     \n                    /_/                        }\n\n\u26A1AS-pect\u26A1 Test suite runner {bgGreenBright.bold.black [", "]}\n"], ["{bold.bgWhite.black ", "       ___   _____                       __    \n      /   | / ___/      ____  ___  _____/ /_   \n     / /| | \\\\__ \\\\______/ __ \\\\/ _ \\\\/ ___/ __/   \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_     \n   /_/  |_/____/     / .___/\\\\___/\\\\___/\\\\__/     \n                    /_/                        }\n\n\u26A1AS-pect\u26A1 Test suite runner {bgGreenBright.bold.black [", "]}\n"])), "", version));
    }
    exports.printAsciiArt = printAsciiArt;
    var templateObject_48;
});
define("worklets/compiler", ["require", "exports", "fs", "path", "worker_threads", "util/writeFile"], function (require, exports, fs_5, path_4, worker_threads_1, writeFile_2) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * @ignore
     *
     * This variable holds the AssemblyScript compiler.
     */
    var asc = require(path_4.join(worker_threads_1.workerData.assemblyScriptFolder, "dist", "asc"));
    /**
     * @ignore
     *
     * This variable holds the fileMap for the compiler.
     */
    var fileMap = new Map();
    /**
     * @ignore
     *
     * This variable holds the folderMap for the compiler.
     */
    var folderMap = new Map();
    /**
     * @ignore
     *
     * Run a worklet command.
     * @param {ICommand} command - The command to run. (This is the compiler worklet command.)
     */
    function run(command) {
        var binary;
        var filePromises = [];
        asc.main(command.props.args, {
            stdout: process.stdout,
            stderr: process.stderr,
            listFiles: function (dirname, baseDir) {
                var folder = path_4.join(baseDir, dirname);
                if (folderMap.has(folder)) {
                    return folderMap.get(folder);
                }
                try {
                    var results = fs_5.readdirSync(folder)
                        .filter(function (file) { return /^(?!.*\.d\.ts$).*\.ts$/.test(file); });
                    folderMap.set(folder, results);
                    return results;
                }
                catch (e) {
                    return [];
                }
            },
            readFile: function (filename, baseDir) {
                var fileName = path_4.join(baseDir, filename);
                if (fileMap.has(fileName)) {
                    return fileMap.get(fileName);
                }
                try {
                    var contents = fs_5.readFileSync(fileName, { encoding: "utf8" });
                    fileMap.set(fileName, contents);
                    return contents;
                }
                catch (e) {
                    return null;
                }
            },
            writeFile: function (name, contents) {
                var ext = path_4.extname(name);
                // get the wasm file
                if (ext === ".wasm") {
                    binary = contents;
                    if (!command.props.outputBinary)
                        return;
                }
                var file = command.props.file;
                var outfileName = path_4.join(path_4.dirname(file), path_4.basename(file, path_4.extname(file)) + ext);
                filePromises.push(writeFile_2.writeFile(outfileName, contents));
            },
        }, function (error) {
            return Promise.all(filePromises)
                .then(function () {
                worker_threads_1.parentPort.postMessage({
                    type: "Result",
                    props: {
                        error: error
                            ? {
                                message: error.message,
                                stack: error.stack,
                                name: error.name,
                            }
                            : null,
                        binary: binary,
                        file: command.props.file,
                    },
                }, binary ? [binary.buffer] : []);
            })
                .catch(function (error) {
                worker_threads_1.parentPort.postMessage({
                    type: "Error",
                    props: {
                        error: error
                            ? {
                                message: error.message,
                                stack: error.stack,
                                name: error.name,
                            }
                            : null,
                    },
                });
            });
        });
    }
    worker_threads_1.parentPort.on("message", run);
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYXMtcGVjdC5jbGkuYW1kLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vc3JjL3Rlc3QudHMiLCIuLi9zcmMvaGVscC50cyIsIi4uL3NyYy91dGlsL3N0cmluZ3MudHMiLCIuLi9zcmMvdXRpbC9Db21tYW5kTGluZUFyZy50cyIsIi4uL3NyYy9pbmRleC50cyIsIi4uL3NyYy9pbml0LnRzIiwiLi4vc3JjL3BvcnRhYmxlLnRzIiwiLi4vc3JjL3V0aWwvSUNvbmZpZ3VyYXRpb24udHMiLCIuLi9zcmMvdXRpbC9jb2xsZWN0UmVwb3J0ZXIudHMiLCIuLi9zcmMvdXRpbC9nZXRUZXN0RW50cnlGaWxlcy50cyIsIi4uL3NyYy91dGlsL3dyaXRlRmlsZS50cyIsIi4uL3NyYy93b3JrbGV0cy9JQ29tbWFuZC50cyIsIi4uL3NyYy9ydW4udHMiLCIuLi9zcmMvdHlwZXMudHMiLCIuLi9zcmMvdXRpbC9hc2NpaUFydC50cyIsIi4uL3NyYy93b3JrbGV0cy9jb21waWxlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQ0VBOzs7O09BSUc7SUFDSCxTQUFnQixJQUFJO1FBQ2xCLE9BQU8sQ0FBQyxHQUFHLENBQUMsZUFBSywyaElBQUEsdzlIQTREaEIsS0FBQyxDQUFDO0lBQ0wsQ0FBQztJQTlERCxvQkE4REM7Ozs7OztJQ3JFRDs7Ozs7T0FLRztJQUNILFNBQWdCLFVBQVUsQ0FBQyxJQUFZO1FBQ3JDLE9BQU8sSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFDLGlCQUFpQixFQUFFLEdBQUcsSUFBSSxDQUFDLFNBQVMsQ0FBQyxDQUFDLENBQUMsQ0FBQztJQUN6RCxDQUFDO0lBRkQsZ0NBRUM7SUFFRDs7Ozs7O09BTUc7SUFDSCxTQUFnQixXQUFXLENBQUMsR0FBVyxFQUFFLElBQWtCO1FBQWxCLHFCQUFBLEVBQUEsVUFBa0I7UUFDekQsT0FBTyxHQUFHO2FBQ1AsS0FBSyxDQUFDLElBQUksQ0FBQzthQUNYLEdB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