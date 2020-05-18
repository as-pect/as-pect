import { AspectRunContext } from "../AspectRunContext";

/**
 * At this point, it's possible for the compiler to be null, and the
 * configuration may already be resolved. In this case, we must defer to
 * to the configuration object for the location of the compiler, otherwise
 * we default to "assemblyscript".
 */
export async function assertCompiler(
  context: AspectRunContext,
): Promise<AspectRunContext> {
  // if asc exists, we are all resolved
  if (context.asc) return context;

  const path = require("path");
  const compilerParameter = context.config?.compiler || "assemblyscript";

  // get the folder
  const resolvedFolder = compilerParameter.startsWith(".")
    ? require("path").resolve(compilerParameter) // from the current cwd location
    : path.dirname(require.resolve(compilerParameter)); // module resolve

  // obtain the compiler
  const compilerLocation = path.join(resolvedFolder, "dist/asc");
  context.asc = require(compilerLocation);

  // obtain the options parser
  const optionsLocation = path.join(resolvedFolder, "cli/util/options");
  const { parse, help } = require(optionsLocation);
  context.parse = parse;
  context.help = help;
  return context;
}
