import { AspectRunContext } from "../AspectRunContext";
import { printError } from "./printError";
import { AspectErrorCode } from "./AspectErrorCode";
const isObject = (value: any) =>
  value === Object(value) && typeof value !== "function";
function assertIsFunction(
  context: AspectRunContext,
  value: any,
  prop: string,
): void {
  if (!(value instanceof Function)) {
    printError(
      AspectErrorCode.ASP_101_InvalidConfiguration,
      context.process,
      prop,
      `must be a function`,
    );
    context.process.exit(1);
    return;
  }
}
export function assertIsReporter(
  context: AspectRunContext,
  value: any,
  prop: string,
): void {
  const functions = ["onEnter", "onExit", "onFinish"];
  for (const func of functions) {
    assertIsFunction(context, value[func], `${prop}.${func}`);
  }
}
export function assertIsInteger(
  context: AspectRunContext,
  value: any,
  prop: string,
) {
  if (!Number.isInteger(value)) {
    printError(
      AspectErrorCode.ASP_101_InvalidConfiguration,
      context.process,
      prop,
      "must be an integer",
    );
    context.process.exit(1);
    return;
  }
}
export function assertIsImports(
  context: AspectRunContext,
  value: any,
  prop: string,
): void {
  if (isObject(value) || value instanceof Function) {
    return;
  } else {
    printError(
      AspectErrorCode.ASP_101_InvalidConfiguration,
      context.process,
      prop,
      "must be an object or a function",
    );
    context.process.exit(1);
    return;
  }
}
export function assertKeysInObject(
  context: AspectRunContext,
  value: any,
  prop: string,
  props: string[],
): void {
  const keySet = new Set(props);
  for (const key of Object.keys(value)) {
    if (!keySet.has(key)) {
      printError(
        AspectErrorCode.ASP_101_InvalidConfiguration,
        context.process,
        prop,
        `${prop}.${key} is an invalid key`,
      );
      context.process.exit(1);
      return;
    }
  }
}
export function assertIsObject(
  context: AspectRunContext,
  value: any,
  prop: string,
): void {
  if (!isObject(value)) {
    printError(
      AspectErrorCode.ASP_101_InvalidConfiguration,
      context.process,
      prop,
      "must be an object",
    );
    context.process.exit(1);
    return;
  }
}
export function assertNotProvided(
  context: AspectRunContext,
  value: any,
  prop: string,
  reason: string,
): void {
  if (value !== void 0 && value !== null) {
    printError(
      AspectErrorCode.ASP_101_InvalidConfiguration,
      context.process,
      prop,
      reason,
    );
    context.process.exit(1);
    return;
  }
}
export function assertIsTrue(
  context: AspectRunContext,
  value: boolean,
  prop: string,
): void {
  if (value !== true) {
    printError(
      AspectErrorCode.ASP_101_InvalidConfiguration,
      context.process,
      prop,
      `${prop} must be true if provided.`,
    );
    context.process.exit(1);
    return;
  }
}
export function assertIsString(
  context: AspectRunContext,
  value: string,
  prop: string,
): void {
  if (typeof value !== "string") {
    printError(
      AspectErrorCode.ASP_101_InvalidConfiguration,
      context.process,
      prop,
      `${prop} must be a string`,
    );
    context.process.exit(1);
    return;
  }
}
export function assertIsStringArray(
  context: AspectRunContext,
  obj: string[],
  prop: string,
): void {
  const reason = `${prop} is not a string[]`;
  if (!Array.isArray(obj)) {
    printError(
      AspectErrorCode.ASP_101_InvalidConfiguration,
      context.process,
      prop,
      reason,
    );
    context.process.exit(1);
    return;
  }
  for (const value of obj) {
    assertIsString(context, value, prop);
  }
}
