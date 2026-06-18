#!/usr/bin/env node

import { spawn } from "node:child_process";
import { fileURLToPath } from "node:url";

export function createNpmRunSpawnConfig(platform = process.platform) {
  const isWindows = platform === "win32";
  return {
    command: isWindows ? "npm.cmd" : "npm",
    options: {
      stdio: "inherit",
      shell: isWindows,
    },
  };
}

function parseArgs(args) {
  const parallel = args[0] === "--parallel";
  const scripts = parallel ? args.slice(1) : args;
  return { parallel, scripts };
}

function printUsage() {
  console.error("Usage: node scripts/run-npm-scripts.mjs [--parallel] <script> [...script]");
}

function runScript(script) {
  return new Promise((resolve) => {
    const { command, options } = createNpmRunSpawnConfig();
    const child = spawn(command, ["run", script], options);

    child.on("error", (error) => {
      console.error(`Failed to start npm script '${script}': ${error.message}`);
      resolve(1);
    });

    child.on("exit", (code, signal) => {
      if (signal) {
        console.error(`npm script '${script}' exited after signal ${signal}`);
        resolve(1);
      } else {
        resolve(code ?? 1);
      }
    });
  });
}

async function runSequential(scripts) {
  for (const script of scripts) {
    const status = await runScript(script);
    if (status !== 0) return status;
  }
  return 0;
}

async function runParallel(scripts) {
  const statuses = await Promise.all(scripts.map((script) => runScript(script)));
  return statuses.find((status) => status !== 0) ?? 0;
}

export async function runNpmScripts(args) {
  const { parallel, scripts } = parseArgs(args);
  if (scripts.length === 0) {
    printUsage();
    return 1;
  }

  return parallel ? runParallel(scripts) : runSequential(scripts);
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  const status = await runNpmScripts(process.argv.slice(2));
  process.exitCode = status;
}
