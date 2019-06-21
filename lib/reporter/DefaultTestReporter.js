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
        /**
         * This method reports a starting TestContext. This method can be called many times, but may
         * be instantiated once
         *
         * @param {TestContext} suite - The test context being started.
         */
        DefaultTestReporter.prototype.onStart = function (suite) {
            this.stdout = suite.stdout || process.stdout;
        };
        /**
         * This method reports a TestGroup is starting.
         *
         * @param {TestGroup} group - The started test group.
         */
        DefaultTestReporter.prototype.onGroupStart = function (group) {
            this.stdout.write(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["\n[Describe]: ", "\n\n"], ["\\n[Describe]: ", "\\n\\n"])), group.name));
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
        /** This method is a stub for onTestStart(). */
        DefaultTestReporter.prototype.onTestStart = function (_group, _test) { };
        /**
         * This method reports a completed test.
         *
         * @param {TestGroup} _group - The TestGroup that the TestResult belongs to.
         * @param {TestResult} test - The finished TestResult
         */
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
            /** If performance mode was enabled for this test, report the statistics. */
            if (test.performance) {
                this.stdout.write(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject([" {yellow [Samples]}: ", " runs\n"], [" {yellow [Samples]}: ", " runs\\n"])), test.times.length.toString()));
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
            for (var _i = 0, _a = suite.warnings; _i < _a.length; _i++) {
                var warning = _a[_i];
                this.stdout.write(chalk_1.default(templateObject_24 || (templateObject_24 = __makeTemplateObject(["{yellow  [Warning]}: ", " ", "\n"], ["{yellow  [Warning]}: ", " ", "\\n"])), warning.type, warning.message));
                this.stdout.write(chalk_1.default(templateObject_25 || (templateObject_25 = __makeTemplateObject(["{yellow    [Stack]}: {yellow ", "}\n\n"], ["{yellow    [Stack]}: {yellow ", "}\\n\\n"])), warning.stackTrace.split("\n").join("\n           ")));
            }
            for (var _b = 0, _c = suite.errors; _b < _c.length; _b++) {
                var error = _c[_b];
                this.stdout.write(chalk_1.default(templateObject_26 || (templateObject_26 = __makeTemplateObject(["{red    [Error]}: ", " ", "\n"], ["{red    [Error]}: ", " ", "\\n"])), error.type, error.message));
                this.stdout.write(chalk_1.default(templateObject_27 || (templateObject_27 = __makeTemplateObject(["{red    [Stack]}: {yellow ", "}\n\n"], ["{red    [Stack]}: {yellow ", "}\\n\\n"])), error.stackTrace.split("\n").join("\n           ")));
            }
            this.stdout.write(chalk_1.default(templateObject_28 || (templateObject_28 = __makeTemplateObject(["\n", "\n\n    [File]: ", " ", "\n  [Groups]: {green ", " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n"], ["\n", "\n\n    [File]: ", " ", "\n  [Groups]: {green ", " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n"])), "~".repeat(process.stdout.columns - 10), suite.fileName, rtraceDelta, suite.testGroups.filter(function (e) { return e.pass; }).length.toString(), suite.testGroups.length.toString(), result, successCount.toString(), fail, count.toString(), suite.startupTime.toString(), suite.time.toString()));
        };
        /**
         * This method reports a todo to stdout.
         *
         * @param {TestGroup} _group - The test group the todo belongs to.
         * @param {string} todo - The todo.
         */
        DefaultTestReporter.prototype.onTodo = function (_group, todo) {
            this.stdout.write(chalk_1.default(templateObject_29 || (templateObject_29 = __makeTemplateObject(["    {yellow [Todo]:} ", "\n"], ["    {yellow [Todo]:} ", "\\n"])), todo));
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
                this.stdout.write(chalk_1.default(templateObject_30 || (templateObject_30 = __makeTemplateObject(["     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", "\n"], ["     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", "\\n"])), pointer, hexPointer, logValue.message));
            }
            else {
                this.stdout.write(chalk_1.default(templateObject_31 || (templateObject_31 = __makeTemplateObject(["     {yellow [Log]:} ", "\n"], ["     {yellow [Log]:} ", "\\n"])), logValue.message));
            }
            // if there are bytes to show, create a logging representation of the bytes
            if (logValue.bytes.length > 0) {
                var value = createReferenceString_1.createReferenceString(logValue.bytes, logValue.pointer, logValue.offset);
                this.stdout.write(chalk_1.default(templateObject_32 || (templateObject_32 = __makeTemplateObject(["            {blueBright ", "}\n"], ["            {blueBright ", "}\\n"])), value.split("\n").join("\n            ")));
            }
            this.stdout.write(chalk_1.default(templateObject_33 || (templateObject_33 = __makeTemplateObject(["        {yellow ", "}\n\n"], ["        {yellow ", "}\\n\\n"])), logValue.stack.split("\n").join("\n        ")));
        };
        return DefaultTestReporter;
    }(TestReporter_1.TestReporter));
    exports.DefaultTestReporter = DefaultTestReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28, templateObject_29, templateObject_30, templateObject_31, templateObject_32, templateObject_33;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiRGVmYXVsdFRlc3RSZXBvcnRlci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9yZXBvcnRlci9EZWZhdWx0VGVzdFJlcG9ydGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFJQSxnREFBMEI7SUFHMUIscURBQW9EO0lBRXBELHNFQUFxRTtJQU9yRTs7Ozs7T0FLRztJQUNILFNBQVMsb0JBQW9CLENBQUMsSUFBZSxFQUFFLEtBQXlCO1FBQ3RFLElBQUksQ0FBQyxLQUFLO1lBQUUsT0FBTyxFQUFFLENBQUM7UUFDdEIsSUFBSSxVQUFVLEdBQVcsRUFBRSxDQUFDO1FBRTVCLElBQUksS0FBSyxDQUFDLEtBQUssQ0FBQyxNQUFNLEdBQUcsQ0FBQyxFQUFFO1lBQzFCLFVBQVUsR0FBRyxtQkFBbUIsR0FBRyw2Q0FBcUIsQ0FBQyxLQUFLLENBQUMsS0FBSyxFQUFFLEtBQUssQ0FBQyxPQUFPLEVBQUUsS0FBSyxDQUFDLE1BQU0sQ0FBQztpQkFDL0YsS0FBSyxDQUFDLElBQUksQ0FBQztpQkFDWCxJQUFJLENBQUMsbUJBQW1CLENBQUMsQ0FBQztTQUM5QjtRQUVELElBQU0sV0FBVyxHQUFHLGVBQWUsR0FBRyxLQUFLLENBQUMsS0FBSzthQUM5QyxLQUFLLENBQUMsSUFBSSxDQUFDO2FBQ1gsSUFBSSxDQUFDLGVBQWUsQ0FBQyxDQUFDO1FBRXpCLE9BQU8sSUFBSSxxQkFBdUI7WUFDL0IsQ0FBQyxDQUFDLGVBQUssMkdBQUEsU0FBVSxFQUFhLFNBQVUsRUFBVSxXQUFZLEVBQVcsTUFBSyxLQUE3RCxLQUFLLENBQUMsT0FBTyxFQUFVLFVBQVUsRUFBWSxXQUFXLEVBQ3pFLENBQUMsQ0FBQyxlQUFLLHlHQUFBLE9BQVEsRUFBYSxTQUFVLEVBQVUsV0FBWSxFQUFXLE1BQUssS0FBN0QsS0FBSyxDQUFDLE9BQU8sRUFBVSxVQUFVLEVBQVksV0FBVyxDQUFLLENBQUE7SUFDakYsQ0FB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