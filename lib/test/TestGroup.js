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
            /**
             * A pointer that points to the test suite name.
             */
            this.suiteNamePointer = -1;
            /**
             * A pointer that points to the beforeAll callback for this test group.
             */
            this.beforeAllPointer = -1;
            /**
             * A pointer that points to the beforeEach callback for this test group.
             */
            this.beforeEachPointer = -1;
            /**
             * A pointer that points to the afterEach callback for this test group.
             */
            this.afterEachPointer = -1;
            /**
             * A pointer that points to the afterAll callback for this test group.
             */
            this.afterAllPointer = -1;
            /**
             * A pointer[] that points to each test function.
             */
            this.testFunctionPointers = [];
            /**
             * A pointer[] that points to all the test names.
             */
            this.testNamePointers = [];
            /**
             * A count of how many successful tests ran in this test group.
             */
            this.successCount = 0;
            /**
             * A count of how many failed tests ran in this test group.
             */
            this.failCount = 0;
            /**
             * A count of how many tests ran in this test group. This may be different that the actual test
             * count because the test suite ends if any setup functions throw an error.
             */
            this.totalCount = 0;
            /**
             * A pointer array that points to the todo string references.
             */
            this.todoPointers = [];
            /**
             * The name of this test group. (e.g. `describe("test-group-name")`)
             */
            this.name = "";
            /**
             * A boolean which indicates if the test group passed.
             */
            this.pass = false;
            /**
             * How long the test group ran in milliseconds rounded to the nearest thousanth.
             */
            this.time = 0;
            /**
             * An array of test results.
             */
            this.results = [];
            /**
             * A resolved list of todos.
             */
            this.todos = [];
            /**
             * The number of todo items.
             */
            this.todoCount = 0;
            /**
             * The reason this test group failed.
             */
            this.reason = "";
            /**
             * The logged items in the current testGroup.
             */
            this.log = [];
        }
        return TestGroup;
    }());
    exports.TestGroup = TestGroup;
});
//# sourceMappingURL=TestGroup.js.map