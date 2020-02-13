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
                    }
                }
            }
        };
        return AspectTransform;
    }(transform_1.Transform));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdHJhbnNmb3JtL2luZGV4LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEsMERBQXlEO0lBQ3pELGlEQUFvRTtJQUNwRSx1RUFBc0U7SUFFdEU7UUFBdUMsbUNBQVM7UUFBdkM7O1FBd0JULENBQUM7UUF2QkM7Ozs7O1dBS0c7UUFDSCxvQ0FBVSxHQUFWLFVBQVcsTUFBYztZQUN2QiwwQkFBMEI7WUFDMUIsS0FBcUIsVUFBc0IsRUFBdEIsS0FBQSxNQUFNLENBQUMsT0FBTyxDQUFDLE9BQU8sRUFBdEIsY0FBc0IsRUFBdEIsSUFBc0IsRUFBRTtnQkFBeEMsSUFBTSxNQUFNLFNBQUE7Z0JBRWYsbUNBQW1DO2dCQUNuQyxLQUF3QixVQUFpQixFQUFqQixLQUFBLE1BQU0sQ0FBQyxVQUFVLEVBQWpCLGNBQWlCLEVBQWpCLElBQWlCLEVBQUU7b0JBQXRDLElBQU0sU0FBUyxTQUFBO29CQUVsQiw4QkFBOEI7b0JBQzlCLElBQUksU0FBUyxDQUFDLElBQUksS0FBSyx5QkFBUSxDQUFDLGdCQUFnQixFQUFFO3dCQUVoRCwwQ0FBMEM7d0JBQzFDLElBQU0sZ0JBQWdCLEdBQXFCLFNBQVMsQ0FBQzt3QkFDckQsZ0JBQWdCLENBQUMsT0FBTyxDQUFDLElBQUksQ0FBQyxtREFBd0IsQ0FBQyxnQkFBZ0IsQ0FBQyxDQUFDLENBQUM7cUJBQzNFO2lCQUNGO2FBQ0Y7UUFDSCxDQUFDO1FBQ0gsc0JBQUM7SUFBRCxDQUFDLEFBeEJRLENBQThCLHFCQUFTLEdBd0IvQyJ9