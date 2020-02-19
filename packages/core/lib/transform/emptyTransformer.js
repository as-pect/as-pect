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
        define(["require", "exports", "./assemblyscript"], factory);
    }
})(function (require, exports) {
    "use strict";
    var assemblyscript_1 = require("./assemblyscript");
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
        AspectTransform.prototype.afterParse = function (_) {
        };
        return AspectTransform;
    }(assemblyscript_1.Transform));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZW1wdHlUcmFuc2Zvcm1lci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy90cmFuc2Zvcm0vZW1wdHlUcmFuc2Zvcm1lci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUFBLG1EQUFtRDtJQUVuRDtRQUF1QyxtQ0FBUztRQUF2Qzs7UUFTVCxDQUFDO1FBUkM7Ozs7O1dBS0c7UUFDSCxvQ0FBVSxHQUFWLFVBQVcsQ0FBUztRQUNwQixDQUFDO1FBQ0gsc0JBQUM7SUFBRCxDQUFDLEFBVFEsQ0FBOEIsMEJBQVMsR0FTL0MifQ==