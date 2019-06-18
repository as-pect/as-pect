import { IPerformanceConfiguration } from "../../util/IPerformanceConfiguration";
import { toCamelCase } from "./strings";

export type argType = "b" | "s" | "S" | "I" | "i" | "F" | "f";

export type ArgValue = string | number | boolean | string[] | number;

export interface Alias {
  name: string;
  long?: true;
}

export interface ICommandLineArg {
  description: string | string[];
  type: argType;
  alias?: Alias | Alias[];
  value: ArgValue;
  options?: [string, string][];
  parent?: string;
}

export interface Options {
  init: boolean;
  config: string;
  version: boolean;
  help: boolean;
  types: boolean;
  file: string;
  group: string;
  test: string;
  outputBinary: boolean;
  norun: boolean;
  nortrace: boolean;
  reporter: string;
  performance: IPerformanceConfiguration;
  compiler: string;
  /** Tracks changes made by the cli options */
  changed: Set<string>;
}

export class CommandLineArg implements ICommandLineArg {
  description: string | string[];
  type: argType;
  value: ArgValue;
  alias?: Alias | Alias[] | undefined;
  options?: [string, string][] | undefined;
  parent?: string;

  constructor(public name: string, command: ICommandLineArg) {
    this.description = command.description;
    this.type = command.type;
    this.value = command.value;
    this.alias = command.alias;
    this.options = command.options;
    this.parent = command.parent;
  }
  parse(data: string): ArgValue {
    switch (this.type) {
      case "s":
        return data;
      case "S":
        return data.split(",")
      case "b":
        if (data !== "true" && data !== "false") {
          throw new Error(`Bad value ${data} for boolean for argument ${this.name}`);
        }
        return "true" === data;
      case "i":
        return parseInt(data);
      case "f":
        return parseFloat(data)
      default:
        throw new Error(`Type ${this.type} is not implemented yet`);
    }
  }
}

export interface CommandLineArgs {
  [key: string]: ICommandLineArg;
}

const _Args: CommandLineArgs = {
  init: {
    description: "Create a test config, an assembly/__tests__ folder and exit.",
    type: "b",
    alias: { name: "i" },
    value: false,
  },
  config: {
    description: "Use a specified configuration",
    type: "s",
    alias: { name: "c" },
    value: "as-pect.config.js",
  },
  version: {
    description: "View the version.",
    type: "b",
    alias: { name: "v" },
    value: false,
  },
  help: {
    description: "Show this help screen.",
    type: "b",
    alias: { name: "h" },
    value: false,
  },
  types: {
    description: "Copy the types file to assembly/__tests__/as-pect.d.ts",
    type: "b",
    alias: { name: "t" },
    value: false,
  },
  file: {
    description: "Run the tests of each file that matches this regex.",
    type: "s",
    alias: [{ name: "files", long: true }, { name: "f" }],
    value: ".",
  },

  group: {
    description: "Run each describe block that matches this regex",
    type: "s",
    alias: [{ name: "groups", long: true }, { name: "g" }],
    value: "(:?)",
  },

  test: {
    description: "Run each test that matches this regex",
    type: "s",
    alias: [{ name: "tests", long: true }, { name: "t" }],
    value: "(:?)",
  },

  "output-binary": {
    description: "Create a (.wasm) file can contains all the tests to be run later.",
    type: "b",
    alias: { name: "o" },
    value: false,
  },

  norun: {
    description: "Skip running tests and output the compiler files.",
    type: "b",
    alias: { name: "n" },
    value: false,
  },

  nortrace: {
    description: "Skip rtrace reference counting calculations.",
    type: "b",
    alias: { name: "nr" },
    value: false,
  },

  reporter: {
    description: "Define the reporter to be used.",
    type: "s",
    value: "DefaultTestReporter",
    options: [
      ["SummaryTestReporter", "Use the summary reporter."],
      ["DefaultTestReporter", "Use the default test reporter."],
      ["JSONTestReporter", "Use the JSON reporter (output results to json files.)"],
      ["CSVTestReporter", "Use the empty reporter (output results to csv files.)"],
      ["EmptyReporter", "Use the empty reporter. This reporter reports nothing)"],
      ["./path/to/reporter.js", "Use the default exported object from this module as the reporter."],
    ],
  },
  performance: {
    description: "Enable performance statistics for {bold every} test.",
    type: "b",
    value: false,
    parent: "performance",
  },
  "max-samples": {
    description: "Set the maximum number of samples to run for each test.",
    type: "i",
    value: 10000,
    parent: "performance",
  },
  "max-test-run-time": {
    description: "Set the maximum test run time in milliseconds.",
    type: "i",
    value: 2000,
    parent: "performance",
  },
  "round-decimal-places": {
    description: "Set the number of decimal places to round to.",
    type: "i",
    value: 3,
    parent: "performance",
  },
  "report-median": {
    description: "Enable/Disable reporting of the median time.",
    type: "b",
    value: true,
    parent: "performance",
  },
  "report-average": {
    description: "Enable/Disable reporting of the average time.",
    type: "b",
    value: true,
    parent: "performance",
  },
  "report-standard-deviation": {
    description: "Enable / Disable reporting of the standard deviation.",
    type: "b",
    value: false,
    parent: "performance",
  },
  "report-max": {
    description: "Enable/Disable reporting of the largest run time.",
    type: "b",
    value: false,
    parent: "performance",
  },
  "report-min": {
    description: "Enable/Disable reporting of the smallest run time.",
    type: "b",
    value: false,
    parent: "performance",
  },
  "report-variance": {
    description:
      "Enable/Disable reporting of the variance.",
    type: "b",
    value: false,
    parent: "performance",
  },
  compiler: {
    description: [
      "Path to folder relative to project root which contains",
      "{folder}/dist/asc for the compiler and {folder}/lib/loader for loader.",
    ],
    type: "s",
    value: "assemblyscript",
  },
};

export type ArgMap = Map<string, CommandLineArg>;

export function makeArgMap(args: CommandLineArgs = _Args): ArgMap {
  const res = new Map<string, CommandLineArg>();
  Object.getOwnPropertyNames(args).forEach(element => {
    let arg = new CommandLineArg(element, _Args[element]);
    res.set(element, arg);
    let aliases = _Args[element].alias;
    if (aliases) {
      (aliases instanceof Array ? aliases : [aliases]).forEach(alias => {
        // short aliases have a `-` prefix to disguish them
        let name = (!alias.long ? "-" : "") + alias.name;
        res.set(name, arg);
      });
    }
  });
  return res;
}

export const Args = makeArgMap(_Args);

let reg = /(?:--([a-z][a-z\-]*)|(-[a-z][a-z\-]*))(?:=(.*))?/i;

let invalidArg = /^[\-]/;

export function parse(commands: string[], args: ArgMap = Args): Options {
  let opts: any = {
    changed: new Set(),
  };

  args.forEach((arg: CommandLineArg) => {
    let camelCase = toCamelCase(arg.name)
    if (arg.parent) {
      if (!opts[arg.parent]) {
        opts[arg.parent] = {};
      }
      if (arg.parent === arg.name) {
        opts[arg.parent].enabled = arg.value as boolean;
      } else {
        opts[arg.parent][camelCase] = arg.value;
      }
    } else {
      opts[camelCase] = arg.value;
    }
  });

  for (let i = 0; i < commands.length; i++) {
    //@ts-ignore
    let [_, flag, alias, data]: string[] = commands[i].match(reg) || [];

    if (flag) {
      if (!args.has(flag)) {
        throw new Error("Flag " + flag + " doesn't exist.");
      }
    } else if (alias) {
      if (!args.has(alias)) {
        throw new Error("Alias " + alias + " doesn't exist.");
      }
    } else {
      throw new Error("Command " + commands[i] + " is not valid.");
    }

    const arg = args.get(flag || alias)!;
    let value;
    if (data) {
      // Data from =(.*)
      value = arg.parse(data);
    } else if (arg.type === "b") {
      // boolean flag
      value = true;
    } else {
      if (i >= commands.length - 1) {
        throw new Error("Command line ended without last argument.");
      }
      if (commands[i + 1].match(invalidArg)) {
        throw new Error(`Passed value ${commands[i + i]} is invalid.`);
      }
      i += 1; // increment index
      value = arg.parse(commands[i]); // Parse data
    }

    let name = toCamelCase(arg.name);
    if (arg.parent) {
      if (arg.parent == name) {
        name = "enabled";
      }
      opts[arg.parent][name] = value;
      opts.changed.add(arg.parent + "." + name);
    } else {
      opts[name] = value
      opts.changed.add(name);
    }
  }
  return opts as Options;
}
