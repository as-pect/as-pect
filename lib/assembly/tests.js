"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
require("allocator/arena");
var index_1 = require("./index");
var Vec3 = /** @class */ (function () {
    function Vec3(x, y, z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
    return Vec3;
}());
index_1.describe("expect", function () {
    index_1.it("should create an expectation with a value", function () {
        var result = index_1.expect(1);
        assert(result.value == 1, "The expect function does not report values correctly.");
    });
    index_1.it("should report reftypes correctly", function () {
        var result = index_1.expect(new Vec3(1, 2, 3));
        assert(result.isRefType, "The expect function does not report reftypes correctly.");
        var result2 = index_1.expect(0);
        assert(!result2.isRefType, "The expect function does not report value types correctly.");
    });
    index_1.it("should negate the _not property", function () {
        var result = index_1.expect(1).not;
        assert(result._not);
    });
    index_1.it("should correctly assert toBe assertions", function () {
        index_1.expect(1).toBe(1);
        var vec = new Vec3(1, 2, 3);
        index_1.expect(vec).toBe(vec);
        index_1.expect(null).toBe(null);
    });
    index_1.it("should correctly assert negated toBe assertions", function () {
        index_1.expect(1).not.toBe(2);
        var vec = new Vec3(1, 2, 3);
        index_1.expect(vec).not.toBe(new Vec3(1, 2, 3));
    });
    index_1.it("should correctly assert toStrictEqual assertions", function () {
        index_1.expect(3).toStrictEqual(3);
        index_1.expect(new Vec3(1, 2, 3)).toStrictEqual(new Vec3(1, 2, 3));
        index_1.expect(null).toStrictEqual(null);
    });
    index_1.it("should correctly assert negated toStrictEqual assertions", function () {
        index_1.expect(3).not.toStrictEqual(4);
        index_1.expect(null).not.toStrictEqual(new Vec3(1, 2, 3));
        index_1.expect(new Vec3(4, 5, 6)).not.toStrictEqual(new Vec3(1, 2, 3));
    });
    index_1.it("should correctly assert truthy values", function () {
        index_1.expect(1).toBeTruthy();
        index_1.expect(true).toBeTruthy();
        index_1.expect(new Vec3(1, 2, 3)).toBeTruthy();
        index_1.expect("Test!").toBeTruthy();
    });
    index_1.it("should correctly assert negated truthy values", function () {
        index_1.expect(0).not.toBeTruthy();
        index_1.expect(false).not.toBeTruthy();
        index_1.expect(null).not.toBeTruthy();
        index_1.expect("").not.toBeTruthy();
    });
    index_1.it("should correctly assert negated falsy values", function () {
        index_1.expect(1).not.toBeFalsy();
        index_1.expect(true).not.toBeFalsy();
        index_1.expect(new Vec3(1, 2, 3)).not.toBeFalsy();
        index_1.expect("Test!").not.toBeFalsy();
    });
    index_1.it("should correctly assert falsy values", function () {
        index_1.expect(0).toBeFalsy();
        index_1.expect(false).toBeFalsy();
        index_1.expect(null).toBeFalsy();
        index_1.expect("").toBeFalsy();
    });
    index_1.it("should correctly detect unreachable()", function () {
        index_1.expect(function () { unreachable(); }).toThrow();
    });
    index_1.it("should correctly detect function completion", function () {
        index_1.expect(function () { }).not.toThrow();
    });
    index_1.it("should detect greater than values", function () {
        index_1.expect(1).toBeGreaterThan(0);
    });
    index_1.it("should detect negated greater than values", function () {
        index_1.expect(1).not.toBeGreaterThan(2);
    });
    index_1.it("should detect greater than or equal to values", function () {
        index_1.expect(1).toBeGreaterThanOrEqualTo(1);
        index_1.expect(1).toBeGreaterThanOrEqualTo(0);
    });
    index_1.it("should detect greater than or equal to values", function () {
        index_1.expect(1).not.toBeGreaterThanOrEqualTo(2);
    });
    index_1.it("should detect less than values", function () {
        index_1.expect(0).toBeLessThan(1);
    });
    index_1.it("should detect negated less than values", function () {
        index_1.expect(2).not.toBeLessThan(1);
    });
    index_1.it("should detect less than or equal to values", function () {
        index_1.expect(1).toBeLessThanOrEqualTo(1);
        index_1.expect(1).toBeLessThanOrEqualTo(2);
    });
    index_1.it("should detect greater than or equal to values", function () {
        index_1.expect(1).not.toBeLessThanOrEqualTo(0);
    });
    index_1.it("should detect nulls", function () {
        index_1.expect(null).toBeNull();
        index_1.expect(0).not.toBeNull();
        index_1.expect(new Vec3(1, 2, 3)).not.toBeNull();
    });
});
