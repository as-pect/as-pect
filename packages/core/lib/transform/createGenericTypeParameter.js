(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./assemblyscript"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var assemblyscript_1 = require("./assemblyscript");
    /**
     * This method makes a generic named parameter.
     *
     * @param {string} name - The name of the type.
     * @param {Range} range - The range given for the type parameter.
     */
    function createGenericTypeParameter(name, range) {
        return assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName(name, range), null, false, range);
    }
    exports.createGenericTypeParameter = createGenericTypeParameter;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlR2VuZXJpY1R5cGVQYXJhbWV0ZXIuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdHJhbnNmb3JtL2NyZWF0ZUdlbmVyaWNUeXBlUGFyYW1ldGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBQUEsbURBQW1EO0lBQ25EOzs7OztPQUtHO0lBQ0gsU0FBZ0IsMEJBQTBCLENBQUMsSUFBWSxFQUFFLEtBQVk7UUFDbkUsT0FBTyx5QkFBUSxDQUFDLGVBQWUsQ0FBQyx5QkFBUSxDQUFDLG9CQUFvQixDQUFDLElBQUksRUFBRSxLQUFLLENBQUMsRUFBRSxJQUFJLEVBQUUsS0FBSyxFQUFFLEtBQUssQ0FBQyxDQUFDO0lBQ2xHLENBQUM7SUFGRCxnRUFFQyJ9