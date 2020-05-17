import { AspectRunContext } from "../AspectRunContext";
import { printError } from "../util/printError";
import { AspectErrorCode } from "../util/AspectErrorCode";

export async function assertNoUnknown(context: AspectRunContext): Promise<AspectRunContext> {
  const result = context.parseResult!; // we know this is the correct value now
  const unknown = result.unknown;
  if (unknown.length) {
    for (let i = 0; i < unknown.length; i++) {
      printError(
        AspectErrorCode.ASP_100_InvalidCLIArgument,
        context.process,
        unknown[i],
        "Unknown argument.",
      );
    }
    context.process.exit(1);
  }
  return context;
}