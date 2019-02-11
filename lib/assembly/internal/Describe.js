"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var noOp_1 = require("./noOp");
var DescribeClosure = /** @class */ (function () {
    function DescribeClosure() {
        this.tests = null;
    }
    return DescribeClosure;
}());
exports.DescribeClosure = DescribeClosure;
exports.closure = new DescribeClosure();
function describe(name, tests) {
    if (name === void 0) { name = ""; }
    if (tests === void 0) { tests = noOp_1.noOp; }
    exports.closure.tests = [];
    tests();
}
exports.describe = describe;
