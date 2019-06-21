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
        define(["require", "exports", "../test/TestReporter", "fs", "path"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestReporter_1 = require("../test/TestReporter");
    var fs_1 = require("fs");
    var path_1 = require("path");
    /**
     * This class reports all relevant test statistics to a JSON file located at
     * `{testLocation}.spec.json`.
     */
    var JSONTestReporter = /** @class */ (function (_super) {
        __extends(JSONTestReporter, _super);
        function JSONTestReporter(_options) {
            var _this = _super.call(this) || this;
            _this.file = null;
            _this.first = true;
            return _this;
        }
        JSONTestReporter.prototype.onStart = function (suite) {
            var extension = path_1.extname(suite.fileName);
            var dir = path_1.dirname(suite.fileName);
            var base = path_1.basename(suite.fileName, extension);
            var outPath = path_1.join(process.cwd(), dir, base + ".json");
            this.file = fs_1.createWriteStream(outPath, "utf8");
            this.file.write("[");
            this.first = true;
        };
        JSONTestReporter.prototype.onGroupStart = function () { };
        JSONTestReporter.prototype.onGroupFinish = function () { };
        JSONTestReporter.prototype.onFinish = function () {
            this.file.end("\n]");
        };
        JSONTestReporter.prototype.onTestStart = function () { };
        JSONTestReporter.prototype.onTestFinish = function (group, result) {
            this.file.write((this.first ? "\n" : ",\n") + JSON.stringify({
                group: group.name,
                name: result.name,
                ran: result.ran,
                pass: result.pass,
                runtime: result.runTime,
                message: result.message,
                actual: result.actual ? result.actual.message : null,
                expected: result.expected ? result.expected.message : null,
                average: result.average,
                median: result.median,
                max: result.max,
                min: result.min,
                stdDev: result.stdDev,
                variance: result.variance,
            }));
            this.first = false;
        };
        JSONTestReporter.prototype.onTodo = function (group, desc) {
            this.file.write((this.first ? "\n" : ",\n") + JSON.stringify({
                group: group.name,
                name: "TODO:" + desc,
                ran: false,
                pass: null,
                runtime: 0,
                message: "",
                actual: null,
                expected: null,
                average: 0,
                median: 0,
                max: 0,
                min: 0,
                stdDev: 0,
                variance: 0,
            }));
            this.first = false;
        };
        return JSONTestReporter;
    }(TestReporter_1.TestReporter));
    exports.JSONTestReporter = JSONTestReporter;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiSlNPTlRlc3RSZXBvcnRlci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9yZXBvcnRlci9KU09OVGVzdFJlcG9ydGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUFBLHFEQUFvRDtJQUVwRCx5QkFBb0Q7SUFDcEQsNkJBQXdEO0lBSXhEOzs7T0FHRztJQUNIO1FBQXNDLG9DQUFZO1FBQ2hELDBCQUFZLFFBQWM7WUFBMUIsWUFBOEIsaUJBQU8sU0FBRztZQUU5QixVQUFJLEdBQXVCLElBQUksQ0FBQztZQUVsQyxXQUFLLEdBQVksSUFBSSxDQUFDOztRQUpTLENBQUM7UUFLakMsa0NBQU8sR0FBZCxVQUFlLEtBQWtCO1lBQy9CLElBQU0sU0FBUyxHQUFHLGNBQU8sQ0FBQyxLQUFLLENBQUMsUUFBUSxDQUFDLENBQUM7WUFDMUMsSUFBTSxHQUFHLEdBQUcsY0FBTyxDQUFDLEtBQUssQ0FBQyxRQUFRLENBQUMsQ0FBQztZQUNwQyxJQUFNLElBQUksR0FBRyxlQUFRLENBQUMsS0FBSyxDQUFDLFFBQVEsRUFBRSxTQUFTLENBQUMsQ0FBQztZQUNqRCxJQUFNLE9BQU8sR0FBRyxXQUFJLENBQ2xCLE9BQU8sQ0FBQyxHQUFHLEVBQUUsRUFDYixHQUFHLEVBQ0gsSUFBSSxHQUFHLE9BQU8sQ0FDZixDQUFDO1lBQ0YsSUFBSSxDQUFDLElBQUksR0FBRyxzQkFBaUIsQ0FBQyxPQUFPLEVBQUUsTUFBTSxDQUFDLENBQUM7WUFDL0MsSUFBSSxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsR0FBRyxDQUFDLENBQUM7WUFDckIsSUFBSSxDQUFDLEtBQUssR0FBRyxJQUFJLENBQUM7UUFDcEIsQ0FBQztRQUVNLHVDQUFZLEdBQW5CLGNBQTZCLENBQUM7UUFDdkIsd0NBQWEsR0FBcEIsY0FBOEIsQ0FBQztRQUN4QixtQ0FBUSxHQUFmO1lBQ0UsSUFBSSxDQUFDLElBQUssQ0FBQyxHQUFHLENBQUMsS0FBSyxDQUFDLENBQUM7UUFDeEIsQ0FBQztRQUVNLHNDQUFXLEdBQWxCLGNBQXNCLENBQUM7UUFFaEIsdUNBQVksR0FBbkIsVUFBb0IsS0FBZ0IsRUFBRSxNQUFrQjtZQUN0RCxJQUFJLENBQUMsSUFBSyxDQUFDLEtBQUssQ0FDZCxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxDQUFDLEdBQUcsSUFBSSxDQUFDLFNBQVMsQ0FBQztnQkFDM0MsS0FBSyxFQUFFLEtBQUssQ0FBQyxJQUFJO2dCQUNqQixJQUFJLEVBQUUsTUFBTSxDQUFDLElBQUk7Z0JBQ2pCLEdBQUcsRUFBRSxNQUFNLENBQUMsR0FBRztnQkFDZixJQUFJLEVBQUUsTUFBTSxDQUFDLElBQUk7Z0JBQ2pCLE9BQU8sRUFBRSxNQUFNLENBQUMsT0FBTztnQkFDdkIsT0FBTyxFQUFFLE1BQU0sQ0FBQyxPQUFPO2dCQUN2QixNQUFNLEVBQUUsTUFBTSxDQUFDLE1BQU0sQ0FBQyxDQUFDLENBQUMsTUFBTSxDQUFDLE1BQU0sQ0FBQyxPQUFPLENBQUMsQ0FBQyxDQUFDLElBQUk7Z0JBQ3BELFFBQVEsRUFBRSxNQUFNLENBQUMsUUFBUSxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsUUFBUSxDQUFDLE9BQU8sQ0FBQyxDQUFDLENBQUMsSUFBSTtnQkFDMUQsT0FBTyxFQUFFLE1BQU0sQ0FBQyxPQUFPO2dCQUN2QixNQUFNLEVBQUUsTUFBTSxDQUFDLE1BQU07Z0JBQ3JCLEdBQUcsRUFBRSxNQUFNLENBQUMsR0FBRztnQkFDZixHQUFHLEVBQUUsTUFBTSxDQUFDLEdBQUc7Z0JBQ2YsTUFBTSxFQUFFLE1BQU0sQ0FBQyxNQUFNO2dCQUNyQixRQUFRLEVBQUUsTUFBTSxDQUFDLFFBQVE7YUFDMUIsQ0FBQyxDQUNILENBQUM7WUFDRixJQUFJLENBQUMsS0FBSyxHQUFHLEtBQUssQ0FBQztRQUNyQixDQUFDO1FBRU0saUNBQU0sR0FBYixVQUFjLEtBQWdCLEVBQUUsSUFBWTtZQUMxQyxJQUFJLENBQUMsSUFBSyxDQUFDLEtBQUssQ0FBQyxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxDQUFDLEdBQUcsSUFBSSxDQUFDLFNBQVMsQ0FBQztnQkFDMUQsS0FBSyxFQUFFLEtBQUssQ0FBQyxJQUFJO2dCQUNqQixJQUFJLEVBQUUsT0FBTyxHQUFHLElBQUk7Z0JBQ3BCLEdBQUcsRUFBRSxLQUFLO2dCQUNWLElBQUksRUFBRSxJQUFJO2dCQUNWLE9BQU8sRUFBRSxDQUFDO2dCQUNWLE9BQU8sRUFBRSxFQUFFO2dCQUNYLE1BQU0sRUFBRSxJQUFJO2dCQUNaLFFBQVEsRUFBRSxJQUFJO2dCQUNkLE9BQU8sRUFBRSxDQUFDO2dCQUNWLE1BQU0sRUFBRSxDQUFDO2dCQUNULEdBQUcsRUFBRSxDQUFDO2dCQUNOLEdBQUcsRUFBRSxDQUFDO2dCQUNOLE1BQU0sRUFBRSxDQUFDO2dCQUNULFFBQVEsRUFBRSxDQUFDO2FBQ1osQ0FBQyxDQUNILENBQUM7WUFDRixJQUFJLENBQUMsS0FBSyxHQUFHLEtBQUssQ0FBQztRQUNyQixDQUFDO1FBQ0gsdUJBQUM7SUFBRCxDQUFDLEFBdEVELENBQXNDLDJCQUFZLEdBc0VqRDtJQXRFWSw0Q0FBZ0IifQ==