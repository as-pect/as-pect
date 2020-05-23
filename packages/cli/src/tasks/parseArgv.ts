import { AspectRunContext } from "../AspectRunContext";
import { options } from "../options";

export async function parseArgv(
  context: AspectRunContext,
): Promise<AspectRunContext> {
  context.cli = context.parse!(context.argv, options);
  return context;
}
