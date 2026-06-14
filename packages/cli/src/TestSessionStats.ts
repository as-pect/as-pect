import type { SnapshotLifecycleStats } from "@as-pect/snapshots";

export interface TestSessionStats {
  addedSnapshots: number;
  changedSnapshots: number;
  removedSnapshots: number;
  passedSnapshots: number;
  totalSnapshots: number;
  groups: number;
  passedGroups: number;
  tests: number;
  passedTests: number;
  pass: boolean;
}

export interface TestSessionSuiteStatsFacts {
  groups: number;
  hasResults: boolean;
  pass: boolean;
  passedGroups: number;
  passedTests: number;
  snapshotStats?: SnapshotLifecycleStats;
  tests: number;
}

export function createInitialTestSessionStats(): TestSessionStats {
  return {
    addedSnapshots: 0,
    changedSnapshots: 0,
    removedSnapshots: 0,
    passedSnapshots: 0,
    totalSnapshots: 0,
    groups: 0,
    passedGroups: 0,
    tests: 0,
    passedTests: 0,
    pass: true,
  };
}

export function accumulateTestSessionSnapshotStats(
  testSessionStats: TestSessionStats,
  snapshotLifecycleStats: SnapshotLifecycleStats,
): void {
  testSessionStats.totalSnapshots += snapshotLifecycleStats.totalSnapshots;
  testSessionStats.passedSnapshots += snapshotLifecycleStats.passedSnapshots;
  testSessionStats.addedSnapshots += snapshotLifecycleStats.addedSnapshots;
  testSessionStats.changedSnapshots += snapshotLifecycleStats.changedSnapshots;
  testSessionStats.removedSnapshots += snapshotLifecycleStats.removedSnapshots;
}

export function accumulateTestSessionSuiteStats(
  testSessionStats: TestSessionStats,
  suiteFacts: TestSessionSuiteStatsFacts,
): void {
  if (!suiteFacts.hasResults) return;

  testSessionStats.groups += suiteFacts.groups;
  testSessionStats.tests += suiteFacts.tests;
  testSessionStats.passedGroups += suiteFacts.passedGroups;
  testSessionStats.passedTests += suiteFacts.passedTests;
  testSessionStats.pass = testSessionStats.pass && suiteFacts.pass;

  if (suiteFacts.snapshotStats) {
    accumulateTestSessionSnapshotStats(testSessionStats, suiteFacts.snapshotStats);
  }
}
