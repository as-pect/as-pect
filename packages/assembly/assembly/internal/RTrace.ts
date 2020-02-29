import { BLOCK, BLOCK_OVERHEAD } from "rt/common";
import { REFCOUNT_MASK } from "./runtime";

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
@external("__aspect", "getRTraceNodeIncrements")
declare function getRTraceNodeIncrements(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceNodeDecrements")
declare function getRTraceNodeDecrements(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceAllocations")
declare function getRTraceAllocations(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceFrees")
declare function getRTraceFrees(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceNodeAllocations")
declare function getRTraceNodeAllocations(): i32;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "getRTraceNodeFrees")
declare function getRTraceNodeFrees(): i32;

// @ts-ignore
@external("__aspect", "getRTraceBlocks")
declare function getRTraceBlocks(): usize[];

// @ts-ignore
@external("__aspect", "getRTraceNodeBlocks")
declare function getRTraceNodeBlocks(): usize[];

// @ts-ignore
@external("__aspect", "getRTraceReallocs")
declare function getRTraceReallocs(): i32;

// @ts-ignore
@external("__aspect", "getRTraceNodeReallocs")
declare function getRTraceNodeReallocs(): i32;

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
  public static nodeIncrements(): i32 {
    if (RTrace.enabled) return getRTraceNodeIncrements();
    return 0;
  }

  /**
   * This method returns the number of decrements that have occurred over the course of a test
   * group.
   */
  public static nodeDecrements(): i32 {
    if (RTrace.enabled) return getRTraceNodeDecrements();
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
  public static nodeAllocations(): i32 {
    if (RTrace.enabled) return getRTraceNodeAllocations();
    return 0;
  }

  /**
   * This method returns the number of frees that have occurred over the course of a test
   * group.
   */
  public static nodeFrees(): i32 {
    if (RTrace.enabled) return getRTraceNodeFrees();
    return 0;
  }

  /**
   * This method triggers a manual garbage collection.
   */
  public static collect(): void {
    __collect();
  }

  /**
   * Get the type id (class id) of the pointer.
   *
   * @param {usize} pointer - The pointer.
   * @returns {u32} - The type id of the allocated block.
   */
  public static typeIdOf(pointer: usize): u32 {
    return changetype<BLOCK>(pointer - BLOCK_OVERHEAD).rtId;
  }

  /**
   * Get the type id (class id) of a reference.
   *
   * @param {T} reference - The reference.
   * @returns {u32} - The type id of the allocated block.
   */
  public static typeIdOfReference<T>(reference: T): u32 {
    if (!isReference<T>())
      ERROR("Cannot get typeId of type T when T is not a reference.");
    if (isFunction<T>())
      ERROR("Cannot get typeId of type T when T is a function.");
    if (isNullable<T>()) {
      assert(reference != null, "Cannot get typeId of reference that is null.");
    }

    return RTrace.typeIdOf(changetype<usize>(reference));
  }

  /**
   * Get the size of a pointer.
   *
   * @param {usize} pointer - The pointer.
   * @returns {u32} - The size of the allocated block.
   */
  public static sizeOf(pointer: usize): u32 {
    return changetype<BLOCK>(pointer - BLOCK_OVERHEAD).rtSize;
  }

  /**
   * Get the size of a reference.
   *
   * @param {T} reference - The reference.
   * @returns {u32} - The size of the allocated block.
   */
  public static sizeOfReference<T>(reference: T): u32 {
    if (!isReference<T>())
      ERROR("Cannot get size of type T when T is not a reference.");
    if (isFunction<T>())
      ERROR("Cannot get size of type T when T is a function");
    if (isNullable<T>()) {
      assert(reference != null, "Cannot get size of reference that is null.");
    }

    return RTrace.sizeOf(changetype<usize>(reference));
  }

  /**
   * Get the currently allocated blocks.
   */
  public static activeBlocks(): usize[] {
    return getRTraceBlocks();
  }

  /**
   * Get the current node allocated blocks.
   */
  public static activeNodeBlocks(): usize[] {
    return getRTraceNodeBlocks();
  }


  /**
   * Gets the current reference count of the specified pointer.
   *
   * ╒══════════════════════ GC Info structure ══════════════════════╕
   * │  3                   2                   1                    │
   * │1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0│
   * ├─┼─┴─┴─┼─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┤
   * │B│color│                     refCount                          │
   * └─┴─────┴───────────────────────────────────────────────────────┘
   */
  public static refCountOf(ptr: usize): u32 {
    return changetype<BLOCK>(ptr - BLOCK_OVERHEAD).gcInfo & REFCOUNT_MASK;
  }

  /**
   * Gets the current count of the specified reference.
   * @param {T} reference - the reference.
   */
  public static refCountOfReference<T>(reference: T): u32 {
    if (!isManaged<T>()) return 0;
    if (!isReference<T>())
      ERROR("Cannot get refCount of type T when T is not a reference.");
    if (isFunction<T>())
      ERROR("Cannot get refCount of type T when T is a function");
    if (isNullable<T>()) {
      assert(
        reference != null,
        "Cannot get refCount of reference that is null.",
      );
    }

    let count = RTrace.refCountOf(changetype<usize>(reference));
    return ASC_OPTIMIZE_LEVEL > 0 ? count : count - 1;
  }

  /**
   * Gets the current number of reallocations over the course of the TestContext module.
   */
  public static reallocations(): i32 {
    return getRTraceReallocs();
  }

  /**
   * Gets the current number of reallocations over the course of the TestNOde..
   */
  public static nodeReallocations(): i32 {
    return getRTraceNodeReallocs();
  }
}

export function __disableRTrace(): void {
  RTrace.enabled = false;
}

export function __getUsizeArrayId(): u32 {
  return idof<usize[]>();
}
