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
    var JSONTestReporter = /** @class */ (function (_super) {
        __extends(JSONTestReporter, _super);
        function JSONTestReporter() {
            var _this = _super !== null && _super.apply(this, arguments) || this;
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
//# sourceMappingURL=JSONTestReporter.js.map