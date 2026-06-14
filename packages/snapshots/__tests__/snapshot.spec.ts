import {
  Snapshot,
  SnapshotDiffResultType,
  SnapshotLifecycle,
  SnapshotParseError,
  SnapshotUpdatePlan,
} from "../lib/index.js";

const inputA = `
exports[\`A\`] = \`SomeA {
      a: 1,
      b: 2,
      c: 3
    }\`;

exports[\`B\`] = \`SomeB {
      d: 4,
      e: 5,
      f: 6
    }\`;

exports[\`C\`] = \`SomeC {
      g: 7,
      h: 8,
      i: 9
    }\`;
`;
const inputB = `
exports[\`A\`] = \`SomeA {
      a: 1,
      b: 2,
      c: 3
    }\`;

exports[\`C\`] = \`SomeC {
      g: 4,
      h: 5,
      i: 6
    }\`;

exports[\`D\`] = \`SomeB {
      d: 1,
      e: 2,
      f: 3
    }\`;
`;

const map = new Map<string, string>();
const snapshotFrom = (entries: [string, string][]): Snapshot => Snapshot.from(new Map(entries));
const snapshotEntries = (snapshot: Snapshot): [string, string][] => Array.from(snapshot.values.entries());

describe("Snapshot", () => {
  it("should be instanceof Snapshot", () => {
    expect(new Snapshot()).toBeInstanceOf(Snapshot);
  });

  it("should parse a snapshot file", () => {
    expect(snapshotEntries(Snapshot.parse(inputA))).toEqual([
      ["A", "SomeA {\n      a: 1,\n      b: 2,\n      c: 3\n    }"],
      ["B", "SomeB {\n      d: 4,\n      e: 5,\n      f: 6\n    }"],
      ["C", "SomeC {\n      g: 7,\n      h: 8,\n      i: 9\n    }"],
    ]);
  });

  it("should parse snapshot entries with flexible whitespace", () => {
    const input = "\n\nexports [ `key` ]\n  =\n`value` ;\n";

    expect(snapshotEntries(Snapshot.parse(input))).toEqual([["key", "value"]]);
  });

  it("should parse compatible snapshot names and values as literal strings", () => {
    const input = "exports[`outer[0]!~renders \\ path`] = `line one\\nnot escaped newline marker`;";

    expect(snapshotEntries(Snapshot.parse(input))).toEqual([
      ["outer[0]!~renders \\ path", "line one\\nnot escaped newline marker"],
    ]);
  });

  it("should keep the last duplicate parsed snapshot value", () => {
    const input = "exports[`A`] = `first`;\nexports[`A`] = `second`;";

    expect(snapshotEntries(Snapshot.parse(input))).toEqual([["A", "second"]]);
  });

  it("should stringify a given snapshot", () => {
    expect(Snapshot.from(map).stringify()).toBe("\n");
  });

  it("should round-trip keys and values containing multiple backticks", () => {
    const values = new Map([["key`with``ticks", "value `one` and ``two``"]]);
    const text = Snapshot.from(values).stringify();

    expect(text).toContain("exports[`key\\`with\\`\\`ticks`] = `value \\`one\\` and \\`\\`two\\`\\``;");
    expect(Array.from(Snapshot.parse(text).values.entries())).toEqual(Array.from(values.entries()));
  });

  it("should populate lexer error facts for unterminated snapshot strings", () => {
    let error: unknown;

    try {
      Snapshot.parse("exports[`A`] = `unterminated;");
    } catch (ex) {
      error = ex;
    }

    expect(error).toBeInstanceOf(SnapshotParseError);
    expect((error as SnapshotParseError).lexerErrors.length).toBeGreaterThan(0);
    expect((error as SnapshotParseError).parserErrors).toEqual([]);
    expect((error as SnapshotParseError).message).toContain("Failed to parse snapshot file:");
  });

  it("should populate parser error facts for malformed snapshot syntax", () => {
    let error: unknown;

    try {
      Snapshot.parse("exports[`A`] = `value`");
    } catch (ex) {
      error = ex;
    }

    expect(error).toBeInstanceOf(SnapshotParseError);
    expect((error as SnapshotParseError).lexerErrors).toEqual([]);
    expect((error as SnapshotParseError).parserErrors.length).toBeGreaterThan(0);
    expect((error as SnapshotParseError).message).toContain("Failed to parse snapshot file:");
  });

  it("should populate parser error facts for missing snapshot values", () => {
    let error: unknown;

    try {
      Snapshot.parse("exports[`A`] = ;");
    } catch (ex) {
      error = ex;
    }

    expect(error).toBeInstanceOf(SnapshotParseError);
    expect((error as SnapshotParseError).lexerErrors).toEqual([]);
    expect((error as SnapshotParseError).parserErrors.length).toBeGreaterThan(0);
    expect((error as SnapshotParseError).message).toContain("Failed to parse snapshot file:");
  });

  it("should keep missing snapshot value parse errors useful", () => {
    const error = new SnapshotParseError([], [{ message: "Snapshot entry is missing a value." }]);

    expect(error.parserErrors).toEqual(["Snapshot entry is missing a value."]);
    expect(error.message).toContain("- Snapshot entry is missing a value.");
  });

  it("should diff snapshots", () => {
    const diff = Snapshot.parse(inputA).diff(Snapshot.parse(inputB));

    expect(Array.from(diff.results.keys())).toEqual(["A", "B", "C", "D"]);
    expect(diff.results.get("A")?.type).toBe(SnapshotDiffResultType.NoChange);
    expect(diff.results.get("B")?.type).toBe(SnapshotDiffResultType.Added);
    expect(diff.results.get("C")?.type).toBe(SnapshotDiffResultType.Different);
    expect(diff.results.get("D")?.type).toBe(SnapshotDiffResultType.Removed);
    expect(diff.results.get("C")?.changes).toEqual([
      { count: 1, added: false, removed: false, value: "SomeC {\n" },
      { count: 3, added: false, removed: true, value: "      g: 4,\n      h: 5,\n      i: 6\n" },
      { count: 3, added: true, removed: false, value: "      g: 7,\n      h: 8,\n      i: 9\n" },
      { count: 1, added: false, removed: false, value: "    }" },
    ]);
  });

  it("should keep compatible unchanged snapshot line changes", () => {
    const value = "line one\nline two\n";
    const diff = Snapshot.from(new Map([["A", value]])).diff(Snapshot.from(new Map([["A", value]])));
    const result = diff.results.get("A")!;

    expect(result.type).toBe(SnapshotDiffResultType.NoChange);
    expect(result.changes).toEqual([
      {
        count: 2,
        added: false,
        removed: false,
        value,
      },
    ]);
  });

  it("should keep empty unchanged snapshots as empty line-change payloads", () => {
    const diff = Snapshot.from(new Map([["A", ""]])).diff(Snapshot.from(new Map([["A", ""]])));
    const result = diff.results.get("A")!;

    expect(result.type).toBe(SnapshotDiffResultType.NoChange);
    expect(result.changes).toEqual([]);
  });

  it("should summarize snapshot lifecycle facts", () => {
    const lifecycle = new SnapshotLifecycle(Snapshot.parse(inputA), Snapshot.parse(inputB));

    expect(lifecycle.pass).toBe(false);
    expect(lifecycle.stats).toEqual({
      totalSnapshots: 4,
      addedSnapshots: 1,
      removedSnapshots: 1,
      changedSnapshots: 1,
      passedSnapshots: 2,
    });
    expect(lifecycle.updatePlan.updates).toEqual([
      {
        name: "B",
        value: "SomeB {\n      d: 4,\n      e: 5,\n      f: 6\n    }",
      },
    ]);
  });

  it("should treat added snapshots as passing update work", () => {
    const lifecycle = new SnapshotLifecycle(Snapshot.from(new Map([["A", "value"]])), new Snapshot());
    const updatedSnapshot = lifecycle.updatePlan.applyTo(new Snapshot());

    expect(lifecycle.pass).toBe(true);
    expect(lifecycle.stats).toEqual({
      totalSnapshots: 1,
      addedSnapshots: 1,
      removedSnapshots: 0,
      changedSnapshots: 0,
      passedSnapshots: 1,
    });
    expect(lifecycle.updatePlan.shouldWrite).toBe(true);
    expect(Array.from(updatedSnapshot.values.entries())).toEqual([["A", "value"]]);
  });

  it.each([
    {
      name: "added",
      actual: [["A", "actual A"]] as [string, string][],
      expected: [] as [string, string][],
      pass: true,
      updates: [{ name: "A", value: "actual A" }],
      shouldWrite: true,
    },
    {
      name: "removed",
      actual: [] as [string, string][],
      expected: [["A", "expected A"]] as [string, string][],
      pass: false,
      updates: [],
      shouldWrite: false,
    },
    {
      name: "changed",
      actual: [["A", "actual A"]] as [string, string][],
      expected: [["A", "expected A"]] as [string, string][],
      pass: false,
      updates: [],
      shouldWrite: false,
    },
    {
      name: "unchanged",
      actual: [["A", "same A"]] as [string, string][],
      expected: [["A", "same A"]] as [string, string][],
      pass: true,
      updates: [],
      shouldWrite: false,
    },
  ])("should derive update plans directly for $name snapshots", ({ actual, expected, pass, updates, shouldWrite }) => {
    const lifecycle = new SnapshotLifecycle(snapshotFrom(actual), snapshotFrom(expected));

    expect(lifecycle.pass).toBe(pass);
    expect(lifecycle.updatePlan.updates).toEqual(updates);
    expect(lifecycle.updatePlan.shouldWrite).toBe(shouldWrite);
  });

  it.each([
    {
      name: "all-added",
      actual: [["A", "actual A"]] as [string, string][],
      expected: [] as [string, string][],
      stats: {
        totalSnapshots: 1,
        addedSnapshots: 1,
        removedSnapshots: 0,
        changedSnapshots: 0,
        passedSnapshots: 1,
      },
    },
    {
      name: "all-removed",
      actual: [] as [string, string][],
      expected: [["A", "expected A"]] as [string, string][],
      stats: {
        totalSnapshots: 1,
        addedSnapshots: 0,
        removedSnapshots: 1,
        changedSnapshots: 0,
        passedSnapshots: 0,
      },
    },
    {
      name: "all-unchanged",
      actual: [["A", "value A"]] as [string, string][],
      expected: [["A", "value A"]] as [string, string][],
      stats: {
        totalSnapshots: 1,
        addedSnapshots: 0,
        removedSnapshots: 0,
        changedSnapshots: 0,
        passedSnapshots: 1,
      },
    },
    {
      name: "all-changed",
      actual: [["A", "actual A"]] as [string, string][],
      expected: [["A", "expected A"]] as [string, string][],
      stats: {
        totalSnapshots: 1,
        addedSnapshots: 0,
        removedSnapshots: 0,
        changedSnapshots: 1,
        passedSnapshots: 0,
      },
    },
    {
      name: "mixed",
      actual: [
        ["added", "new value"],
        ["changed", "actual value"],
        ["unchanged", "same value"],
      ] as [string, string][],
      expected: [
        ["changed", "expected value"],
        ["removed", "old value"],
        ["unchanged", "same value"],
      ] as [string, string][],
      stats: {
        totalSnapshots: 4,
        addedSnapshots: 1,
        removedSnapshots: 1,
        changedSnapshots: 1,
        passedSnapshots: 2,
      },
    },
  ])("should count $name snapshot stats using the union of expected and actual keys", ({ actual, expected, stats }) => {
    const lifecycle = new SnapshotLifecycle(snapshotFrom(actual), snapshotFrom(expected));

    expect(lifecycle.stats).toEqual(stats);
    expect(lifecycle.stats.passedSnapshots).toBeLessThanOrEqual(lifecycle.stats.totalSnapshots);
  });

  it("should apply added snapshot updates using exact diff keys", () => {
    const lifecycle = new SnapshotLifecycle(
      Snapshot.from(new Map([["test!~name[0]", "actual value"]])),
      new Snapshot(),
    );
    const updatedSnapshot = lifecycle.updatePlan.applyTo(new Snapshot());

    expect(lifecycle.updatePlan.updates).toEqual([
      {
        name: "test!~name[0]",
        value: "actual value",
      },
    ]);
    expect(Array.from(updatedSnapshot.values.entries())).toEqual([["test!~name[0]", "actual value"]]);
    expect(updatedSnapshot.values.has("test!~name[0][0]")).toBe(false);
  });

  it("should preserve existing snapshot files when applying added snapshot updates", () => {
    const expected = Snapshot.from(new Map([["test!~name[0]", "existing value"]]));
    const actual = Snapshot.from(
      new Map([
        ["test!~name[0]", "existing value"],
        ["test!~name[1]", "new value"],
      ]),
    );
    const updatedSnapshot = new SnapshotLifecycle(actual, expected).updatePlan.applyTo(expected);

    expect(Array.from(updatedSnapshot.values.entries())).toEqual([
      ["test!~name[0]", "existing value"],
      ["test!~name[1]", "new value"],
    ]);
  });

  it("should let update plans overwrite exact keys without allocating suffixes", () => {
    const plan = new SnapshotUpdatePlan([{ name: "test!~name[0]", value: "new value" }]);
    const updatedSnapshot = plan.applyTo(Snapshot.from(new Map([["test!~name[0]", "old value"]])));

    expect(Array.from(updatedSnapshot.values.entries())).toEqual([["test!~name[0]", "new value"]]);
  });

  it("should continue to allocate unique keys when adding snapshots", () => {
    const snapshot = new Snapshot();

    snapshot.add("test!~name", "first value");
    snapshot.add("test!~name", "second value");

    expect(Array.from(snapshot.values.entries())).toEqual([
      ["test!~name[0]", "first value"],
      ["test!~name[1]", "second value"],
    ]);
  });
});
