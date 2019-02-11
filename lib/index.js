"use strict";
var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var loader_1 = require("assemblyscript/lib/loader");
var chalk_1 = __importDefault(require("chalk"));
var pkg = require('../package.json');
function testLoader(buffer, imports) {
    if (imports === void 0) { imports = {}; }
    var testCallback = -1;
    var start = Date.now();
    var reason = "";
    console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bold.bgWhite.black ", "    ___   _____                       __ \n   /   | / ___/      ____  ___  _____/ /_\n  / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/\n / ___ |___/ /_____/ /_/ /  __/ /__/ /_  \n/_/  |_/____/     / .___/\\___/\\___/\\__/  \n                 /_/                     } ASpect Test suite runner {bgRedBright.white [", "]}\n"], ["{bold.bgWhite.black ",
        "    ___   _____                       __ \n   /   | / ___/      ____  ___  _____/ /_\n  / /| | \\\\__ \\\\______/ __ \\\\/ _ \\\\/ ___/ __/\n / ___ |___/ /_____/ /_/ /  __/ /__/ /_  \n/_/  |_/____/     / .___/\\\\___/\\\\___/\\\\__/  \n                 /_/                     } ASpect Test suite runner {bgRedBright.white [", "]}\n"])), "", pkg.version));
    imports.env = {
        abort: function (reasonPointer, _fileNamePointer, _c, _d) {
            reason = wasm.getString(reasonPointer);
        },
    };
    imports.__aspect = {
        tryCall: function (pointer) {
            var func = wasm.getFunction(pointer);
            try {
                func();
            }
            catch (ex) {
                return 0;
            }
            return 1;
        },
        reportDescribe: function (suiteName) {
            console.log("");
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["Running test suite for {bold ", "}:"], ["Running test suite for {bold ", "}:"])), wasm.getString(suiteName)));
        },
        reportSuccess: function (testName) {
            console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["  {bgGreenBright.black [Success]}: ", ""], ["  {bgGreenBright.black [Success]}: ", ""])), wasm.getString(testName)));
        },
        reportFailure: function (testName) {
            console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["  {bgRedBright.white [Failure]}: ", ""], ["  {bgRedBright.white [Failure]}: ", ""])), wasm.getString(testName)));
            console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["    {bgWhite.black [Reason]}: ", ""], ["    {bgWhite.black [Reason]}: ", ""])), reason));
        },
        reportCallback: function (cb) {
            testCallback = cb;
        },
        reportStatistics: function (success, failed) {
            var end = Date.now();
            console.log("");
            console.log("");
            console.log("Test suite " + (failed === 0 ? chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgGreenBright.black PASS}"], ["{bgGreenBright.black PASS}"]))) : chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{bgRedBright.white FAIL}"], ["{bgRedBright.white FAIL}"])))));
            console.log("Tests:      " + success + " passed, " + (success + failed) + " total");
            console.log("Time:       " + (end - start) + "ms");
        }
    };
    var wasm = loader_1.instantiateBuffer(buffer, imports);
    var func = wasm.getFunction(testCallback);
    func();
}
exports.testLoader = testLoader;
var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7;
