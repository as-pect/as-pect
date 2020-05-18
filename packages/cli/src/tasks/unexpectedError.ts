import { AspectRunContext } from "../AspectRunContext";
import { AspectErrorCode } from "../util/AspectErrorCode";
import { printError } from "../util/printError";

export async function unexpectedError(context: AspectRunContext, reason: any): Promise<void> {
  printError(
    AspectErrorCode.ASP_001_AnUnexpectedErrorOccured,
    context.process,
    reason.toString(),
  );
  if (context.files.length) {
    await Promise.all(context.files);
  }
}
