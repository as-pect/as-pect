import { AspectRunContext } from "../AspectRunContext";
import { AspectErrorCode } from "../util/AspectErrorCode";
import { printError } from "../util/printError";

export async function tryResolveConfig(
  context: AspectRunContext,
): Promise<AspectRunContext> {
  const path = require("path");
  if (context.parseResult) {
    const configLocation = path.resolve(context.parseResult.options.config);
    context.config = require(configLocation);
  } else {
    const path = require("path");
    let index = context.argv.indexOf("--");
    const argv = index === -1 ? context.argv : context.argv.slice(0, index);

    // we need to obtain the url for the as-pect config manually
    index = argv.indexOf("--config");
    if (index === -1) index = argv.indexOf("-c");
    // no as-pect configuration is required, and all required options are cli bound
    if (index === -1) {
      context.config = require(path.resolve("./as-pect.config.js"));
      return context;
    }

    // a flag was passed, now we need to resolve the compiler, or throw an error.
    const nextIndex = index + 1;
    if (nextIndex >= argv.length || /^[^\.a-z]/i.test(argv[nextIndex])) {
      const process = context.process;
      printError(
        AspectErrorCode.ASP_100_InvalidCLIArgument,
        process,
        "--config or -c",
        "If the config flag is passed to the cli, it must be followed by a package name or a relative url to the compiler.",
      );
      process.exit(1);
      return context;
    }
    context.config = require(path.resolve(argv[nextIndex]));
  }

  return context;
}
