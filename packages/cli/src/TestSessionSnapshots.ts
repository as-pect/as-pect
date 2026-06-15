import path from "path";
import { Snapshot } from "@as-pect/snapshots";

export const enum SnapshotMode {
  WriteSnapshots,
  CompareSnapshots,
}

export interface TestSessionSnapshotFileSystem {
  access(path: string): Promise<void>;
  existsSync(path: string): boolean;
  mkdir(path: string): Promise<void>;
  readFile(path: string, encoding: BufferEncoding): Promise<string>;
  writeFile(path: string, contents: string, encoding?: BufferEncoding): Promise<void>;
}

export interface SnapshotUpdatePlanLike {
  readonly shouldWrite: boolean;
  applyTo(snapshot: Snapshot): Snapshot;
}

export interface CompareSnapshotWriteFacts {
  expectedSnapshots: Snapshot;
  updatePlan: SnapshotUpdatePlanLike;
}

export interface WriteSnapshotWriteFacts {
  expectedSnapshots: Snapshot;
  rootPassed: boolean;
  updatePlan: SnapshotUpdatePlanLike;
}

export type SnapshotWriteFacts = CompareSnapshotWriteFacts | WriteSnapshotWriteFacts;

export interface TestSessionSnapshotPlan {
  expectedSnapshots: Snapshot | undefined;
  mode: SnapshotMode;
  snapshotPath: string;
  applySnapshotWrites(facts: SnapshotWriteFacts): Promise<void>;
}

export interface PlanTestSessionSnapshotsOptions {
  entry: string;
  fileSystem: TestSessionSnapshotFileSystem;
  log?: (message: string) => void;
  updateSnapshots: boolean;
}

export async function planTestSessionSnapshots({
  entry,
  fileSystem,
  log,
  updateSnapshots,
}: PlanTestSessionSnapshotsOptions): Promise<TestSessionSnapshotPlan> {
  const dir = path.dirname(entry);
  const basename = path.basename(entry, path.extname(entry));
  const snapshotPath = path.join(dir, "__snapshots__", basename + ".snap");
  const mode = updateSnapshots ? SnapshotMode.WriteSnapshots : SnapshotMode.CompareSnapshots;
  const expectedSnapshots = await loadExpectedSnapshots(fileSystem, snapshotPath, mode);

  return {
    expectedSnapshots,
    mode,
    snapshotPath,
    applySnapshotWrites(facts) {
      return mode === SnapshotMode.CompareSnapshots
        ? applyCompareSnapshotWrites(fileSystem, snapshotPath, facts as CompareSnapshotWriteFacts)
        : applyWriteSnapshotWrites(fileSystem, snapshotPath, facts as WriteSnapshotWriteFacts, log);
    },
  };
}

async function loadExpectedSnapshots(
  fileSystem: TestSessionSnapshotFileSystem,
  snapshotPath: string,
  mode: SnapshotMode,
): Promise<Snapshot | undefined> {
  if (mode !== SnapshotMode.CompareSnapshots || !fileSystem.existsSync(snapshotPath)) {
    return void 0;
  }

  return Snapshot.parse(await fileSystem.readFile(snapshotPath, "utf8"));
}

async function applyCompareSnapshotWrites(
  fileSystem: TestSessionSnapshotFileSystem,
  snapshotPath: string,
  facts: CompareSnapshotWriteFacts,
): Promise<void> {
  if (!facts.updatePlan.shouldWrite) return;

  facts.updatePlan.applyTo(facts.expectedSnapshots);
  await fileSystem.writeFile(snapshotPath, facts.expectedSnapshots.stringify(), "utf8");
}

async function applyWriteSnapshotWrites(
  fileSystem: TestSessionSnapshotFileSystem,
  snapshotPath: string,
  facts: WriteSnapshotWriteFacts,
  log: ((message: string) => void) | undefined,
): Promise<void> {
  if (!facts.rootPassed || !facts.updatePlan.shouldWrite) return;

  log?.("Creating Snapshots.");

  const snapshotDir = path.dirname(snapshotPath);
  try {
    await fileSystem.access(snapshotDir);
  } catch (ex) {
    await fileSystem.mkdir(snapshotDir);
  }

  facts.updatePlan.applyTo(facts.expectedSnapshots);
  await fileSystem.writeFile(snapshotPath, facts.expectedSnapshots.stringify(), "utf8");
}
