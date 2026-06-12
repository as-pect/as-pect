import { createCliProgram } from "../src/index.js";

function parseOptions(args: string[]) {
  const command = createCliProgram();
  command.exitOverride();
  command.parse(["node", "asp", ...args]);
  return command.opts();
}

describe("CLI option parsing", () => {
  it("maps --version without requiring config", () => {
    expect(parseOptions(["--version"]).version).toBe(true);
  });

  it("maps --init without requiring config", () => {
    expect(parseOptions(["--init"]).init).toBe(true);
  });

  it("maps --no-logo as disabled logo output", () => {
    expect(parseOptions(["--no-logo"]).logo).toBe(false);
  });

  it("maps --no-run as compile-only mode", () => {
    expect(parseOptions(["--no-run"]).run).toBe(false);
  });

  it("maps output binary and snapshot update flags", () => {
    const opts = parseOptions(["--output-binary", "--update-snapshots"]);

    expect(opts.outputBinary).toBe(true);
    expect(opts.updateSnapshots).toBe(true);
  });

  it("maps memory options to page counts", () => {
    const opts = parseOptions(["--memory-size", "4", "--memory-max", "8"]);

    expect(opts.memorySize).toBe("4");
    expect(opts.memoryMax).toBe("8");
  });

  it("maps --reporter to a custom reporter location", () => {
    expect(parseOptions(["--reporter", "./reporter.js"]).reporter).toBe("./reporter.js");
  });

  it("maps include and disclude values", () => {
    const opts = parseOptions(["--include", "assembly/setup.ts", "--disclude", "skip"]);

    expect(opts.include).toBe("assembly/setup.ts");
    expect(opts.disclude).toBe("skip");
  });
});
