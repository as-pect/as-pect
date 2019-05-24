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
    /**
     * This test group class is designed with a data oriented layout in mind. Each test property is
     * represented by an array.
     */
    var TestGroup = /** @class */ (function () {
        function TestGroup() {
            this.describePointers = [];
            // callback properties
            this.beforeEachPointers = [];
            this.afterEachPointers = [];
            this.beforeAllPointers = [];
            this.afterAllPointers = [];
            // test properties
            this.testFunctionPointers = [];
            this.testNames = [];
            this.testMessages = [];
            this.testThrows = [];
            // tests and todos
            this.tests = [];
            this.todoPointers = [];
            this.todos = [];
            // logs
            this.logs = [];
            this.name = "";
            this.pass = true;
            this.reason = "";
            this.time = 0;
            // individual test performance configurations
            this.performanceEnabled = [];
            this.maxSamples = [];
            this.roundDecimalPlaces = [];
            this.maxTestRuntime = [];
            this.reportAverage = [];
            this.reportMedian = [];
            this.reportStandardDeviation = [];
            this.reportMax = [];
            this.reportMin = [];
            this.reportVariance = [];
        }
        TestGroup.prototype.fork = function () {
            var forked = new TestGroup();
            forked.describePointers = this.describePointers.slice();
            forked.beforeEachPointers = this.beforeEachPointers.slice();
            forked.afterEachPointers = this.afterEachPointers.slice();
            forked.beforeAllPointers = this.beforeAllPointers.slice();
            forked.afterAllPointers = this.afterAllPointers.slice();
            return forked;
        };
        return TestGroup;
    }());
    exports.TestGroup = TestGroup;
});
//# sourceMappingURL=TestGroup.js.map