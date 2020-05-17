type HelpFunction = typeof import("assemblyscript/cli/util/options").help;
type ParseFunction = typeof import("assemblyscript/cli/util/options").parse;

export interface IGetCLIParserResult {
  help: HelpFunction;
  parse: ParseFunction;
}

export function getCLIParser(compiler: string): IGetCLIParserResult {
  const path = require("path");
  const optionsPath = path.join(compiler, "cli/util/options");
  return require(optionsPath);
}
