var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./Reporter", "chalk"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var Reporter_1 = require("./Reporter");
    var chalk_1 = __importDefault(require("chalk"));
    function stringifyActualValue(type, value) {
        if (!value)
            return "";
        var byteString = "";
        if (value.bytes.length > 0) {
            byteString = "\n               " + createReferenceString(value.bytes, value.pointer, value.offset)
                .split("\n")
                .join("\n               ");
        }
        var stackString = "\n           " + value.stack
            .split("\n")
            .join("\n           ");
        return type === 1 /* Expected */
            ? chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{green ", "}{blue ", "}{yellow ", "}\n"], ["{green ", "}{blue ", "}{yellow ", "}\\n"])), value.message, byteString, stackString) : chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{red ", "}{blue ", "}{yellow ", "}\n"], ["{red ", "}{blue ", "}{yellow ", "}\\n"])), value.message, byteString, stackString);
    }
    /**
     * This function generates a 2 digit hexadecimal string from the given number.
     *
     * @param {number} value - A number from [0-255].
     * @returns {string} - The hexadecimal string representing the byte
     */
    function hex(value) {
        var result = value.toString(16);
        if (result.length === 1)
            return "0" + result;
        return result;
    }
    /**
     * This function returns a string that formats the bytes into rows of 8 bytes with a space between
     * byte 4 and 5 on each row.
     *
     * @param {number[]} bytes - The byte array
     * @param {number} pointer - The pointer of the reference.
     * @param {number} offset - The offset of the reference.
     */
    function createReferenceString(bytes, pointer, offset) {
        var referenceEnd = pointer + offset;
        // start with a tabbed out string
        var result = "Range: [dec: " + pointer.toString() + "~" + referenceEnd.toString() + "] [hex: 0x" + pointer.toString(16) + "~0x" + referenceEnd.toString(16) + "]";
        result += "\n07 06 05 04   03 02 01 00";
        result += "\n~~~~~~~~~~~~~~~~~~~~~~~~~";
        result += "\n";
        // for each byte
        for (var i = 0; i < offset; i++) {
            // append a byte and an empty space
            result += hex(bytes[i]) + " ";
            if (i % 8 === 7) {
                // every 8 characters add a newline
                result += "\n";
            }
            else if (i % 4 === 3) {
                // every 4 characters add an extra two spaces
                result += "  ";
            }
        }
        // remove leading space
        return result.trimRight();
    }
    var DefaultReporter = /** @class */ (function (_super) {
        __extends(DefaultReporter, _super);
        function DefaultReporter() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        DefaultReporter.prototype.onStart = function (suite) {
            console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["     {yellow [Log]:} ", ""], ["     {yellow [Log]:} ", ""])), suite.filename));
            console.log("");
        };
        DefaultReporter.prototype.onGroupStart = function (group) {
            console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["[Describe]: ", ""], ["[Describe]: ", ""])), group.name));
            console.log("");
        };
        DefaultReporter.prototype.onGroupFinish = function (group) {
            var result = group.pass
                ? chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
            console.log("");
            console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["  [Result]: ", ""], ["  [Result]: ", ""])), result));
            console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["   [Tests]: ", " pass, ", " fail, ", " total"], ["   [Tests]: ", " pass, ", " fail, ", " total"])), group.successCount.toString(), group.failCount.toString(), group.totalCount.toString()));
            console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["    [Todo]: ", " tests"], ["    [Todo]: ", " tests"])), group.todoCount.toString()));
            console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["    [Time]: ", "ms"], ["    [Time]: ", "ms"])), group.time.toString()));
        };
        DefaultReporter.prototype.onTestStart = function (_group, _test) { };
        DefaultReporter.prototype.onTestFinish = function (_group, test) {
            if (test.pass) {
                console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject([" {green [Success]: \u2714} ", ""], [" {green [Success]: \u2714} ", ""])), test.testName));
            }
            else {
                console.log(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["    {red [Fail]: \u2716} ", ""], ["    {red [Fail]: \u2716} ", ""])), test.testName));
                console.log("");
                console.log("   [Actual]: " + stringifyActualValue(0 /* Actual */, test.actual));
                console.log(" [Expected]: " + stringifyActualValue(1 /* Expected */, test.expected));
                if (test.message) {
                    console.log("  [Message]: {yellow " + test.message + "}");
                }
                console.log("    [Stack]: " + test.stack.split("\n").join("\n           "));
            }
        };
        DefaultReporter.prototype.onFinish = function (suite) {
            var result = suite.pass
                ? chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["{green \u2714 Pass} "], ["{green \u2714 Pass} "]))) : chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{red \u2716 Fail}"], ["{red \u2716 Fail}"])));
            console.log("");
            console.log("~".repeat(process.stdout.columns - 10));
            console.log(chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["    [File]: ", ""], ["    [File]: ", ""])), suite.filename));
            console.log(chalk_1.default(templateObject_16 || (templateObject_16 = __makeTemplateObject(["  [Result]: ", ""], ["  [Result]: ", ""])), result));
            console.log(chalk_1.default(templateObject_17 || (templateObject_17 = __makeTemplateObject([" [Summary]: ", " pass, ", " fail, ", " total"], [" [Summary]: ", " pass, ", " fail, ", " total"])), suite.successCount.toString(), suite.failCount.toString(), suite.totalTests.toString()));
            console.log(chalk_1.default(templateObject_18 || (templateObject_18 = __makeTemplateObject(["    [Todo]: ", " test"], ["    [Todo]: ", " test"])), suite.todoCount.toString()) + (suite.todoCount === 1 ? "s" : ""));
            console.log(chalk_1.default(templateObject_19 || (templateObject_19 = __makeTemplateObject(["    [Time]: ", "ms"], ["    [Time]: ", "ms"])), suite.time.toString()));
            console.log("");
        };
        DefaultReporter.prototype.onTodo = function (_group, todo) {
            console.log(chalk_1.default(templateObject_20 || (templateObject_20 = __makeTemplateObject(["    {yellow [Todo]:} ", ""], ["    {yellow [Todo]:} ", ""])), todo));
        };
        DefaultReporter.prototype.onLog = function (logValue) {
            // create string representations of the pointer
            var pointer = logValue.pointer.toString();
            var hexPointer = logValue.pointer.toString(16);
            // log the log message
            if (logValue.pointer > 0) {
                console.log(chalk_1.default(templateObject_21 || (templateObject_21 = __makeTemplateObject(["     {yellow [Log]:} at address [", "] [hex: 0x", "] ", ""], ["     {yellow [Log]:} at address [", "] [hex: 0x", "] ", ""])), pointer, hexPointer, logValue.message));
                console.log("");
            }
            else {
                console.log(chalk_1.default(templateObject_22 || (templateObject_22 = __makeTemplateObject(["     {yellow [Log]:} ", ""], ["     {yellow [Log]:} ", ""])), logValue.message));
            }
            // if there are bytes to show, create a logging representation of the bytes
            if (logValue.bytes.length > 0) {
                var value = createReferenceString(logValue.bytes, logValue.pointer, logValue.offset);
                console.log(chalk_1.default(templateObject_23 || (templateObject_23 = __makeTemplateObject(["           {blueBright ", "}"], ["           {blueBright ", "}"])), value.split("\n").join("\n           ")));
            }
            console.log(chalk_1.default(templateObject_24 || (templateObject_24 = __makeTemplateObject(["       {yellow ", "}\n"], ["       {yellow ", "}\\n"])), logValue.stack.split("\n").join("\n       ")));
        };
        return DefaultReporter;
    }(Reporter_1.Reporter));
    exports.DefaultReporter = DefaultReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24;
});
//# sourceMappingURL=DefaultReporter.js.map