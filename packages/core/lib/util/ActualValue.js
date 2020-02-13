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
        define(["require", "exports", "./LogValue"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var LogValue_1 = require("./LogValue");
    /**
     * A class representing a reported expected or actual value. It shares a lot of properties with
     * LogValue, so those are copied over.
     */
    var ActualValue = /** @class */ (function (_super) {
        __extends(ActualValue, _super);
        function ActualValue() {
            var _this = _super !== null && _super.apply(this, arguments) || this;
            /**
             * An indicator if the actual expected value is negated.
             */
            _this.negated = false;
            return _this;
        }
        return ActualValue;
    }(LogValue_1.LogValue));
    exports.ActualValue = ActualValue;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiQWN0dWFsVmFsdWUuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdXRpbC9BY3R1YWxWYWx1ZS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFBQSx1Q0FBc0M7SUFFdEM7OztPQUdHO0lBQ0g7UUFBaUMsK0JBQVE7UUFBekM7WUFBQSxxRUFLQztZQUpDOztlQUVHO1lBQ0ksYUFBTyxHQUFZLEtBQUssQ0FBQzs7UUFDbEMsQ0FBQztRQUFELGtCQUFDO0lBQUQsQ0FBQyxBQUxELENBQWlDLG1CQUFRLEdBS3hDO0lBTFksa0NBQVcifQ==