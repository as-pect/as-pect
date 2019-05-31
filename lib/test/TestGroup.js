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
            this.tests = [];
            this.todos = [];
            this.logs = [];
            this.name = "";
            this.pass = true;
            this.reason = "";
            this.time = 0;
            this.start = 0;
            this.end = 0;
        }
        return TestGroup;
    }());
    exports.TestGroup = TestGroup;
});
//# sourceMappingURL=TestGroup.js.map