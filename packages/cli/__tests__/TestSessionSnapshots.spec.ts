import { jest } from "@jest/globals";
import { Snapshot } from "@as-pect/snapshots";
import { planTestSessionSnapshots, SnapshotMode, TestSessionSnapshotFileSystem } from "../src/TestSessionSnapshots.js";

const createFileSystem = (overrides: Partial<TestSessionSnapshotFileSystem> = {}): TestSessionSnapshotFileSystem => ({
  access: jest.fn(async () => void 0),
  existsSync: jest.fn(() => false),
  mkdir: jest.fn(async () => void 0),
  readFile: jest.fn(async () => ""),
  writeFile: jest.fn(async () => void 0),
  ...overrides,
});

describe("Test session snapshot planning", () => {
  it("loads expected snapshots in compare mode only when the snapshot file exists", async () => {
    const existingFileSystem = createFileSystem({
      existsSync: jest.fn(() => true),
      readFile: jest.fn(async () => "exports[`test[0]`] = `expected`;\n"),
    });

    const existingPlan = await planTestSessionSnapshots({
      entry: "assembly/__tests__/entry.spec.ts",
      fileSystem: existingFileSystem,
      updateSnapshots: false,
    });

    expect(existingPlan.mode).toBe(SnapshotMode.CompareSnapshots);
    expect(existingPlan.snapshotPath).toBe("assembly/__tests__/__snapshots__/entry.spec.snap");
    expect(existingPlan.expectedSnapshots?.values.get("test[0]")).toBe("expected");
    expect(existingFileSystem.readFile).toHaveBeenCalledWith(
      "assembly/__tests__/__snapshots__/entry.spec.snap",
      "utf8",
    );

    const missingFileSystem = createFileSystem({ existsSync: jest.fn(() => false) });

    const missingPlan = await planTestSessionSnapshots({
      entry: "assembly/__tests__/entry.spec.ts",
      fileSystem: missingFileSystem,
      updateSnapshots: false,
    });

    expect(missingPlan.expectedSnapshots).toBeUndefined();
    expect(missingFileSystem.readFile).not.toHaveBeenCalled();
  });

  it("writes expected snapshots from a compare-mode update plan when the plan should write", async () => {
    const expectedSnapshots = new Snapshot();
    const fileSystem = createFileSystem();
    const plan = await planTestSessionSnapshots({
      entry: "assembly/__tests__/entry.spec.ts",
      fileSystem,
      updateSnapshots: false,
    });

    await plan.applySnapshotWrites({
      expectedSnapshots,
      updatePlan: {
        shouldWrite: true,
        applyTo(snapshot: Snapshot) {
          return snapshot.set("test[0]", "updated");
        },
      },
    });

    expect(fileSystem.writeFile).toHaveBeenCalledWith(
      "assembly/__tests__/__snapshots__/entry.spec.snap",
      "exports[`test[0]`] = `updated`;\n",
      "utf8",
    );
  });

  it("does not write expected snapshots from a compare-mode update plan when there are no updates", async () => {
    const fileSystem = createFileSystem();
    const plan = await planTestSessionSnapshots({
      entry: "assembly/__tests__/entry.spec.ts",
      fileSystem,
      updateSnapshots: false,
    });

    await plan.applySnapshotWrites({
      expectedSnapshots: new Snapshot(),
      updatePlan: {
        shouldWrite: false,
        applyTo(snapshot: Snapshot) {
          return snapshot;
        },
      },
    });

    expect(fileSystem.writeFile).not.toHaveBeenCalled();
  });

  it("creates the snapshots directory in write mode when it is missing", async () => {
    const fileSystem = createFileSystem({
      access: jest.fn(async () => {
        throw new Error("missing");
      }),
    });
    const plan = await planTestSessionSnapshots({
      entry: "assembly/__tests__/entry.spec.ts",
      fileSystem,
      updateSnapshots: true,
    });

    await plan.applySnapshotWrites({
      actualSnapshots: new Snapshot(),
      rootPassed: true,
    });

    expect(fileSystem.access).toHaveBeenCalledWith("assembly/__tests__/__snapshots__");
    expect(fileSystem.mkdir).toHaveBeenCalledWith("assembly/__tests__/__snapshots__");
  });

  it("writes actual snapshots in write mode only when the root test node passes", async () => {
    const passingFileSystem = createFileSystem();
    const passingPlan = await planTestSessionSnapshots({
      entry: "assembly/__tests__/entry.spec.ts",
      fileSystem: passingFileSystem,
      updateSnapshots: true,
    });
    const actualSnapshots = Snapshot.from(new Map([["test[0]", "actual"]]));

    await passingPlan.applySnapshotWrites({ actualSnapshots, rootPassed: true });

    expect(passingFileSystem.writeFile).toHaveBeenCalledWith(
      "assembly/__tests__/__snapshots__/entry.spec.snap",
      "exports[`test[0]`] = `actual`;\n",
      "utf8",
    );

    const failingFileSystem = createFileSystem();
    const failingPlan = await planTestSessionSnapshots({
      entry: "assembly/__tests__/entry.spec.ts",
      fileSystem: failingFileSystem,
      updateSnapshots: true,
    });

    await failingPlan.applySnapshotWrites({ actualSnapshots, rootPassed: false });

    expect(failingFileSystem.writeFile).not.toHaveBeenCalled();
  });
});
