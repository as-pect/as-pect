import { OBJECT, TOTAL_OVERHEAD } from "rt/common";
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
@external("__aspect", "getRTraceMoves")
declare function getRTraceMoves(): i32;

// @ts-ignore
@external("__aspect", "getRTraceNodeMoves")
declare function getRTraceNodeMoves(): i32;

@global
export class RTrace {
  public static enabled: bool = true;

  public static count(): i32 {
    if (RTrace.enabled) return getRTraceCount();
    return 0;
  }

  public static start(label: i32): void {
    if (RTrace.enabled) startRTrace(label);
  }

  public static end(label: i32): i32 {
    if (RTrace.enabled) return endRTrace(label);
    return 0;
  }

  public static increments(): i32 {
    if (RTrace.enabled) return getRTraceIncrements();
    return 0;
  }

  public static decrements(): i32 {
    if (RTrace.enabled) return getRTraceDecrements();
    return 0;
  }

  public static nodeIncrements(): i32 {
    if (RTrace.enabled) return getRTraceNodeIncrements();
    return 0;
  }

  public static nodeDecrements(): i32 {
    if (RTrace.enabled) return getRTraceNodeDecrements();
    return 0;
  }

  public static allocations(): i32 {
    if (RTrace.enabled) return getRTraceAllocations();
    return 0;
  }

  public static frees(): i32 {
    if (RTrace.enabled) return getRTraceFrees();
    return 0;
  }

  public static nodeAllocations(): i32 {
    if (RTrace.enabled) return getRTraceNodeAllocations();
    return 0;
  }

  public static nodeFrees(): i32 {
    if (RTrace.enabled) return getRTraceNodeFrees();
    return 0;
  }

  public static collect(): void {
    __collect();
  }

  public static typeIdOf(pointer: usize): u32 {
    return changetype<OBJECT>(pointer - TOTAL_OVERHEAD).rtId;
  }

  public static typeIdOfReference<T>(reference: T): u32 {
    if (!isReference<T>())
      ERROR("Cannot get typeId of type T when T is not a reference.");
    if (isFunction<T>())
      ERROR("Cannot get typeId of type T when T is a function.");
    assert(
      changetype<usize>(reference) != 0,
      "Cannot get typeId of reference that is null.",
    );

    return RTrace.typeIdOf(changetype<usize>(reference));
  }

  public static sizeOf(pointer: usize): u32 {
    return changetype<OBJECT>(pointer - TOTAL_OVERHEAD).rtSize;
  }

  public static sizeOfReference<T>(reference: T): u32 {
    if (!isReference<T>())
      ERROR("Cannot get size of type T when T is not a reference.");
    if (isFunction<T>())
      ERROR("Cannot get size of type T when T is a function");
    assert(
      changetype<usize>(reference) != 0,
      "Cannot get size of reference that is null.",
    );
    if (isManaged<T>()) {
      return RTrace.sizeOf(changetype<usize>(reference));
    }
    return offsetof<T>();
  }

  public static activeBlocks(): usize[] {
    return getRTraceBlocks();
  }

  public static activeNodeBlocks(): usize[] {
    return getRTraceNodeBlocks();
  }

  public static refCountOf(ptr: usize): u32 {
    return changetype<OBJECT>(ptr - TOTAL_OVERHEAD).gcInfo & REFCOUNT_MASK;
  }

  public static refCountOfReference<T>(reference: T): u32 {
    if (!isManaged<T>()) return 0;
    if (!isReference<T>())
      ERROR("Cannot get refCount of type T when T is not a reference.");
    if (isFunction<T>())
      ERROR("Cannot get refCount of type T when T is a function");

    assert(
      changetype<usize>(reference) != 0,
      "Cannot get refCount of reference that is null.",
    );
    let count = RTrace.refCountOf(changetype<usize>(reference));
    return ASC_OPTIMIZE_LEVEL > 0 ? count : count - 1;
  }

  /** Count the total number of block moves */
  public static moves(): i32 {
    return getRTraceMoves();
  }

  public static nodeMoves(): i32 {
    return getRTraceNodeMoves();
  }
}

export function __disableRTrace(): void {
  RTrace.enabled = false;
}

export function __getUsizeArrayId(): u32 {
  return idof<usize[]>();
}
