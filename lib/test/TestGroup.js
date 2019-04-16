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
            this.testNamePointers = [];
            this.testMessagePointers = [];
            this.testThrows = [];
            // tests and todos
            this.tests = [];
            this.todos = [];
            // logs
            this.logs = [];
            this.name = "";
            this.pass = true;
            this.reason = "";
            this.time = 0;
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