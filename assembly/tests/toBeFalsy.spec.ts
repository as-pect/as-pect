import { Vec3 } from "./setup/Vec3";

var vec: Vec3 = new Vec3(1, 2, 3);

describe("toBeFalsy", (): void => {
  it("should assert falsy value types", (): void => {
    expect<i32>(0).toBeFalsy("zero value types should be falsy");
  });

  it("should assert false is falsy", (): void => {
    expect<bool>(false).toBeFalsy("false should be falsy");
  });

  it("should assert a null reftype is falsy", (): void => {
    expect<Vec3>(null).toBeFalsy("null reftypes should be falsy.");
  });

  it("should assert empty strings are falsy", (): void => {
    expect<string>("").toBeFalsy();
  });

  it("should assert non-zero value types are truthy", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).toBeFalsy();
    }).toThrow();
  });

  it("should assert true is truthy", (): void => {
    expect<() => void>((): void => {
      expect<bool>(true).toBeFalsy();
    }).toThrow();
  });

  it("should assert a reftype is truthy", (): void => {
    expect<() => void>((): void => {
      expect<Vec3>(vec).toBeFalsy();
    }).toThrow();
  });

  it("should assert strings of length 1 or greater not to be truthy", (): void => {
    expect<() => void>((): void => {
      expect<string>("test!").toBeFalsy();
    }).toThrow("strings of length 1 or greater should throw");
  });

  it("should assert negated value types of non-zero to be truthy", (): void => {
    expect<i32>(1).not.toBeFalsy("1 should not be falsy");
  });

  it("should assert negated value types of 0 to be falsy", (): void => {
    expect<() => void>((): void => {
      expect<i32>(0).not.toBeFalsy();
    }).toThrow("0 is falsy, this should throw");
  });

  it("should assert negated value types of true not to be falsy", (): void => {
    expect<bool>(true).not.toBeFalsy("true should not be falsy");
  });

  it("should assert false is falsy", (): void => {
    expect<() => void>((): void => {
      expect<bool>(false).not.toBeFalsy();
    }).toThrow();
  });

  it("should assert negated reftypes of reftypes not to be falsy", (): void => {
    expect<Vec3>(vec).not.toBeFalsy();
  });

  it("should assert negated reftypes of null values to be falsy", (): void => {
    expect<() => void>((): void => {
      expect<Vec3>(null).not.toBeFalsy();
    }).toThrow();
  });

  it("should assert negated strings of length 1 or greater not to be falsy", (): void => {
    expect<string>("test!").not.toBeFalsy();
  });

  it("should assert negated strings of length 0 to be falsy", (): void => {
    expect<() => void>((): void => {
      expect<string>("").not.toBeFalsy();
    }).toThrow();
  });
});