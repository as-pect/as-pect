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
            /**
             * The actual test's name or description.
             */
            this.testName = "";
            /**
             * The indicator to see if the test passed.
             */
            this.pass = false;
            /**
             * The time in milliseconds indicating how long the test ran.
             */
            this.time = 0;
            /**
             * The reported actual value description.
             */
            this.actual = "";
            /**
             * The reported expected value description.
             */
            this.expected = "";
            /**
             * If the test failed, this is the message describing why the test failed.
             */
            this.message = "";
        }
        return TestResult;
    }());
    exports.TestResult = TestResult;
});
//# sourceMappingURL=TestResult.js.map