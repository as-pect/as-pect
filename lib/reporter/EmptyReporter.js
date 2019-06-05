var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../test/TestReporter"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestReporter_1 = require("../test/TestReporter");
    /**
     * This class can be used as a blank reporter to interface with the `TestContext` in the browser.
     * It will not report any information about the tests.
     */
    var EmptyReporter = /** @class */ (function (_super) {
        __extends(EmptyReporter, _super);
        function EmptyReporter() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        EmptyReporter.prototype.onFinish = function () { };
        EmptyReporter.prototype.onGroupFinish = function () { };
        EmptyReporter.prototype.onGroupStart = function () { };
        EmptyReporter.prototype.onStart = function () { };
        EmptyReporter.prototype.onTestFinish = function () { };
        EmptyReporter.prototype.onTestStart = function () { };
        EmptyReporter.prototype.onTodo = function () { };
        return EmptyReporter;
    }(TestReporter_1.TestReporter));
    exports.EmptyReporter = EmptyReporter;
});
//# sourceMappingURL=EmptyReporter.js.map