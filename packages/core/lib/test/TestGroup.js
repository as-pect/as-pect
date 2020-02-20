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
            /**
             * This is the set of function pointers that will be called before each test.
             */
            this.beforeEachPointers = [];
            /**
             * This is the set of function pointers that will be called after each test.
             */
            this.afterEachPointers = [];
            /**
             * This is the set of function pointers that will be called before each describe block.
             */
            this.beforeAllPointers = [];
            /**
             * This is the set of function pointers that will be called after each describe block.
             */
            this.afterAllPointers = [];
            /**
             * This is the list of tests that the `TestContext` ran for this group.
             */
            this.tests = [];
            /**
             * This is a list of "todos" that were collected for this group.
             */
            this.todos = [];
            /**
             * This is the set of log values that were collected before and after the tests ran.
             */
            this.logs = [];
            /**
             * This is the name of the test.
             */
            this.name = "";
            /**
             * This is a value indicating if the group's tests passed successfully.
             */
            this.pass = true;
            /**
             * This is the reason that the group's tests did not pass.
             */
            this.reason = "";
            /**
             * This is how long the group ran in ms.
             */
            this.time = 0;
            /**
             * A value indicating if this test group should run.
             */
            this.willRun = true;
            /**
             * The group start time.
             */
            this.start = 0;
            /**
             * The group end time.
             */
            this.end = 0;
            /**
             * If the test group did not error, this is the number of allocations that occurred durring the
             * the group's exection.
             */
            this.allocationCount = 0;
            /**
             * If the test group did not error, this is the number of deallocations that occurred durring the
             * the group's exection.
             */
            this.freeCount = 0;
            /**
             * If the test group did not error, this is the number of block decrements that occurred during
             * the group's exection.
             */
            this.decrementCount = 0;
            /**
             * If the test group did not error, this is the number of block increments that occurred during
             * the group's exection.
             */
            this.incrementCount = 0;
            /**
             * If the test group did not error, this is the number of block reallocations that occurred during
             * the group's exection.
             */
            this.reallocationCount = 0;
            /**
             * This is the number of allocations currently on the heap when the `TestGroup` execution starts.
             */
            this.rtraceStart = 0;
            /**
             * If the test group completed, this is the number of allocations currently on the heap when the
             * `TestGroup` execution ends.
             */
            this.rtraceEnd = 0;
            /**
             * If the test group completed, this is the delta number of allocations that occured during the
             * `TestGroup` execution.
             */
            this.rtraceDelta = 0;
            /**
             * The parent describe context that contains callbacks that also apply to this context.
             */
            this.parent = null;
            this.children = [];
            this.errors = [];
            /**
             * A set of warnings that were reported for this test.
             */
            this.warnings = [];
        }
        /**
         * This method creates a new TestGroup that contains a reference to all of the current flow
         * functions of this `TestGroup`.
         */
        TestGroup.prototype.fork = function () {
            var forked = new TestGroup();
            forked.parent = this;
            this.children.push(forked);
            return forked;
        };
        return TestGroup;
    }());
    exports.TestGroup = TestGroup;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVGVzdEdyb3VwLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3Rlc3QvVGVzdEdyb3VwLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBS0E7OztPQUdHO0lBQ0g7UUFBQTtZQUNFOztlQUVHO1lBQ0ksdUJBQWtCLEdBQWEsRUFBRSxDQUFDO1lBRXpDOztlQUVHO1lBQ0ksc0JBQWlCLEdBQWEsRUFBRSxDQUFDO1lBRXhDOztlQUVHO1lBQ0ksc0JBQWlCLEdBQWEsRUFBRSxDQUFDO1lBRXhDOztlQUVHO1lBQ0kscUJBQWdCLEdBQWEsRUFBRSxDQUFDO1lBRXZDOztlQUVHO1lBQ0ksVUFBSyxHQUFpQixFQUFFLENBQUM7WUFFaEM7O2VBRUc7WUFDSSxVQUFLLEdBQWEsRUFBRSxDQUFDO1lBRTVCOztlQUVHO1lBQ0ksU0FBSSxHQUFxQixFQUFFLENBQUM7WUFFbkM7O2VBRUc7WUFDSSxTQUFJLEdBQVcsRUFBRSxDQUFDO1lBRXpCOztlQUVHO1lBQ0ksU0FBSSxHQUFZLElBQUksQ0FBQztZQUU1Qjs7ZUFFRztZQUNJLFdBQU0sR0FBVyxFQUFFLENBQUM7WUFFM0I7O2VBRUc7WUFDSSxTQUFJLEdBQVcsQ0FBQyxDQUFDO1lBRXhCOztlQUVHO1lBQ0ksWUFBTyxHQUFZLElBQUksQ0FBQztZQUUvQjs7ZUFFRztZQUNJLFVBQUssR0FBVyxDQUFDLENBQUM7WUFDekI7O2VBRUc7WUFDSSxRQUFHLEdBQVcsQ0FBQyxDQUFDO1lBRXZCOzs7ZUFHRztZQUNJLG9CQUFlLEdBQVcsQ0FBQyxDQUFDO1lBRW5DOzs7ZUFHRztZQUNJLGNBQVMsR0FBVyxDQUFDLENBQUM7WUFFN0I7OztlQUdHO1lBQ0ksbUJBQWMsR0FBVyxDQUFDLENBQUM7WUFFbEM7OztlQUdHO1lBQ0ksbUJBQWMsR0FBVyxDQUFDLENBQUM7WUFFbEM7OztlQUdHO1lBQ0ksc0JBQWlCLEdBQVcsQ0FBQyxDQUFDO1lBRXJDOztlQUVHO1lBQ0ksZ0JBQVcsR0FBVyxDQUFDLENBQUM7WUFFL0I7OztlQUdHO1lBQ0ksY0FBUyxHQUFXLENBQUMsQ0FBQztZQUU3Qjs7O2VBR0c7WUFDSSxnQkFBVyxHQUFXLENBQUMsQ0FBQztZQUUvQjs7ZUFFRztZQUNJLFdBQU0sR0FBcUIsSUFBSSxDQUFDO1lBRWhDLGFBQVEsR0FBZ0IsRUFBRSxDQUFDO1lBYTNCLFdBQU0sR0FBZSxFQUFFLENBQUM7WUFFL0I7O2VBRUc7WUFDSSxhQUFRLEdBQWUsRUFBRSxDQUFDO1FBQ25DLENBQUM7UUFqQkM7OztXQUdHO1FBQ0ksd0JBQUksR0FBWDtZQUNFLElBQU0sTUFBTSxHQUFHLElBQUksU0FBUyxFQUFFLENBQUM7WUFDL0IsTUFBTSxDQUFDLE1BQU0sR0FBRyxJQUFJLENBQUM7WUFDckIsSUFBSSxDQUFDLFFBQVEsQ0FBQyxJQUFJLENBQUMsTUFBTSxDQUFDLENBQUM7WUFDM0IsT0FBTyxNQUFNLENBQUM7UUFDaEIsQ0FBQztRQVFILGdCQUFDO0lBQUQsQ0FBQyxBQTdJRCxJQTZJQztJQTdJWSw4QkFBUyJ9