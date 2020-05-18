import { IProcessConfiguration } from "./IProcessConfiguration";
import { tryResolveCompiler } from "./tasks/tryResolveCompiler";
import { tryResolveConfig } from "./tasks/tryResolveConfig";
import { AspectRunContext } from "./AspectRunContext";
import { assertCompiler } from "./tasks/assertCompiler";
import { parseArgv } from "./tasks/parseArgv";
import { assertNoUnknown } from "./tasks/assertNoUnkown";
import { printError } from "./util/printError";
import { AspectErrorCode } from "./util/AspectErrorCode";
import { exit } from "./tasks/exit";
import { unexpectedError } from "./tasks/unexpectedError";

export function asp(argv: string[], config: IProcessConfiguration): void {
  const context: AspectRunContext = {
    argv,
    process: config,
    files: [],
    exitCode: 0,
  };
  tryResolveCompiler(context)
    .then(tryResolveConfig)
    .then(tryValidateConfig)
    .then(assertCompiler)
    .then(parseArgv)
    .then(assertNoUnknown)
    .catch(unexpectedError.bind(null, context))
    .then(() => exit(context));
}
