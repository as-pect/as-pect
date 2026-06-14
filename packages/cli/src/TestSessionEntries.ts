export interface TestSessionEntryDiscoveryOptions {
  args: string[];
  configEntries?: string[];
  entryFilterRegexes: RegExp[];
  includeGlobs: string[];
  glob(pattern: string): Promise<string[]>;
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
}: TestSessionEntryDiscoveryOptions): Promise<PlannedTestSessionEntries> {
  const includes = new Set<string>();
  const entries = new Set<string>();

  for (const arg of args.concat(configEntries)) {
    const entryPoints = sortDiscoveredPaths(await glob(arg));
    for (const entryPoint of entryPoints) {
      if (shouldKeepEntry(entryFilterRegexes, entryPoint)) entries.add(entryPoint);
    }
  }

  for (const includedGlob of includeGlobs) {
    const includedFiles = sortDiscoveredPaths(await glob(includedGlob));
    for (const includedFile of includedFiles) {
      includes.add(includedFile);
    }
  }

  return {
    entries: Array.from(entries),
    includeFiles: sortDiscoveredPaths(Array.from(includes)),
  };
}
