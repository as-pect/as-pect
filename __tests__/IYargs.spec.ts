import { makeArgMap, CommandLineArg, parse } from "../src/cli/util/IYargs";
import { createDefaultPerformanceConfiguration } from '../src/util/IPerformanceConfiguration';

let Args: Map<string, CommandLineArg>;


describe("Command line parsing", () => {
    beforeEach(() => {
        Args = makeArgMap();
    })
  it("should match empty strings", () => {});

  it("should fail if missing argument", () => {
    expect(() => parse(["-t"], Args)).toThrow();
  });

  it("should change the default value", () => {
    let opts = parse(["-t", "testFile"], Args);
    expect(Args.has("-t")).toBe(true);
    expect(Args.get("-t")!.value).toBe("testFile");
    expect(opts.test).toBe("testFile")
  });

  it("should handle enabling booleans", () => {
    expect(Args.get("performance")!.value).toBe(false);
    parse(["--performance"], Args);
    expect(Args.get("performance")!.value).toBe(true);
  });

  it("should handle setting booleans", () => {
    expect(Args.get("performance")!.value).toBe(false);
    parse(["--performance=true"], Args);
    expect(Args.get("performance")!.value).toBe(true);
  });

  it("should have correct defaults for performance", () => {
      expect(parse([], Args).performance).toStrictEqual(createDefaultPerformanceConfiguration())
  })
});
