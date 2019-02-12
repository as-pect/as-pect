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
var fs_1 = __importDefault(require("fs"));
var pkg = require("../package.json");
console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bold.bgWhite.black ", "     ___   _____                       __  \n    /   | / ___/      ____  ___  _____/ /_ \n   / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/ \n  / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n /_/  |_/____/     / .___/\\___/\\___/\\__/   \n                  /_/                      } AS-pect Test suite runner {bgGreenBright.black [", "]}\n"], ["{bold.bgWhite.black ",
    "     ___   _____                       __  \n    /   | / ___/      ____  ___  _____/ /_ \n   / /| | \\\\__ \\\\______/ __ \\\\/ _ \\\\/ ___/ __/ \n  / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n /_/  |_/____/     / .___/\\\\___/\\\\___/\\\\__/   \n                  /_/                      } AS-pect Test suite runner {bgGreenBright.black [", "]}\n"])), "", pkg.version));
function identity(value) { return value; }
commander_1.default
    .version(pkg.version)
    .option("-c, --config <path>", "The as-spect configuration location", identity)
    .option("-i, --init", "Initialize an as-pect test suite")
    .parse(process.argv);
console.log("config is", commander_1.default.config);
if (commander_1.default.init) {
    console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgWhite.black [Log]} Initializing test suite"], ["{bgWhite.black [Log]} Initializing test suite"]))));
    // Create the test folder
    var testFolder = path_1.default.join(process.cwd(), "assembly", "__tests__");
    if (!fs_1.default.existsSync(testFolder)) {
        console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: assembly/__tests__"], ["{bgWhite.black [Log]} Creating folder: assembly/__tests__"]))));
        fs_1.default.mkdirSync(testFolder);
    }
    var exampleFile = path_1.default.join(testFolder, "example.spec.ts");
    var exampleFileSource = path_1.default.join(__dirname, "..", "init", "example.spec.ts");
    if (!fs_1.default.existsSync(exampleFile)) {
        console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: assembly/__tests__/example.spec.ts"], ["{bgWhite.black [Log]} Creating file: assembly/__tests__/example.spec.ts"]))));
        fs_1.default.createReadStream(exampleFileSource, "utf-8")
            .pipe(fs_1.default.createWriteStream(exampleFile, "utf-8"));
    }
    var typesFileSource = path_1.default.join(__dirname, "..", "init", "as-pect.d.ts");
    var typesFile = path_1.default.join(testFolder, "as-pect.d.ts");
    if (!fs_1.default.existsSync(typesFile)) {
        console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: assembly/__tests__/as-pect.d.ts"], ["{bgWhite.black [Log]} Creating file: assembly/__tests__/as-pect.d.ts"]))));
        fs_1.default.createReadStream(typesFileSource, "utf-8")
            .pipe(fs_1.default.createWriteStream(typesFile, "utf-8"));
    }
    var configFile = path_1.default.join(process.cwd(), "as-pect.config.js");
    var configFileSource = path_1.default.join(__dirname, "..", "init", "as-pect.config.js");
    if (!fs_1.default.existsSync(configFile)) {
        console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: as-pect.config.js"], ["{bgWhite.black [Log]} Creating file: as-pect.config.js"]))));
        fs_1.default.createReadStream(configFileSource, "utf-8")
            .pipe(fs_1.default.createWriteStream(configFile, "utf-8"));
    }
    process.exit(0);
}
var configurationPath = path_1.default.resolve(process.cwd(), commander_1.default.config);
console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{bgWhite.black [Log]} using configuration ", ""], ["{bgWhite.black [Log]} using configuration ", ""])), configurationPath));
var configuration = null;
try {
    configuration = require(configurationPath);
}
catch (ex) {
    console.log("");
    console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["{bgRedBright.black [Error]} problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} problem loading {bold [", "]}."])), configurationPath));
    console.log(ex);
    process.exit(1);
}
if (!(typeof configuration === "object")) {
    console.log("");
    console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."])), configurationPath));
    process.exit(1);
}
console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{bgWhite.black [Log]} including files ", ""], ["{bgWhite.black [Log]} including files ", ""])), configuration.include.join(", ")));
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
    console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["{bgWhite.black [Log]} Compiling: ", " ", " / ", ""], ["{bgWhite.black [Log]} Compiling: ", " ", " / ", ""])), file, (i + 1).toString(), files.length.toString()));
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
            console.log(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."], ["{bgRedBright.black [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."])), file));
            console.log(error);
            process.exit(1);
            return;
        }
        if (!binaries[i]) {
            console.log(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["{bgRedBright.black [Error]} There was no output binary file: ", "."], ["{bgRedBright.black [Error]} There was no output binary file: ", "."])), file));
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
var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13;
//# sourceMappingURL=cli.js.map