type Category = { category?: string };
type Config = import("assemblyscript/cli/util/options").Config & Category;

const enum FlagTypes {
  String = "s",
  StringArray = "S",
  Flag = "b",
  Integer = "i",
}

const enum ConfigurationGroups {
  Testing = "Testing Configuration",
  Compiler = "Compiler Configuration",
  Module = "Module Configuration",
}

export const options: Config = {
  help: {
    type: FlagTypes.Flag,
    alias: "h",
    description: "Show this help scrren.",
    default: false,
  },

  init: {
    type: FlagTypes.Flag,
    alias: "I",
    description: "Initialize a default as-pect project.",
    default: false,
  },

  types: {
    type: FlagTypes.Flag,
    alias: "f",
    description: "Create a types file in assembly/__tests__/as-pect.d.ts",
    default: false,
  },

  portable: {
    type: FlagTypes.Flag,
    alias: "p",
    description: [
      "Create a types file that contains a portable set of as-pect that is",
      "compatible with jest.",
    ],
    default: false,
  },

  debug: {
    type: FlagTypes.Flag,
    alias: "D",
    description: "Enable a more verbose cli output.",
    default: false,
  },

  config: {
    type: FlagTypes.String,
    alias: "c",
    description:
      "The as-pect config location. (default: './as-pect.config.js')",
    default: "./as-pect.config.js",
    category: ConfigurationGroups.Testing,
  },

  include: {
    type: FlagTypes.StringArray,
    alias: "i",
    description: [
      "The globs, seperated by ',' that indicate the files to include",
      "as testing modules for the test run. This must be provided by the",
      "configuration or the cli, otherwise the process will exit code 1.",
    ],
    category: ConfigurationGroups.Testing,
    default: [],
  },

  add: {
    type: FlagTypes.StringArray,
    alias: "a",
    description: [
      "The globs, seperated by ',' that indicate the files to add",
      "as entry points for testing modules.",
    ],
    category: ConfigurationGroups.Testing,
    default: [],
  },

  disclude: {
    type: FlagTypes.StringArray,
    alias: "d",
    description: [
      "The globs, seperated by ',' that indicate the files that should",
      "be removed from the 'include' results so that they will not be run",
      "as test modules.",
    ],
    default: [],
    category: ConfigurationGroups.Testing,
  },

  test: {
    type: FlagTypes.String,
    alias: "t",
    description:
      "A regular expression that filters tests by their name. (default (:?))",
    category: ConfigurationGroups.Testing,
    default: "(:?)",
  },

  group: {
    type: FlagTypes.String,
    alias: "g",
    description:
      "A regular expression that filters test groups by their name. (default (:?))",
    category: ConfigurationGroups.Testing,
    default: "(:?)",
  },

  verbose: {
    type: FlagTypes.Flag,
    alias: "v",
    description:
      "Use the verbose reporter. If another reporter is specified, it will be combined.",
    category: ConfigurationGroups.Testing,
    default: false,
  },

  summary: {
    type: FlagTypes.Flag,
    alias: "s",
    description: "Use the summary reporter.",
    category: ConfigurationGroups.Testing,
    default: false,
  },

  csv: {
    type: FlagTypes.Flag,
    description:
      "Use the csv reporter. Must be installed via @as-pect/csv-reporter",
    category: ConfigurationGroups.Testing,
    default: false,
  },

  json: {
    type: FlagTypes.Flag,
    description:
      "Use the json reporter. Must be installed via @as-pect/json-reporter",
    category: ConfigurationGroups.Testing,
    default: false,
  },

  compiler: {
    type: FlagTypes.String,
    alias: "C",
    description: [
      "The absolute file system url to the AssemblyScript compiler, or the",
      "name of the package. (default 'assemblyscript')",
    ],
    category: ConfigurationGroups.Compiler,
    default: "assemblyscript",
  },

  "output-binary": {
    type: FlagTypes.Flag,
    alias: "b",
    description: [
      "Output the wasm file associated with each test in the same locataion as",
      "the testing file. Example:",
      "  ./example.spec.ts -> ./example.spec.wasm",
    ],
    category: ConfigurationGroups.Compiler,
    default: false,
  },

  "memory-size": {
    type: FlagTypes.Integer,
    alias: "m",
    description: [
      "Set the initial memory size of each testing module in [64kb]",
      "pages. (default: 10)",
    ],
    category: ConfigurationGroups.Module,
    default: 10,
  },

  "memory-max": {
    type: FlagTypes.Integer,
    alias: "M",
    description: [
      "Set the maximum memory size of each testing module in [64kb]",
      "pages. Pass -1 to disable setting the maximum. (default: -1)",
    ],
    category: ConfigurationGroups.Module,
    default: -1,
  },

  "default-wasi": {
    type: FlagTypes.Flag,
    alias: "w",
    description: [
      "Use a default wasi configuration. This will pass the env object into",
      "the wasi instance, but argv will not be set, and no files will be",
      "preopened. This option will throw an error if a WASI configuration is",
      "passed in the as-pect configuration.",
    ],
    category: ConfigurationGroups.Module,
    default: false,
  },
};
