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
        define(["require", "exports", "../test/TestReporter"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestReporter_1 = require("../test/TestReporter");
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
            var chalk = require("chalk");
            this.stdout = suite.stdout;
            // TODO: Figure out a better way to flatten this array.
            var tests = (_a = []).concat.apply(_a, suite.testGroups.map(function (e) { return e.tests; }));
            var todos = (_b = []).concat.apply(_b, suite.testGroups.map(function (e) { return e.todos; })).length;
            var total = tests.length;
            var passCount = tests.reduce(function (left, right) { return (right.pass ? left + 1 : left); }, 0);
            var groupPassCount = suite.testGroups.reduce(function (num, group) { return (group.pass ? 1 : 0) + num; }, 0);
            /** Report if all the groups passed. */
            if (passCount === total && suite.testGroups.length === groupPassCount) {
                suite.stdout.write(chalk(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{green.bold \u2714 ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\n"], ["{green.bold \u2714 ",
                    "} Pass: ", " / ", " Todo: ", " Time: ", "ms\\n"])), suite.fileName, passCount.toString(), total.toString(), todos.toString(), suite.time.toString()));
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
                suite.stdout.write(chalk(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{red.bold \u274C ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\n"], ["{red.bold \u274C ",
                    "} Pass: ", " / ", " Todo: ", " Time: ", "ms\\n"])), suite.fileName, passCount.toString(), total.toString(), todos.toString(), suite.time.toString()));
                /** If the group failed, report that the group failed. */
                for (var _k = 0, _l = suite.testGroups; _k < _l.length; _k++) {
                    var group = _l[_k];
                    if (group.pass)
                        continue;
                    suite.stdout.write(chalk(templateObject_3 || (templateObject_3 = __makeTemplateObject(["  {red Failed:} ", "\n"], ["  {red Failed:} ", "\\n"])), group.name));
                    /** Display the reason if there is one. */
                    if (group.reason)
                        suite.stdout.write(chalk(templateObject_4 || (templateObject_4 = __makeTemplateObject(["    {yellow Reason:} ", ""], ["    {yellow Reason:} ", ""])), group.reason));
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
                        suite.stdout.write(chalk(templateObject_5 || (templateObject_5 = __makeTemplateObject(["    {red.bold \u274C ", "} - ", "\n"], ["    {red.bold \u274C ", "} - ", "\\n"])), test_2.name, test_2.message));
                        if (test_2.expected !== null)
                            suite.stdout.write(chalk(templateObject_6 || (templateObject_6 = __makeTemplateObject(["      {green.bold [Expected]:} ", "\n"], ["      {green.bold [Expected]:} ",
                                "\\n"])), test_2.expected
                                .stringify({ indent: 2 })
                                .trimLeft()));
                        if (test_2.actual !== null)
                            suite.stdout.write(chalk(templateObject_7 || (templateObject_7 = __makeTemplateObject(["      {red.bold [Actual]  :} ", "\n"], ["      {red.bold [Actual]  :} ",
                                "\\n"])), test_2.actual
                                .stringify({ indent: 2 })
                                .trimLeft()));
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
                this.stdout.write(chalk(templateObject_8 || (templateObject_8 = __makeTemplateObject(["{yellow  [Warning]}: ", " ", "\n"], ["{yellow  [Warning]}: ", " ", "\\n"])), warning.type, warning.message));
                this.stdout.write(chalk(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{yellow    [Stack]}: {yellow ", "}\n\n"], ["{yellow    [Stack]}: {yellow ",
                    "}\\n\\n"])), warning.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            for (var _v = 0, _w = suite.errors; _v < _w.length; _v++) {
                var error = _w[_v];
                this.stdout.write(chalk(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{red    [Error]}: ", " ", "\n"], ["{red    [Error]}: ", " ", "\\n"])), error.type, error.message));
                this.stdout.write(chalk(templateObject_11 || (templateObject_11 = __makeTemplateObject(["{red    [Stack]}: {yellow ", "}\n\n"], ["{red    [Stack]}: {yellow ",
                    "}\\n\\n"])), error.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
        };
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {ReflectedValue} logValue - A value to be logged to the console
         */
        SummaryReporter.prototype.onLog = function (logValue) {
            var chalk = require("chalk");
            var output = logValue.stringify({ indent: 12 }).trimLeft();
            this.stdout.write(chalk(templateObject_12 || (templateObject_12 = __makeTemplateObject(["     {yellow [Log]:} ", "\n"], ["     {yellow [Log]:} ", "\\n"])), output));
        };
        return SummaryReporter;
    }(TestReporter_1.TestReporter));
    exports.default = SummaryReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiU3VtbWFyeVJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3JlcG9ydGVyL1N1bW1hcnlSZXBvcnRlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEscURBQW9EO0lBT3BEOzs7O09BSUc7SUFDSDtRQUE2QyxtQ0FBWTtRQUd2RCx5QkFBWSxPQUFhO1lBQXpCLFlBQ0UsaUJBQU8sU0FNUjtZQVRPLG1CQUFhLEdBQVksSUFBSSxDQUFDO1lBa0I5QixZQUFNLEdBQXFCLElBQUksQ0FBQztZQWR0QyxJQUFJLE9BQU8sRUFBRTtnQkFDWCwwQkFBMEI7Z0JBQzFCLElBQUksQ0FBQyxPQUFPLENBQUMsYUFBYSxJQUFJLE9BQU8sQ0FBQyxhQUFhLEtBQUssT0FBTztvQkFDN0QsS0FBSSxDQUFDLGFBQWEsR0FBRyxLQUFLLENBQUM7YUFDOUI7O1FBQ0gsQ0FBQztRQUVNLGlDQUFPLEdBQWQsY0FBd0IsQ0FBQztRQUNsQixzQ0FBWSxHQUFuQixjQUE2QixDQUFDO1FBQ3ZCLHVDQUFhLEdBQXBCLGNBQThCLENBQUM7UUFDeEIscUNBQVcsR0FBbEIsY0FBNEIsQ0FBQztRQUN0QixzQ0FBWSxHQUFuQixjQUE2QixDQUFDO1FBQ3ZCLGdDQUFNLEdBQWIsY0FBdUIsQ0FBQztRQUl4Qjs7OztXQUlHO1FBQ0ksa0NBQVEsR0FBZixVQUFnQixLQUFrQjs7WUFDaEMsSUFBTSxLQUFLLEdBQUcsT0FBTyxDQUFDLE9BQU8sQ0FBQyxDQUFDO1lBQy9CLElBQUksQ0FBQyxNQUFNLEdBQUcsS0FBSyxDQUFDLE1BQU0sQ0FBQztZQUUzQix1REFBdUQ7WUFDdkQsSUFBTSxLQUFLLEdBQWlCLENBQUEsS0FBQyxFQUFtQixDQUFBLENBQUMsTUFBTSxXQUNsRCxLQUFLLENBQUMsVUFBVSxDQUFDLEdBQUcsQ0FBQyxVQUFBLENBQUMsSUFBSSxPQUFBLENBQUMsQ0FBQyxLQUFLLEVBQVAsQ0FBTyxDQUFDLENBQ3RDLENBQUM7WUFDRixJQUFNLEtBQUssR0FBRyxDQUFBLEtBQUMsRUFBZSxDQUFBLENBQUMsTUFBTSxXQUFJLEtBQUssQ0FBQyxVQUFVLENBQUMsR0FBRyxDQUFDLFVBQUEsQ0FBQyxJQUFJLE9BQUEsQ0FBQyxDQUFDLEtBQUssRUFBUCxDQUFPLENBQUMsRUFDeEUsTUFBTSxDQUFDO1lBQ1YsSUFBTSxLQUFLLEdBQUcsS0FBSyxDQUFDLE1BQU0sQ0FBQztZQUMzQixJQUFNLFNBQVMsR0FBRyxLQUFLLENBQUMsTUFBTSxDQUM1QixVQUFDLElBQUksRUFBRSxLQUFLLElBQUssT0FBQSxDQUFDLEtBQUssQ0FBQyxJQUFJLENBQUMsQ0FBQyxDQUFDLElBQUksR0FBRyxDQUFDLENBQUMsQ0FBQyxDQUFDLElBQUksQ0FBQyxFQUE5QixDQUE4QixFQUMvQyxDQUFDLENBQ0YsQ0FBQztZQUNGLElBQU0sY0FBYyxHQUFHLEtBQUssQ0FBQyxVQUFVLENBQUMsTUFBTSxDQUM1QyxVQUFDLEdBQVcsRUFBRSxLQUFnQixJQUFLLE9BQUEsQ0FBQyxLQUFLLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxHQUFHLEdBQUcsRUFBMUIsQ0FBMEIsRUFDN0QsQ0FBQyxDQUNGLENBQUM7WUFFRix1Q0FBdUM7WUFDdkMsSUFBSSxTQUFTLEtBQUssS0FBSyxJQUFJLEtBQUssQ0FBQyxVQUFVLENBQUMsTUFBTSxLQUFLLGNBQWMsRUFBRTtnQkFDckUsS0FBSyxDQUFDLE1BQU8sQ0FBQyxLQUFLLENBQ2pCLEtBQUsseUlBQUEscUJBQWlCO29CQUV0QixVQUFXLEVBQW9CLEtBQU0sRUFBZ0IsU0FBVSxFQUFnQixTQUFVLEVBQXFCLE9BQU0sS0FEbEgsS0FBSyxDQUFDLFFBQVEsRUFDTCxTQUFTLENBQUMsUUFBUSxFQUFFLEVBQU0sS0FBSyxDQUFDLFFBQVEsRUFBRSxFQUFVLEtBQUssQ0FBQyxRQUFRLEVBQUUsRUFBVSxLQUFLLENBQUMsSUFBSSxDQUFDLFFBQVEsRUFBRSxFQUMvRyxDQUFDO2dCQUVGLGlEQUFpRDtnQkFDakQsSUFBSSxJQUFJLENBQUMsYUFBYSxFQUFFO29CQUN0QixLQUFvQixVQUFnQixFQUFoQixLQUFBLEtBQUssQ0FBQyxVQUFVLEVBQWhCLGNBQWdCLEVBQWhCLElBQWdCLEVBQUU7d0JBQWpDLElBQU0sS0FBSyxTQUFBO3dCQUNkLEtBQWtCLFVBQVUsRUFBVixLQUFBLEtBQUssQ0FBQyxJQUFJLEVBQVYsY0FBVSxFQUFWLElBQVUsRUFBRTs0QkFBekIsSUFBTSxHQUFHLFNBQUE7NEJBQ1osSUFBSSxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsQ0FBQzt5QkFDakI7d0JBRUQsS0FBbUIsVUFBVyxFQUFYLEtBQUEsS0FBSyxDQUFDLEtBQUssRUFBWCxjQUFXLEVBQVgsSUFBVyxFQUFFOzRCQUEzQixJQUFNLE1BQUksU0FBQTs0QkFDYixLQUFrQixVQUFTLEVBQVQsS0FBQSxNQUFJLENBQUMsSUFBSSxFQUFULGNBQVMsRUFBVCxJQUFTLEVBQUU7Z0NBQXhCLElBQU0sR0FBRyxTQUFBO2dDQUNaLElBQUksQ0FBQyxLQUFLLENBQUMsR0FBRyxDQUFDLENBQUM7NkJBQ2pCO3lCQUNGO3FCQUNGO2lCQUNGO2FBQ0Y7aUJBQU07Z0JBQ0wsS0FBSyxDQUFDLE1BQU8sQ0FBQyxLQUFLLENBQ2pCLEtBQUssdUlBQUEsbUJBQWU7b0JBRXBCLFVBQVcsRUFBb0IsS0FBTSxFQUFnQixTQUFVLEVBQWdCLFNBQVUsRUFBcUIsT0FBTSxLQURsSCxLQUFLLENBQUMsUUFBUSxFQUNMLFNBQVMsQ0FBQyxRQUFRLEVBQUUsRUFBTSxLQUFLLENBQUMsUUFBUSxFQUFFLEVBQVUsS0FBSyxDQUFDLFFBQVEsRUFBRSxFQUFVLEtBQUssQ0FBQyxJQUFJLENBQUMsUUFBUSxFQUFFLEVBQy9HLENBQUM7Z0JBRUYseURBQXlEO2dCQUN6RCxLQUFvQixVQUFnQixFQUFoQixLQUFBLEtBQUssQ0FBQyxVQUFVLEVBQWhCLGNBQWdCLEVBQWhCLElBQWdCLEVBQUU7b0JBQWpDLElBQU0sS0FBSyxTQUFBO29CQUNkLElBQUksS0FBSyxDQUFDLElBQUk7d0JBQUUsU0FBUztvQkFDekIsS0FBSyxDQUFDLE1BQU8sQ0FBQyxLQUFLLENBQUMsS0FBSywyRkFBQSxrQkFBbUIsRUFBVSxLQUFJLEtBQWQsS0FBSyxDQUFDLElBQUksRUFBSyxDQUFDO29CQUU1RCwwQ0FBMEM7b0JBQzFDLElBQUksS0FBSyxDQUFDLE1BQU07d0JBQ2QsS0FBSyxDQUFDLE1BQU8sQ0FBQyxLQUFLLENBQUMsS0FBSyw4RkFBQSx1QkFBd0IsRUFBWSxFQUFFLEtBQWQsS0FBSyxDQUFDLE1BQU0sRUFBRyxDQUFDO29CQUVuRSw2Q0FBNkM7b0JBQzdDLElBQUksSUFBSSxDQUFDLGFBQWEsRUFBRTt3QkFDdEIsS0FBa0IsVUFBVSxFQUFWLEtBQUEsS0FBSyxDQUFDLElBQUksRUFBVixjQUFVLEVBQVYsSUFBVSxFQUFFOzRCQUF6QixJQUFNLEdBQUcsU0FBQTs0QkFDWixJQUFJLENBQUMsS0FBSyxDQUFDLEdBQUcsQ0FBQyxDQUFDO3lCQUNqQjtxQkFDRjtvQkFFRCxLQUFLLEVBQUUsS0FBbUIsVUFBVyxFQUFYLEtBQUEsS0FBSyxDQUFDLEtBQUssRUFBWCxjQUFXLEVBQVgsSUFBVyxFQUFFO3dCQUEzQixJQUFNLE1BQUksU0FBQTt3QkFDcEIsSUFBSSxNQUFJLENBQUMsSUFBSTs0QkFBRSxTQUFTLEtBQUssQ0FBQzt3QkFDOUIsS0FBSyxDQUFDLE1BQU8sQ0FBQyxLQUFLLENBQ2pCLEtBQUssd0dBQUEsdUJBQW1CLEVBQVMsTUFBTyxFQUFZLEtBQUksS0FBaEMsTUFBSSxDQUFDLElBQUksRUFBTyxNQUFJLENBQUMsT0FBTyxFQUNyRCxDQUFDO3dCQUNGLElBQUksTUFBSSxDQUFDLFFBQVEsS0FBSyxJQUFJOzRCQUN4QixLQUFLLENBQUMsTUFBTyxDQUFDLEtBQUssQ0FDakIsS0FBSywwR0FBQSxpQ0FBa0M7Z0NBRTFCLEtBQUksS0FGc0IsTUFBSSxDQUFDLFFBQVE7aUNBQ2pELFNBQVMsQ0FBQyxFQUFFLE1BQU0sRUFBRSxDQUFDLEVBQUUsQ0FBQztpQ0FDeEIsUUFBUSxFQUFFLEVBQ2QsQ0FBQzt3QkFDSixJQUFJLE1BQUksQ0FBQyxNQUFNLEtBQUssSUFBSTs0QkFDdEIsS0FBSyxDQUFDLE1BQU8sQ0FBQyxLQUFLLENBQ2pCLEtBQUssd0dBQUEsK0JBQWdDO2dDQUV4QixLQUFJLEtBRm9CLE1BQUksQ0FBQyxNQUFNO2lDQUM3QyxTQUFTLENBQUMsRUFBRSxNQUFNLEVBQUUsQ0FBQyxFQUFFLENBQUM7aUNBQ3hCLFFBQVEsRUFBRSxFQUNkLENBQUM7d0JBQ0osSUFBSSxJQUFJLENBQUMsYUFBYSxFQUFFOzRCQUN0QixLQUFrQixVQUFTLEVBQVQsS0FBQSxNQUFJLENBQUMsSUFBSSxFQUFULGNBQVMsRUFBVCxJQUFTLEVBQUU7Z0NBQXhCLElBQU0sR0FBRyxTQUFBO2dDQUNaLElBQUksQ0FBQyxLQUFLLENBQUMsR0FBRyxDQUFDLENBQUM7NkJBQ2pCO3lCQUNGO3FCQUNGO2lCQUNGO2FBQ0Y7WUFFRCxLQUFzQixVQUFjLEVBQWQsS0FBQSxLQUFLLENBQUMsUUFBUSxFQUFkLGNBQWMsRUFBZCxJQUFjLEVBQUU7Z0JBQWpDLElBQU0sT0FBTyxTQUFBO2dCQUNoQixJQUFJLENBQUMsTUFBTyxDQUFDLEtBQUssQ0FDaEIsS0FBSyxxR0FBQSx1QkFBd0IsRUFBWSxHQUFJLEVBQWUsS0FBSSxLQUFuQyxPQUFPLENBQUMsSUFBSSxFQUFJLE9BQU8sQ0FBQyxPQUFPLEVBQzdELENBQUM7Z0JBQ0YsSUFBSSxDQUFDLE1BQU8sQ0FBQyxLQUFLLENBQ2hCLEtBQUssMkdBQUEsK0JBQWdDO29CQUViLFNBQU8sS0FGTSxPQUFPLENBQUMsVUFBVTtxQkFDcEQsS0FBSyxDQUFDLElBQUksQ0FBQztxQkFDWCxJQUFJLENBQUMsZUFBZSxDQUFDLEVBQ3pCLENBQUM7YUFDSDtZQUVELEtBQW9CLFVBQVksRUFBWixLQUFBLEtBQUssQ0FBQyxNQUFNLEVBQVosY0FBWSxFQUFaLElBQVksRUFBRTtnQkFBN0IsSUFBTSxLQUFLLFNBQUE7Z0JBQ2QsSUFBSSxDQUFDLE1BQU8sQ0FBQyxLQUFLLENBQ2hCLEtBQUssb0dBQUEsb0JBQXFCLEVBQVUsR0FBSSxFQUFhLEtBQUksS0FBL0IsS0FBSyxDQUFDLElBQUksRUFBSSxLQUFLLENBQUMsT0FBTyxFQUN0RCxDQUFDO2dCQUNGLElBQUksQ0FBQyxNQUFPLENBQUMsS0FBSyxDQUNoQixLQUFLLDBHQUFBLDRCQUE2QjtvQkFFVixTQUFPLEtBRkcsS0FBSyxDQUFDLFVBQVU7cUJBQy9DLEtBQUssQ0FBQyxJQUFJLENBQUM7cUJBQ1gsSUFBSSxDQUFDLGVBQWUsQ0FBQyxFQUN6QixDQUFDO2FBQ0g7UUFDSCxDQUFDO1FBRUQ7Ozs7V0FJRztRQUNJLCtCQUFLLEdBQVosVUFBYSxRQUF3QjtZQUNuQyxJQUFNLEtBQUssR0FBRyxPQUFPLENBQUMsT0FBTyxDQUFDLENBQUM7WUFDL0IsSUFBTSxNQUFNLEdBQUcsUUFBUSxDQUFDLFNBQVMsQ0FBQyxFQUFFLE1BQU0sRUFBRSxFQUFFLEVBQUUsQ0FBQyxDQUFDLFFBQVEsRUFBRSxDQUFDO1lBQzdELElBQUksQ0FBQyxNQUFPLENBQUMsS0FBSyxDQUFDLEtBQUssa0dBQUEsdUJBQXdCLEVBQU0sS0FBSSxLQUFWLE1BQU0sRUFBSyxDQUFDO1FBQzlELENBQUM7UUFDSCxzQkFBQztJQUFELENBQUMsQUF0SkQsQ0FBNkMsMkJBQVksR0FzSnhEIn0=