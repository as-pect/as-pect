import process from "process";

export interface CliOptions {
  [key: string]: unknown;
  asConfig: string;
  config: string;
  csv: boolean;
  disclude?: string;
  group: string;
  include?: string;
  init: boolean;
  json: boolean;
  logo: boolean;
  memoryMax: string;
  memorySize: string;
  outputBinary: boolean;
  reporter?: string;
  run: boolean;
  showStats: boolean;
  summary: boolean;
  test: string;
  updateSnapshots: boolean;
  verbose: boolean;
  version: boolean;
}

interface CliOutputConfiguration {
  writeErr?: (str: string) => void;
  writeOut?: (str: string) => void;
}

type OptionValueName = "asConfig" | "config" | "disclude" | "include" | "memoryMax" | "memorySize" | "reporter";
type BooleanOptionName =
  | "csv"
  | "group"
  | "init"
  | "json"
  | "outputBinary"
  | "showStats"
  | "summary"
  | "test"
  | "updateSnapshots"
  | "verbose"
  | "version";

interface ValueOptionDefinition {
  description: string;
  display: string;
  long: string;
  missingArgumentMessage: string;
  property: OptionValueName;
  short?: string;
}

interface BooleanOptionDefinition {
  description: string;
  display: string;
  long: string;
  property: BooleanOptionName;
  short?: string;
  value: boolean;
}

const VALUE_OPTIONS: ValueOptionDefinition[] = [
  {
    description: 'Specify the location of your [as-pect.config.js] (default: "./as-pect.config.js")',
    display: "-c, --config <config_location>",
    long: "--config",
    missingArgumentMessage: "error: option '-c, --config <config_location>' argument missing",
    property: "config",
    short: "-c",
  },
  {
    description:
      'Specify the location of the as-pect asconfig. (default: `./as-pect.asconfig.json`) (default: "./as-pect.asconfig.json")',
    display: "-a, --as-config <asconfig_location>",
    long: "--as-config",
    missingArgumentMessage: "error: option '-a, --as-config <asconfig_location>' argument missing",
    property: "asConfig",
    short: "-a",
  },
  {
    description: 'Initial size of imported memory in pages of 64kb. (Default: 10 pages) (default: "10")',
    display: "--memory-size <pages>",
    long: "--memory-size",
    missingArgumentMessage: "error: option '--memory-size <pages>' argument missing",
    property: "memorySize",
  },
  {
    description:
      'Set the maximum amount of memory pages the wasm test modules can use. (Default: -1, no max specified) (default: "-1")',
    display: "--memory-max <pages>",
    long: "--memory-max",
    missingArgumentMessage: "error: option '--memory-max <pages>' argument missing",
    property: "memoryMax",
  },
  {
    description: "Match test files with the following regex, disclude them from testing.",
    display: "-d, --disclude <regex>",
    long: "--disclude",
    missingArgumentMessage: "error: option '-d, --disclude <regex>' argument missing",
    property: "disclude",
    short: "-d",
  },
  {
    description: "A comma seperated list of include globs that will include files for each test compilation.",
    display: "-i, --include <globs>",
    long: "--include",
    missingArgumentMessage: "error: option '-i, --include <globs>' argument missing",
    property: "include",
    short: "-i",
  },
  {
    description: "Define a custom reporter (local path or package module)",
    display: "--reporter <reporter>",
    long: "--reporter",
    missingArgumentMessage: "error: option '--reporter <reporter>' argument missing",
    property: "reporter",
  },
];

const BOOLEAN_OPTIONS: BooleanOptionDefinition[] = [
  {
    description: "Display the as-pect version. (default: false)",
    display: "-v, --version",
    long: "--version",
    property: "version",
    short: "-v",
    value: true,
  },
  {
    description: "Initialize a testing project. (default: false)",
    display: "--init",
    long: "--init",
    property: "init",
    value: true,
  },
  {
    description: "Match tests with the following regex. (Default: `(:?)`)",
    display: "-t, --test",
    long: "--test",
    property: "test",
    short: "-t",
    value: true,
  },
  {
    description: "Match test groups with the following regex. (Default `(:?)`)",
    display: "-g, --group",
    long: "--group",
    property: "group",
    short: "-g",
    value: true,
  },
  {
    description: "Output the wasm binary for each test file. (default: false)",
    display: "-o, --output-binary",
    long: "--output-binary",
    property: "outputBinary",
    short: "-o",
    value: true,
  },
  {
    description: "Update the existing snapshots. (default: false)",
    display: "-u, --update-snapshots",
    long: "--update-snapshots",
    property: "updateSnapshots",
    short: "-u",
    value: true,
  },
  {
    description:
      "Use the summary reporter. {yellow (This is the default if no reporter is specified.)} (default: false)",
    display: "--summary",
    long: "--summary",
    property: "summary",
    value: true,
  },
  {
    description: "Use a more verbose reporter. (default: false)",
    display: "--verbose",
    long: "--verbose",
    property: "verbose",
    value: true,
  },
  {
    description: "Use the csv reporter (output results to csv files.) (default: false)",
    display: "--csv",
    long: "--csv",
    property: "csv",
    value: true,
  },
  {
    description: "Use the json reporter (output results to json files.) (default: false)",
    display: "--json",
    long: "--json",
    property: "json",
    value: true,
  },
  {
    description: "Show compiler stats between compilations. (default: false)",
    display: "-s, --show-stats",
    long: "--show-stats",
    property: "showStats",
    short: "-s",
    value: true,
  },
];

const NEGATED_BOOLEAN_OPTIONS: Record<string, { property: "logo" | "run"; value: false }> = {
  "--no-logo": { property: "logo", value: false },
  "--no-run": { property: "run", value: false },
  "-n": { property: "logo", value: false },
};

function createDefaultOptions(): CliOptions {
  return {
    asConfig: "./as-pect.asconfig.json",
    config: "./as-pect.config.js",
    csv: false,
    group: "(:?)",
    init: false,
    json: false,
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
  };
}

function formatOptionLine(display: string, description: string): string {
  const padding = " ".repeat(Math.max(2, 37 - display.length));
  return `  ${display}${padding}${description}`;
}

function isOptionToken(token: string): boolean {
  return token.startsWith("-") && token !== "-";
}

function resolveCommandName(argvName: string | undefined, currentName: string): string {
  const basename = argvName?.split(/[\\/]/).pop();
  if (basename === "aspect") return "aspect";
  if (basename === "asp") return "asp";
  return currentName;
}

export class CliProgram {
  public args: string[] = [];
  private commandName = "asp";
  private outputConfiguration: CliOutputConfiguration = {};
  private shouldThrowOnExit = false;
  private values = createDefaultOptions();

  public configureOutput(configuration: CliOutputConfiguration): this {
    this.outputConfiguration = configuration;
    return this;
  }

  public exitOverride(): this {
    this.shouldThrowOnExit = true;
    return this;
  }

  public helpInformation(): string {
    const usageName = this.commandName;
    return `Usage: ${usageName} [options] [globs...]\n\n${[
      "Arguments:",
      "  globs                                Test entry globs",
      "",
      "Options:",
      formatOptionLine("-n, --no-logo", "Don't display the as-pect logo."),
      ...VALUE_OPTIONS.slice(0, 2).map((option) => formatOptionLine(option.display, option.description)),
      ...BOOLEAN_OPTIONS.slice(0, 2).map((option) => formatOptionLine(option.display, option.description)),
      ...VALUE_OPTIONS.slice(2, 4).map((option) => formatOptionLine(option.display, option.description)),
      ...BOOLEAN_OPTIONS.slice(2, 4).map((option) => formatOptionLine(option.display, option.description)),
      ...VALUE_OPTIONS.slice(4, 6).map((option) => formatOptionLine(option.display, option.description)),
      ...BOOLEAN_OPTIONS.slice(4, 5).map((option) => formatOptionLine(option.display, option.description)),
      formatOptionLine("--no-run", "Skip running tests, and output the binary files."),
      ...BOOLEAN_OPTIONS.slice(5).map((option) => formatOptionLine(option.display, option.description)),
      ...VALUE_OPTIONS.slice(6).map((option) => formatOptionLine(option.display, option.description)),
      formatOptionLine("-h, --help", "display help for command"),
    ].join("\n")}\n`;
  }

  public name(commandName: string): this {
    this.commandName = commandName;
    return this;
  }

  public opts(): CliOptions {
    return this.values;
  }

  public parse(argv: string[]): this {
    this.values = createDefaultOptions();
    this.args = [];
    this.commandName = resolveCommandName(argv[1], this.commandName);

    for (let index = 2; index < argv.length; index++) {
      const token = argv[index] ?? "";

      if (token === "--help" || token === "-h") {
        this.writeOut(this.helpInformation());
        this.exit(0, "(outputHelp)");
        return this;
      }

      const valueOption = this.findValueOption(token);
      if (valueOption) {
        const parsedValue = this.readValueOption(argv, index, token, valueOption);
        this.values[valueOption.property] = parsedValue.value;
        index = parsedValue.nextIndex;
        continue;
      }

      const booleanOption = BOOLEAN_OPTIONS.find((option) => token === option.long || token === option.short);
      if (booleanOption) {
        this.setBooleanOption(booleanOption.property, booleanOption.value);
        continue;
      }

      const negatedOption = NEGATED_BOOLEAN_OPTIONS[token];
      if (negatedOption) {
        this.values[negatedOption.property] = negatedOption.value;
        continue;
      }

      if (isOptionToken(token)) {
        this.error(`error: unknown option '${token}'`);
        return this;
      }

      this.args.push(token);
    }

    return this;
  }

  private error(message: string): never {
    this.writeErr(`${message}\n`);
    this.exit(1, message);
  }

  private exit(code: number, message: string): never {
    if (this.shouldThrowOnExit) {
      throw new Error(message);
    }

    process.exit(code);
  }

  private setBooleanOption(property: BooleanOptionName, value: boolean): void {
    (this.values as Record<BooleanOptionName, unknown>)[property] = value;
  }

  private findValueOption(token: string): ValueOptionDefinition | undefined {
    return VALUE_OPTIONS.find(
      (option) =>
        token === option.long ||
        token === option.short ||
        token.startsWith(`${option.long}=`) ||
        (option.short !== undefined && token.startsWith(option.short) && token !== option.short),
    );
  }

  private readValueOption(
    argv: string[],
    index: number,
    token: string,
    option: ValueOptionDefinition,
  ): { nextIndex: number; value: string } {
    if (token.startsWith(`${option.long}=`)) {
      return { nextIndex: index, value: token.slice(option.long.length + 1) };
    }

    if (option.short !== undefined && token.startsWith(option.short) && token !== option.short) {
      return { nextIndex: index, value: token.slice(option.short.length) };
    }

    const value = argv[index + 1];
    if (value === undefined || isOptionToken(value)) {
      this.error(option.missingArgumentMessage);
    }

    return { nextIndex: index + 1, value };
  }

  private writeErr(str: string): void {
    const writeErr = this.outputConfiguration.writeErr ?? process.stderr.write.bind(process.stderr);
    writeErr(str);
  }

  private writeOut(str: string): void {
    const writeOut = this.outputConfiguration.writeOut ?? process.stdout.write.bind(process.stdout);
    writeOut(str);
  }
}
