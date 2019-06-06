import yargsparser from "yargs-parser";

/**
 * A utility interface that contains an argv property that has the command line arguments.
 */
export interface IYargs {
  argv: yargsparser.Arguments;
}
