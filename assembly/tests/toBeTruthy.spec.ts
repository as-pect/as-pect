import { Vec3 } from "./setup/Vec3";

var vec: Vec3 = new Vec3(1, 2, 3);

describe("toBeTruthy", (): void => {
  it("should assert truthy value types", (): void => {
    expect<i32>(1).toBeTruthy("nonzero value types should be truthy");
  });

  it("should assert true is truthy", (): void => {
    expect<bool>(true).toBeTruthy("true should be truthy");
  });

  it("should assert a non-null reftype is truthy", (): void => {
    expect<Vec3>(vec).toBeTruthy("non-null reftypes should be truthy.");
  });

  it("should assert strings of length 1 or greater to be truthy", (): void => {
    expect<string>("Test!").toBeTruthy();
  });

  it("should assert 0 value type are not truthy", (): void => {
    expect<() => void>((): void => {
      expect<i32>(0).toBeTruthy();
    }).toThrow();
  });

  it("should assert false is not truthy", (): void => {
    expect<() => void>((): void => {
      expect<bool>(false).toBeTruthy();
    }).toThrow();
  });

  it("should assert a null reftype is not truthy", (): void => {
    expect<() => void>((): void => {
      expect<Vec3>(null).toBeTruthy();
    }).toThrow();
  });

  it("should assert strings of length 0 not to be truthy", (): void => {
    expect<() => void>((): void => {
      expect<string>("").toBeTruthy();
    }).toThrow();
  });

  it("should assert negated value types of 0 to be not truthy", (): void => {
    expect<i32>(0).not.toBeTruthy();
  });

  it("should assert negated value types of non-zero to be truthy", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).not.toBeTruthy();
    }).toThrow();
  });

  it("should assert negated value types of false to be not truthy", (): void => {
    expect<bool>(false).not.toBeTruthy();
  });

  it("should assert negated value types of non-zero to be truthy", (): void => {
    expect<() => void>((): void => {
      expect<bool>(true).not.toBeTruthy();
    }).toThrow();
  });

  it("should assert negated reftypes of null to be not truthy", (): void => {
    expect<Vec3>(null).not.toBeTruthy();
  });

  it("should assert negated reftypes of non-null values to be truthy", (): void => {
    expect<() => void>((): void => {
      expect<Vec3>(vec).not.toBeTruthy();
    }).toThrow();
  });

  it("should assert negated strings of length 0 to be not truthy", (): void => {
    expect<string>("").not.toBeTruthy();
  });

  it("should assert negated strings of length 1 or greater to be truthy", (): void => {
    expect<() => void>((): void => {
      expect<string>("test!").not.toBeTruthy();
    }).toThrow();
  });
});