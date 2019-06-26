var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./reporter/CSVReporter", "./reporter/VerboseReporter", "./reporter/EmptyReporter", "./reporter/JSONReporter", "./reporter/SummaryReporter", "./reporter/CombinationReporter", "./test/TestContext", "./test/TestGroup", "./test/TestReporter", "./test/TestResult", "./test/TestCollector", "./util/ActualValue", "./util/IPerformanceConfiguration", "./util/LogValue", "./cli"], factory);
    }
})(function (require, exports) {
    "use strict";
    function __export(m) {
        for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
    }
    Object.defineProperty(exports, "__esModule", { value: true });
    var CSVReporter_1 = __importDefault(require("./reporter/CSVReporter"));
    exports.CSVReporter = CSVReporter_1.default;
    var VerboseReporter_1 = __importDefault(require("./reporter/VerboseReporter"));
    exports.VerboseReporter = VerboseReporter_1.default;
    var EmptyReporter_1 = __importDefault(require("./reporter/EmptyReporter"));
    exports.EmptyReporter = EmptyReporter_1.default;
    var JSONReporter_1 = __importDefault(require("./reporter/JSONReporter"));
    exports.JSONReporter = JSONReporter_1.default;
    var SummaryReporter_1 = __importDefault(require("./reporter/SummaryReporter"));
    exports.SummaryReporter = SummaryReporter_1.default;
    var CombinationReporter_1 = __importDefault(require("./reporter/CombinationReporter"));
    exports.CombinatonReporter = CombinationReporter_1.default;
    __export(require("./test/TestContext"));
    __export(require("./test/TestGroup"));
    __export(require("./test/TestReporter"));
    __export(require("./test/TestResult"));
    __export(require("./test/TestCollector"));
    __export(require("./util/ActualValue"));
    __export(require("./util/IPerformanceConfiguration"));
    __export(require("./util/LogValue"));
    __export(require("./cli"));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYXMtcGVjdC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uL3NyYy9hcy1wZWN0LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEsdUVBQWlEO0lBYXhDLHNCQWJGLHFCQUFXLENBYUU7SUFacEIsK0VBQXlEO0lBYWhELDBCQWJGLHlCQUFlLENBYUU7SUFaeEIsMkVBQXFEO0lBYTVDLHdCQWJGLHVCQUFhLENBYUU7SUFadEIseUVBQW1EO0lBYTFDLHVCQWJGLHNCQUFZLENBYUU7SUFackIsK0VBQXlEO0lBYWhELDBCQWJGLHlCQUFlLENBYUU7SUFaeEIsdUZBQWdFO0lBYXZELDZCQWJGLDZCQUFrQixDQWFFO0lBVjNCLHdDQUFtQztJQUNuQyxzQ0FBaUM7SUFDakMseUNBQW9DO0lBQ3BDLHVDQUFrQztJQUNsQywwQ0FBcUM7SUFPckMsd0NBQW1DO0lBSW5DLHNEQUFpRDtJQUNqRCxxQ0FBZ0M7SUFDaEMsMkJBQXNCIn0=