import { IProcessConfiguration } from "./IProcessConfiguration";
import { tryResolveCompiler } from "./tasks/tryResolveCompiler";
import { tryResolveConfig } from "./tasks/tryResolveConfig";
import { AspectRunContext } from "./AspectRunContext";

export function asp(argv: string[], config: IProcessConfiguration): void {
  const context: AspectRunContext = {
    argv,
    process: config,
    files: [],
    exitCode: 0,
  };
  tryResolveCompiler(context).then(tryResolveConfig).then(assertCompiler);
}
