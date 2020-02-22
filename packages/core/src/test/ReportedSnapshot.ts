/** The data class representing a reported snapshot. */
export class ReportedSnapshot {
  /** The name of the test. */
  test: string | null = null;
  /** The name of the group. */
  group: string | null = null;
  /** The name of the snapshot. */
  snapshot: string | null = null;
  /** The value of the snapshot. */
  value: string | null = null;
  /** An indicator if the reported snapshot is negated. */
  negated: boolean = false;
}