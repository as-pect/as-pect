import { AspectRunContext } from "../AspectRunContext";
import {
  assertIsObject,
  assertKeysInObject,
  assertIsStringArray,
  assertIsTrue,
  assertNotProvided,
  assertIsString,
  assertIsImports,
  assertIsInteger,
  assertIsReporter,
} from "../util/assert";

export async function tryValidateConfig(
  context: AspectRunContext,
): Promise<AspectRunContext> {
  if (context.config) {
    const config = context.config;
    assertIsObject(context, config, "The configuration itself");
    assertKeysInObject(context, config, "config", [
      "add",
      "defaultWasi",
      "wasi",
      "compiler",
      "disclude",
      "flags",
      "imports",
      "maxMemory",
      "memorySize",
      "outputBinary",
    ]);
    if (config.add) assertIsStringArray(context, config.add, "add");
    if (config.defaultWasi) {
      assertIsTrue(context, config.defaultWasi, "defaultWasi");
      assertNotProvided(
        context,
        config.wasi,
        "wasi",
        "A wasi configuration must not be provided if a default wasi configuration is requested.",
      );
    }
    if (config.wasi) {
      assertIsObject(context, config.wasi, "wasi");
      assertKeysInObject(context, config.wasi, "wasi", [
        "args",
        "env",
        "preopens",
        "returnOnExit",
      ]);
    }
    if (config.compiler) assertIsString(context, config.compiler, "compiler");
    if (config.disclude)
      assertIsStringArray(context, config.disclude, "disclude");
    if (config.flags) assertIsStringArray(context, config.flags, "flags");
    if (config.imports) {
      assertIsImports(context, config.imports, "imports");
    }
    if (config.include) assertIsStringArray(context, config.include, "include");
    if (config.memoryMax)
      assertIsInteger(context, config.memoryMax, "maxMemory");
    if (config.memorySize)
      assertIsInteger(context, config.memorySize, "memorySize");
    if (config.outputBinary)
      assertIsTrue(context, config.outputBinary, "outputBinary");
    if (config.reporter) assertIsReporter(context, config.reporter, "reporter");
  }

  return context;
}
