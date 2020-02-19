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
    var HostValue = /** @class */ (function () {
        function HostValue() {
            this.type = 0 /* None */;
            this.typeName = null;
            this.pointer = 0;
            this.typeId = 0;
            this.keys = null;
            this.values = null;
            this.offset = 0;
            this.value = 0;
            this.isNull = false;
            this.nullable = false;
            this.size = 0;
            this.signed = false;
            this.stack = "";
            this.negated = false;
            this.isManaged = false;
        }
        return HostValue;
    }());
    exports.HostValue = HostValue;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiSG9zdFZhbHVlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3V0aWwvSG9zdFZhbHVlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBRUE7UUFBQTtZQUNFLFNBQUksZ0JBQXFDO1lBQ3pDLGFBQVEsR0FBa0IsSUFBSSxDQUFDO1lBQy9CLFlBQU8sR0FBVyxDQUFDLENBQUM7WUFDcEIsV0FBTSxHQUFXLENBQUMsQ0FBQztZQUNuQixTQUFJLEdBQXVCLElBQUksQ0FBQztZQUNoQyxXQUFNLEdBQXVCLElBQUksQ0FBQztZQUNsQyxXQUFNLEdBQVcsQ0FBQyxDQUFDO1lBQ25CLFVBQUssR0FBb0IsQ0FBQyxDQUFDO1lBQzNCLFdBQU0sR0FBWSxLQUFLLENBQUM7WUFDeEIsYUFBUSxHQUFZLEtBQUssQ0FBQztZQUMxQixTQUFJLEdBQVcsQ0FBQyxDQUFDO1lBQ2pCLFdBQU0sR0FBWSxLQUFLLENBQUM7WUFDeEIsVUFBSyxHQUFXLEVBQUUsQ0FBQztZQUNuQixZQUFPLEdBQVksS0FBSyxDQUFDO1lBQ3pCLGNBQVMsR0FBWSxLQUFLLENBQUM7UUFDN0IsQ0FBQztRQUFELGdCQUFDO0lBQUQsQ0FBQyxBQWhCRCxJQWdCQztJQWhCWSw4QkFBUyJ9