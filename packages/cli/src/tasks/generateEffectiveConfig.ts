import { AspectRunContext } from "../AspectRunContext";
import {
  CombinationReporter,
  IReporter,
  VerboseReporter,
  SummaryReporter,
} from "@as-pect/core";
import { WASI } from "wasi";

export async function generateEffectiveConfig(
  context: AspectRunContext,
): Promise<AspectRunContext> {
  const { effective, config, cli, process } = context;
  effective.add = ([] as string[])
    .concat(cli?.options.add as string[], config?.add as string[])
    .filter(Boolean);
  effective.disclude = ([] as string[])
    .concat(cli?.options.disclude as string[], config?.disclude as string[])
    .filter(Boolean);
  effective.include = ([] as string[])
    .concat(cli?.options.include as string[], config?.include as string[])
    .filter(Boolean);
  effective.flags = ([] as string[]).concat(
    config?.flags as string[],
    cli?.trailing as string[],
  );

  if (cli?.provided.has("group")) {
    effective.group = new RegExp(cli?.options.group as string);
  }
  if (cli?.provided.has("test")) {
    effective.test = new RegExp(cli?.options.test as string);
  }
  if (cli?.arguments.length) {
    effective.files = cli.arguments.map((e) => new RegExp(e, "i"));
  }
  effective.imports = config?.imports ?? {};
  effective.memoryMax = cli?.provided.has("memory-max")
    ? (cli.options["memory-max"] as number)
    : config?.memoryMax ?? -1;
  effective.memorySize = cli?.provided.has("memory-size")
    ? (cli.options["memory-size"] as number)
    : config?.memorySize ?? 10;

  effective.outputBinary = cli?.provided.has("output-binary")
    ? (cli.options["output-binary"] as boolean)
    : config?.outputBinary ?? false;

  // reporter collection
  const reporters: IReporter[] = [];
  if (cli?.provided.has("summary") && cli?.provided.has("verbosoe")) {
    throw new Error(
      "Cannot use the verbose and summary reporters at the same time.",
    );
  }
  if (cli?.provided.has("verbose")) {
    reporters.push(new VerboseReporter(process));
  }
  if (cli?.provided.has("summary")) {
    reporters.push(new SummaryReporter(process));
  }
  if (config?.reporter) {
    reporters.push(config.reporter);
  }
  effective.reporter =
    reporters.length > 0
      ? new CombinationReporter(reporters)
      : new SummaryReporter(process);

  const useDefaultWasi = cli?.provided.has("default-wasi")
    ? cli?.options["default-wasi"]
    : config?.defaultWasi ?? false;

  if (useDefaultWasi && config?.wasi)
    throw new Error("Cannot use default-wasi and wasi at the same time.");

  if (useDefaultWasi) {
    const WASI = require("wasi").WASI;
    effective.wasi = new WASI({
      args: [],
      env: process.env,
      preopens: {},
    });
  } else if (config?.wasi) {
    const WASI = require("wasi").WASI;
    effective.wasi = new WASI(config.wasi);
  }

  return context;
}
