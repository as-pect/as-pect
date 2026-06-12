import { Snapshot, SnapshotDiffResultType, SnapshotLifecycle, SnapshotParseError, SnapshotUpdatePlan } from "../lib/index.js";

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

describe("Snapshot", () => {
  it("should be instanceof Snapshot", () => {
    expect(new Snapshot()).toBeInstanceOf(Snapshot);
  });

  it("should parse a snapshot file", () => {
    expect(Snapshot.parse(inputA)).toMatchSnapshot();
  });

  it("should stringify a given snapshot", () => {
    expect(Snapshot.from(map).stringify()).toMatchSnapshot();
  });

  it("should round-trip keys and values containing multiple backticks", () => {
    const values = new Map([["key`with``ticks", "value `one` and ``two``"]]);
    const text = Snapshot.from(values).stringify();

    expect(text).toContain("exports[`key\\`with\\`\\`ticks`] = `value \\`one\\` and \\`\\`two\\`\\``;");
    expect(Array.from(Snapshot.parse(text).values.entries())).toEqual(Array.from(values.entries()));
  });

  it("should throw an explicit parse error for unterminated snapshot strings", () => {
    expect(() => Snapshot.parse("exports[`A`] = `unterminated;")).toThrow(SnapshotParseError);
  });

  it("should throw an explicit parse error for malformed snapshot syntax", () => {
    let error: unknown;

    try {
      Snapshot.parse("exports[`A`] = `value`");
    } catch (ex) {
      error = ex;
    }

    expect(error).toBeInstanceOf(SnapshotParseError);
    expect((error as SnapshotParseError).parserErrors.length).toBeGreaterThan(0);
  });

  it("should diff snapshots", () => {
    expect(
      Snapshot.parse(inputA).diff(Snapshot.parse(inputB)),
    ).toMatchSnapshot();
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
      totalSnapshots: 3,
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
      totalSnapshots: 0,
      addedSnapshots: 1,
      removedSnapshots: 0,
      changedSnapshots: 0,
      passedSnapshots: 1,
    });
    expect(lifecycle.updatePlan.shouldWrite).toBe(true);
    expect(Array.from(updatedSnapshot.values.entries())).toEqual([["A", "value"]]);
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
    expect(Array.from(updatedSnapshot.values.entries())).toEqual([
      ["test!~name[0]", "actual value"],
    ]);
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
    const updatedSnapshot = plan.applyTo(
      Snapshot.from(new Map([["test!~name[0]", "old value"]])),
    );

    expect(Array.from(updatedSnapshot.values.entries())).toEqual([
      ["test!~name[0]", "new value"],
    ]);
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
