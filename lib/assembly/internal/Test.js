"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var Describe_1 = require("./Describe");
var noOp_1 = require("./noOp");
var Test = /** @class */ (function () {
    function Test(description, runner) {
        if (description === void 0) { description = ""; }
        if (runner === void 0) { runner = noOp_1.noOp; }
        this.description = "";
        this.runner = noOp_1.noOp;
        this.description = description;
        this.runner = runner;
    }
    return Test;
}());
exports.Test = Test;
function it(description, runner) {
    return test(description, runner);
}
exports.it = it;
function test(description, runner) {
    if (Describe_1.closure.tests == null)
        throw new Error("Cannot add test when there is no description to add to.");
    Describe_1.closure.tests.push(new Test(description, runner));
}
exports.test = test;
