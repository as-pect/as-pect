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
        VerboseReporter.prototype.onGroupFinish = function (group) {
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
        VerboseReporter.prototype.onTestStart = function (_group, _test) { };
        /**
         * This method reports a completed test.
         *
         * @param {TestGroup} _group - The TestGroup that the TestResult belongs to.
         * @param {TestResult} test - The finished TestResult
         */
        VerboseReporter.prototype.onTestFinish = function (_group, test) {
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
        VerboseReporter.prototype.onFinish = function (suite) {
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
        VerboseReporter.prototype.onTodo = function (_group, todo) {
            this.stdout.write(chalk_1.default(templateObject_29 || (templateObject_29 = __makeTemplateObject(["    {yellow [Todo]:} ", "\n"], ["    {yellow [Todo]:} ", "\\n"])), todo));
        };
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {LogValue} logValue - A value to be logged to the console
         */
        VerboseReporter.prototype.onLog = function (logValue) {
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
        return VerboseReporter;
    }(TestReporter_1.TestReporter));
    exports.default = VerboseReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28, templateObject_29, templateObject_30, templateObject_31, templateObject_32, templateObject_33;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVmVyYm9zZVJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3JlcG9ydGVyL1ZlcmJvc2VSZXBvcnRlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBSUEsZ0RBQTBCO0lBRzFCLHFEQUFvRDtJQUVwRCxzRUFBcUU7SUFPckU7Ozs7O09BS0c7SUFDSCxTQUFTLG9CQUFvQixDQUFDLElBQWUsRUFBRSxLQUF5QjtRQUN0RSxJQUFJLENBQUMsS0FBSztZQUFFLE9BQU8sRUFBRSxDQUFDO1FBQ3RCLElBQUksVUFBVSxHQUFXLEVBQUUsQ0FBQztRQUU1QixJQUFJLEtBQUssQ0FBQyxLQUFLLENBQUMsTUFBTSxHQUFHLENBQUMsRUFBRTtZQUMxQixVQUFVLEdBQUcsbUJBQW1CLEdBQUcsNkNBQXFCLENBQUMsS0FBSyxDQUFDLEtBQUssRUFBRSxLQUFLLENBQUMsT0FBTyxFQUFFLEtBQUssQ0FBQyxNQUFNLENBQUM7aUJBQy9GLEtBQUssQ0FBQyxJQUFJLENBQUM7aUJBQ1gsSUFBSSxDQUFDLG1CQUFtQixDQUFDLENBQUM7U0FDOUI7UUFFRCxJQUFNLFdBQVcsR0FBRyxlQUFlLEdBQUcsS0FBSyxDQUFDLEtBQUs7YUFDOUMsS0FBSyxDQUFDLElBQUksQ0FBQzthQUNYLElBQUksQ0FBQyxlQUFlLENBQUMsQ0FBQztRQUV6QixPQUFPLElBQUkscUJBQXVCO1lBQy9CLENBQUMsQ0FBQyxlQUFLLDJHQUFBLFNBQVUsRUFBYSxTQUFVLEVBQVUsV0FBWSxFQUFXLE1BQUssS0FBN0QsS0FBSyxDQUFDLE9BQU8sRUFBVSxVQUFVLEVBQVksV0FBVyxFQUN6RSxDQUFDLENBQUMsZUFBSyx5R0FBQSxPQUFRLEVBQWEsU0FBVSxFQUFVLFdBQVksRUFBVyxNQUFLLEtBQTdELEtBQUssQ0FBQyxPQUFPLEVBQVUsVUFBVSxFQUFZLFdBQVcsQ0FBSyxDQUFBO0lBQ2pGLENBQUM7SUFFRDs7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