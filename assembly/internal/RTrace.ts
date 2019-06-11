// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceCount")
declare function getRTraceCount(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "startRTrace")
declare function startRTrace(label: i32): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "endRTrace")
declare function endRTrace(label: i32): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceIncrements")
declare function getRTraceIncrements(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceDecrements")
declare function getRTraceDecrements(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceGroupIncrements")
declare function getRTraceGroupIncrements(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceGroupDecrements")
declare function getRTraceGroupDecrements(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceTestIncrements")
declare function getRTraceTestIncrements(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceTestDecrements")
declare function getRTraceTestDecrements(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceAllocations")
declare function getRTraceAllocations(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceFrees")
declare function getRTraceFrees(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceGroupAllocations")
declare function getRTraceGroupAllocations(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceGroupFrees")
declare function getRTraceGroupFrees(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceTestAllocations")
declare function getRTraceTestAllocations(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceTestFrees")
declare function getRTraceTestFrees(): i32;


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

  /**
   * This method returns the number of increments that have occurred over the course of a test
   * file.
   */
  public static increments(): i32 {
    if (RTrace.enabled) return getRTraceIncrements();
    return 0;
  }

  /**
   * This method returns the number of decrements that have occurred over the course of a test
   * file.
   */
  public static decrements(): i32 {
    if (RTrace.enabled) return getRTraceDecrements();
    return 0;
  }

  /**
   * This method returns the number of increments that have occurred over the course of a test
   * group.
   */
  public static groupIncrements(): i32 {
    if (RTrace.enabled) return getRTraceGroupIncrements();
    return 0;
  }

  /**
   * This method returns the number of decrements that have occurred over the course of a test
   * group.
   */
  public static groupDecrements(): i32 {
    if (RTrace.enabled) return getRTraceGroupDecrements();
    return 0;
  }

  /**
   * This method returns the number of increments that have occurred over the course of a test
   * group.
   */
  public static testIncrements(): i32 {
    if (RTrace.enabled) return getRTraceTestIncrements();
    return 0;
  }

  /**
   * This method returns the number of decrements that have occurred over the course of a test
   * group.
   */
  public static testDecrements(): i32 {
    if (RTrace.enabled) return getRTraceTestDecrements();
    return 0;
  }

  /**
   * This method returns the number of allocations that have occurred over the course of a test
   * file.
   */
  public static allocations(): i32 {
    if (RTrace.enabled) return getRTraceAllocations();
    return 0;
  }

  /**
   * This method returns the number of frees that have occurred over the course of a test
   * file.
   */
  public static frees(): i32 {
    if (RTrace.enabled) return getRTraceFrees();
    return 0;
  }

  /**
   * This method returns the number of allocations that have occurred over the course of a test
   * group.
   */
  public static groupAllocations(): i32 {
    if (RTrace.enabled) return getRTraceGroupAllocations();
    return 0;
  }

  /**
   * This method returns the number of frees that have occurred over the course of a test
   * group.
   */
  public static groupFrees(): i32 {
    if (RTrace.enabled) return getRTraceGroupFrees();
    return 0;
  }

  /**
   * This method returns the number of allocations that have occurred over the course of a test
   * group.
   */
  public static testAllocations(): i32 {
    if (RTrace.enabled) return getRTraceTestAllocations();
    return 0;
  }

  /**
   * This method returns the number of frees that have occurred over the course of a test
   * group.
   */
  public static testFrees(): i32 {
    if (RTrace.enabled) return getRTraceTestFrees();
    return 0;
  }

  /**
   * This method triggers a manual garbage collection.
   */
  public static collect(): void {
    __collect();
  }

  /**
   * Get the class id of the pointer.
   *
   * @param {usize} pointer - The pointer.
   * @returns {u32} - The class id of the allocated block.
   */
  public static classIdOf(pointer: usize): u32 {
    return load<u32>(pointer - 8);
  }

  /**
   * Get the size of a block or buffer.
   *
   * @param {T} reference - The reference.
   * @returns {u32} - The size of the allocated block.
   */
  public static sizeOf<T>(reference: T): u32 {
    return load<u32>(changetype<usize>(reference) - 4);
  }
}

export function __disableRTrace(): void {
  RTrace.enabled = false;
}
