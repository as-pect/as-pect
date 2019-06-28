var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./reporter/CombinationReporter", "./reporter/CSVReporter", "./reporter/EmptyReporter", "./reporter/JSONReporter", "./reporter/SummaryReporter", "./reporter/VerboseReporter", "./cli", "./test/TestCollector", "./test/TestContext", "./test/TestGroup", "./test/TestReporter", "./test/TestResult", "./util/ActualValue", "./util/IPerformanceConfiguration", "./util/LogValue"], factory);
    }
})(function (require, exports) {
    "use strict";
    function __export(m) {
        for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
    }
    Object.defineProperty(exports, "__esModule", { value: true });
    var CombinationReporter_1 = __importDefault(require("./reporter/CombinationReporter"));
    exports.CombinatonReporter = CombinationReporter_1.default;
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
    __export(require("./cli"));
    __export(require("./test/TestCollector"));
    __export(require("./test/TestContext"));
    __export(require("./test/TestGroup"));
    __export(require("./test/TestReporter"));
    __export(require("./test/TestResult"));
    __export(require("./util/ActualValue"));
    __export(require("./util/IPerformanceConfiguration"));
    __export(require("./util/LogValue"));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYXMtcGVjdC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uL3NyYy9hcy1wZWN0LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEsdUZBQWdFO0lBT3ZELDZCQVBGLDZCQUFrQixDQU9FO0lBTjNCLHVFQUFpRDtJQU94QyxzQkFQRixxQkFBVyxDQU9FO0lBTnBCLDJFQUFxRDtJQU81Qyx3QkFQRix1QkFBYSxDQU9FO0lBTnRCLHlFQUFtRDtJQU8xQyx1QkFQRixzQkFBWSxDQU9FO0lBTnJCLCtFQUF5RDtJQU9oRCwwQkFQRix5QkFBZSxDQU9FO0lBTnhCLCtFQUF5RDtJQU9oRCwwQkFQRix5QkFBZSxDQU9FO0lBQ3hCLDJCQUFzQjtJQUV0QiwwQ0FBcUM7SUFDckMsd0NBQW1DO0lBQ25DLHNDQUFpQztJQUNqQyx5Q0FBb0M7SUFDcEMsdUNBQWtDO0lBQ2xDLHdDQUFtQztJQUluQyxzREFBaUQ7SUFDakQscUNBQWdDIn0=