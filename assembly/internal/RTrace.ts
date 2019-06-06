// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceCount")
declare function getRTraceCount(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "startRTrace")
declare function startRTrace(label: i32): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "endRTrace")
declare function endRTrace(label: i32): i32;

@global
export class RTrace {
  /**
   * This bool indicates if `RTrace` should call into JavaScript to obtain reference counts.
   */
  public static enabled: bool = true;

  /**
   * This method returns the current number of active references on the heap.
   */
  public static count(): i32 {
    if (RTrace.enabled) return getRTraceCount();
    return 0;
  }

  /**
   * This method starts a new refcounting group, and causes the next call to `RTrace.end(label)` to
   * return a delta in reference counts on the heap.
   *
   * @param {i32} label - The numeric label for this refcounting group.
   */
  public static start(label: i32): void {
    if (RTrace.enabled) startRTrace(label);
  }

  /**
   * This method returns a delta of how many new (positive) or collected (negative) are on the heap.
   *
   * @param {i32} label - The numeric label for this refcounting group.
   */
  public static end(label: i32): i32 {
    if (RTrace.enabled) return endRTrace(label);
    return 0;
  }
}

export function __disableRTrace(): void {
  RTrace.enabled = false;
}
