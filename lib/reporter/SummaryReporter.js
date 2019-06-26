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
    var SummaryReporter = /** @class */ (function (_super) {
        __extends(SummaryReporter, _super);
        function SummaryReporter(options) {
            var _this = _super.call(this) || this;
            _this.enableLogging = true;
            _this.stdout = null;
            if (options) {
                // can be "false" from cli
                if (!options.enableLogging || options.enableLogging === "false")
                    _this.enableLogging = false;
            }
            return _this;
        }
        SummaryReporter.prototype.onStart = function () { };
        SummaryReporter.prototype.onGroupStart = function () { };
        SummaryReporter.prototype.onGroupFinish = function () { };
        SummaryReporter.prototype.onTestStart = function () { };
        SummaryReporter.prototype.onTestFinish = function () { };
        SummaryReporter.prototype.onTodo = function () { };
        /**
         * This method reports a test context is finished running.
         *
         * @param {TestContext} suite - The finished test suite.
         */
        SummaryReporter.prototype.onFinish = function (suite) {
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
        SummaryReporter.prototype.onLog = function (logValue) {
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
        return SummaryReporter;
    }(TestReporter_1.TestReporter));
    exports.default = SummaryReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiU3VtbWFyeVJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3JlcG9ydGVyL1N1bW1hcnlSZXBvcnRlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEscURBQW9EO0lBR3BELGdEQUEwQjtJQUkxQixzRUFBcUU7SUFFckU7Ozs7T0FJRztJQUNIO1FBQTZDLG1DQUFZO1FBR3ZELHlCQUFZLE9BQWE7WUFBekIsWUFDRSxpQkFBTyxTQUtSO1lBUk8sbUJBQWEsR0FBWSxJQUFJLENBQUM7WUFpQjlCLFlBQU0sR0FBcUIsSUFBSSxDQUFDO1lBYnRDLElBQUksT0FBTyxFQUFFO2dCQUNYLDBCQUEwQjtnQkFDMUIsSUFBSSxDQUFDLE9BQU8sQ0FBQyxhQUFhLElBQUksT0FBTyxDQUFDLGFBQWEsS0FBSyxPQUFPO29CQUFFLEtBQUksQ0FBQyxhQUFhLEdBQUcsS0FBSyxDQUFDO2FBQzdGOztRQUNILENBQUM7UUFFTSxpQ0FBTyxHQUFkLGNBQXdCLENBQUM7UUFDbEIsc0NBQVksR0FBbkIsY0FBNkIsQ0FBQztRQUN2Qix1Q0FBYSxHQUFwQixjQUE4QixDQUFDO1FBQ3hCLHFDQUFXLEdBQWxCLGNBQTRCLENBQUM7UUFDdEIsc0NBQVksR0FBbkIsY0FBNkIsQ0FBQztRQUN2QixnQ0FBTSxHQUFiLGNBQXVCLENBQUM7UUFJeEI7Ozs7V0FJRztRQUNJLGtDQUFRLEdBQWYsVUFBZ0IsS0FBa0I7O1lBQ2hDLElBQUksQ0FBQyxNQUFNLEdBQUcsS0FBSyxDQUFDLE1BQU0sQ0FBQztZQUUzQix1REFBdUQ7WUFDdkQsSUFBTSxLQUFLLEdBQWlCLENBQUEsS0FBQyxFQUFtQixDQUFBLENBQzdDLE1BQU0sV0FBSSxLQUFLLENBQUMsVUFBVSxDQUFDLEdBQUcsQ0FBQyxVQUFBLENBQUMsSUFBSSxPQUFBLENBQUMsQ0FBQyxLQUFLLEVBQVAsQ0FBTyxDQUFDLENBQUMsQ0FBQztZQUNq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