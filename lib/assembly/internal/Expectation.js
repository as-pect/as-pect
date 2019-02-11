"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var Expectation = /** @class */ (function () {
    function Expectation(value) {
        this._not = false;
        this.isRefType = isReference();
        this.value = value;
    }
    Object.defineProperty(Expectation.prototype, "not", {
        get: function () {
            this._not = true;
            return this;
        },
        enumerable: true,
        configurable: true
    });
    Expectation.prototype.toBe = function (value, message) {
        if (message === void 0) { message = ""; }
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        assert(this._not ^ (value == this.value), message);
    };
    Expectation.prototype.toStrictEqual = function (value, message) {
        if (message === void 0) { message = ""; }
        // fast path, the value is itself
        if (value == this.value)
            return;
        // fast path, both values aren't null together, so if any of them are null, they do not equal
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        if (this.isRefType && (value == null || this.value == null))
            assert(this._not ^ false, message);
        // slow path, assert a memcompare
        var compareResult = memory.compare(changetype(value), changetype(this.value), sizeof());
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        if (this.isRefType)
            assert(this._not ^ compareResult, message);
        else
            this.toBe(value);
    };
    Expectation.prototype.toBeTruthy = function (message) {
        if (message === void 0) { message = ""; }
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        assert(this._not ^ (!!this.value), message);
    };
    Expectation.prototype.toBeFalsy = function (message) {
        if (message === void 0) { message = ""; }
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        assert(this._not ^ (!this.value), message);
    };
    Expectation.prototype.toThrow = function (message) {
        if (message === void 0) { message = ""; }
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        assert(this._not ^ (!tryCall(value)), message);
    };
    Expectation.prototype.toBeGreaterThan = function (value, message) {
        if (message === void 0) { message = ""; }
        if (this.isRefType && (value == null || this.value == null))
            assert(false, message);
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        assert(this._not ^ (this.value > value), message);
    };
    Expectation.prototype.toBeGreaterThanOrEqualTo = function (value, message) {
        if (message === void 0) { message = ""; }
        if (this.isRefType && (value == null || this.value == null))
            assert(false, message);
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        assert(this._not ^ (this.value <= value), message);
    };
    Expectation.prototype.toBeLessThan = function (value, message) {
        if (message === void 0) { message = ""; }
        if (this.isRefType && (value == null || this.value == null))
            assert(false, message);
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        assert(this._not ^ (this.value < value), message);
    };
    Expectation.prototype.toBeLessThanOrEqualTo = function (value, message) {
        if (message === void 0) { message = ""; }
        if (this.isRefType && (value == null || this.value == null))
            assert(false, message);
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        assert(this._not ^ (this.value <= value), message);
    };
    Expectation.prototype.toBeNull = function (message) {
        if (message === void 0) { message = ""; }
        // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
        assert(this.isRefType && (this._not ^ (this.value == null)), message);
    };
    return Expectation;
}());
exports.Expectation = Expectation;
function expect(value) {
    return new Expectation(value);
}
exports.expect = expect;
