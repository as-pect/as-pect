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
            this.groups = [];
            this.total = 0;
            this.success = 0;
            this.fail = 0;
            this.filename = "";
            this.time = 0;
            this.passed = false;
        }
        return TestSuite;
    }());
    exports.TestSuite = TestSuite;
});
//# sourceMappingURL=TestSuite.js.map