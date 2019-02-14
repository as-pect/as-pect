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
            /**
             * All the test groups in this test suite.
             */
            this.testGroups = [];
            /**
             * The total number tests run in this test suite.
             */
            this.totalTests = 0;
            /**
             * The total number test successes in this test suite.
             */
            this.successCount = 0;
            /**
             * The total number of test fails in this test suite.
             */
            this.failCount = 0;
            /**
             * The total number to todos left to complete in this test suite.
             */
            this.todoCount = 0;
            /**
             * The test suite filename.
             */
            this.filename = "";
            /**
             * The total time it took for this test suite to run in milliseconds rounded to the nearest
             * thousandth.
             */
            this.time = 0;
            /**
             * An indicator if the test suite passed.
             */
            this.pass = false;
        }
        return TestSuite;
    }());
    exports.TestSuite = TestSuite;
});
//# sourceMappingURL=TestSuite.js.map