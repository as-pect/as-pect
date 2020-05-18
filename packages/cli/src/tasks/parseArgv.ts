import { AspectRunContext } from "../AspectRunContext";
import { options } from "../options";

export async function parseArgv(
  context: AspectRunContext,
): Promise<AspectRunContext> {
  context.parseResult = context.parse!(context.argv, options);
  return context;
}
