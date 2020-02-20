(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./stringifyHostValue"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var stringifyHostValue_1 = require("./stringifyHostValue");
    /**
     * A JavaScript object that represents a reflected value from the as-pect testing
     * module.
     */
    var HostValue = /** @class */ (function () {
        function HostValue() {
            /** An indicator if the reflected object was managed by the runtime. */
            this.isManaged = false;
            /** An indicator if the reflected object was null. */
            this.isNull = false;
            /** A set of keys for Maps or Classes in the reflected object. */
            this.keys = null;
            /** Used to indicate if an expected assertion value was negated. */
            this.negated = false;
            /** An indicator wether the reflected object was in a nullable context. */
            this.nullable = false;
            /** The size of the heap allocation for a given class. */
            this.offset = 0;
            /** The pointer to the value in the module. */
            this.pointer = 0;
            /** An indicator if a number was signed. */
            this.signed = false;
            /** The size of an array, or the byte size of a number. */
            this.size = 0;
            /** A stack trace for the given value. */
            this.stack = "";
            /** The host value type. */
            this.type = 0 /* None */;
            /** The runtime class id for the reflected host value. */
            this.typeId = 0;
            /** The name of the class for a given reflected host value. */
            this.typeName = null;
            /** A string or number representing the host value. */
            this.value = 0;
            /** A set of values that are contained in a given reflected Set, Map, or Class object. */
            this.values = null;
        }
        /**
         * Stringify the HostValue with custom formatting.
         *
         * @param {Partial<StringifyHostValueProps>} props - The stringify configuration
         */
        HostValue.prototype.stringify = function (props) {
            if (props === void 0) { props = {}; }
            return stringifyHostValue_1.stringifyHostValue(this, props);
        };
        return HostValue;
    }());
    exports.HostValue = HostValue;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiSG9zdFZhbHVlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3V0aWwvSG9zdFZhbHVlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBQ0EsMkRBRzhCO0lBRTlCOzs7T0FHRztJQUNIO1FBQUE7WUFDRSx1RUFBdUU7WUFDdkUsY0FBUyxHQUFZLEtBQUssQ0FBQztZQUMzQixxREFBcUQ7WUFDckQsV0FBTSxHQUFZLEtBQUssQ0FBQztZQUN4QixpRUFBaUU7WUFDakUsU0FBSSxHQUF1QixJQUFJLENBQUM7WUFDaEMsbUVBQW1FO1lBQ25FLFlBQU8sR0FBWSxLQUFLLENBQUM7WUFDekIsMEVBQTBFO1lBQzFFLGFBQVEsR0FBWSxLQUFLLENBQUM7WUFDMUIseURBQXlEO1lBQ3pELFdBQU0sR0FBVyxDQUFDLENBQUM7WUFDbkIsOENBQThDO1lBQzlDLFlBQU8sR0FBVyxDQUFDLENBQUM7WUFDcEIsMkNBQTJDO1lBQzNDLFdBQU0sR0FBWSxLQUFLLENBQUM7WUFDeEIsMERBQTBEO1lBQzFELFNBQUksR0FBVyxDQUFDLENBQUM7WUFDakIseUNBQXlDO1lBQ3pDLFVBQUssR0FBVyxFQUFFLENBQUM7WUFDbkIsMkJBQTJCO1lBQzNCLFNBQUksZ0JBQXFDO1lBQ3pDLHlEQUF5RDtZQUN6RCxXQUFNLEdBQVcsQ0FBQyxDQUFDO1lBQ25CLDhEQUE4RDtZQUM5RCxhQUFRLEdBQWtCLElBQUksQ0FBQztZQUMvQixzREFBc0Q7WUFDdEQsVUFBSyxHQUFvQixDQUFDLENBQUM7WUFDM0IseUZBQXlGO1lBQ3pGLFdBQU0sR0FBdUIsSUFBSSxDQUFDO1FBVXBDLENBQUM7UUFSQzs7OztXQUlHO1FBQ0gsNkJBQVMsR0FBVCxVQUFVLEtBQTRDO1lBQTVDLHNCQUFBLEVBQUEsVUFBNEM7WUFDcEQsT0FBTyx1Q0FBa0IsQ0FBQyxJQUFJLEVBQUUsS0FBSyxDQUFDLENBQUM7UUFDekMsQ0FBQztRQUNILGdCQUFDO0lBQUQsQ0FBQyxBQXhDRCxJQXdDQztJQXhDWSw4QkFBUyJ9