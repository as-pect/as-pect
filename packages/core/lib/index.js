var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./reporter/CombinationReporter", "./reporter/CSVReporter", "./reporter/EmptyReporter", "./reporter/JSONReporter", "./reporter/SummaryReporter", "./reporter/VerboseReporter", "./test/TestContext", "./test/TestGroup", "./test/TestReporter", "./test/TestResult", "./util/IPerformanceConfiguration", "./util/HostValue"], factory);
    }
})(function (require, exports) {
    "use strict";
    function __export(m) {
        for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
    }
    Object.defineProperty(exports, "__esModule", { value: true });
    var CombinationReporter_1 = __importDefault(require("./reporter/CombinationReporter"));
    exports.CombinationReporter = CombinationReporter_1.default;
    var CSVReporter_1 = __importDefault(require("./reporter/CSVReporter"));
    exports.CSVReporter = CSVReporter_1.default;
    var EmptyReporter_1 = __importDefault(require("./reporter/EmptyReporter"));
    exports.EmptyReporter = EmptyReporter_1.default;
    var JSONReporter_1 = __importDefault(require("./reporter/JSONReporter"));
    exports.JSONReporter = JSONReporter_1.default;
    var SummaryReporter_1 = __importDefault(require("./reporter/SummaryReporter"));
    exports.SummaryReporter = SummaryReporter_1.default;
    var VerboseReporter_1 = __importDefault(require("./reporter/VerboseReporter"));
    exports.VerboseReporter = VerboseReporter_1.default;
    __export(require("./test/TestContext"));
    __export(require("./test/TestGroup"));
    __export(require("./test/TestReporter"));
    __export(require("./test/TestResult"));
    __export(require("./util/IPerformanceConfiguration"));
    __export(require("./util/HostValue"));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi9zcmMvaW5kZXgudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFBQSx1RkFBaUU7SUFPeEQsOEJBUEYsNkJBQW1CLENBT0U7SUFONUIsdUVBQWlEO0lBT3hDLHNCQVBGLHFCQUFXLENBT0U7SUFOcEIsMkVBQXFEO0lBTzVDLHdCQVBGLHVCQUFhLENBT0U7SUFOdEIseUVBQW1EO0lBTzFDLHVCQVBGLHNCQUFZLENBT0U7SUFOckIsK0VBQXlEO0lBT2hELDBCQVBGLHlCQUFlLENBT0U7SUFOeEIsK0VBQXlEO0lBT2hELDBCQVBGLHlCQUFlLENBT0U7SUFFeEIsd0NBQW1DO0lBQ25DLHNDQUFpQztJQUNqQyx5Q0FBb0M7SUFDcEMsdUNBQWtDO0lBR2xDLHNEQUFpRDtJQUNqRCxzQ0FBaUMifQ==