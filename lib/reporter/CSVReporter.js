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
    /**
     * This is a list of all the columns in the exported csv file.
     */
    var csvColumns = [
        "Group",
        "Name",
        "Ran",
        "Pass",
        "Runtime",
        "Message",
        "Actual",
        "Expected",
        "Average",
        "Mean",
        "Max",
        "Min",
        "StdDev",
        "Variance",
    ];
    /**
     * This class is responsible for creating a csv file located at {testName}.spec.csv. It will
     * contain a set of tests with relevant pass and fail information.
     */
    var CSVReporter = /** @class */ (function (_super) {
        __extends(CSVReporter, _super);
        function CSVReporter(_options) {
            var _this = _super.call(this) || this;
            _this.output = null;
            _this.fileName = null;
            return _this;
        }
        CSVReporter.prototype.onStart = function (suite) {
            this.output = csv_stringify_1.default({ columns: csvColumns });
            var extension = path_1.extname(suite.fileName);
            var dir = path_1.dirname(suite.fileName);
            var base = path_1.basename(suite.fileName, extension);
            var outPath = path_1.join(process.cwd(), dir, base + ".csv");
            this.fileName = fs_1.createWriteStream(outPath, "utf8");
            this.output.pipe(this.fileName);
            this.output.write(csvColumns);
        };
        CSVReporter.prototype.onGroupStart = function () { };
        CSVReporter.prototype.onGroupFinish = function () { };
        CSVReporter.prototype.onFinish = function () {
            this.output.end();
        };
        CSVReporter.prototype.onTestStart = function () { };
        CSVReporter.prototype.onTestFinish = function (group, result) {
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
        CSVReporter.prototype.onTodo = function (group, desc) {
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
        return CSVReporter;
    }(TestReporter_1.TestReporter));
    exports.default = CSVReporter;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiQ1NWUmVwb3J0ZXIuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvcmVwb3J0ZXIvQ1NWUmVwb3J0ZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEscURBQW9EO0lBRXBELGdFQUF1RDtJQUN2RCx5QkFBb0Q7SUFDcEQsNkJBQXdEO0lBSXhEOztPQUVHO0lBQ0gsSUFBTSxVQUFVLEdBQUc7UUFDakIsT0FBTztRQUNQLE1BQU07UUFDTixLQUFLO1FBQ0wsTUFBTTtRQUNOLFNBQVM7UUFDVCxTQUFTO1FBQ1QsUUFBUTtRQUNSLFVBQVU7UUFDVixTQUFTO1FBQ1QsTUFBTTtRQUNOLEtBQUs7UUFDTCxLQUFLO1FBQ0wsUUFBUTtRQUNSLFVBQVU7S0FDWCxDQUFDO0lBRUY7OztPQUdHO0lBQ0g7UUFBeUMsK0JBQVk7UUFJbkQscUJBQVksUUFBYztZQUExQixZQUNFLGlCQUFPLFNBQ1I7WUFMUyxZQUFNLEdBQXVCLElBQUksQ0FBQztZQUNsQyxjQUFRLEdBQXVCLElBQUksQ0FBQzs7UUFJOUMsQ0FBQztRQUVNLDZCQUFPLEdBQWQsVUFBZSxLQUFrQjtZQUMvQixJQUFJLENBQUMsTUFBTSxHQUFHLHVCQUFTLENBQUMsRUFBRSxPQUFPLEVBQUUsVUFBVSxFQUFFLENBQUMsQ0FBQztZQUNqRCxJQUFNLFNBQVMsR0FBRyxjQUFPLENBQUMsS0FBSyxDQUFDLFFBQVEsQ0FBQyxDQUFDO1lBQzFDLElBQU0sR0FBRyxHQUFHLGNBQU8sQ0FBQyxLQUFLLENBQUMsUUFBUSxDQUFDLENBQUM7WUFDcEMsSUFBTSxJQUFJLEdBQUcsZUFBUSxDQUFDLEtBQUssQ0FBQyxRQUFRLEVBQUUsU0FBUyxDQUFDLENBQUM7WUFDakQsSUFBTSxPQUFPLEdBQUcsV0FBSSxDQUNsQixPQUFPLENBQUMsR0FBRyxFQUFFLEVBQ2IsR0FBRyxFQUNILElBQUksR0FBRyxNQUFNLENBQ2QsQ0FBQztZQUNGLElBQUksQ0FB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