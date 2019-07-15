import { parse } from "../src/util/CommandLineArg";
import { createDefaultPerformanceConfiguration } from "@as-pect/core/src/util/IPerformanceConfiguration";

describe("Command line parsing", () => {
  it("should match empty strings", () => {
    expect(parse([])).toBeDefined();
  });

  it("should fail if missing argument", () => {
    expect(() => parse(["-t"])).toThrow();
  });

  it("should change the default value", () => {
    let opts = parse(["-t", "testFile"]);
    expect(opts.test).toBe("testFile");
  });

  it("should handle enabling booleans", () => {
    let opts = parse(["--performance"]);
    expect(opts.performance.enabled).toBeTruthy();
  });

  it("should handle setting booleans", () => {
    let opts = parse(["--performance=true"]);
    expect(opts.performance.enabled).toBeTruthy();
  });

  it("should have correct defaults for performance", () => {
    expect(parse([]).performance).toStrictEqual(
      createDefaultPerformanceConfiguration(),
    );
  });

  it("should set option from alias", () => {
    expect(parse(["-v"]).version).toBeTruthy();
  });
});
