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
        define(["require", "exports", "chalk", "../test/TestReporter", "./util/createReferenceString"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
    var TestReporter_1 = require("../test/TestReporter");
    var createReferenceString_1 = require("./util/createReferenceString");
    /**
     * This method stringifies an actual or expected test value.
     *
     * @param {ValueType} type - Actual or Expected.
     * @param {ActualValue | null} value - The reported value.
     */
    function stringifyActualValue(type, value) {
        if (!value)
            return "";
        var byteString = "";
        if (value.bytes.length > 0) {
            byteString = "\n               " + createReferenceString_1.createReferenceString(value.bytes, value.pointer, value.offset)
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
     * This weakmap is used to keep track of which logs have already been printed, and from what index.
     */
    var groupLogIndex = new WeakMap();
    /**
     * This is the default test reporter class for the `asp` command line application. It will pipe
     * all relevant details about each tests to the `stdout` WriteStream.
     */
    var DefaultTestReporter = /** @class */ (function (_super) {
        __extends(DefaultTestReporter, _super);
        function DefaultTestReporter(_options) {
            var _this = _super.call(this) || this;
            _this.stdout = null;
            return _this;
        }
        DefaultTestReporter.prototype.onStart = function (suite) {
            this.stdout = suite.stdout || process.stdout;
        };
        DefaultTestReporter.prototype.onGroupStart = function (group) {
            this.stdout.write(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["\n[Describe]: ", "\n\n"], ["\\n[Describe]: ", "\\n\\n"])), group.name));
            for (var _i = 0, _a = group.logs; _i < _a.length; _i++) {
                var logValue = _a[_i];
                this.onLog(logValue);
            }
            groupLogIndex.set(group, group.logs.length);
        };
        DefaultTestReporter.prototype.onGroupFinish = function (group) {
            var result = group.pass
                ? chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
            var todoCount = group.todos.length;
            var successCount = group.tests.filter(function (e) { return e.pass; }).length;
            var count = group.tests.length;
            for (var _i = 0, _a = group.logs.slice(groupLogIndex.get(group) || 0); _i < _a.length; _i++) {
                var logValue = _a[_i];
                this.onLog(logValue);
            }
            var fail = (count === successCount)
                ? "0 fail"
                : chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{red ", " fail}"], ["{red ", " fail}"])), (count - successCount).toString());
            var rtraceDelta = group.rtraceDelta === 0
                ? ""
                : chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ", "}"])), (group.rtraceDelta > 0 ? "+" : "-") + group.rtraceDelta.toString());
            var output = chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["\n  [Result]: ", " ", "\n   [Tests]: {green ", " pass}, ", ", ", " total\n    [Todo]: ", " tests\n    [Time]: ", "ms\n"], ["\n  [Result]: ", " ", "\n   [Tests]: {green ", " pass}, ", ", ", " total\n    [Todo]: ", " tests\n    [Time]: ", "ms\n"])), result, rtraceDelta, successCount.toString(), fail, count.toString(), todoCount.toString(), group.time.toString());
            this.stdout.write(output);
        };
        DefaultTestReporter.prototype.onTestStart = function (_group, _test) { };
        DefaultTestReporter.prototype.onTestFinish = function (_group, test) {
            if (test.pass) {
                var rtraceDelta = test.rtraceDelta === 0
                    ? ""
                    : chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ", "}"])), (test.rtraceDelta > 0 ? "+" : "-") + test.rtraceDelta.toString());
                this.stdout.write(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject([" {green [Success]: \u2714} ", " ", "\n"], [" {green [Success]: \u2714} ", " ", "\\n"])), test.name, rtraceDelta));
            }
            else {
                this.stdout.write(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["    {red [Fail]: \u2716} ", "\n"], ["    {red [Fail]: \u2716} ", "\\n"])), test.name));
                if (!test.negated) {
                    this.stdout.write("\n   [Actual]: " + stringifyActualValue(0 /* Actual */, test.actual) + "\n [Expected]: " + stringifyActualValue(1 /* Expected */, test.expected) + "\n");
                }
                if (test.message) {
                    this.stdout.write(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["  [Message]: {yellow ", "}\n"], ["  [Message]: {yellow ", "}\\n"])), test.message));
                }
                if (test.stack) {
                    this.stdout.write("    [Stack]: " + test.stack.split("\n").join("\n           ") + "\n");
                }
            }
            if (test.performance) {
                this.stdout.write(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject([" {yellow [Samples]}: ", " runs\n"], [" {yellow [Samples]}: ", " runs\\n"])), test.times.length.toString()));
                // log statistics
                if (test.hasAverage) {
                    this.stdout.write(chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["    {yellow [Mean]}: ", "ms\n"], ["    {yellow [Mean]}: ", "ms\\n"])), test.average.toString()));
                }
                if (test.hasMedian) {
                    this.stdout.write(chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["  {yellow [Median]}: ", "ms\n"], ["  {yellow [Median]}: ", "ms\\n"])), test.median.toString()));
                }
                if (test.hasVariance) {
                    this.stdout.write(chalk_1.default(templateObject_16 || (templateObject_16 = __makeTemplateObject(["{yellow [Variance]}: ", "ms\n"], ["{yellow [Variance]}: ", "ms\\n"])), test.variance.toString()));
                }
                if (test.hasStdDev) {
                    this.stdout.write(chalk_1.default(templateObject_17 || (templateObject_17 = __makeTemplateObject(["  {yellow [StdDev]}: ", "ms\n"], ["  {yellow [StdDev]}: ", "ms\\n"])), test.stdDev.toString()));
                }
                if (test.hasMax) {
                    this.stdout.write(chalk_1.default(templateObject_18 || (templateObject_18 = __makeTemplateObject(["     {yellow [Max]}: ", "ms\n"], ["     {yellow [Max]}: ", "ms\\n"])), test.max.toString()));
                }
                if (test.hasMin) {
                    this.stdout.write(chalk_1.default(templateObject_19 || (templateObject_19 = __makeTemplateObject(["     {yellow [Min]}: ", "ms\n"], ["     {yellow [Min]}: ", "ms\\n"])), test.min.toString()));
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
            if (suite.testGroups.length === 0)
                return;
            var result = suite.pass
                ? chalk_1.default(templateObject_20 || (templateObject_20 = __makeTemplateObject(["{green \u2714 Pass}"], ["{green \u2714 Pass}"]))) : chalk_1.default(templateObject_21 || (templateObject_21 = __makeTemplateObject(["{red \u2716 Fail}"], ["{red \u2716 Fail}"])));
            var count = suite.testGroups
                .map(function (e) { return e.tests.length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var successCount = suite.testGroups
                .map(function (e) { return e.tests.filter(function (f) { return f.pass; }).length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var fail = (count === successCount)
                ? "0 fail"
                : chalk_1.default(templateObject_22 || (templateObject_22 = __makeTemplateObject(["{red ", " fail}"], ["{red ", " fail}"])), (count - successCount).toString());
            var rtcount = suite.allocationCount - suite.freeCount;
            var rtraceDelta = rtcount === 0
                ? ""
                : chalk_1.default(templateObject_23 || (templateObject_23 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ", "}"])), (rtcount > 0 ? "+" : "-") + rtcount.toString());
            this.stdout.write(chalk_1.default(templateObject_24 || (templateObject_24 = __makeTemplateObject(["\n", "\n\n    [File]: ", " ", "\n  [Groups]: {green ", " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n"], ["\n", "\n\n    [File]: ", " ", "\n  [Groups]: {green ", " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n"])), "~".repeat(process.stdout.columns - 10), suite.fileName, rtraceDelta, suite.testGroups.filter(function (e) { return e.pass; }).length.toString(), suite.testGroups.length.toString(), result, successCount.toString(), fail, count.toString(), suite.startupTime.toString(), suite.time.toString()));
        };
        DefaultTestReporter.prototype.onTodo = function (_group, todo) {
            this.stdout.write(chalk_1.default(templateObject_25 || (templateObject_25 = __makeTemplateObject(["    {yellow [Todo]:} ", "\n"], ["    {yellow [Todo]:} ", "\\n"])), todo));
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
                this.stdout.write(chalk_1.default(templateObject_26 || (templateObject_26 = __makeTemplateObject(["     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", "\n"], ["     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", "\\n"])), pointer, hexPointer, logValue.message));
            }
            else {
                this.stdout.write(chalk_1.default(templateObject_27 || (templateObject_27 = __makeTemplateObject(["     {yellow [Log]:} ", "\n"], ["     {yellow [Log]:} ", "\\n"])), logValue.message));
            }
            // if there are bytes to show, create a logging representation of the bytes
            if (logValue.bytes.length > 0) {
                var value = createReferenceString_1.createReferenceString(logValue.bytes, logValue.pointer, logValue.offset);
                this.stdout.write(chalk_1.default(templateObject_28 || (templateObject_28 = __makeTemplateObject(["            {blueBright ", "}\n"], ["            {blueBright ", "}\\n"])), value.split("\n").join("\n            ")));
            }
            this.stdout.write(chalk_1.default(templateObject_29 || (templateObject_29 = __makeTemplateObject(["        {yellow ", "}\n\n"], ["        {yellow ", "}\\n\\n"])), logValue.stack.split("\n").join("\n        ")));
        };
        return DefaultTestReporter;
    }(TestReporter_1.TestReporter));
    exports.DefaultTestReporter = DefaultTestReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28, templateObject_29;
});
//# sourceMappingURL=DefaultTestReporter.js.map