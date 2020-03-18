import { toCamelCase } from "./strings";

/**
 * @ignore
 *
 * This is the set of command line ArgumentTypes.
 */
export type ArgType = "b" | "bs" | "s" | "S" | "I" | "i" | "F" | "f";

/**
 * @ignore
 *
 * These are the possible command line argument values.
 */
export type ArgValue =
  | string
  | number
  | boolean
  | string[]
  | number
  | { [key: string]: ArgValue }
  | Set<string>;

/**
 * @ignore
 *
 * This interface represents a CommandLineArgument alias.
 */
export interface Alias {
  name: string;
  long?: true;
}

/**
 * @ignore
 *
 * This is the Command Line Argument interface.
 */
export interface ICommandLineArg {
  description: string | string[];
  type: ArgType;
  alias?: Alias | Alias[];
  value: ArgValue;
  options?: [string, string][];
  parent?: string;
}

/**
 * This is the set of CLI options provided by the parser when the arguments are parsed.
 */
export interface Options {
  [key: string]: ArgValue;
  init: boolean;
  initWasi: boolean;
  config: string;
  version: boolean;
  help: boolean;
  types: boolean;
  file: string;
  group: string;
  test: string;
  outputBinary: boolean;
  memorySize: number;
  memoryMax: number;
  norun: boolean;
  nortrace: boolean;
  reporter: string;
  portable: boolean;
  compiler: string;
  csv: string | boolean;
  json: string | boolean;
  verbose: string | boolean;
  summary: string | boolean;
  /** Suppress ASCII art from being printed */
  nologo: boolean;
  /** Tracks changes made by the cli options */
  changed: Set<string>;
  /** The number of experimental workers used for compiling. */
  workers: number;
  /** Indicates of snapshots should be updated. */
  update: boolean;
}

/**
 * @ignore
 *
 * This class represents a definition for a command line argument.
 */
export class CommandLineArg implements ICommandLineArg {
  description: string | string[];
  type: ArgType;
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
      case "bs":
        return data;
      case "S":
        return data.split(",");
      case "b":
        if (data !== "true" && data !== "false") {
          throw new Error(
            `Bad value ${data} for boolean for argument ${this.name}`,
          );
        }
        return "true" === data;
      case "i":
        return parseInt(data);
      case "f":
        return parseFloat(data);
      default:
        throw new Error(`Type ${this.type} is not implemented yet`);
    }
  }
}

/**
 * @ignore
 *
 * This interface defines an object that will contain the command line arguments.
 */
export interface CommandLineArgs {
  [key: string]: ICommandLineArg;
}

/**
 * @ignore
 * The definition for the as-pect/cli arguments.
 */
const _Args: CommandLineArgs = {
  compiler: {
    description: [
      "Path to folder relative to project root which contains",
      "{folder}/dist/asc for the compiler and {folder}/lib/loader for loader.",
    ],
    type: "s",
    value: "assemblyscript",
  },

  config: {
    description: "Use a specified configuration",
    type: "s",
    alias: { name: "c" },
    value: "as-pect.config.js",
  },

  csv: {
    description:
      "Use the csv reporter. It outputs test data to {testname}.spec.csv",
    type: "bs",
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

  help: {
    description: "Show this help screen.",
    type: "b",
    alias: { name: "h" },
    value: false,
  },

  init: {
    description: "Create a test config, an assembly/__tests__ folder and exit.",
    type: "b",
    alias: { name: "i" },
    value: false,
  },

  initWasi: {
    description: "Create a test config for use with wasi, an assembly/__tests__ folder and exit.",
    type: "b",
    value: false,
  },

  json: {
    description: [
      "Use the json reporter. It outputs test data to {testname}.spec.json",
    ],
    type: "bs",
    value: false,
  },

  "memory-max": {
    description:
      "Set the maximum amount of memory pages the wasm module can use.",
    type: "i",
    value: -1,
  },

  "memory-size": {
    description: "Set the initial wasm memory size in pages [64kb each].",
    type: "i",
    alias: { name: "m" },
    value: 10,
  },

  nologo: {
    description: "Suppress ASCII art from being printed.",
    type: "b",
    alias: { name: "nl" },
    value: false,
  },

  nortrace: {
    description: "Skip rtrace reference counting calculations.",
    type: "b",
    alias: { name: "nr" },
    value: false,
  },

  norun: {
    description: "Skip running tests and output the compiler files.",
    type: "b",
    alias: { name: "n" },
    value: false,
  },

  "output-binary": {
    description:
      "Create a (.wasm) file can contains all the tests to be run later.",
    type: "b",
    alias: { name: "o" },
    value: false,
  },

  portable: {
    description: "Add the portable jest/as-pect types to your project.",
    type: "b",
    value: false,
  },

  reporter: {
    description: "Define the reporter to be used.",
    type: "s",
    value: "",
    options: [
      [
        "./path/to/reporter.js?queryString",
        "Use the default exported object from this module as the reporter.",
      ],
    ],
  },

  summary: {
    description: [
      "Use the summary reporter. It outputs a summary of the test results to stdout.",
    ],
    type: "bs",
    value: false,
  },

  test: {
    description: "Run each test that matches this regex",
    type: "s",
    alias: [{ name: "tests", long: true }, { name: "t" }],
    value: "(:?)",
  },

  types: {
    description: "Copy the types file to assembly/__tests__/as-pect.d.ts",
    type: "b",
    value: false,
  },

  verbose: {
    description: [
      "Use the verbose reporter. It outputs all the test details to stdout.",
    ],
    type: "bs",
    value: false,
  },

  version: {
    description: "View the version.",
    type: "b",
    alias: { name: "v" },
    value: false,
  },

  workers: {
    description:
      "An experimental flag that enables parallel compilation in Worker worklets.",
    type: "i",
    alias: { name: "w" },
    value: 0,
  },

  update: {
    description: "Update the snapshots",
    type: "b",
    alias: { name: "u" },
    value: false,
  },
};

/**
 * @ignore
 *
 * This is the command line argument map.
 */
export type ArgMap = Map<string, CommandLineArg>;

/**
 * @ignore
 * Take a CommandLineArgs object and turn it into an ArgMap.
 *
 * @param args
 */
export function makeArgMap(args: CommandLineArgs = _Args): ArgMap {
  const res = new Map<string, CommandLineArg>();
  Object.getOwnPropertyNames(args).forEach(element => {
    let arg = new CommandLineArg(element, _Args[element]);
    res.set(element, arg);
    let aliases = _Args[element].alias;
    if (aliases) {
      (Array.isArray(aliases) ? aliases : [aliases]).forEach(alias => {
        // short aliases have a `-` prefix to disguish them
        let name = (!alias.long ? "-" : "") + alias.name;
        res.set(name, arg);
      });
    }
  });
  return res;
}

/**
 * This is the set of stored command line arguments for the asp command line.
 */
export const defaultCliArgs = makeArgMap(_Args);

/**
 * @ignore
 */
const reg = /(?:--([a-z][a-z\-]*)|(-[a-z][a-z\-]*))(?:=(.*))?/i;
/**
 * @ignore
 */
const invalidArg = /^[\-]/;

/**
 * This method parses command line options like the `asp` command does. It takes an optional
 * second parameter to modify the command line arguments used.
 *
 * @param {string[]} commands - The command line arguments.
 * @param {ArgMap} cliArgs - The set of parsable arguments.
 */
export function parse(
  commands: string[],
  cliArgs: ArgMap = defaultCliArgs,
): Options {
  const opts = {
    changed: new Set<string>(),
  } as Options;

  cliArgs.forEach((arg: CommandLineArg) => {
    const camelCase = toCamelCase(arg.name);
    if (arg.parent) {
      const parent: { [key: string]: ArgValue } =
        (opts[arg.parent] as { [key: string]: ArgValue }) || {};
      if (arg.parent === arg.name) {
        parent.enabled = arg.value as boolean;
      } else {
        parent[camelCase] = arg.value;
      }
      opts[arg.parent] = parent;
    } else {
      opts[camelCase] = arg.value;
    }
  });

  for (let i = 0; i < commands.length; i++) {
    //@ts-ignore
    let [_, flag, alias, data]: string[] = commands[i].match(reg) || [];

    if (flag) {
      if (!cliArgs.has(flag)) {
        throw new Error("Flag " + flag + " doesn't exist.");
      }
    } else if (alias) {
      if (!cliArgs.has(alias)) {
        throw new Error("Alias " + alias + " doesn't exist.");
      }
    } else {
      throw new Error("Command " + commands[i] + " is not valid.");
    }

    const arg = cliArgs.get(flag || alias)!;
    let value;
    if (data) {
      // Data from =(.*)
      value = arg.parse(data);
    } else if (arg.type === "bs") {
      // boolean flag or string, do not parse further
      value = true;
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
      (opts[arg.parent] as { [key: string]: ArgValue })[name] = value;
      opts.changed.add(arg.parent + "." + name);
    } else {
      opts[name] = value;
      opts.changed.add(name);
    }
  }
  return opts;
}
