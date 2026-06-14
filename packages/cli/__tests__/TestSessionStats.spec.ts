import {
  accumulateTestSessionSuiteStats,
  createInitialTestSessionStats,
  TestSessionSuiteStatsFacts,
} from "../src/TestSessionStats.js";

const suiteFacts = (overrides: Partial<TestSessionSuiteStatsFacts> = {}): TestSessionSuiteStatsFacts => ({
  groups: 0,
  hasResults: true,
  pass: true,
  passedGroups: 0,
  passedTests: 0,
  tests: 0,
  ...overrides,
});

describe("Test session stats accumulation", () => {
  it("ignores empty suites", () => {
    const stats = createInitialTestSessionStats();

    accumulateTestSessionSuiteStats(
      stats,
      suiteFacts({
        groups: 3,
        hasResults: false,
        pass: false,
        passedGroups: 1,
        passedTests: 1,
        snapshotStats: {
          addedSnapshots: 1,
          changedSnapshots: 1,
          passedSnapshots: 1,
          removedSnapshots: 1,
          totalSnapshots: 4,
        },
        tests: 2,
      }),
    );

    expect(stats).toEqual(createInitialTestSessionStats());
  });

  it("aggregates group and test pass counts", () => {
    const stats = createInitialTestSessionStats();

    accumulateTestSessionSuiteStats(stats, suiteFacts({ groups: 2, passedGroups: 2, passedTests: 3, tests: 4 }));
    accumulateTestSessionSuiteStats(stats, suiteFacts({ groups: 1, passedGroups: 1, passedTests: 2, tests: 2 }));

    expect(stats.groups).toBe(3);
    expect(stats.passedGroups).toBe(3);
    expect(stats.tests).toBe(6);
    expect(stats.passedTests).toBe(5);
  });

  it("aggregates snapshot stats when compare-mode lifecycle facts are supplied", () => {
    const stats = createInitialTestSessionStats();

    accumulateTestSessionSuiteStats(
      stats,
      suiteFacts({
        snapshotStats: {
          addedSnapshots: 1,
          changedSnapshots: 2,
          passedSnapshots: 3,
          removedSnapshots: 4,
          totalSnapshots: 10,
        },
      }),
    );
    accumulateTestSessionSuiteStats(
      stats,
      suiteFacts({
        snapshotStats: {
          addedSnapshots: 2,
          changedSnapshots: 3,
          passedSnapshots: 4,
          removedSnapshots: 5,
          totalSnapshots: 14,
        },
      }),
    );

    expect(stats.addedSnapshots).toBe(3);
    expect(stats.changedSnapshots).toBe(5);
    expect(stats.passedSnapshots).toBe(7);
    expect(stats.removedSnapshots).toBe(9);
    expect(stats.totalSnapshots).toBe(24);
  });

  it("flips aggregate pass to false for a failed suite and keeps it false", () => {
    const stats = createInitialTestSessionStats();

    accumulateTestSessionSuiteStats(stats, suiteFacts({ pass: false }));
    accumulateTestSessionSuiteStats(stats, suiteFacts({ pass: true }));

    expect(stats.pass).toBe(false);
  });
});
