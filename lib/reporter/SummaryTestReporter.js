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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../test/TestReporter", "chalk", "./util/createReferenceString"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestReporter_1 = require("../test/TestReporter");
    var chalk_1 = __importDefault(require("chalk"));
    var createReferenceString_1 = require("./util/createReferenceString");
    /**
     * This test reporter should be used when logging output and test validation only needs happen on
     * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
     * process.
     */
    var SummaryTestReporter = /** @class */ (function (_super) {
        __extends(SummaryTestReporter, _super);
        function SummaryTestReporter(options) {
            var _this = _super.call(this) || this;
            _this.enableLogging = false;
            _this.stdout = null;
            if (options) {
                if (options.enableLogging)
                    _this.enableLogging = true;
            }
            return _this;
        }
        SummaryTestReporter.prototype.onStart = function () { };
        SummaryTestReporter.prototype.onGroupStart = function () { };
        SummaryTestReporter.prototype.onGroupFinish = function () { };
        SummaryTestReporter.prototype.onTestStart = function () { };
        SummaryTestReporter.prototype.onTestFinish = function () { };
        SummaryTestReporter.prototype.onTodo = function () { };
        /**
         * This method reports a test context is finished running.
         *
         * @param {TestContext} suite - The finished test suite.
         */
        SummaryTestReporter.prototype.onFinish = function (suite) {
            var _a, _b;
            this.stdout = suite.stdout;
            // TODO: Figure out a better way to flatten this array.
            var tests = (_a = []).concat.apply(_a, suite.testGroups.map(function (e) { return e.tests; }));
            var todos = (_b = []).concat.apply(_b, suite.testGroups.map(function (e) { return e.todos; })).length;
            var total = tests.length;
            var passCount = tests.reduce(function (left, right) { return right.pass ? left + 1 : left; }, 0);
            var groupPassCount = suite.testGroups
                .reduce(function (num, group) { return (group.pass ? 1 : 0) + num; }, 0);
            /** Report if all the groups passed. */
            if (passCount === total && suite.testGroups.length === groupPassCount) {
                suite.stdout.write(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{green.bold \u2714 ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\n"], ["{green.bold \u2714 ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\\n"])), suite.fileName, passCount.toString(), total.toString(), todos.toString(), suite.time.toString()));
                /** If logging is enabled, log all the values. */
                if (this.enableLogging) {
                    for (var _i = 0, _c = suite.testGroups; _i < _c.length; _i++) {
                        var group = _c[_i];
                        for (var _d = 0, _e = group.logs; _d < _e.length; _d++) {
                            var log = _e[_d];
                            this.onLog(log);
                        }
                        for (var _f = 0, _g = group.tests; _f < _g.length; _f++) {
                            var test_1 = _g[_f];
                            for (var _h = 0, _j = test_1.logs; _h < _j.length; _h++) {
                                var log = _j[_h];
                                this.onLog(log);
                            }
                        }
                    }
                }
            }
            else {
                suite.stdout.write(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{red.bold \u274C ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\n"], ["{red.bold \u274C ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\\n"])), suite.fileName, passCount.toString(), total.toString(), todos.toString(), suite.time.toString()));
                /** If the group failed, report that the group failed. */
                for (var _k = 0, _l = suite.testGroups; _k < _l.length; _k++) {
                    var group = _l[_k];
                    if (group.pass)
                        continue;
                    suite.stdout.write(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["  {red Failed:} ", "\n"], ["  {red Failed:} ", "\\n"])), group.name));
                    /** Display the reason if there is one. */
                    if (group.reason)
                        suite.stdout.write(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["    {yellow Reason:} ", ""], ["    {yellow Reason:} ", ""])), group.reason));
                    /** Log each log item in the failed group. */
                    if (this.enableLogging) {
                        for (var _m = 0, _o = group.logs; _m < _o.length; _m++) {
                            var log = _o[_m];
                            this.onLog(log);
                        }
                    }
                    inner: for (var _p = 0, _q = group.tests; _p < _q.length; _p++) {
                        var test_2 = _q[_p];
                        if (test_2.pass)
                            continue inner;
                        suite.stdout.write(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["    {red.bold \u274C ", "} - ", "\n"], ["    {red.bold \u274C ", "} - ", "\\n"])), test_2.name, test_2.message));
                        if (test_2.expected !== null)
                            suite.stdout.write(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["      {green.bold [Expected]:} ", "\n"], ["      {green.bold [Expected]:} ", "\\n"])), test_2.expected.message));
                        if (test_2.actual !== null)
                            suite.stdout.write(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["      {red.bold [Actual]  :} ", "\n"], ["      {red.bold [Actual]  :} ", "\\n"])), test_2.actual.message));
                        if (this.enableLogging) {
                            for (var _r = 0, _s = test_2.logs; _r < _s.length; _r++) {
                                var log = _s[_r];
                                this.onLog(log);
                            }
                        }
                    }
                }
            }
            for (var _t = 0, _u = suite.warnings; _t < _u.length; _t++) {
                var warning = _u[_t];
                this.stdout.write(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["{yellow  [Warning]}: ", " ", "\n"], ["{yellow  [Warning]}: ", " ", "\\n"])), warning.type, warning.message));
                this.stdout.write(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{yellow    [Stack]}: {yellow ", "}\n\n"], ["{yellow    [Stack]}: {yellow ", "}\\n\\n"])), warning.stackTrace.split("\n").join("\n           ")));
            }
            for (var _v = 0, _w = suite.errors; _v < _w.length; _v++) {
                var error = _w[_v];
                this.stdout.write(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{red    [Error]}: ", " ", "\n"], ["{red    [Error]}: ", " ", "\\n"])), error.type, error.message));
                this.stdout.write(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["{red    [Stack]}: {yellow ", "}\n\n"], ["{red    [Stack]}: {yellow ", "}\\n\\n"])), error.stackTrace.split("\n").join("\n           ")));
            }
        };
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {LogValue} logValue - A value to be logged to the console
         */
        SummaryTestReporter.prototype.onLog = function (logValue) {
            // create string representations of the pointer
            var pointer = logValue.pointer.toString();
            var hexPointer = logValue.pointer.toString(16);
            // log the log message
            if (logValue.pointer > 0) {
                this.stdout.write(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", "\n"], ["     {yellow [Log]:} Reference at address [", "] [hex: 0x", "] ", "\\n"])), pointer, hexPointer, logValue.message));
            }
            else {
                this.stdout.write(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["     {yellow [Log]:} ", "\n"], ["     {yellow [Log]:} ", "\\n"])), logValue.message));
            }
            // if there are bytes to show, create a logging representation of the bytes
            if (logValue.bytes.length > 0) {
                var value = createReferenceString_1.createReferenceString(logValue.bytes, logValue.pointer, logValue.offset);
                this.stdout.write(chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["            {blueBright ", "}\n"], ["            {blueBright ", "}\\n"])), value.split("\n").join("\n            ")));
            }
            this.stdout.write(chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["        {yellow ", "}\n\n"], ["        {yellow ", "}\\n\\n"])), logValue.stack.split("\n").join("\n        ")));
        };
        return SummaryTestReporter;
    }(TestReporter_1.TestReporter));
    exports.SummaryTestReporter = SummaryTestReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiU3VtbWFyeVRlc3RSZXBvcnRlci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9yZXBvcnRlci9TdW1tYXJ5VGVzdFJlcG9ydGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFBQSxxREFBb0Q7SUFHcEQsZ0RBQTBCO0lBSTFCLHNFQUFxRTtJQUVyRTs7OztPQUlHO0lBQ0g7UUFBeUMsdUNBQVk7UUFHbkQsNkJBQVksT0FBYTtZQUF6QixZQUNFLGlCQUFPLFNBSVI7WUFQTyxtQkFBYSxHQUFZLEtBQUssQ0FBQztZQWdCL0IsWUFBTSxHQUFxQixJQUFJLENBQUM7WUFadEMsSUFBSSxPQUFPLEVBQUU7Z0JBQ1gsSUFBSSxPQUFPLENBQUMsYUFBYTtvQkFBRSxLQUFJLENBQUMsYUFBYSxHQUFHLElBQUksQ0FBQzthQUN0RDs7UUFDSCxDQUFDO1FBRU0scUNBQU8sR0FBZCxjQUF3QixDQUFDO1FBQ2xCLDBDQUFZLEdBQW5CLGNBQTZCLENBQUM7UUFDdkIsMkNBQWEsR0FBcEIsY0FBOEIsQ0FBQztRQUN4Qix5Q0FBVyxHQUFsQixjQUE0QixDQUFDO1FBQ3RCLDBDQUFZLEdBQW5CLGNBQTZCLENBQUM7UUFDdkIsb0NBQU0sR0FBYixjQUF1QixDQUFDO1FBSXhCOzs7O1dBSUc7UUFDSSxzQ0FBUSxHQUFmLFVBQWdCLEtBQWtCOztZQUNoQyxJQUFJLENBQUMsTUFBTSxHQUFHLEtBQUssQ0FBQyxNQUFNLENBQUM7WUFFM0IsdURBQXVEO1lBQ3ZELElBQU0sS0FBSyxHQUFpQixDQUFBLEtBQUMsRUFBbUIsQ0FBQSxDQUM3QyxNQUFNLFdBQUksS0FBSyxDQUFDLFVBQVUsQ0FBQyxHQUFHLENBQUMsVUFBQSxDQUFDLElBQUksT0FBQSxDQUFDLENBQUMsS0FBSyxFQUFQLENBQU8sQ0FBQyxDQUFDLENBQUM7WUFDakQsSUFBTSxLQUFLLEdBQUcsQ0FBQSxLQUFDLEVBQWUsQ0FBQSxDQUMz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