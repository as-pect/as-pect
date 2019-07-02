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
            byteString =
                "\n               " +
                    createReferenceString_1.createReferenceString(value.bytes, value.pointer, value.offset)
                        .split("\n")
                        .join("\n               ");
        }
        var stackString = "\n           " + value.stack.split("\n").join("\n           ");
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
            var result = group.pass ? chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
            var todoCount = group.todos.length;
            var successCount = group.tests.filter(function (e) { return e.pass; }).length;
            var count = group.tests.length;
            for (var _i = 0, _a = group.logs.slice(groupLogIndex.get(group) || 0); _i < _a.length; _i++) {
                var logValue = _a[_i];
                this.onLog(logValue);
            }
            var fail = count === successCount
                ? "0 fail"
                : chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{red ", " fail}"], ["{red ", " fail}"])), (count - successCount).toString());
            var rtraceDelta = group.rtraceDelta === 0
                ? ""
                : chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                    "}"])), (group.rtraceDelta > 0 ? "+" : "-") +
                    group.rtraceDelta.toString());
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
                    : chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                        "}"])), (test.rtraceDelta > 0 ? "+" : "-") +
                        test.rtraceDelta.toString());
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
            var result = suite.pass ? chalk_1.default(templateObject_20 || (templateObject_20 = __makeTemplateObject(["{green \u2714 Pass}"], ["{green \u2714 Pass}"]))) : chalk_1.default(templateObject_21 || (templateObject_21 = __makeTemplateObject(["{red \u2716 Fail}"], ["{red \u2716 Fail}"])));
            var count = suite.testGroups
                .map(function (e) { return e.tests.length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var successCount = suite.testGroups
                .map(function (e) { return e.tests.filter(function (f) { return f.pass; }).length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var fail = count === successCount
                ? "0 fail"
                : chalk_1.default(templateObject_22 || (templateObject_22 = __makeTemplateObject(["{red ", " fail}"], ["{red ", " fail}"])), (count - successCount).toString());
            var rtcount = suite.allocationCount - suite.freeCount;
            var rtraceDelta = rtcount === 0
                ? ""
                : chalk_1.default(templateObject_23 || (templateObject_23 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                    "}"])), (rtcount > 0 ? "+" : "-") +
                    rtcount.toString());
            for (var _i = 0, _a = suite.warnings; _i < _a.length; _i++) {
                var warning = _a[_i];
                this.stdout.write(chalk_1.default(templateObject_24 || (templateObject_24 = __makeTemplateObject(["{yellow  [Warning]}: ", " ", "\n"], ["{yellow  [Warning]}: ", " ", "\\n"])), warning.type, warning.message));
                this.stdout.write(chalk_1.default(templateObject_25 || (templateObject_25 = __makeTemplateObject(["{yellow    [Stack]}: {yellow ", "}\n\n"], ["{yellow    [Stack]}: {yellow ",
                    "}\\n\\n"])), warning.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            for (var _b = 0, _c = suite.errors; _b < _c.length; _b++) {
                var error = _c[_b];
                this.stdout.write(chalk_1.default(templateObject_26 || (templateObject_26 = __makeTemplateObject(["{red    [Error]}: ", " ", "\n"], ["{red    [Error]}: ", " ", "\\n"])), error.type, error.message));
                this.stdout.write(chalk_1.default(templateObject_27 || (templateObject_27 = __makeTemplateObject(["{red    [Stack]}: {yellow ", "}\n\n"], ["{red    [Stack]}: {yellow ",
                    "}\\n\\n"])), error.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            this.stdout.write(chalk_1.default(templateObject_28 || (templateObject_28 = __makeTemplateObject(["\n", "\n\n    [File]: ", " ", "\n  [Groups]: {green ", " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n"], ["\n", "\n\n    [File]: ", " ", "\n  [Groups]: {green ",
                " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n"])), "~".repeat(process.stdout.columns - 10), suite.fileName, rtraceDelta, suite.testGroups
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
                this.stdout.write(chalk_1.default(templateObject_32 || (templateObject_32 = __makeTemplateObject(["            {blueBright ", "}\n"], ["            {blueBright ",
                    "}\\n"])), value
                    .split("\n")
                    .join("\n            ")));
            }
            this.stdout.write(chalk_1.default(templateObject_33 || (templateObject_33 = __makeTemplateObject(["        {yellow ", "}\n\n"], ["        {yellow ",
                "}\\n\\n"])), logValue.stack
                .split("\n")
                .join("\n        ")));
        };
        return VerboseReporter;
    }(TestReporter_1.TestReporter));
    exports.default = VerboseReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28, templateObject_29, templateObject_30, templateObject_31, templateObject_32, templateObject_33;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVmVyYm9zZVJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3JlcG9ydGVyL1ZlcmJvc2VSZXBvcnRlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBR0EsZ0RBQTBCO0lBRzFCLHFEQUFvRDtJQUVwRCxzRUFBcUU7SUFPckU7Ozs7O09BS0c7SUFDSCxTQUFTLG9CQUFvQixDQUMzQixJQUFlLEVBQ2YsS0FBeUI7UUFFekIsSUFBSSxDQUFDLEtBQUs7WUFBRSxPQUFPLEVBQUUsQ0FBQztRQUN0QixJQUFJLFVBQVUsR0FBVyxFQUFFLENBQUM7UUFFNUIsSUFBSSxLQUFLLENBQUMsS0FBSyxDQUFDLE1BQU0sR0FBRyxDQUFDLEVBQUU7WUFDMUIsVUFBVTtnQkFDUixtQkFBbUI7b0JBQ25CLDZDQUFxQixDQUFDLEtBQUssQ0FBQyxLQUFLLEVBQUUsS0FBSyxDQUFDLE9BQU8sRUFBRSxLQUFLLENBQUMsTUFBTSxDQUFDO3lCQUM1RCxLQUFLLENBQUMsSUFBSSxDQUFDO3lCQUNYLElBQUksQ0FBQyxtQkFBbUIsQ0FBQyxDQUFDO1NBQ2hDO1FBRUQsSUFBTSxXQUFXLEdBQ2YsZUFBZSxHQUFHLEtBQUssQ0FBQyxLQUFLLENBQUMsS0FBSyxDQUFDLElBQUksQ0FBQyxDQUFDLElBQUksQ0FBQyxlQUFlLENBQUMsQ0FBQztRQUVsRSxPQUFPLElBQUkscUJBQXVCO1lBQ2hDLENBQUMsQ0FBQyxlQUFLLDJHQUFBLFNBQVUsRUFBYSxTQUFVLEVBQVUsV0FBWSxFQUFXLE1BQUssS0FBN0QsS0FBSyxDQUFDLE9BQU8sRUFBVSxVQUFVLEVBQVksV0FBVyxFQUN6RSxDQUFDLENBQUMsZUFBSyx5R0FBQSxPQUFRLEVBQWEsU0FBVSxFQUFVLFdBQVksRUFBVyxNQUFLLEtBQTdELEtBQUssQ0FBQyxPQUFPLEVBQVUsVUFBVSxFQUFZLFdBQVcsQ0FBSyxDQUFDO0lBQ2pGLENBQUM7SUFF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