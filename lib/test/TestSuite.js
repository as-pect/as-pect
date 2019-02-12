"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var TestSuite = /** @class */ (function () {
    function TestSuite() {
        this.describe = "";
        this.beforeAll = -1;
        this.beforeEach = -1;
        this.tests = [];
        this.testNames = [];
        this.afterEach = -1;
        this.afterAll = -1;
        this.todos = [];
    }
    return TestSuite;
}());
exports.TestSuite = TestSuite;
