import { Snapshot, SnapshotData, ISnapshotStringifyOptions } from "../src";
const example1 = `
exports[\`group 1\`][\`test 1\`][\`snapshot 1\`] = \`
  Array<i32> [1, 2, 3]
\`;
`;
const example2 = `
exports[\`group 1\`][\`test 1\`][\`snapshot 1\`] = \`
  Vec3 {
    x: 1.0,
    y: 2.0,
    z: 3.0,
  }
\`;
`;

type SnapshotMock = [string, string, string, string][];

function mock(mock: SnapshotMock): SnapshotData {
  let result: SnapshotData = new Map();

  for (let [group, test, snapshot, value] of mock) {
    if (!result.has(group)) result.set(group, new Map());
    const groupMap = result.get(group)!;

    if (!groupMap.has(test)) groupMap.set(test, new Map());
    const testMap = groupMap.get(test)!;

    testMap.set(snapshot, value);
  }

  return result;
}

const example3 = mock([
  ["group1", "test1", "snapshot1", "testValue"],
  ["group1", "test1", "snapshot2", "testValue2"],
  ["group2", "test1", "snapshot1", "testValue3"],
  ["group2", "test1", "snapshot2", "testValue4"],
  ["group4", "test1", "snapshot1", "testValue7"],
  ["group4", "test1", "snapshot3", "testValue8"],
]);

const example4 = mock([
  ["group1", "test1", "snapshot1", "testValue5"],
  ["group1", "test1", "snapshot2", "testValue6"],
  ["group2", "test1", "snapshot1", "testValue7"],
  ["group2", "test1", "snapshot3", "testValue8"],
  ["group3", "test1", "snapshot1", "testValue7"],
  ["group3", "test1", "snapshot3", "testValue8"],
]);

const example5 = mock([
  ["group1", "test1", "snapshot5", "testValue9"],
  ["group1", "test3", "snapshot6", "someMatchingValue"],
]);

const example6 = mock([
  ["group1", "test2", "snapshot5", "testValue9"],
  ["group1", "test3", "snapshot6", "someMatchingValue"],
]);

const options: Partial<ISnapshotStringifyOptions> = {
  addedFormat: str => "added: " + str,
  defaultFormat: str => "default: " + str,
  indent: 2,
  removedFormat: str => "removed: " + str,
};

describe("Snapshots from strings", () => {
  test("Snapshot shape", () => {
    const result1 = Snapshot.fromString(example1);
    expect(result1).toMatchSnapshot("fromstring");

    const result2 = Snapshot.fromString(example2);
    expect(result2).toMatchSnapshot("fromstring");

    const result3 = Snapshot.fromData(example3);
    expect(result3).toMatchSnapshot("fromdata");

    const result4 = Snapshot.fromData(example4);
    expect(result4).toMatchSnapshot("fromdata");

    expect(result1.diff(result2, options)).toMatchSnapshot("diff");
    expect(result3.diff(result4, options)).toMatchSnapshot("diff");

    const result5 = Snapshot.fromData(example5);
    const result6 = Snapshot.fromData(example6);
    expect(result5.diff(result6, options)).toMatchSnapshot("diff");
  });
});
