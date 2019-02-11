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
function testLoader(buffer, imports) {
    if (imports === void 0) { imports = {}; }
    var testCallback = -1;
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
            console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bold.white ASpect Test}"], ["{bold.white ASpect Test}"]))));
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["Running test suite for {bold ", "}:"], ["Running test suite for {bold ", "}:"])), wasm.getString(suiteName)));
        },
        reportSuccess: function (testName) {
            console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["- {bgGreenBright.black Success}: ", ""], ["- {bgGreenBright.black Success}: ", ""])), wasm.getString(testName)));
        },
        reportFailure: function (testName) {
            console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["- {bgRedBright.white Failure}: ", ""], ["- {bgRedBright.white Failure}: ", ""])), wasm.getString(testName)));
        },
        reportCallback: function (cb) {
            testCallback = cb;
        },
    };
    var wasm = loader_1.instantiateBuffer(buffer, imports);
    var func = wasm.getFunction(testCallback);
    func();
}
exports.testLoader = testLoader;
var templateObject_1, templateObject_2, templateObject_3, templateObject_4;
