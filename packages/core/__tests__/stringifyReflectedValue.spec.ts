import { ReflectedValue } from "../src/util/ReflectedValue.js";
import { ReflectedValueType } from "../src/util/ReflectedValueType.js";

const identity = (value: string): string => value;

function reflectedInteger(value: number): ReflectedValue {
  const reflected = new ReflectedValue();
  reflected.type = ReflectedValueType.Integer;
  reflected.typeName = "i32";
  reflected.value = value;
  return reflected;
}

function reflectedArray(values: number[]): ReflectedValue {
  const reflected = new ReflectedValue();
  reflected.type = ReflectedValueType.Array;
  reflected.typeName = "Array<i32>";
  reflected.values = values.map((value) => reflectedInteger(value));
  return reflected;
}

function reflectedFloat(value: number): ReflectedValue {
  const reflected = new ReflectedValue();
  reflected.type = ReflectedValueType.Float;
  reflected.typeName = "f64";
  reflected.value = value;
  return reflected;
}

describe("stringifyReflectedValue", () => {
  const plainFormatters = {
    keywordFormatter: identity,
    stringFormatter: identity,
    classNameFormatter: identity,
    numberFormatter: identity,
  };

  it("reports the real remaining count for truncated expanded arrays", () => {
    const output = reflectedArray([1, 2, 3]).stringify({
      ...plainFormatters,
      maxPropertyCount: 2,
      maxExpandLevel: 3,
    });

    expect(output).toContain("... +1 values");
  });

  it("does not report a zero remaining count for arrays at the property limit", () => {
    const output = reflectedArray([1, 2]).stringify({
      ...plainFormatters,
      maxPropertyCount: 2,
      maxExpandLevel: 3,
    });

    expect(output).not.toContain("... +0 values");
  });

  it("does not append a decimal suffix to non-decimal reflected floats", () => {
    expect(reflectedFloat(Number.NaN).stringify(plainFormatters)).toBe("NaN");
    expect(reflectedFloat(Number.POSITIVE_INFINITY).stringify(plainFormatters)).toBe("Infinity");
    expect(reflectedFloat(Number.NEGATIVE_INFINITY).stringify(plainFormatters)).toBe("-Infinity");
    expect(reflectedFloat(1e21).stringify(plainFormatters)).toBe("1e+21");
  });
});
