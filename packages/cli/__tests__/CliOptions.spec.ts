import type { CliShell } from "../src/CliShell.js";
import { asp, createCliProgram } from "../src/index.js";

function parseCommand(args: string[]) {
  const command = createCliProgram();
  command.exitOverride();
  command.parse(["node", "asp", ...args]);
  return command;
}

function parseOptions(args: string[]) {
  return parseCommand(args).opts();
}

function createTestShell(): { exits: number[]; shell: CliShell; stderr: string[]; stdout: string[] } {
  const exits: number[] = [];
  const stderr: string[] = [];
  const stdout: string[] = [];

  return {
    exits,
    shell: {
      exit(code: number): never {
        exits.push(code);
        throw new Error(`cli.exit:${code}`);
      },
      stderr: {
        write(text: string): void {
          stderr.push(text);
        },
      },
      stdout: {
        write(text: string): void {
          stdout.push(text);
        },
      },
    },
    stderr,
    stdout,
  };
}

function expectParseError(args: string[], expectedMessage: string) {
  const errors: string[] = [];
  const command = createCliProgram();
  command.exitOverride();
  command.configureOutput({
    writeErr: (str: string) => errors.push(str),
    writeOut: () => undefined,
  });

  expect(() => command.parse(["node", "asp", ...args])).toThrow(expectedMessage);
  expect(errors.join("")).toContain(expectedMessage);
}

describe("CLI option parsing", () => {
  it("describes --reporter as accepting local paths and package modules", () => {
    expect(createCliProgram().helpInformation().replace(/\s+/g, " ")).toContain(
      "Define a custom reporter (local path or package module)",
    );
  });

  it("lists the supported asp command surface in help output", () => {
    const help = createCliProgram().name("asp").helpInformation();

    expect(help).toContain("Usage: asp [options] [globs...]");
    expect(help).toContain("-c, --config <config_location>");
    expect(help).toContain("-a, --as-config <asconfig_location>");
    expect(help).toContain("--memory-size <pages>");
    expect(help).toContain("--memory-max <pages>");
    expect(help).toContain("-t, --test <regex>");
    expect(help).toContain("-g, --group <regex>");
    expect(help).toContain("-d, --disclude <regex>");
    expect(help).toContain("-i, --include <globs>");
    expect(help).toContain("--reporter <reporter>");
    expect(help).toContain("--junit");
  });

  it("maps default option values used for a normal test session", () => {
    expect(parseOptions([])).toMatchObject({
      asConfig: "./as-pect.asconfig.json",
      config: "./as-pect.config.js",
      csv: false,
      group: "(:?)",
      init: false,
      json: false,
      junit: false,
      logo: true,
      memoryMax: "-1",
      memorySize: "10",
      outputBinary: false,
      run: true,
      showStats: false,
      summary: false,
      test: "(:?)",
      updateSnapshots: false,
      verbose: false,
      version: false,
    });
  });

  it("maps --version without requiring config", () => {
    expect(parseOptions(["--version"]).version).toBe(true);
  });

  it("prints version output and exits before loading config through the CLI shell", async () => {
    const { exits, shell, stdout } = createTestShell();

    await expect(asp(["node", "asp", "--version"], shell)).rejects.toThrow("cli.exit:0");

    expect(stdout.join("")).toContain("⚡AS-pect⚡ Test suite runner");
    expect(exits).toEqual([0]);
  });

  it("writes config load failures to stderr and exits through the CLI shell", async () => {
    const { exits, shell, stderr } = createTestShell();

    await expect(
      asp(["node", "asp", "--no-logo", "--config", "./__missing_as_pect_config_for_cli_shell__.js"], shell),
    ).rejects.toThrow("cli.exit:1");

    expect(stderr.join("")).toContain("__missing_as_pect_config_for_cli_shell__.js");
    expect(exits).toEqual([1]);
  });

  it("writes logo output through the CLI shell and respects --no-logo", async () => {
    const logoRun = createTestShell();
    await expect(
      asp(["node", "asp", "--config", "./__missing_as_pect_config_for_cli_shell__.js"], logoRun.shell),
    ).rejects.toThrow("cli.exit:1");

    const noLogoRun = createTestShell();
    await expect(
      asp(["node", "asp", "--no-logo", "--config", "./__missing_as_pect_config_for_cli_shell__.js"], noLogoRun.shell),
    ).rejects.toThrow("cli.exit:1");

    expect(logoRun.stdout.join("")).toContain("___   _____");
    expect(noLogoRun.stdout.join("")).not.toContain("___   _____");
  });

  it("maps --init without requiring config", () => {
    expect(parseOptions(["--init"]).init).toBe(true);
  });

  it("maps logo aliases as disabled logo output", () => {
    expect(parseOptions(["--no-logo"]).logo).toBe(false);
    expect(parseOptions(["-n"]).logo).toBe(false);
  });

  it("maps --no-run as compile-only mode", () => {
    expect(parseOptions(["--no-run"]).run).toBe(false);
  });

  it("maps output binary and snapshot update flags", () => {
    const opts = parseOptions(["--output-binary", "--update-snapshots"]);

    expect(opts.outputBinary).toBe(true);
    expect(opts.updateSnapshots).toBe(true);
  });

  it("maps documented short aliases", () => {
    const opts = parseOptions(["-c", "test/as-pect.config.js", "-a", "test/asconfig.json", "-o", "-u", "-s"]);

    expect(opts.config).toBe("test/as-pect.config.js");
    expect(opts.asConfig).toBe("test/asconfig.json");
    expect(opts.outputBinary).toBe(true);
    expect(opts.updateSnapshots).toBe(true);
    expect(opts.showStats).toBe(true);
  });

  it("maps memory options to page counts", () => {
    const opts = parseOptions(["--memory-size", "4", "--memory-max", "8"]);

    expect(opts.memorySize).toBe("4");
    expect(opts.memoryMax).toBe("8");
  });

  it("maps config and AssemblyScript config paths", () => {
    const opts = parseOptions(["--config", "test/as-pect.config.js", "--as-config", "test/asconfig.json"]);

    expect(opts.config).toBe("test/as-pect.config.js");
    expect(opts.asConfig).toBe("test/asconfig.json");
  });

  it("collects common positional test entry globs", () => {
    const command = parseCommand(["assembly/__tests__/**/*.spec.ts", "custom/**/*.spec.ts"]);

    expect(command.args).toEqual(["assembly/__tests__/**/*.spec.ts", "custom/**/*.spec.ts"]);
  });

  it("maps --reporter to a custom reporter location", () => {
    expect(parseOptions(["--reporter", "./reporter.js"]).reporter).toBe("./reporter.js");
  });

  it("maps include and disclude values", () => {
    const opts = parseOptions(["--include", "assembly/setup.ts", "--disclude", "skip"]);

    expect(opts.include).toBe("assembly/setup.ts");
    expect(opts.disclude).toBe("skip");
  });

  it("maps built-in reporter selector flags", () => {
    const opts = parseOptions(["--summary", "--verbose", "--csv", "--json", "--junit"]);

    expect(opts.summary).toBe(true);
    expect(opts.verbose).toBe(true);
    expect(opts.csv).toBe(true);
    expect(opts.json).toBe(true);
    expect(opts.junit).toBe(true);
  });

  it("maps the show stats flag", () => {
    expect(parseOptions(["--show-stats"]).showStats).toBe(true);
  });

  it("maps test and group filter flags to regex values instead of positional globs", () => {
    const command = parseCommand(["--test", "adds values", "--group", "math"]);

    expect(command.opts()).toMatchObject({
      group: "math",
      test: "adds values",
    });
    expect(command.args).toEqual([]);
  });

  it("maps short test and group filter aliases to regex values", () => {
    const command = parseCommand(["-t", "adds", "-g", "math"]);

    expect(command.opts()).toMatchObject({
      group: "math",
      test: "adds",
    });
    expect(command.args).toEqual([]);
  });

  it("rejects missing test and group filter values", () => {
    expectParseError(["--test"], "error: option '-t, --test <regex>' argument missing");
    expectParseError(["--group"], "error: option '-g, --group <regex>' argument missing");
  });

  it("rejects unknown options", () => {
    expectParseError(["--unknown"], "error: unknown option '--unknown'");
  });

  it("prints help output and exits successfully", () => {
    const output: string[] = [];
    const command = createCliProgram();
    command.exitOverride();
    command.configureOutput({
      writeErr: () => undefined,
      writeOut: (str: string) => output.push(str),
    });

    expect(() => command.parse(["node", "asp", "--help"])).toThrow("(outputHelp)");
    expect(output.join("")).toContain("Usage: asp [options] [globs...]");
  });

  it("uses the aspect alias in help output when invoked that way", () => {
    const output: string[] = [];
    const command = createCliProgram();
    command.exitOverride();
    command.configureOutput({
      writeErr: () => undefined,
      writeOut: (str: string) => output.push(str),
    });

    expect(() => command.parse(["node", "aspect", "--help"])).toThrow("(outputHelp)");
    expect(output.join("")).toContain("Usage: aspect [options] [globs...]");
  });
});
