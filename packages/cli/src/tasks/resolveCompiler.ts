import { IProcessConfiguration } from "../IProcessConfiguration";
import { printError } from "../util/printError";
import { AspectErrorCode } from "../util/AspectErrorCode";

/**
 * Return the assemblyscript folder.
 *
 * @param argv
 * @param config
 */
export function resolveCompiler(
  argv: string[],
  config: IProcessConfiguration,
): string {
  const path = require("path");
  let index = argv.indexOf("--compiler");
  if (index === -1) index = argv.indexOf("-C");
  if (index === -1) return path.dirname(require.resolve("assemblyscript"));
  const nextIndex = index + 1;
  if (nextIndex >= argv.length || /^[^\.a-z]/i.test(argv[nextIndex])) {
    printError(
      AspectErrorCode.InvalidCommandLineArgumentName,
      config,
      "--compiler or -c",
      "If the compiler flag is passed to the cli, it must be followed by a package name or a relative url to the compiler.",
    );
    config.exit(1);
  }
  const location = argv[nextIndex];
  return location.startsWith(".")
    ? require("path").resolve(location) // from the current cwd location
    : path.dirname(require.resolve(location)); // module resolve
}
