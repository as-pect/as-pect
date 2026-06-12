#!/usr/bin/env node

import { readFile, stat } from "node:fs/promises";
import { dirname, posix, resolve, sep } from "node:path";
import { fileURLToPath } from "node:url";

const packageDirectory = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const packageJsonPath = resolve(packageDirectory, "package.json");
const packageJson = JSON.parse(await readFile(packageJsonPath, "utf8"));

/** @type {{ source: string; target: string }[]} */
const declaredTargets = [];

function addTarget(source, value, { requirePackageExportTarget = false } = {}) {
  if (typeof value !== "string") return;

  if (requirePackageExportTarget && !value.startsWith("./")) {
    throw new Error(`${source} must use a relative package export target, received ${JSON.stringify(value)}`);
  }

  if (value.startsWith("/") || value.includes("://")) {
    throw new Error(`${source} must point inside the package, received ${JSON.stringify(value)}`);
  }

  declaredTargets.push({ source, target: normalizePackagePath(value) });
}

function collectExportTargets(value, source) {
  if (typeof value === "string") {
    addTarget(source, value, { requirePackageExportTarget: true });
    return;
  }

  if (Array.isArray(value)) {
    value.forEach((entry, index) => collectExportTargets(entry, `${source}[${index}]`));
    return;
  }

  if (value && typeof value === "object") {
    for (const [key, entry] of Object.entries(value)) {
      collectExportTargets(entry, `${source}.${key}`);
    }
  }
}

function normalizePackagePath(value) {
  return value.replace(/^\.\//, "").replaceAll("\\", "/");
}

function filesEntryToRegExp(entry) {
  const normalized = normalizePackagePath(entry).replace(/\/$/, "");
  const escaped = normalized.replace(/[.+?^${}()|[\]\\]/g, "\\$&").replaceAll("*", "[^/]*");
  return new RegExp(`^${escaped}(?:/.*)?$`);
}

function isIncludedByFilesList(target) {
  if (!Array.isArray(packageJson.files)) return true;

  return packageJson.files.some((entry) => {
    if (typeof entry !== "string") return false;

    const normalizedEntry = normalizePackagePath(entry);
    const normalizedTarget = normalizePackagePath(target);

    if (normalizedEntry.includes("*")) {
      return filesEntryToRegExp(normalizedEntry).test(normalizedTarget);
    }

    const directoryEntry = normalizedEntry.endsWith("/") ? normalizedEntry : `${normalizedEntry}/`;
    return normalizedTarget === normalizedEntry.replace(/\/$/, "") || normalizedTarget.startsWith(directoryEntry);
  });
}

async function assertPackageFile(source, target) {
  const absoluteTarget = resolve(packageDirectory, target.split("/").join(sep));
  const targetStat = await stat(absoluteTarget).catch(() => null);

  if (!targetStat?.isFile()) {
    throw new Error(`${source} points to missing file ${target}. Run npm run asbuild:release first.`);
  }

  if (!isIncludedByFilesList(target)) {
    throw new Error(`${source} points to ${target}, but packages/assembly/package.json files does not include it.`);
  }
}

async function collectWasmCompanions(target) {
  if (!target.endsWith(".js")) return [];

  const sourceText = await readFile(resolve(packageDirectory, target.split("/").join(sep)), "utf8");
  const companions = [];
  const importMetaUrlPattern = /new URL\(["']([^"']+\.wasm)["'],\s*import\.meta\.url\)/g;

  for (const match of sourceText.matchAll(importMetaUrlPattern)) {
    companions.push({
      source: `${target} runtime wasm companion`,
      target: normalizePackagePath(posix.join(posix.dirname(target), match[1])),
    });
  }

  return companions;
}

if (packageJson.types) {
  addTarget("types", packageJson.types);
}

collectExportTargets(packageJson.exports, "exports");

if (declaredTargets.length === 0) {
  throw new Error("No package types or exports targets were found to validate.");
}

for (const { source, target } of declaredTargets) {
  await assertPackageFile(source, target);

  for (const companion of await collectWasmCompanions(target)) {
    await assertPackageFile(companion.source, companion.target);
  }
}

console.log(`Validated ${declaredTargets.length} declared @as-pect/assembly package target(s).`);
