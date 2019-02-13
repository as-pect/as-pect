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
        define(["require", "exports", "chalk", "path", "glob", "yargs-parser", "assemblyscript/cli/asc", "./test/TestRunner", "fs"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
    var path_1 = __importDefault(require("path"));
    var glob_1 = __importDefault(require("glob"));
    var yargs_parser_1 = __importDefault(require("yargs-parser"));
    // import { TestRunner } from "./test/TestRunner";
    var asc_1 = __importDefault(require("assemblyscript/cli/asc"));
    var TestRunner_1 = require("./test/TestRunner");
    var fs_1 = __importDefault(require("fs"));
    var pkg = require("../package.json");
    function asp(args) {
        var yargs = {
            argv: yargs_parser_1.default(args),
        };
        if (!(yargs.argv.v || yargs.argv.version)) {
            console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bold.bgWhite.black ", "       ___   _____                       __  \n      /   | / ___/      ____  ___  _____/ /_ \n     / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/ \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n   /_/  |_/____/     / .___/\\___/\\___/\\__/   \n                    /_/                      }\n\n  AS-pect Test suite runner {bgGreenBright.black [", "]}\n  "], ["{bold.bgWhite.black ",
                "       ___   _____                       __  \n      /   | / ___/      ____  ___  _____/ /_ \n     / /| | \\\\__ \\\\______/ __ \\\\/ _ \\\\/ ___/ __/ \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n   /_/  |_/____/     / .___/\\\\___/\\\\___/\\\\__/   \n                    /_/                      }\n\n  AS-pect Test suite runner {bgGreenBright.black [", "]}\n  "])), "", pkg.version));
        }
        if (yargs.argv.i || yargs.argv.init) {
            console.log("");
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["[Log] Initializing test suite files."], ["[Log] Initializing test suite files."]))));
            console.log("");
            // Create the test folder
            var testFolder = path_1.default.join(process.cwd(), "assembly", "__tests__");
            if (!fs_1.default.existsSync(testFolder)) {
                console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["[Log] Creating folder: assembly/__tests__"], ["[Log] Creating folder: assembly/__tests__"]))));
                fs_1.default.mkdirSync(testFolder);
            }
            var exampleFile = path_1.default.join(testFolder, "example.spec.ts");
            var exampleFileSource = path_1.default.join(__dirname, "..", "init", "example.spec.ts");
            if (!fs_1.default.existsSync(exampleFile)) {
                console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["[Log] Creating file: assembly/__tests__/example.spec.ts"], ["[Log] Creating file: assembly/__tests__/example.spec.ts"]))));
                fs_1.default.createReadStream(exampleFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(exampleFile, "utf-8"));
            }
            var typesFileSource = path_1.default.join(__dirname, "..", "init", "as-pect.d.ts");
            var typesFile = path_1.default.join(testFolder, "as-pect.d.ts");
            if (!fs_1.default.existsSync(typesFile)) {
                console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["[Log] Creating file: assembly/__tests__/as-pect.d.ts"], ["[Log] Creating file: assembly/__tests__/as-pect.d.ts"]))));
                fs_1.default.createReadStream(typesFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(typesFile, "utf-8"));
            }
            var configFile = path_1.default.join(process.cwd(), "as-pect.config.js");
            var configFileSource = path_1.default.join(__dirname, "..", "init", "as-pect.config.js");
            if (!fs_1.default.existsSync(configFile)) {
                console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["[Log] Creating file: as-pect.config.js"], ["[Log] Creating file: as-pect.config.js"]))));
                fs_1.default.createReadStream(configFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(configFile, "utf-8"));
            }
        }
        else if (yargs.argv.v || yargs.argv.version) {
            console.log(pkg.version);
        }
        else if (yargs.argv.help || yargs.argv.h) {
            console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["\n  {bold.blueBright SYNTAX}\n    {bold.green asp} --config as-pect.config.js\n    {bold.green asp} -c as-pect.config.js\n    {bold.green asp} --init\n    {bold.green asp} -i\n    {bold.green asp} --version\n    {bold.green asp} -v\n\n  {bold.blueBright OPTIONS}\n    {bold.green --version, -v}         Prints the package version and exits.\n    {bold.green --help, -h}            Prints this message and exits.\n    {bold.green --config, -c}          Accepts a configuration file and runs the tests.\n    {bold.green --init, -i}            Creates a test config, an assembly/__tests__ folder and exits.\n  "], ["\n  {bold.blueBright SYNTAX}\n    {bold.green asp} --config as-pect.config.js\n    {bold.green asp} -c as-pect.config.js\n    {bold.green asp} --init\n    {bold.green asp} -i\n    {bold.green asp} --version\n    {bold.green asp} -v\n\n  {bold.blueBright OPTIONS}\n    {bold.green --version, -v}         Prints the package version and exits.\n    {bold.green --help, -h}            Prints this message and exits.\n    {bold.green --config, -c}          Accepts a configuration file and runs the tests.\n    {bold.green --init, -i}            Creates a test config, an assembly/__tests__ folder and exits.\n  "]))));
        }
        else {
            var configurationPath = path_1.default.resolve(process.cwd(), yargs.argv.c || yargs.argv.config || "./as-pect.config.js");
            console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["{bgWhite.black [Log]} using configuration ", ""], ["{bgWhite.black [Log]} using configuration ", ""])), configurationPath));
            var configuration_1 = null;
            try {
                configuration_1 = require(configurationPath);
            }
            catch (ex) {
                console.log("");
                console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), configurationPath));
                console.log(ex);
                process.exit(1);
            }
            if (!(typeof configuration_1 === "object")) {
                console.log("");
                console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."])), configurationPath));
                process.exit(1);
            }
            console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["[Log] including files ", ""], ["[Log] including files ", ""])), configuration_1.include.join(", ")));
            console.log("");
            console.log("");
            var files_1 = [];
            for (var _i = 0, _a = configuration_1.include; _i < _a.length; _i++) {
                var pattern = _a[_i];
                files_1.push.apply(files_1, glob_1.default.sync(pattern));
            }
            var disclude = configuration_1.disclude || [];
            disclude.forEach(function (regexp) {
                files_1 = files_1.filter(function (file) { return !regexp.test(file); });
            });
            ;
            var binaries_1 = {};
            var entryPath = path_1.default.join(__dirname, "../assembly/index.ts");
            var relativePath_1 = path_1.default.relative(process.cwd(), entryPath);
            var failed_1 = false;
            var count_1 = files_1.length;
            var runner_1 = new TestRunner_1.TestRunner();
            files_1.forEach(function (file, i) {
                console.log(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["[Log] Compiling: ", " ", " / ", ""], ["[Log] Compiling: ", " ", " / ", ""])), file, (i + 1).toString(), files_1.length.toString()));
                console.log("");
                asc_1.default.main([
                    file, relativePath_1,
                    "--validate",
                    "--debug",
                    "--measure",
                    "--binaryFile", "output.wasm",
                ], {
                    // @ts-ignore: this is fine
                    stdout: process.stdout,
                    // @ts-ignore: this is fine
                    stderr: process.stderr,
                    writeFile: function (name, contents) {
                        if (path_1.default.extname(name) === ".wasm") {
                            binaries_1[i] = contents;
                        }
                    }
                }, function (error) {
                    if (error) {
                        console.log(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."], ["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."])), file));
                        console.log(error);
                        process.exit(1);
                        return;
                    }
                    if (!binaries_1[i]) {
                        console.log(chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{red [Error]} There was no output binary file: ", "."], ["{red [Error]} There was no output binary file: ", "."])), file));
                        process.exit(1);
                        return;
                    }
                    runner_1.run(file, binaries_1[i], Object.assign({}, configuration_1.imports), configuration_1.reporter || void 0);
                    count_1 -= 1;
                    failed_1 = failed_1 || !runner_1.passed;
                    if (count_1 === 0 && failed_1) {
                        process.exit(1);
                    }
                });
            });
        }
    }
    exports.asp = asp;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14;
});
//# sourceMappingURL=cli.js.map