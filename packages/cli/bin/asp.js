#!/usr/bin/env node
import { spawn } from "child_process";
import process from "process";
import path from "path";
import url from "url";

const __dirname = url.fileURLToPath(new URL('.', import.meta.url))
const nodeVersion = parseInt(process.version.match(/^v(\d+)\./)[1]);

const jsPath = path.join(__dirname, "../lib/test.js");

const args = [
  jsPath,
  ...process.argv.slice(2),
];


if (nodeVersion >= 12 && nodeVersion < 16)
  args.unshift("--experimental-wasm-bigint");
if (nodeVersion >= 13) args.unshift("--experimental-wasi-unstable-preview1");
args.unshift("--enable-source-maps");

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
