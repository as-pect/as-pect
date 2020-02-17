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
var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../test/TestReporter", "./util/stringifyHostValue"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestReporter_1 = require("../test/TestReporter");
    var stringifyHostValue_1 = require("./util/stringifyHostValue");
    /**
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
                this.stdout.write(chalk(templateObject_1 || (templateObject_1 = __makeTemplateObject(["[Describe]: ", "\n\n"], ["[Describe]: ", "\\n\\n"])), group.name));
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
                    : chalk(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                        "}"])), (test.rtraceDelta > 0 ? "+" : "-") +
                        test.rtraceDelta.toString());
                this.stdout.write(test.negated
                    ? chalk(templateObject_3 || (templateObject_3 = __makeTemplateObject([" {green  [Throws]: \u2714} ", " ", "\n"], [" {green  [Throws]: \u2714} ", " ", "\\n"])), test.name, rtraceDelta) : chalk(templateObject_4 || (templateObject_4 = __makeTemplateObject([" {green [Success]: \u2714} ", " ", "\n"], [" {green [Success]: \u2714} ", " ", "\\n"])), test.name, rtraceDelta));
            }
            else {
                this.stdout.write(chalk(templateObject_5 || (templateObject_5 = __makeTemplateObject(["    {red [Fail]: \u2716} ", "\n"], ["    {red [Fail]: \u2716} ", "\\n"])), test.name));
                if (!test.negated) {
                    this.stdout.write("  [Actual]: " + stringifyHostValue_1.stringifyHostValue(test.actual, 2) + "\n[Expected]: " + stringifyHostValue_1.stringifyHostValue(test.expected, 2) + "\n");
                }
                if (test.message) {
                    this.stdout.write(chalk(templateObject_6 || (templateObject_6 = __makeTemplateObject([" [Message]: {yellow ", "}\n"], [" [Message]: {yellow ", "}\\n"])), test.message));
                }
                if (test.stack) {
                    this.stdout.write("   [Stack]: " + test.stack.split("\n").join("\n           ") + "\n");
                }
            }
            /** If performance mode was enabled for this test, report the statistics. */
            if (test.performance) {
                this.stdout.write(chalk(templateObject_7 || (templateObject_7 = __makeTemplateObject([" {yellow [Samples]}: ", " runs\n"], [" {yellow [Samples]}: ", " runs\\n"])), test.times.length.toString()));
                if (test.hasAverage) {
                    this.stdout.write(chalk(templateObject_8 || (templateObject_8 = __makeTemplateObject(["    {yellow [Mean]}: ", "ms\n"], ["    {yellow [Mean]}: ", "ms\\n"])), test.average.toString()));
                }
                if (test.hasMedian) {
                    this.stdout.write(chalk(templateObject_9 || (templateObject_9 = __makeTemplateObject(["  {yellow [Median]}: ", "ms\n"], ["  {yellow [Median]}: ", "ms\\n"])), test.median.toString()));
                }
                if (test.hasVariance) {
                    this.stdout.write(chalk(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{yellow [Variance]}: ", "ms\n"], ["{yellow [Variance]}: ", "ms\\n"])), test.variance.toString()));
                }
                if (test.hasStdDev) {
                    this.stdout.write(chalk(templateObject_11 || (templateObject_11 = __makeTemplateObject(["  {yellow [StdDev]}: ", "ms\n"], ["  {yellow [StdDev]}: ", "ms\\n"])), test.stdDev.toString()));
                }
                if (test.hasMax) {
                    this.stdout.write(chalk(templateObject_12 || (templateObject_12 = __makeTemplateObject(["     {yellow [Max]}: ", "ms\n"], ["     {yellow [Max]}: ", "ms\\n"])), test.max.toString()));
                }
                if (test.hasMin) {
                    this.stdout.write(chalk(templateObject_13 || (templateObject_13 = __makeTemplateObject(["     {yellow [Min]}: ", "ms\n"], ["     {yellow [Min]}: ", "ms\\n"])), test.min.toString()));
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
            var result = suite.pass ? chalk(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk(templateObject_15 || (templateObject_15 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
            var count = suite.testGroups
                .map(function (e) { return e.tests.length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var successCount = suite.testGroups
                .map(function (e) { return e.tests.filter(function (f) { return f.pass; }).length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var fail = count === successCount
                ? "0 fail"
                : chalk(templateObject_16 || (templateObject_16 = __makeTemplateObject(["{red ", " fail}"], ["{red ", " fail}"])), (count - successCount).toString());
            var rtcount = suite.allocationCount - suite.freeCount;
            var rtraceDelta = rtcount === 0
                ? ""
                : chalk(templateObject_17 || (templateObject_17 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                    "}"])), (rtcount > 0 ? "+" : "-") +
                    rtcount.toString());
            for (var _i = 0, _a = suite.warnings; _i < _a.length; _i++) {
                var warning = _a[_i];
                this.stdout.write(chalk(templateObject_18 || (templateObject_18 = __makeTemplateObject(["\n{yellow  [Warning]}: ", " ", ""], ["\\n{yellow  [Warning]}: ", " ", ""])), warning.type, warning.message));
                this.stdout.write(chalk(templateObject_19 || (templateObject_19 = __makeTemplateObject(["\n{yellow    [Stack]}: {yellow ", "}\n"], ["\\n{yellow    [Stack]}: {yellow ",
                    "}\\n"])), warning.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            for (var _b = 0, _c = suite.errors; _b < _c.length; _b++) {
                var error = _c[_b];
                this.stdout.write(chalk(templateObject_20 || (templateObject_20 = __makeTemplateObject(["\n{red    [Error]}: ", " ", ""], ["\\n{red    [Error]}: ", " ", ""])), error.type, error.message));
                this.stdout.write(chalk(templateObject_21 || (templateObject_21 = __makeTemplateObject(["\n{red    [Stack]}: {yellow ", "}\n"], ["\\n{red    [Stack]}: {yellow ",
                    "}\\n"])), error.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            this.stdout.write(chalk(templateObject_22 || (templateObject_22 = __makeTemplateObject(["", "\n\n    [File]: ", " ", "\n  [Groups]: {green ", " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n\n"], ["",
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
            this.stdout.write(chalk(templateObject_23 || (templateObject_23 = __makeTemplateObject(["    {yellow [Todo]:} ", "\n"], ["    {yellow [Todo]:} ", "\\n"])), todo));
        };
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {HostValue} logValue - A value to be logged to the console
         */
        VerboseReporter.prototype.onLog = function (logValue) {
            var chalk = require("chalk");
            var output = stringifyHostValue_1.stringifyHostValue(logValue, 2).trimLeft();
            this.stdout.write(chalk(templateObject_24 || (templateObject_24 = __makeTemplateObject(["     {yellow [Log]:} ", "\n"], ["     {yellow [Log]:} ", "\\n"])), output));
        };
        return VerboseReporter;
    }(TestReporter_1.TestReporter));
    exports.default = VerboseReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVmVyYm9zZVJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3JlcG9ydGVyL1ZlcmJvc2VSZXBvcnRlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBR0EscURBQW9EO0lBR3BELGdFQUErRDtJQUUvRDs7T0FFRztJQUNILElBQU0sYUFBYSxHQUErQixJQUFJLE9BQU8sRUFBRSxDQUFDO0lBRWhFOzs7T0FHRztJQUNIO1FBQTZDLG1DQUFZO1FBR3ZELHlCQUFZLFFBQWM7WUFBMUIsWUFDRSxpQkFBTyxTQUNSO1lBSlMsWUFBTSxHQUFxQixJQUFJLENBQUM7O1FBSTFDLENBQUM7UUFFRDs7Ozs7V0FLRztRQUNJLGlDQUFPLEdBQWQsVUFBZSxLQUFrQjtZQUMvQixJQUFJLENBQUMsTUFBTSxHQUFHLEtBQUssQ0FBQyxNQUFNLElBQUksT0FBTyxDQUFDLE1BQU0sQ0FBQztRQUMvQyxDQUFDO1FBRUQ7Ozs7V0FJRztRQUNJLHNDQUFZLEdBQW5CLFVBQW9CLEtBQWdCO1lBQ2xDLElBQUksS0FBSyxDQUFDLEtBQUssQ0FBQyxNQUFNLEtBQUssQ0FBQztnQkFBRSxPQUFPO1lBQ3JDLElBQU0sS0FBSyxHQUFHLE9BQU8sQ0FBQyxPQUFPLENBQUMsQ0FBQztZQUMvQixJQUFJLEtBQUssQ0FBQyxJQUFJO2dCQUFFLElBQUksQ0FBQyxNQUFPLENBQUMsS0FBSyxDQUFDLEtBQUsseUZBQUEsY0FBZSxFQUFVLFFBQU0sS0FBaEIsS0FBSyxDQUFDLElBQUksRUFBTyxDQUFDO1lBQ3pFLEtBQXVCLFVBQVUsRUFBVixLQUFBLEtBQUssQ0FBQyxJQUFJLEVBQVYsY0FBVSxFQUFWLElBQVUsRUFBRTtnQkFBOUIsSUFBTSxRQUFRLFNBQUE7Z0JBQ2pCLElBQUksQ0FBQyxLQUFLLENBQUMsUUFBUSxDQUFDLENBQUM7YUFDdEI7WUFDRCxhQUFhLENBQUMsR0FBRyxDQUFDLEtBQUssRUFBRSxL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