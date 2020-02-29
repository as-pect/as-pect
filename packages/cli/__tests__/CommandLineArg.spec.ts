import { parse } from "../src/util/CommandLineArg";

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

  it("should set option from alias", () => {
    expect(parse(["-v"]).version).toBeTruthy();
  });
});
