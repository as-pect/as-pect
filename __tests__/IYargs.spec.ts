import { parse } from "../src/cli/util/IYargs";
import { createDefaultPerformanceConfiguration } from '../src/util/IPerformanceConfiguration';



describe("Command line parsing", () => {

  it("should match empty strings", () => {});

  it("should fail if missing argument", () => {
    expect(() => parse(["-t"])).toThrow();
  });

  it("should change the default value", () => {
    let opts = parse(["-t", "testFile"]);
    expect(opts.test).toBe("testFile");
  });

  it("should handle enabling booleans", () => {
    let opts = parse(["--performance"]);
    expect(opts.performance.enabled).toBe(true);
  });

  it("should handle setting booleans", () => {
    
    let opts = parse(["--performance=true"]);
    expect(opts.performance.enabled).toBe(true);
  });

  it("should have correct defaults for performance", () => {
      expect(parse([]).performance).toStrictEqual(createDefaultPerformanceConfiguration())
  })
});
