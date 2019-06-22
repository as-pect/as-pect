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
     * This class can be used as a stub reporter to interface with the `TestContext` in the browser.
     * It will not report any information about the tests.
     */
    var EmptyReporter = /** @class */ (function (_super) {
        __extends(EmptyReporter, _super);
        function EmptyReporter(_options) {
            return _super.call(this) || this;
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiRW1wdHlSZXBvcnRlci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9yZXBvcnRlci9FbXB0eVJlcG9ydGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUFBLHFEQUFvRDtJQUVwRDs7O09BR0c7SUFDSDtRQUFtQyxpQ0FBWTtRQUM3Qyx1QkFBWSxRQUFjO21CQUFJLGlCQUFPO1FBQUUsQ0FBQztRQUN4QyxnQ0FBUSxHQUFSLGNBQWtCLENBQUM7UUFDbkIscUNBQWEsR0FBYixjQUF1QixDQUFDO1FBQ3hCLG9DQUFZLEdBQVosY0FBc0IsQ0FBQztRQUN2QiwrQkFBTyxHQUFQLGNBQWlCLENBQUM7UUFDbEIsb0NBQVksR0FBWixjQUFzQixDQUFDO1FBQ3ZCLG1DQUFXLEdBQVgsY0FBcUIsQ0FBQztRQUN0Qiw4QkFBTSxHQUFOLGNBQWdCLENBQUM7UUFDbkIsb0JBQUM7SUFBRCxDQUFDLEFBVEQsQ0FBbUMsMkJBQVksR0FTOUM7SUFUWSxzQ0FBYSJ9