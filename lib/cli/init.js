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
        define(["require", "exports", "chalk", "path", "fs"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
    var path_1 = __importDefault(require("path"));
    var fs_1 = __importDefault(require("fs"));
    function init(assemblyFolder, testFolder, typesFile, typesFileSource) {
        console.log("");
        console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["[Log] Initializing test suite files."], ["[Log] Initializing test suite files."]))));
        console.log("");
        // create the assembly folder if it doesn't exist
        if (!fs_1.default.existsSync(assemblyFolder)) {
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["[Log] Creating folder: ./assembly/"], ["[Log] Creating folder: ./assembly/"]))));
            fs_1.default.mkdirSync(assemblyFolder);
        }
        // Create the test folder if it doesn't exist
        if (!fs_1.default.existsSync(testFolder)) {
            console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["[Log] Creating folder: ./assembly/__tests__/"], ["[Log] Creating folder: ./assembly/__tests__/"]))));
            fs_1.default.mkdirSync(testFolder);
            // create the example file only if the __tests__ folder does not exist
            var exampleFile = path_1.default.join(testFolder, "example.spec.ts");
            var exampleFileSource = path_1.default.join(__dirname, "../../init/example.spec.ts");
            if (!fs_1.default.existsSync(exampleFile)) {
                console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["[Log] Creating file: ./assembly/__tests__/example.spec.ts"], ["[Log] Creating file: ./assembly/__tests__/example.spec.ts"]))));
                fs_1.default.createReadStream(exampleFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(exampleFile, "utf-8"));
            }
        }
        // create the types file if it doesn't exist for typescript tooling users
        if (!fs_1.default.existsSync(typesFile)) {
            console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["[Log] Creating file: assembly/__tests__/as-pect.d.ts"], ["[Log] Creating file: assembly/__tests__/as-pect.d.ts"]))));
            fs_1.default.createReadStream(typesFileSource, "utf-8")
                .pipe(fs_1.default.createWriteStream(typesFile, "utf-8"));
        }
        // create the default configuration file
        var configFile = path_1.default.join(process.cwd(), "as-pect.config.js");
        var configFileSource = path_1.default.join(__dirname, "../../init/as-pect.config.js");
        if (!fs_1.default.existsSync(configFile)) {
            console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["[Log] Creating file: as-pect.config.js"], ["[Log] Creating file: as-pect.config.js"]))));
            fs_1.default.createReadStream(configFileSource, "utf-8")
                .pipe(fs_1.default.createWriteStream(configFile, "utf-8"));
        }
    }
    exports.init = init;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6;
});
//# sourceMappingURL=init.js.map