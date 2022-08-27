#!/usr/bin/env node
import { spawn } from "child_process";
import process from "process";
import path from "path";
let nodeVersion = parseInt(process.version.match(/^v(\d+)\./)[1]);

function relativeFromMeta(metaUrl, relativePath) {
  return path.resolve(
    path.dirname(metaUrl.replace("file://", "")),
    relativePath,
  );
}

const args = [
  relativeFromMeta(import.meta.url, "../lib/test.js"),
  ...process.argv.slice(2),
];

if (nodeVersion >= 12 && nodeVersion < 16)
  args.unshift("--experimental-wasm-bigint");
if (nodeVersion >= 13) args.unshift("--experimental-wasi-unstable-preview1");

const spawned = spawn("node", args, {
  env: Object.assign({}, process.env, {
    FORCE_COLOR: "2",
  }),
});

spawned.stdout.pipe(process.stdout);
spawned.stderr.pipe(process.stderr);
spawned.ref();
spawned.on("exit", (code, _signal) => {
  process.exit(code);
});
