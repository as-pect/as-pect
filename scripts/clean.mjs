#!/usr/bin/env node
import { rm } from "node:fs/promises";

const targets = process.argv.slice(2);

if (targets.length === 0) {
  console.error("Usage: node scripts/clean.mjs <path> [...path]");
  process.exitCode = 1;
} else {
  await Promise.all(targets.map((target) => rm(target, { force: true, recursive: true })));
}
