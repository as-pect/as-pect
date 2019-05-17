(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./test/TestContext", "./test/TestGroup", "./test/TestReporter", "./test/TestResult", "./reporter/DefaultTestReporter", "./reporter/EmptyReporter", "./reporter/SummaryTestReporter", "./util/ActualValue", "./util/LogValue", "./cli/cli"], factory);
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
    __export(require("./reporter/DefaultTestReporter"));
    __export(require("./reporter/EmptyReporter"));
    __export(require("./reporter/SummaryTestReporter"));
    __export(require("./util/ActualValue"));
    __export(require("./util/LogValue"));
    __export(require("./cli/cli"));
});
//# sourceMappingURL=as-pect.js.map