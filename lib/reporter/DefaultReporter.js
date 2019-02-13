"use strict";
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
var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var Reporter_1 = require("./Reporter");
var chalk_1 = __importDefault(require("chalk"));
var DefaultReporter = /** @class */ (function (_super) {
    __extends(DefaultReporter, _super);
    function DefaultReporter() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    DefaultReporter.prototype.onStart = function (suite) {
        console.log("");
        console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["[Log] Running: ", ""], ["[Log] Running: ", ""])), suite.filename));
        console.log("");
    };
    DefaultReporter.prototype.onGroupStart = function (group) {
        console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["[Describe]: ", ""], ["[Describe]: ", ""])), group.name));
        console.log("");
    };
    DefaultReporter.prototype.onGroupFinish = function (group) {
        var result = group.pass
            ? chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
        console.log("");
        console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["  [Result]: ", ""], ["  [Result]: ", ""])), result));
        console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["   [Tests]: ", " pass, ", " fail, ", " total"], ["   [Tests]: ", " pass, ", " fail, ", " total"])), group.success.toString(), group.fail.toString(), group.total.toString()));
        console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["    [Time]: ", "ms"], ["    [Time]: ", "ms"])), group.time.toString()));
    };
    DefaultReporter.prototype.onTestStart = function (_group, _test) { };
    DefaultReporter.prototype.onTestFinish = function (_group, test) {
        if (test.pass) {
            console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["  {green [Success] \u2714} ", ""], ["  {green [Success] \u2714} ", ""])), test.description));
        }
        else {
            console.log("");
            console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["     {red [Fail] \u2716} ", ""], ["     {red [Fail] \u2716} ", ""])), test.description));
            console.log("");
            console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["   [Actual]: {red ", "}"], ["   [Actual]: {red ", "}"])), test.actual));
            console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject([" [Expected]: {green ", "}"], [" [Expected]: {green ", "}"])), test.expected));
        }
    };
    DefaultReporter.prototype.onFinish = function (suite) {
        var result = suite.passed
            ? chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["{green \u2714 Pass} "], ["{green \u2714 Pass} "]))) : chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["{red \u2716 Fail}"], ["{red \u2716 Fail}"])));
        console.log("");
        console.log(chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["    [File]: ", ""], ["    [File]: ", ""])), suite.filename));
        console.log(chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["  [Result]: ", ""], ["  [Result]: ", ""])), result));
        console.log(chalk_1.default(templateObject_16 || (templateObject_16 = __makeTemplateObject([" [Summary]: ", " pass, ", " fail, ", " total"], [" [Summary]: ", " pass, ", " fail, ", " total"])), suite.success.toString(), suite.fail.toString(), suite.total.toString()));
        console.log(chalk_1.default(templateObject_17 || (templateObject_17 = __makeTemplateObject(["    [Time]: ", "ms"], ["    [Time]: ", "ms"])), suite.time.toString()));
        console.log("");
    };
    return DefaultReporter;
}(Reporter_1.Reporter));
exports.DefaultReporter = DefaultReporter;
var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17;
//# sourceMappingURL=DefaultReporter.js.map