import { IProcessConfiguration } from "../IProcessConfiguration";
import { printError } from "../util/printError";
import { AspectErrorCode } from "../util/AspectErrorCode";
import {
  IOptionalRunContextProps,
  AspectRunContext,
} from "../AspectRunContext";
import { IAspectConfiguration } from "../IAspectConfiguration";

/**
 * Return the assemblyscript folder.
 *
 * @param argv
 * @param config
 */
export async function tryResolveCompiler(
  context: AspectRunContext,
): Promise<AspectRunContext> {
  const argv = context.argv!;
  const process = context.process!;
  let index = argv.indexOf("--compiler");
  // if no -C or --config flag is passed, we need to skip this step.
  if (index === -1) index = argv.indexOf("-C");
  if (index === -1) return context;

  // a flag was passed, now we need to resolve the compiler, or throw an error.
  const nextIndex = index + 1;
  if (nextIndex >= argv.length || /^[^\.a-z]/i.test(argv[nextIndex])) {
    printError(
      AspectErrorCode.ASP_100_InvalidCLIArgument,
      process,
      "--compiler or -C", // compiler flag is "C" config is "c"
      "If the compiler flag is passed to the cli, it must be followed by a package name or a relative url to the compiler.",
    );
    process.exit(1);
    return context;
  }

  const path = require("path");
  const locationParameter = argv[nextIndex];
  const resolvedFolder = locationParameter.startsWith(".")
    ? require("path").resolve(locationParameter) // from the current cwd location
    : path.dirname(require.resolve(locationParameter)); // module resolve
  const compilerLocation = path.join(resolvedFolder, "dist/asc");
  context.asc = require(compilerLocation);
  const optionsLocation = path.join(resolvedFolder, "cli/util/options");
  const { parse, help } = require(optionsLocation);
  context.parse = parse;
  context.help = help;
  return context;
}
