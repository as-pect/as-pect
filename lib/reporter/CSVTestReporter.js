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
        define(["require", "exports", "../test/TestReporter", "csv-stringify", "fs", "path"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestReporter_1 = require("../test/TestReporter");
    var csv_stringify_1 = __importDefault(require("csv-stringify"));
    var fs_1 = require("fs");
    var path_1 = require("path");
    var columns = ["Group", "Name", "Ran", "Pass", "Runtime", "Message", "Actual", "Expected", "Average", "Mean", "Max", "Min", "StdDev", "Variance"];
    var CSVTestReporter = /** @class */ (function (_super) {
        __extends(CSVTestReporter, _super);
        function CSVTestReporter() {
            var _this = _super !== null && _super.apply(this, arguments) || this;
            _this.output = null;
            _this.fileName = null;
            return _this;
        }
        CSVTestReporter.prototype.onStart = function (suite) {
            this.output = csv_stringify_1.default({ columns: columns });
            var extension = path_1.extname(suite.fileName);
            var dir = path_1.dirname(suite.fileName);
            var base = path_1.basename(suite.fileName, extension);
            var outPath = path_1.join(process.cwd(), dir, base + ".csv");
            this.fileName = fs_1.createWriteStream(outPath, "utf8");
            this.output.pipe(this.fileName);
            this.output.write(columns);
        };
        CSVTestReporter.prototype.onGroupStart = function () { };
        CSVTestReporter.prototype.onGroupFinish = function () { };
        CSVTestReporter.prototype.onFinish = function () {
            this.output.end();
        };
        CSVTestReporter.prototype.onTestStart = function () { };
        CSVTestReporter.prototype.onTestFinish = function (group, result) {
            this.output.write([
                group.name,
                result.ran ? "RAN" : "NOT RUN",
                result.name,
                result.pass ? "PASS" : "FAIL",
                result.runTime.toString(),
                result.message,
                result.actual ? result.actual.message : "",
                result.expected ? result.expected.message : "",
                result.hasAverage ? result.average.toString() : "",
                result.hasMedian ? result.median.toString() : "",
                result.hasMax ? result.max.toString() : "",
                result.hasMin ? result.min.toString() : "",
                result.hasStdDev ? result.stdDev.toString() : "",
                result.hasVariance ? result.variance.toString() : ""
            ]);
        };
        CSVTestReporter.prototype.onTodo = function (group, desc) {
            this.output.write([
                group.name,
                "TODO",
                desc,
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
            ]);
        };
        return CSVTestReporter;
    }(TestReporter_1.TestReporter));
    exports.CSVTestReporter = CSVTestReporter;
});
//# sourceMappingURL=CSVTestReporter.js.map