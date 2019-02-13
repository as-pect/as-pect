(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestResult = /** @class */ (function () {
        function TestResult() {
            this.description = "";
            this.pass = false;
            this.time = 0;
            this.actual = "";
            this.expected = "";
            this.reason = "";
        }
        return TestResult;
    }());
    exports.TestResult = TestResult;
});
//# sourceMappingURL=TestResult.js.map