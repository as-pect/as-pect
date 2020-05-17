import { IProcessConfiguration } from "./IProcessConfiguration";
import { resolveCompiler } from "./tasks/resolveCompiler";
import { getCLIParser } from "./tasks/getCLIParser";
import { options } from "./options";

export function asp(argv: string[], config: IProcessConfiguration): void {
  const compilerLocation = resolveCompiler(argv, config);
  const { parse, help } = getCLIParser(compilerLocation);

  const result = parse(argv, options);
}
