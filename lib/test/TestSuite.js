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
    var TestSuite = /** @class */ (function () {
        function TestSuite() {
            this.testGroups = [];
            this.totalTests = 0;
            this.successCount = 0;
            this.failCount = 0;
            this.todoCount = 0;
            this.filename = "";
            this.time = 0;
            this.pass = false;
        }
        return TestSuite;
    }());
    exports.TestSuite = TestSuite;
});
//# sourceMappingURL=TestSuite.js.map