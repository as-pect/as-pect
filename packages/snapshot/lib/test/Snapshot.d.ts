import { ISnapshotData } from "../parser";
export declare class Snapshot {
    data: ISnapshotData | null;
    stringified: string | null;
    static fromSnapshotData(data: ISnapshotData): Snapshot;
    static fromString(data: string): Snapshot;
}
//# sourceMappingURL=Snapshot.d.ts.map