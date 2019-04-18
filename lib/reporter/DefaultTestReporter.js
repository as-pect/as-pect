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
        define(["require", "exports", "chalk", "../test/TestReporter"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
    var TestReporter_1 = require("../test/TestReporter");
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
    var DefaultTestReporter = /** @class */ (function (_super) {
        __extends(DefaultTestReporter, _super);
        function DefaultTestReporter() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        DefaultTestReporter.prototype.onStart = function (_suite) {
        };
        DefaultTestReporter.prototype.onGroupStart = function (group) {
            console.log("");
            console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["[Describe]: ", ""], ["[Describe]: ", ""])), group.name));
            console.log("");
        };
        DefaultTestReporter.prototype.onGroupFinish = function (group) {
            var result = group.pass
                ? chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
            var todoCount = group.todos.length;
            var successCount = group.tests.filter(function (e) { return e.pass; }).length;
            var count = group.tests.length;
            if (!group.performanceEnabled) {
                for (var _i = 0, _a = group.logs; _i < _a.length; _i++) {
                    var logValue = _a[_i];
                    this.onLog(logValue);
                }
            }
            console.log("");
            console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["  [Result]: ", ""], ["  [Result]: ", ""])), result));
            console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["   [Tests]: ", " pass, ", " fail, ", " total"], ["   [Tests]: ", " pass, ", " fail, ", " total"])), successCount.toString(), (count - successCount).toString(), count.toString()));
            console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["    [Todo]: ", " tests"], ["    [Todo]: ", " tests"])), todoCount.toString()));
            console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["    [Time]: ", "ms"], ["    [Time]: ", "ms"])), group.time.toString()));
        };
        DefaultTestReporter.prototype.onTestStart = function (_group, _test) { };
        DefaultTestReporter.prototype.onTestFinish = function (_group, test) {
            if (test.pass) {
                console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject([" {green [Success]: \u2714} ", ""], [" {green [Success]: \u2714} ", ""])), test.name));
            }
            else {
                console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["    {red [Fail]: \u2716} ", ""], ["    {red [Fail]: \u2716} ", ""])), test.name));
                console.log("");
                if (!test.negated) {
                    console.log("   [Actual]: " + stringifyActualValue(0 /* Actual */, test.actual));
                    console.log(" [Expected]: " + stringifyActualValue(1 /* Expected */, test.expected));
                }
                if (test.message) {
                    console.log(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["  [Message]: {yellow ", "}"], ["  [Message]: {yellow ", "}"])), test.message));
                }
                if (test.stack) {
                    console.log("    [Stack]: " + test.stack.split("\n").join("\n           "));
                }
            }
            if (test.performance) {
                console.log(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject([" {yellow [Samples]}: ", ""], [" {yellow [Samples]}: ", ""])), test.times.length.toString()));
                // log statistics
                if (test.hasAverage) {
                    console.log(chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["    {yellow [Mean]}: ", "ms"], ["    {yellow [Mean]}: ", "ms"])), test.average.toString()));
                }
                if (test.hasMedian) {
                    console.log(chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["  {yellow [Median]}: ", "ms"], ["  {yellow [Median]}: ", "ms"])), test.median.toString()));
                }
                if (test.hasStdDev) {
                    console.log(chalk_1.default(templateObject_16 || (templateObject_16 = __makeTemplateObject(["  {yellow [StdDev]}: ", "ms"], ["  {yellow [StdDev]}: ", "ms"])), test.stdDev.toString()));
                }
                if (test.hasMax) {
                    console.log(chalk_1.default(templateObject_17 || (templateObject_17 = __makeTemplateObject(["     {yellow [Max]}: ", "ms"], ["     {yellow [Max]}: ", "ms"])), test.max.toString()));
                }
                if (test.hasMin) {
                    console.log(chalk_1.default(templateObject_18 || (templateObject_18 = __makeTemplateObject(["     {yellow [Min]}: ", "ms"], ["     {yellow [Min]}: ", "ms"])), test.min.toString()));
                }
            }
            else {
                // log the log values
                for (var _i = 0, _a = test.logs; _i < _a.length; _i++) {
                    var logValue = _a[_i];
                    this.onLog(logValue);
                }
            }
        };
        DefaultTestReporter.prototype.onFinish = function (suite) {
            var result = suite.pass
                ? chalk_1.default(templateObject_19 || (templateObject_19 = __makeTemplateObject(["{green \u2714 Pass}"], ["{green \u2714 Pass}"]))) : chalk_1.default(templateObject_20 || (templateObject_20 = __makeTemplateObject(["{red \u2716 Fail}"], ["{red \u2716 Fail}"])));
            var count = suite.testGroups
                .map(function (e) { return e.tests.length; })
                .reduce(function (a, b) { return a + b; });
            var successCount = suite.testGroups
                .map(function (e) { return e.tests.filter(function (f) { return f.pass; }).length; })
                .reduce(function (a, b) { return a + b; });
            console.log("");
            console.log("~".repeat(process.stdout.columns - 10));
            console.log("");
            console.log(chalk_1.default(templateObject_21 || (templateObject_21 = __makeTemplateObject(["    [File]: ", ""], ["    [File]: ", ""])), suite.file));
            console.log(chalk_1.default(templateObject_22 || (templateObject_22 = __makeTemplateObject(["  [Groups]: ", " pass, ", " total"], ["  [Groups]: ", " pass, ", " total"])), suite.testGroups.filter(function (e) { return e.pass; }).length.toString(), suite.testGroups.length.toString()));
            console.log(chalk_1.default(templateObject_23 || (templateObject_23 = __makeTemplateObject(["  [Result]: ", ""], ["  [Result]: ", ""])), result));
            console.log(chalk_1.default(templateObject_24 || (templateObject_24 = __makeTemplateObject([" [Summary]: ", " pass, ", " fail, ", " total"], [" [Summary]: ", " pass, ", " fail, ", " total"])), successCount.toString(), (count - successCount).toString(), count.toString()));
            console.log(chalk_1.default(templateObject_25 || (templateObject_25 = __makeTemplateObject(["    [Time]: ", "ms"], ["    [Time]: ", "ms"])), suite.time.toString()));
            console.log("");
        };
        DefaultTestReporter.prototype.onTodo = function (_group, todo) {
            console.log(chalk_1.default(templateObject_26 || (templateObject_26 = __makeTemplateObject(["    {yellow [Todo]:} ", ""], ["    {yellow [Todo]:} ", ""])), todo));
        };
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {LogValue} logValue - A value to be logged to the console
         */
        DefaultTestReporter.prototype.onLog = function (logValue) {
            // create string representations of the pointer
            var pointer = logValue.pointer.toString();
            var hexPointer = logValue.pointer.toString(16);
            // log the log message
            if (logValue.pointer > 0) {
                console.log(chalk_1.default(templateObject_27 || (templateObject_27 = __makeTemplateObject(["     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", ""], ["     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", ""])), pointer, hexPointer, logValue.message));
            }
            else {
                console.log(chalk_1.default(templateObject_28 || (templateObject_28 = __makeTemplateObject(["     {yellow [Log]:} ", ""], ["     {yellow [Log]:} ", ""])), logValue.message));
            }
            // if there are bytes to show, create a logging representation of the bytes
            if (logValue.bytes.length > 0) {
                var value = createReferenceString(logValue.bytes, logValue.pointer, logValue.offset);
                console.log(chalk_1.default(templateObject_29 || (templateObject_29 = __makeTemplateObject(["            {blueBright ", "}"], ["            {blueBright ", "}"])), value.split("\n").join("\n            ")));
            }
            console.log(chalk_1.default(templateObject_30 || (templateObject_30 = __makeTemplateObject(["        {yellow ", "}\n"], ["        {yellow ", "}\\n"])), logValue.stack.split("\n").join("\n        ")));
        };
        return DefaultTestReporter;
    }(TestReporter_1.TestReporter));
    exports.DefaultTestReporter = DefaultTestReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28, templateObject_29, templateObject_30;
});
//# sourceMappingURL=DefaultTestReporter.js.map