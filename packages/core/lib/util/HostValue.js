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
    var HostValue = /** @class */ (function () {
        function HostValue() {
            this.isManaged = false;
            this.isNull = false;
            this.keys = null;
            this.negated = false;
            this.nullable = false;
            this.offset = 0;
            this.pointer = 0;
            this.signed = false;
            this.size = 0;
            this.stack = "";
            this.type = 0 /* None */;
            this.typeId = 0;
            this.typeName = null;
            this.value = 0;
            this.values = null;
        }
        HostValue.prototype.stringify = function (props) {
            return stringifyHostValue_1.stringifyHostValue(this, props);
        };
        return HostValue;
    }());
    exports.HostValue = HostValue;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiSG9zdFZhbHVlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3V0aWwvSG9zdFZhbHVlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBQ0EsMkRBQW1GO0lBRW5GO1FBQUE7WUFDRSxjQUFTLEdBQVksS0FBSyxDQUFDO1lBQzNCLFdBQU0sR0FBWSxLQUFLLENBQUM7WUFDeEIsU0FBSSxHQUF1QixJQUFJLENBQUM7WUFDaEMsWUFBTyxHQUFZLEtBQUssQ0FBQztZQUN6QixhQUFRLEdBQVksS0FBSyxDQUFDO1lBQzFCLFdBQU0sR0FBVyxDQUFDLENBQUM7WUFDbkIsWUFBTyxHQUFXLENBQUMsQ0FBQztZQUNwQixXQUFNLEdBQVksS0FBSyxDQUFDO1lBQ3hCLFNBQUksR0FBVyxDQUFDLENBQUM7WUFDakIsVUFBSyxHQUFXLEVBQUUsQ0FBQztZQUNuQixTQUFJLGdCQUFxQztZQUN6QyxXQUFNLEdBQVcsQ0FBQyxDQUFDO1lBQ25CLGFBQVEsR0FBa0IsSUFBSSxDQUFDO1lBQy9CLFVBQUssR0FBb0IsQ0FBQyxDQUFDO1lBQzNCLFdBQU0sR0FBdUIsSUFBSSxDQUFDO1FBS3BDLENBQUM7UUFIQyw2QkFBUyxHQUFULFVBQVUsS0FBdUM7WUFDL0MsT0FBTyx1Q0FBa0IsQ0FBQyxJQUFJLEVBQUUsS0FBSyxDQUFDLENBQUM7UUFDekMsQ0FBQztRQUNILGdCQUFDO0lBQUQsQ0FBQyxBQXBCRCxJQW9CQztJQXBCWSw4QkFBUyJ9