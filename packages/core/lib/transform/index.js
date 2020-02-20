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
        define(["require", "exports", "./assemblyscript", "./createStrictEqualsMember", "./createAddReflectedValueKeyValuePairsMember"], factory);
    }
})(function (require, exports) {
    "use strict";
    // import { Transform } from "assemblyscript/cli/transform";
    var assemblyscript_1 = require("./assemblyscript");
    var createStrictEqualsMember_1 = require("./createStrictEqualsMember");
    var createAddReflectedValueKeyValuePairsMember_1 = require("./createAddReflectedValueKeyValuePairsMember");
    return /** @class */ (function (_super) {
        __extends(AspectTransform, _super);
        function AspectTransform() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        /**
         * This method results in a pure AST transform that inserts a strictEquals member
         * into each ClassDeclaration.
         *
         * @param {Parser} parser - The AssemblyScript parser.
         */
        AspectTransform.prototype.afterParse = function (parser) {
            // for each program source
            for (var _i = 0, _a = parser.program.sources; _i < _a.length; _i++) {
                var source = _a[_i];
                // for each statement in the source
                for (var _b = 0, _c = source.statements; _b < _c.length; _b++) {
                    var statement = _c[_b];
                    // find each class declaration
                    if (statement.kind === assemblyscript_1.NodeKind.CLASSDECLARATION) {
                        // cast and create a strictEquals function
                        var classDeclaration = statement;
                        classDeclaration.members.push(createStrictEqualsMember_1.createStrictEqualsMember(classDeclaration));
                        classDeclaration.members.push(createAddReflectedValueKeyValuePairsMember_1.createAddReflectedValueKeyValuePairsMember(classDeclaration));
                    }
                }
            }
        };
        return AspectTransform;
    }(assemblyscript_1.Transform));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdHJhbnNmb3JtL2luZGV4LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEsNERBQTREO0lBQzVELG1EQUswQjtJQUMxQix1RUFBc0U7SUFDdEUsMkdBQTBHO0lBQzFHO1FBQXVDLG1DQUFTO1FBQXZDOztRQTBCVCxDQUFDO1FBekJDOzs7OztXQUtHO1FBQ0gsb0NBQVUsR0FBVixVQUFXLE1BQWM7WUFDdkIsMEJBQTBCO1lBQzFCLEtBQXFCLFVBQXNCLEVBQXRCLEtBQUEsTUFBTSxDQUFDLE9BQU8sQ0FBQyxPQUFPLEVBQXRCLGNBQXNCLEVBQXRCLElBQXNCLEVBQUU7Z0JBQXhDLElBQU0sTUFBTSxTQUFBO2dCQUNmLG1DQUFtQztnQkFDbkMsS0FBd0IsVUFBaUIsRUFBakIsS0FBQSxNQUFNLENBQUMsVUFBVSxFQUFqQixjQUFpQixFQUFqQixJQUFpQixFQUFFO29CQUF0QyxJQUFNLFNBQVMsU0FBQTtvQkFDbEIsOEJBQThCO29CQUM5QixJQUFJLFNBQVMsQ0FBQyxJQUFJLEtBQUsseUJBQVEsQ0FBQyxnQkFBZ0IsRUFBRTt3QkFDaEQsMENBQTBDO3dCQUMxQyxJQUFNLGdCQUFnQixHQUFxQixTQUFTLENBQUM7d0JBQ3JELGdCQUFnQixDQUFDLE9BQU8sQ0FBQyxJQUFJLENBQzNCLG1EQUF3QixDQUFDLGdCQUFnQixDQUFDLENBQzNDLENBQUM7d0JBQ0YsZ0JBQWdCLENBQUMsT0FBTyxDQUFDLElBQUksQ0FDM0IsdUZBQTBDLENBQUMsZ0JBQWdCLENBQUMsQ0FDN0QsQ0FBQztxQkFDSDtpQkFDRjthQUNGO1FBQ0gsQ0FBQztRQUNILHNCQUFDO0lBQUQsQ0FBQyxBQTFCUSxDQUE4QiwwQkFBUyxHQTBCOUMifQ==