(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./test/TestContext", "./test/TestGroup", "./test/TestReporter", "./test/TestResult", "./test/TestCollector", "./reporter/CSVTestReporter", "./reporter/DefaultTestReporter", "./reporter/EmptyReporter", "./reporter/JSONTestReporter", "./reporter/SummaryTestReporter", "./util/ActualValue", "./util/IPerformanceConfiguration", "./util/LogValue", "./cli"], factory);
    }
})(function (require, exports) {
    "use strict";
    function __export(m) {
        for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
    }
    Object.defineProperty(exports, "__esModule", { value: true });
    __export(require("./test/TestContext"));
    __export(require("./test/TestGroup"));
    __export(require("./test/TestReporter"));
    __export(require("./test/TestResult"));
    __export(require("./test/TestCollector"));
    __export(require("./reporter/CSVTestReporter"));
    __export(require("./reporter/DefaultTestReporter"));
    __export(require("./reporter/EmptyReporter"));
    __export(require("./reporter/JSONTestReporter"));
    __export(require("./reporter/SummaryTestReporter"));
    __export(require("./util/ActualValue"));
    __export(require("./util/IPerformanceConfiguration"));
    __export(require("./util/LogValue"));
    __export(require("./cli"));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYXMtcGVjdC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uL3NyYy9hcy1wZWN0LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7O0lBQ0Esd0NBQW1DO0lBQ25DLHNDQUFpQztJQUNqQyx5Q0FBb0M7SUFDcEMsdUNBQWtDO0lBQ2xDLDBDQUFxQztJQUNyQyxnREFBMkM7SUFDM0Msb0RBQStDO0lBQy9DLDhDQUF5QztJQUN6QyxpREFBNEM7SUFDNUMsb0RBQStDO0lBQy9DLHdDQUFtQztJQUluQyxzREFBaUQ7SUFDakQscUNBQWdDO0lBQ2hDLDJCQUFzQiJ9