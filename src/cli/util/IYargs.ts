type argType = "b" | "s" | "S" | "I" | "i" | "F" | "f";

type ArgValue = string | number | boolean;

interface alias {
  name: string;
  long?: true;
}

export interface CommandLineArg {
  description: string | string[];
  type: argType;
  alias?: alias | alias[];
  default?: ArgValue;
  options?: [string, string][];
  children?: CommandLineArgs;
}

export interface CommandLineArgs {
  [key: string]: CommandLineArg;
}

export const Args: CommandLineArgs = {
  init: {
    description: "Create a test config, an assembly/__tests__ folder and exit.",
    type: "b",
    alias: { name: "i" },
    default: false
  },
  config: {
    description: "Use a specified configuration",
    type: "s",
    alias: { name: "c" },
    default: "as-pect.config.js"
  },
  version: {
    description: "View the version.",
    type: "b",
    alias: { name: "v" },
    default: false
  },
  help: {
    description: "Show this help screen.",
    type: "b",
    alias: { name: "h" },
    default: false
  },
  types: {
    description: "Copy the types file to assembly/__tests__/as-pect.d.ts",
    type: "s",
    alias: { name: "t" },
    default: ""
  },
  file: {
    description:
      "Run the tests of each file that matches this regex. {yellow (Default: /./)}",
    type: "s",
    alias: [{ name: "files", long: true }, { name: "f" }]
  },

  group: {
    description:
      "Run each describe block that matches this regex {yellow (Default: /(:?)/)}",
    type: "s",
    alias: [{ name: "groups", long: true }, { name: "g" }]
  },

  test: {
    description:
      "Run each test that matches this regex {yellow (Default: /(:?)/)}",
    type: "s",
    alias: [{ name: "tests", long: true }, { name: "t" }],
    default: "(:?)"
  },

  "output-binary": {
    description:
      "Create a (.wasm) file can contains all the tests to be run later.",
    type: "b",
    alias: { name: "o" },
    default: false
  },

  norun: {
    description: "Skip running tests and output the compiler files.",
    type: "b",
    alias: { name: "n" },
    default: false
  },
  //   {bold.green -n}

  nortrace: {
    description: "Skip rtrace reference counting calculations.",
    type: "s",
    alias: { name: "nr" },
    default: false
  },

  reporter: {
    description:
      "Define the reporter to be used. {yellow (Default: DefaultTestReporter)}",
    type: "s",
    default: "DefaultTestReporter",
    options: [
      ["SummaryTestReporter", "Use the summary reporter."],
      ["DefaultTestReporter", "Use the default test reporter."],
      [
        "JSONTestReporter",
        "Use the JSON reporter (output results to json files.)"
      ],
      [
        "CSVTestReporter",
        "Use the empty reporter (output results to csv files.)"
      ],
      [
        "EmptyReporter",
        "Use the empty reporter. {yellow (This reporter reports nothing)}"
      ],
      [
        "./path/to/reporter.js",
        "Use the default exported object from this module as the reporter."
      ]
    ]
  },
  performance: {
    description:
      "Enable performance statistics for {bold every} test. {yellow (Default: false)}",
    type: "b",
    default: false,
    children: {
      "max-samples": {
        description:
          "Set the maximum number of samples to run for each test. {yellow (Default: 10000 samples)}",
        type: "i",
        default: 10000
      },
      "max-test-run-time": {
        description:
          "Set the maximum test run time in milliseconds. {yellow (Default: 2000ms)}",
        type: "i",
        default: 2000
      },
      "round-decimal-places": {
        description:
          "Set the number of decimal places to round to. {yellow (Default: 3)}",
        type: "i",
        default: 3
      },
      "report-median": {
        description:
          "Enable/Disable reporting of the median time. {yellow (Default: true)}",
        type: "b",
        default: true
      },
      "report-average": {
        description:
          "Enable/Disable reporting of the average time. {yellow (Default: true)}",
        type: "b",
        default: true
      },
      "report-standard-deviation": {
        description: "Enable / Disable reporting of the standard deviation.",
        type: "b",
        default: false
      },
      // // {bold.green --report-standard-deviation(=false)?} Enable/Disable reporting of the standard deviation. {yellow (Default: false)}
      "report-max": {
        description:
          "Enable/Disable reporting of the largest run time. {yellow (Default: false)}",
        type: "b",
        default: false
      },
      "report-min": {
        description:
          "Enable/Disable reporting of the smallest run time. {yellow (Default: false)}",
        type: "b",
        default: false
      },
      "report-variance": {
        description:
          "Enable/Disable reporting of the variance. {yellow (Default: false)}",
        type: "s"
      }
    }
  }
};
