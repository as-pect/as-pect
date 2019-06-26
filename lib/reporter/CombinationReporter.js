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
     * This reporter is used to combine a set of reporters into a single reporter object. It uses
     * forEach() to call each reporter's function when each method is called.
     */
    var CombinationReporter = /** @class */ (function (_super) {
        __extends(CombinationReporter, _super);
        function CombinationReporter(reporters) {
            var _this = _super.call(this) || this;
            _this.reporters = reporters;
            return _this;
        }
        CombinationReporter.prototype.onFinish = function (suite) {
            this.reporters.forEach(function (e) { return e.onFinish(suite); });
        };
        CombinationReporter.prototype.onGroupFinish = function (group) {
            this.reporters.forEach(function (e) { return e.onGroupFinish(group); });
        };
        CombinationReporter.prototype.onGroupStart = function (group) {
            this.reporters.forEach(function (e) { return e.onGroupStart(group); });
        };
        CombinationReporter.prototype.onStart = function (suite) {
            this.reporters.forEach(function (e) { return e.onStart(suite); });
        };
        CombinationReporter.prototype.onTestStart = function (group, result) {
            this.reporters.forEach(function (e) { return e.onTestStart(group, result); });
        };
        CombinationReporter.prototype.onTestFinish = function (group, result) {
            this.reporters.forEach(function (e) { return e.onTestFinish(group, result); });
        };
        CombinationReporter.prototype.onTodo = function (group, todo) {
            this.reporters.forEach(function (e) { return e.onTodo(group, todo); });
        };
        return CombinationReporter;
    }(TestReporter_1.TestReporter));
    exports.default = CombinationReporter;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiQ29tYmluYXRpb25SZXBvcnRlci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9yZXBvcnRlci9Db21iaW5hdGlvblJlcG9ydGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUFBLHFEQUFvRDtJQUtwRDs7O09BR0c7SUFDSDtRQUFpRCx1Q0FBWTtRQUMzRCw2QkFDUyxTQUF5QjtZQURsQyxZQUdFLGlCQUFPLFNBQ1I7WUFIUSxlQUFTLEdBQVQsU0FBUyxDQUFnQjs7UUFHbEMsQ0FBQztRQUVELHNDQUFRLEdBQVIsVUFBUyxLQUFrQjtZQUN6QixJQUFJLENBQUMsU0FBUyxDQUFDLE9BQU8sQ0FBQyxVQUFBLENBQUMsSUFBSSxPQUFBLENBQUMsQ0FBQyxRQUFRLENBQUMsS0FBSyxDQUFDLEVBQWpCLENBQWlCLENBQUMsQ0FBQztRQUNqRCxDQUFDO1FBRUQsMkNBQWEsR0FBYixVQUFjLEtBQWdCO1lBQzVCLElBQUksQ0FBQyxTQUFTLENBQUMsT0FBTyxDQUFDLFVBQUEsQ0FBQyxJQUFJLE9BQUEsQ0FBQyxDQUFDLGFBQWEsQ0FBQyxLQUFLLENBQUMsRUFBdEIsQ0FBc0IsQ0FBQyxDQUFDO1FBQ3RELENBQUM7UUFFRCwwQ0FBWSxHQUFaLFVBQWEsS0FBZ0I7WUFDM0IsSUFBSSxDQUFDLFNBQVMsQ0FBQyxPQUFPLENBQUMsVUFBQSxDQUFDLElBQUksT0FBQSxDQUFDLENBQUMsWUFBWSxDQUFDLEtBQUssQ0FBQyxFQUFyQixDQUFxQixDQUFDLENBQUM7UUFDckQsQ0FBQztRQUVELHFDQUFPLEdBQVAsVUFBUSxLQUFrQjtZQUN4QixJQUFJLENBQUMsU0FBUyxDQUFDLE9BQU8sQ0FBQyxVQUFBLENBQUMsSUFBSSxPQUFBLENBQUMsQ0FBQyxPQUFPLENBQUMsS0FBSyxDQUFDLEVBQWhCLENBQWdCLENBQUMsQ0FBQztRQUNoRCxDQUFDO1FBRUQseUNBQVcsR0FBWCxVQUFZLEtBQWdCLEVBQUUsTUFBa0I7WUFDOUMsSUFBSSxDQUFDLFNBQVMsQ0FBQyxPQUFPLENBQUMsVUFBQSxDQUFDLElBQUksT0FBQSxDQUFDLENBQUMsV0FBVyxDQUFDLEtBQUssRUFBRSxNQUFNLENBQUMsRUFBNUIsQ0FBNEIsQ0FBQyxDQUFDO1FBQzVELENBQUM7UUFFRCwwQ0FBWSxHQUFaLFVBQWEsS0FBZ0IsRUFBRSxNQUFrQjtZQUMvQyxJQUFJLENBQUMsU0FBUyxDQUFDLE9BQU8sQ0FBQyxVQUFBLENBQUMsSUFBSSxPQUFBLENBQUMsQ0FBQyxZQUFZLENBQUMsS0FBSyxFQUFFLE1BQU0sQ0FBQyxFQUE3QixDQUE2QixDQUFDLENBQUM7UUFDN0QsQ0FBQztRQUVELG9DQUFNLEdBQU4sVUFBTyxLQUFnQixFQUFFLElBQVk7WUFDbkMsSUFBSSxDQUFDLFNBQVMsQ0FBQyxPQUFPLENBQUMsVUFBQSxDQUFDLElBQUksT0FBQSxDQUFDLENBQUMsTUFBTSxDQUFDLEtBQUssRUFBRSxJQUFJLENBQUMsRUFBckIsQ0FBcUIsQ0FBQyxDQUFDO1FBQ3JELENBQUM7UUFDSCwwQkFBQztJQUFELENBQUMsQUFsQ0QsQ0FBaUQsMkJBQVksR0FrQzVEIn0=