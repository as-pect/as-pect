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
     * This class is a test runner helper class that contains a set of useful properties
     * to help reduce run function size.
     */
    var RunContext = /** @class */ (function () {
        function RunContext(wasm, reporter) {
            this.wasm = wasm;
            this.reporter = reporter;
            this.start = 0;
            this.end = 0;
            this.groupstart = 0;
            this.groupend = 0;
            this.teststart = 0;
            this.testend = 0;
            this.passed = true;
            this.endGroup = false;
        }
        return RunContext;
    }());
    exports.RunContext = RunContext;
});
//# sourceMappingURL=RunContext.js.map