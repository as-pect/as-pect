import type { TestSessionProject } from "./TestSessionProject.js";

export interface TestSessionGlobOptions {
  cwd: string;
}

export type TestSessionGlob = (pattern: string, options?: TestSessionGlobOptions) => Promise<string[]>;

export interface TestSessionEntryDiscoveryOptions {
  args: string[];
  configEntries?: string[];
  entryFilterRegexes: RegExp[];
  includeGlobs: string[];
  glob: TestSessionGlob;
  project?: TestSessionProject;
}

export interface PlannedTestSessionEntries {
  entries: string[];
  includeFiles: string[];
}

function regexMatches(regex: RegExp, value: string): boolean {
  regex.lastIndex = 0;
  try {
    return regex.test(value);
  } finally {
    regex.lastIndex = 0;
  }
}

function compareDiscoveredPaths(left: string, right: string): number {
  if (left < right) return -1;
  if (left > right) return 1;
  return 0;
}

export function sortDiscoveredPaths(paths: string[]): string[] {
  return [...paths].sort(compareDiscoveredPaths);
}

function shouldKeepEntry(entryFilterRegexes: RegExp[], entry: string): boolean {
  return entryFilterRegexes.every((entryFilterRegex) => !regexMatches(entryFilterRegex, entry));
}

export async function planTestSessionEntries({
  args,
  configEntries = [],
  entryFilterRegexes,
  includeGlobs,
  glob,
  project,
}: TestSessionEntryDiscoveryOptions): Promise<PlannedTestSessionEntries> {
  const includes = new Set<string>();
  const entries = new Set<string>();
  const globOptions = project ? { cwd: project.cwd } : undefined;

  for (const arg of args.concat(configEntries)) {
    const entryPoints = sortDiscoveredPaths(await glob(arg, globOptions));
    for (const entryPoint of entryPoints) {
      if (shouldKeepEntry(entryFilterRegexes, entryPoint)) entries.add(entryPoint);
    }
  }

  for (const includedGlob of includeGlobs) {
    const includedFiles = sortDiscoveredPaths(await glob(includedGlob, globOptions));
    for (const includedFile of includedFiles) {
      includes.add(includedFile);
    }
  }

  return {
    entries: Array.from(entries),
    includeFiles: sortDiscoveredPaths(Array.from(includes)),
  };
}
