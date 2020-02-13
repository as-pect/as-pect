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
        define(["require", "exports", "assemblyscript/cli/transform", "assemblyscript", "./createStrictEqualsMember"], factory);
    }
})(function (require, exports) {
    "use strict";
    var transform_1 = require("assemblyscript/cli/transform");
    var assemblyscript_1 = require("assemblyscript");
    var createStrictEqualsMember_1 = require("./createStrictEqualsMember");
    return /** @class */ (function (_super) {
        __extends(AspectTransform, _super);
        function AspectTransform() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        AspectTransform.prototype.afterParse = function (parser) {
            for (var _i = 0, _a = parser.program.sources; _i < _a.length; _i++) {
                var source = _a[_i];
                for (var _b = 0, _c = source.statements; _b < _c.length; _b++) {
                    var statement = _c[_b];
                    if (statement.kind === assemblyscript_1.NodeKind.CLASSDECLARATION) {
                        var classDeclaration = statement;
                        classDeclaration.members.push(createStrictEqualsMember_1.createStrictEqualsMember(classDeclaration));
                    }
                }
            }
        };
        return AspectTransform;
    }(transform_1.Transform));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdHJhbnNmb3JtL2luZGV4LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEsMERBQXlEO0lBQ3pELGlEQUFvRTtJQUNwRSx1RUFBc0U7SUFFdEU7UUFBdUMsbUNBQVM7UUFBdkM7O1FBV1QsQ0FBQztRQVZDLG9DQUFVLEdBQVYsVUFBVyxNQUFjO1lBQ3ZCLEtBQXFCLFVBQXNCLEVBQXRCLEtBQUEsTUFBTSxDQUFDLE9BQU8sQ0FBQyxPQUFPLEVBQXRCLGNBQXNCLEVBQXRCLElBQXNCLEVBQUU7Z0JBQXhDLElBQU0sTUFBTSxTQUFBO2dCQUNmLEtBQXdCLFVBQWlCLEVBQWpCLEtBQUEsTUFBTSxDQUFDLFVBQVUsRUFBakIsY0FBaUIsRUFBakIsSUFBaUIsRUFBRTtvQkFBdEMsSUFBTSxTQUFTLFNBQUE7b0JBQ2xCLElBQUksU0FBUyxDQUFDLElBQUksS0FBSyx5QkFBUSxDQUFDLGdCQUFnQixFQUFFO3dCQUNoRCxJQUFNLGdCQUFnQixHQUFxQixTQUFTLENBQUM7d0JBQ3JELGdCQUFnQixDQUFDLE9BQU8sQ0FBQyxJQUFJLENBQUMsbURBQXdCLENBQUMsZ0JBQWdCLENBQUMsQ0FBQyxDQUFDO3FCQUMzRTtpQkFDRjthQUNGO1FBQ0gsQ0FBQztRQUNILHNCQUFDO0lBQUQsQ0FBQyxBQVhRLENBQThCLHFCQUFTLEdBVy9DIn0=