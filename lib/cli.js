"use strict";
var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var commander_1 = __importDefault(require("commander"));
var chalk_1 = __importDefault(require("chalk"));
var path_1 = __importDefault(require("path"));
var glob_1 = __importDefault(require("glob"));
// import { TestRunner } from "./test/TestRunner";
var asc_1 = __importDefault(require("assemblyscript/cli/asc"));
var TestRunner_1 = require("./test/TestRunner");
var pkg = require("../package.json");
console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bold.bgWhite.black ", "     ___   _____                       __  \n    /   | / ___/      ____  ___  _____/ /_ \n   / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/ \n  / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n /_/  |_/____/     / .___/\\___/\\___/\\__/   \n                  /_/                      } AS-pect Test suite runner {bgGreenBright.black [", "]}\n"], ["{bold.bgWhite.black ",
    "     ___   _____                       __  \n    /   | / ___/      ____  ___  _____/ /_ \n   / /| | \\\\__ \\\\______/ __ \\\\/ _ \\\\/ ___/ __/ \n  / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n /_/  |_/____/     / .___/\\\\___/\\\\___/\\\\__/   \n                  /_/                      } AS-pect Test suite runner {bgGreenBright.black [", "]}\n"])), "", pkg.version));
function identity(value) { return value; }
commander_1.default
    .version(pkg.version)
    .option("-c, --config", "The as-spect configuration location", identity, "as-spect.config.js")
    .option("-i, --init", "Initialize an as-pect test suite")
    .parse(process.argv);
if (commander_1.default.init) {
    console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgWhite.black [Log]} Initializing test suite"], ["{bgWhite.black [Log]} Initializing test suite"]))));
}
var configurationPath = path_1.default.resolve(process.cwd(), commander_1.default.config);
console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} using configuration ", ""], ["{bgWhite.black [Log]} using configuration ", ""])), configurationPath));
var configuration = null;
try {
    configuration = require(configurationPath);
}
catch (ex) {
    console.log("");
    console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgRedBright.black [Error]} problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} problem loading {bold [", "]}."])), configurationPath));
    console.log(ex);
    process.exit(1);
}
if (!(typeof configuration === "object")) {
    console.log("");
    console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."])), configurationPath));
    process.exit(1);
}
console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgWhite.black [Log]} including files ", ""], ["{bgWhite.black [Log]} including files ", ""])), configuration.include.join(", ")));
console.log("");
console.log("");
var files = [];
for (var _i = 0, _a = configuration.include; _i < _a.length; _i++) {
    var pattern = _a[_i];
    files.push.apply(files, glob_1.default.sync(pattern));
}
var binaries = {};
var entryPath = path_1.default.join(__dirname, "../assembly/index.ts");
var relativePath = path_1.default.relative(process.cwd(), entryPath);
var failed = false;
var count = files.length;
files.forEach(function (file, i) {
    console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{bgWhite.black [Log]} Compiling: ", " ", " / ", ""], ["{bgWhite.black [Log]} Compiling: ", " ", " / ", ""])), file, (i + 1).toString(), files.length.toString()));
    console.log("");
    asc_1.default.main([
        file, relativePath,
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
                binaries[i] = contents;
            }
        }
    }, function (error) {
        if (error) {
            console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."], ["{bgRedBright.black [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."])), file));
            console.log(error);
            process.exit(1);
            return;
        }
        if (!binaries[i]) {
            console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{bgRedBright.black [Error]} There was no output binary file: ", "."], ["{bgRedBright.black [Error]} There was no output binary file: ", "."])), file));
            process.exit(1);
            return;
        }
        var runner = new TestRunner_1.TestRunner(binaries[i], Object.assign({}, configuration.imports));
        runner.run();
        count -= 1;
        failed = failed || !runner.passed;
        if (count === 0 && failed) {
            process.exit(1);
        }
    });
});
var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9;
//# sourceMappingURL=cli.js.map