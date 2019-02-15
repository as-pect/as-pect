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
    var LogValue = /** @class */ (function () {
        function LogValue() {
            this.pointer = 0;
            this.offset = 0;
            this.bytes = [];
            this.message = "";
            this.stack = "";
            this.test = null;
            this.group = null;
        }
        return LogValue;
    }());
    exports.LogValue = LogValue;
});
//# sourceMappingURL=LogValue.js.map