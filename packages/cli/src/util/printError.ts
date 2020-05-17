import { IProcessConfiguration } from "../IProcessConfiguration";
import { AspectErrorCode } from "./AspectErrorCode";

export function printError(
  errcode:
    | AspectErrorCode.ASP_100_InvalidCLIArgument
    | AspectErrorCode.ASP_101_InvalidConfiguration,
  config: IProcessConfiguration,
  option: string,
  reason: string,
): void;
export function printError(
  errcode: AspectErrorCode,
  config: IProcessConfiguration,
  ...rest: string[]
): void {
  const colors: typeof import("ansi-colors") = require("ansi-colors");
  const stderr = config.stderr;
  stderr.write(colors.bgRedBright.black("[Error]:") + " ");

  const result = errcode.replace(
    /\{(\d+)\}/g,
    (_match: string, num: string) => {
      const index = parseInt(num);
      return rest[index];
    },
  );

  stderr.write(result);
}
