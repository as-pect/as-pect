import { AspectRunContext } from "../AspectRunContext";

export function exit(context: AspectRunContext): void {
  context.process.exit(context.exitCode);
}
