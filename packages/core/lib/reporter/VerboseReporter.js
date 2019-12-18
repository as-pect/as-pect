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
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../test/TestReporter", "./util/createReferenceString"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestReporter_1 = require("../test/TestReporter");
    var createReferenceString_1 = require("./util/createReferenceString");
    /**
     * @ignore
     * This method stringifies an actual or expected test value.
     *
     * @param {ValueType} type - Actual or Expected.
     * @param {ActualValue | null} value - The reported value.
     */
    function stringifyActualValue(type, value) {
        var chalk = require("chalk");
        if (!value)
            return "";
        var byteString = "";
        if (value.bytes.length > 0 || value.values.length > 0) {
            byteString =
                "\n               " +
                    createReferenceString_1.createReferenceString(value)
                        .split("\n")
                        .join("\n               ");
        }
        // const stackString =
        //   "\n           " + value.stack.split("\n").join("\n           ");
        return type === 1 /* Expected */
            ? chalk(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{green ", "}{blue ", "}"], ["{green ", "}{blue ", "}"])), value.message, byteString) : chalk(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{red ", "}{blue ", "}"], ["{red ", "}{blue ", "}"])), value.message, byteString);
    }
    /**
     * @ignore
     * This weakmap is used to keep track of which logs have already been printed, and from what index.
     */
    var groupLogIndex = new WeakMap();
    /**
     * This is the default test reporter class for the `asp` command line application. It will pipe
     * all relevant details about each tests to the `stdout` WriteStream.
     */
    var VerboseReporter = /** @class */ (function (_super) {
        __extends(VerboseReporter, _super);
        function VerboseReporter(_options) {
            var _this = _super.call(this) || this;
            _this.stdout = null;
            return _this;
        }
        /**
         * This method reports a starting TestContext. This method can be called many times, but may
         * be instantiated once
         *
         * @param {TestContext} suite - The test context being started.
         */
        VerboseReporter.prototype.onStart = function (suite) {
            this.stdout = suite.stdout || process.stdout;
        };
        /**
         * This method reports a TestGroup is starting.
         *
         * @param {TestGroup} group - The started test group.
         */
        VerboseReporter.prototype.onGroupStart = function (group) {
            if (group.tests.length === 0)
                return;
            var chalk = require("chalk");
            if (group.name)
                this.stdout.write(chalk(templateObject_3 || (templateObject_3 = __makeTemplateObject(["[Describe]: ", "\n\n"], ["[Describe]: ", "\\n\\n"])), group.name));
            for (var _i = 0, _a = group.logs; _i < _a.length; _i++) {
                var logValue = _a[_i];
                this.onLog(logValue);
            }
            groupLogIndex.set(group, group.logs.length);
        };
        /**
         * This method reports a completed TestGroup.
         *
         * @param {TestGroup} group - The finished TestGroup.
         */
        VerboseReporter.prototype.onGroupFinish = function (group) {
            if (group.tests.length === 0)
                return;
            this.stdout.write("\n");
        };
        /** This method is a stub for onTestStart(). */
        VerboseReporter.prototype.onTestStart = function (_group, _test) { };
        /**
         * This method reports a completed test.
         *
         * @param {TestGroup} _group - The TestGroup that the TestResult belongs to.
         * @param {TestResult} test - The finished TestResult
         */
        VerboseReporter.prototype.onTestFinish = function (_group, test) {
            var chalk = require("chalk");
            if (test.pass) {
                var rtraceDelta = test.rtraceDelta === 0
                    ? ""
                    : chalk(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                        "}"])), (test.rtraceDelta > 0 ? "+" : "-") +
                        test.rtraceDelta.toString());
                this.stdout.write(test.negated
                    ? chalk(templateObject_5 || (templateObject_5 = __makeTemplateObject([" {green  [Throws]: \u2714} ", " ", "\n"], [" {green  [Throws]: \u2714} ", " ", "\\n"])), test.name, rtraceDelta) : chalk(templateObject_6 || (templateObject_6 = __makeTemplateObject([" {green [Success]: \u2714} ", " ", "\n"], [" {green [Success]: \u2714} ", " ", "\\n"])), test.name, rtraceDelta));
            }
            else {
                this.stdout.write(chalk(templateObject_7 || (templateObject_7 = __makeTemplateObject(["    {red [Fail]: \u2716} ", "\n"], ["    {red [Fail]: \u2716} ", "\\n"])), test.name));
                if (!test.negated) {
                    this.stdout.write("  [Actual]: " + stringifyActualValue(0 /* Actual */, test.actual) + "\n[Expected]: " + stringifyActualValue(1 /* Expected */, test.expected) + "\n");
                }
                if (test.message) {
                    this.stdout.write(chalk(templateObject_8 || (templateObject_8 = __makeTemplateObject([" [Message]: {yellow ", "}\n"], [" [Message]: {yellow ", "}\\n"])), test.message));
                }
                if (test.stack) {
                    this.stdout.write("   [Stack]: " + test.stack.split("\n").join("\n           ") + "\n");
                }
            }
            /** If performance mode was enabled for this test, report the statistics. */
            if (test.performance) {
                this.stdout.write(chalk(templateObject_9 || (templateObject_9 = __makeTemplateObject([" {yellow [Samples]}: ", " runs\n"], [" {yellow [Samples]}: ", " runs\\n"])), test.times.length.toString()));
                if (test.hasAverage) {
                    this.stdout.write(chalk(templateObject_10 || (templateObject_10 = __makeTemplateObject(["    {yellow [Mean]}: ", "ms\n"], ["    {yellow [Mean]}: ", "ms\\n"])), test.average.toString()));
                }
                if (test.hasMedian) {
                    this.stdout.write(chalk(templateObject_11 || (templateObject_11 = __makeTemplateObject(["  {yellow [Median]}: ", "ms\n"], ["  {yellow [Median]}: ", "ms\\n"])), test.median.toString()));
                }
                if (test.hasVariance) {
                    this.stdout.write(chalk(templateObject_12 || (templateObject_12 = __makeTemplateObject(["{yellow [Variance]}: ", "ms\n"], ["{yellow [Variance]}: ", "ms\\n"])), test.variance.toString()));
                }
                if (test.hasStdDev) {
                    this.stdout.write(chalk(templateObject_13 || (templateObject_13 = __makeTemplateObject(["  {yellow [StdDev]}: ", "ms\n"], ["  {yellow [StdDev]}: ", "ms\\n"])), test.stdDev.toString()));
                }
                if (test.hasMax) {
                    this.stdout.write(chalk(templateObject_14 || (templateObject_14 = __makeTemplateObject(["     {yellow [Max]}: ", "ms\n"], ["     {yellow [Max]}: ", "ms\\n"])), test.max.toString()));
                }
                if (test.hasMin) {
                    this.stdout.write(chalk(templateObject_15 || (templateObject_15 = __makeTemplateObject(["     {yellow [Min]}: ", "ms\n"], ["     {yellow [Min]}: ", "ms\\n"])), test.min.toString()));
                }
            }
            else {
                /** Log the values to stdout if this was a typical test. */
                for (var _i = 0, _a = test.logs; _i < _a.length; _i++) {
                    var logValue = _a[_i];
                    this.onLog(logValue);
                }
            }
        };
        /**
         * This method reports that a TestContext has finished.
         *
         * @param {TestContext} suite - The finished test context.
         */
        VerboseReporter.prototype.onFinish = function (suite) {
            if (suite.testGroups.length === 0)
                return;
            var chalk = require("chalk");
            var result = suite.pass ? chalk(templateObject_16 || (templateObject_16 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk(templateObject_17 || (templateObject_17 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
            var count = suite.testGroups
                .map(function (e) { return e.tests.length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var successCount = suite.testGroups
                .map(function (e) { return e.tests.filter(function (f) { return f.pass; }).length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var fail = count === successCount
                ? "0 fail"
                : chalk(templateObject_18 || (templateObject_18 = __makeTemplateObject(["{red ", " fail}"], ["{red ", " fail}"])), (count - successCount).toString());
            var rtcount = suite.allocationCount - suite.freeCount;
            var rtraceDelta = rtcount === 0
                ? ""
                : chalk(templateObject_19 || (templateObject_19 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                    "}"])), (rtcount > 0 ? "+" : "-") +
                    rtcount.toString());
            for (var _i = 0, _a = suite.warnings; _i < _a.length; _i++) {
                var warning = _a[_i];
                this.stdout.write(chalk(templateObject_20 || (templateObject_20 = __makeTemplateObject(["\n{yellow  [Warning]}: ", " ", ""], ["\\n{yellow  [Warning]}: ", " ", ""])), warning.type, warning.message));
                this.stdout.write(chalk(templateObject_21 || (templateObject_21 = __makeTemplateObject(["\n{yellow    [Stack]}: {yellow ", "}\n"], ["\\n{yellow    [Stack]}: {yellow ",
                    "}\\n"])), warning.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            for (var _b = 0, _c = suite.errors; _b < _c.length; _b++) {
                var error = _c[_b];
                this.stdout.write(chalk(templateObject_22 || (templateObject_22 = __makeTemplateObject(["\n{red    [Error]}: ", " ", ""], ["\\n{red    [Error]}: ", " ", ""])), error.type, error.message));
                this.stdout.write(chalk(templateObject_23 || (templateObject_23 = __makeTemplateObject(["\n{red    [Stack]}: {yellow ", "}\n"], ["\\n{red    [Stack]}: {yellow ",
                    "}\\n"])), error.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            this.stdout.write(chalk(templateObject_24 || (templateObject_24 = __makeTemplateObject(["", "\n\n    [File]: ", " ", "\n  [Groups]: {green ", " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n\n"], ["",
                "\n\n    [File]: ", " ", "\n  [Groups]: {green ",
                " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\\n\\n"])), process.stdout.columns
                ? "~".repeat(Math.max(process.stdout.columns - 10, 10))
                : "~".repeat(80), suite.fileName, rtraceDelta, suite.testGroups
                .filter(function (e) { return e.pass; })
                .length.toString(), suite.testGroups.length.toString(), result, successCount.toString(), fail, count.toString(), suite.startupTime.toString(), suite.time.toString()));
        };
        /**
         * This method reports a todo to stdout.
         *
         * @param {TestGroup} _group - The test group the todo belongs to.
         * @param {string} todo - The todo.
         */
        VerboseReporter.prototype.onTodo = function (_group, todo) {
            var chalk = require("chalk");
            this.stdout.write(chalk(templateObject_25 || (templateObject_25 = __makeTemplateObject(["    {yellow [Todo]:} ", "\n"], ["    {yellow [Todo]:} ", "\\n"])), todo));
        };
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {LogValue} logValue - A value to be logged to the console
         */
        VerboseReporter.prototype.onLog = function (logValue) {
            var chalk = require("chalk");
            // create string representations of the pointer
            var pointer = logValue.pointer.toString();
            var hexPointer = logValue.pointer.toString(16);
            // log the log message
            if (logValue.pointer > 0) {
                this.stdout.write(chalk(templateObject_26 || (templateObject_26 = __makeTemplateObject(["\n     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", "\n"], ["\\n     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", "\\n"])), pointer, hexPointer, logValue.message));
            }
            else {
                this.stdout.write(chalk(templateObject_27 || (templateObject_27 = __makeTemplateObject(["\n     {yellow [Log]:} ", "\n"], ["\\n     {yellow [Log]:} ", "\\n"])), logValue.message));
            }
            // if there are bytes to show, create a logging representation of the bytes
            if (logValue.bytes.length > 0 || logValue.values.length > 0) {
                var value = createReferenceString_1.createReferenceString(logValue);
                this.stdout.write(chalk(templateObject_28 || (templateObject_28 = __makeTemplateObject(["            {blueBright ", "}\n"], ["            {blueBright ",
                    "}\\n"])), value
                    .split("\n")
                    .join("\n            ")));
            }
            this.stdout.write(chalk(templateObject_29 || (templateObject_29 = __makeTemplateObject(["        {yellow ", "}\n"], ["        {yellow ",
                "}\\n"])), logValue.stack
                .split("\n")
                .join("\n        ")));
        };
        return VerboseReporter;
    }(TestReporter_1.TestReporter));
    exports.default = VerboseReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28, templateObject_29;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVmVyYm9zZVJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3JlcG9ydGVyL1ZlcmJvc2VSZXBvcnRlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBS0EscURBQW9EO0lBRXBELHNFQUFxRTtJQVdyRTs7Ozs7O09BTUc7SUFDSCxTQUFTLG9CQUFvQixDQUMzQixJQUFlLEVBQ2YsS0FBeUI7UUFFekIsSUFBTSxLQUFLLEdBQUcsT0FBTyxDQUFDLE9BQU8sQ0FBQyxDQUFDO1FBQy9CLElBQUksQ0FBQyxLQUFLO1lBQUUsT0FBTyxFQUFFLENBQUM7UUFDdEIsSUFBSSxVQUFVLEdBQVcsRUFBRSxDQUFDO1FBRTVCLElBQUksS0FBSyxDQUFDLEtBQUssQ0FBQyxNQUFNLEdBQUcsQ0FBQyxJQUFJLEtBQUssQ0FBQyxNQUFNLENBQUMsTUFBTSxHQUFHLENBQUMsRUFBRTtZQUNyRCxVQUFVO2dCQUNSLG1CQUFtQjtvQkFDbkIsNkNBQXFCLENBQUMsS0FBSyxDQUFDO3lCQUN6QixLQUFLLENBQUMsSUFBSSxDQUFDO3lCQUNYLElBQUksQ0FBQyxtQkFBbUIsQ0FBQyxDQUFDO1NBQ2hDO1FBRUQsc0JBQXNCO1FBQ3RCLHFFQUFxRTtRQUVyRSxPQUFPLElBQUkscUJBQXVCO1lBQ2hDLENBQUMsQ0FBQyxLQUFLLDRGQUFBLFNBQVUsRUFBYSxTQUFVLEVBQVUsR0FBRyxLQUFwQyxLQUFLLENBQUMsT0FBTyxFQUFVLFVBQVUsRUFDbEQsQ0FBQyxDQUFDLEtBQUssMEZBQUEsT0FBUSxFQUFhLFNBQVUsRUFBVSxHQUFHLEtBQXBDLEtBQUssQ0FBQyxPQUFPLEVBQVUsVUFBVSxDQUFHLENBQUM7SUFDeEQsQ0FBQztJQUVEOzs7T0FHRztJQUNILElBQU0sYUFBYSxHQUErQixJQUFJLE9BQU8sRUFBRSxDQUFDO0lBRWhFOzs7T0FHRztJQUNIO1FBQTZDLG1DQUFZO1FBR3ZELHlCQUFZLFFB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