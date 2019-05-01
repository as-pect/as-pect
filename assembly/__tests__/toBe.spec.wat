(module
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$id (func (param f64) (result i32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$vd (func (param f64)))
 (type $FUNCSIG$vid (func (param i32 f64)))
 (type $FUNCSIG$vdi (func (param f64 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/Expectation/reportActualNull))
 (import "__aspect" "reportActualString" (func $assembly/internal/Expectation/reportActualString (param i32)))
 (import "__aspect" "reportActualReference" (func $assembly/internal/Expectation/reportActualReference (param i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/Expectation/reportExpectedNull (param i32)))
 (import "__aspect" "reportExpectedString" (func $assembly/internal/Expectation/reportExpectedString (param i32 i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/Expectation/reportExpectedReference (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedFloat (param f64 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 64) "\10\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00")
 (data (i32.const 88) "\10\00\00\00b\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00v\00a\00l\00u\00e\00s\00 \00t\00o\00 \00b\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 208) "\10\00\00\00B\00\00\00\00\00\00\00\00\00\00\00T\00w\00o\00 \00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00e\00q\00u\00a\00l\00.\00")
 (data (i32.const 296) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 376) "\10\00\00\00J\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 472) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 488) "\10\00\00\00n\00\00\00\00\00\00\00\00\00\00\00N\00e\00g\00a\00t\00e\00d\00 \00t\00o\00B\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00w\00i\00t\00h\00 \00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 616) "\10\00\00\00f\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00u\00n\00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00v\00a\00l\00u\00e\00s\00 \00t\00o\00 \00u\00n\00e\00q\00u\00a\00l\00.\00")
 (data (i32.const 736) "\10\00\00\00N\00\00\00\00\00\00\00\00\00\00\00T\00w\00o\00 \00u\00n\00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00b\00e\00 \00e\00q\00u\00a\00l\00.\00")
 (data (i32.const 832) "\10\00\00\00N\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00a\00r\00e\00 \00u\00n\00e\00q\00u\00a\00l\00")
 (data (i32.const 928) "\10\00\00\00b\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00w\00i\00t\00h\00 \00u\00n\00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1048) "\10\00\00\00P\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00i\00t\00s\00e\00l\00f\00")
 (data (i32.const 1144) "\10\00\00\00F\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00s\00a\00m\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00i\00t\00s\00e\00l\00f\00")
 (data (i32.const 1232) "\10\00\00\00J\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00i\00t\00s\00e\00l\00f\00")
 (data (i32.const 1328) "\10\00\00\00l\00\00\00\00\00\00\00\00\00\00\00N\00e\00g\00a\00t\00e\00d\00 \00t\00o\00B\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00f\00 \00e\00q\00u\00a\00l\00 \00p\00o\00i\00n\00t\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 1456) "\10\00\00\00X\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00n\00o\00t\00 \00i\00t\00s\00e\00l\00f\00")
 (data (i32.const 1560) "\10\00\00\00T\00\00\00\00\00\00\00\00\00\00\00T\00w\00o\00 \00d\00i\00f\00f\00e\00r\00e\00n\00c\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00n\00\'\00t\00 \00t\00h\00e\00 \00s\00a\00m\00e\00.\00")
 (data (i32.const 1664) "\10\00\00\00`\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00f\00 \00u\00n\00e\00q\00u\00a\00l\00 \00p\00o\00i\00n\00t\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 1776) "\10\00\00\00<\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00u\00l\00l\00s\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 1856) "\10\00\00\00^\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00n\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 1968) "\10\00\00\00^\00\00\00\00\00\00\00\00\00\00\00N\00e\00g\00a\00t\00e\00d\00 \00t\00o\00B\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00s\00 \00o\00f\00 \00n\00u\00l\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 2080) "\10\00\00\00N\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 2176) "\10\00\00\00T\00\00\00\00\00\00\00\00\00\00\00A\00 \00v\00a\00l\00i\00d\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00b\00e\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2280) "\10\00\00\00T\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00")
 (data (i32.const 2384) "\10\00\00\00j\00\00\00\00\00\00\00\00\00\00\00A\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00e\00x\00p\00e\00c\00t\00i\00o\00n\00 \00t\00o\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00i\00t\00\'\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2512) "\10\00\00\00T\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 2616) "\10\00\00\00x\00\00\00\00\00\00\00\00\00\00\00A\00n\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00c\00a\00n\00 \00n\00e\00v\00e\00r\00 \00b\00e\00 \00N\00a\00N\00,\00 \00a\00n\00d\00 \00n\00e\00v\00e\00r\00 \00e\00q\00u\00a\00l\00s\00 \00a\00n\00y\00t\00h\00i\00n\00g\00.\00")
 (data (i32.const 2752) "\10\00\00\00X\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 2856) "\10\00\00\00|\00\00\00\00\00\00\00\00\00\00\00A\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00c\00a\00n\00 \00n\00e\00v\00e\00r\00 \00b\00e\00 \00N\00a\00N\00,\00 \00a\00n\00d\00 \00n\00e\00v\00e\00r\00 \00e\00q\00u\00a\00l\00s\00 \00a\00n\00y\00t\00h\00i\00n\00g\00.\00")
 (data (i32.const 3000) "\10\00\00\00T\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00b\00o\00t\00h\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00N\00a\00N\00")
 (data (i32.const 3104) "\10\00\00\00:\00\00\00\00\00\00\00\00\00\00\00N\00a\00N\00 \00i\00s\00 \00n\00o\00t\00 \00e\00v\00e\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00N\00a\00N\00.\00")
 (table $0 18 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|14 $start:assembly/__tests__/toBe.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/__tests__/toBe.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toBe.spec/vec2 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 17))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 3180))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/util/runtime/adjust (; 16 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 1
  i32.const 32
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.add
  i32.const 1
  i32.sub
  i32.clz
  i32.sub
  i32.shl
 )
 (func $~lib/allocator/arena/__mem_allocate (; 17 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.const 1073741824
  i32.gt_u
  if
   unreachable
  end
  global.get $~lib/allocator/arena/offset
  local.set $1
  local.get $1
  local.get $0
  local.tee $2
  i32.const 1
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.add
  i32.const 7
  i32.add
  i32.const 7
  i32.const -1
  i32.xor
  i32.and
  local.set $4
  current_memory
  local.set $5
  local.get $4
  local.get $5
  i32.const 16
  i32.shl
  i32.gt_u
  if
   local.get $4
   local.get $1
   i32.sub
   i32.const 65535
   i32.add
   i32.const 65535
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.shr_u
   local.set $2
   local.get $5
   local.tee $3
   local.get $2
   local.tee $6
   local.get $3
   local.get $6
   i32.gt_s
   select
   local.set $3
   local.get $3
   grow_memory
   i32.const 0
   i32.lt_s
   if
    local.get $2
    grow_memory
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $4
  global.set $~lib/allocator/arena/offset
  local.get $1
 )
 (func $~lib/memory/memory.allocate (; 18 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 19 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/util/runtime/adjust
  call $~lib/memory/memory.allocate
  local.set $1
  local.get $1
  global.get $~lib/util/runtime/HEADER_MAGIC
  i32.store
  local.get $1
  local.get $0
  i32.store offset=4
  local.get $1
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.add
 )
 (func $~lib/util/runtime/register (; 20 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/memory/HEAP_BASE
  i32.gt_u
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 129
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  local.set $2
  local.get $2
  i32.load
  global.get $~lib/util/runtime/HEADER_MAGIC
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 131
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  local.get $1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 21 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 24
    call $~lib/util/runtime/allocate
    i32.const 17
    call $~lib/util/runtime/register
    local.set $0
   end
   local.get $0
   f64.const 0
   f64.store
   local.get $0
   f64.const 0
   f64.store offset=8
   local.get $0
   f64.const 0
   f64.store offset=16
   local.get $0
  end
  local.get $1
  f64.store
  local.get $0
  local.get $2
  f64.store offset=8
  local.get $0
  local.get $3
  f64.store offset=16
  local.get $0
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 22 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 18
    call $~lib/util/runtime/register
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
  end
  local.get $1
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<i32> (; 23 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 24 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportExpected (; 25 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedInteger
 )
 (func $~lib/allocator/arena/__mem_free (; 26 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $~lib/memory/memory.free (; 27 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $~lib/allocator/arena/__mem_free
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 28 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|0 (; 29 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  local.set $2
  i32.const 42
  local.set $1
  i32.const 224
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Test/it (; 30 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 31 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|1 (; 32 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $2
  i32.const 42
  local.set $1
  i32.const 488
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Test/throws (; 33 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|2 (; 34 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $2
  i32.const 42
  local.set $1
  i32.const 752
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|3 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.set $2
  i32.const 42
  local.set $1
  i32.const 488
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 36 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 19
    call $~lib/util/runtime/register
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
  end
  local.get $1
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 37 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 38 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual (; 39 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   call $assembly/internal/Expectation/reportActualNull
  else   
   block (result i32)
    local.get $0
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $0
    i32.load offset=4
    call $assembly/internal/Expectation/reportActualString
   else    
    block (result i32)
     local.get $0
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $0
     i32.load offset=4
     local.set $1
     local.get $1
     local.get $1
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     call $assembly/internal/Expectation/reportActualReference
    else     
     local.get $0
     i32.load offset=4
     i32.const 24
     call $assembly/internal/Expectation/reportActualReference
    end
   end
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected (; 40 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $1
  i32.const 0
  i32.eq
  if
   local.get $0
   i32.load
   call $assembly/internal/Expectation/reportExpectedNull
  else   
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    local.get $1
    local.get $0
    i32.load
    call $assembly/internal/Expectation/reportExpectedString
   else    
    block (result i32)
     local.get $1
     drop
     i32.const 0
    end
    if
     local.get $1
     local.set $2
     local.get $2
     local.get $2
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     local.get $0
     i32.load
     call $assembly/internal/Expectation/reportExpectedReference
    else     
     local.get $1
     i32.const 24
     local.get $0
     i32.load
     call $assembly/internal/Expectation/reportExpectedReference
    end
   end
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup (; 41 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|4 (; 42 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $2
  global.get $assembly/__tests__/toBe.spec/vec1
  local.set $1
  i32.const 1160
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 43 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|5 (; 44 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $2
  global.get $assembly/__tests__/toBe.spec/vec1
  local.set $1
  i32.const 488
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|6 (; 45 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $2
  global.get $assembly/__tests__/toBe.spec/vec2
  local.set $1
  i32.const 1576
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|7 (; 46 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $2
  global.get $assembly/__tests__/toBe.spec/vec2
  local.set $1
  i32.const 488
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|8 (; 47 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $2
  i32.const 0
  local.set $1
  i32.const 488
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|9 (; 48 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $2
  i32.const 0
  local.set $1
  i32.const 488
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|10 (; 49 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $2
  i32.const 0
  local.set $1
  i32.const 2192
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|11 (; 50 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $2
  i32.const 0
  local.set $1
  i32.const 488
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (; 51 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 16
    call $~lib/util/runtime/allocate
    i32.const 20
    call $~lib/util/runtime/register
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   f64.const 0
   f64.store offset=8
   local.get $0
  end
  local.get $1
  f64.store offset=8
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<f64> (; 52 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportActual (; 53 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  f64.load offset=8
  call $assembly/internal/Expectation/reportActualFloat
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportExpected (; 54 ;) (type $FUNCSIG$vid) (param $0 i32) (param $1 f64)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
 )
 (func $assembly/internal/Expectation/Expectation<f64>#cleanup (; 55 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|12 (; 56 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $2
  f64.const 0
  local.set $0
  i32.const 488
  local.set $1
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  local.get $2
  i32.load
  local.get $0
  local.get $2
  f64.load offset=8
  f64.eq
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|13 (; 57 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  f64.const 0
  call $assembly/internal/Expectation/expect<f64>
  local.set $2
  f64.const nan:0x8000000000000
  local.set $0
  i32.const 488
  local.set $1
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  local.get $2
  i32.load
  local.get $0
  local.get $2
  f64.load offset=8
  f64.eq
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|14 (; 58 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $2
  f64.const nan:0x8000000000000
  local.set $0
  i32.const 488
  local.set $1
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  local.get $2
  i32.load
  local.get $0
  local.get $2
  f64.load offset=8
  f64.eq
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 312
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0 (; 59 ;) (type $FUNCSIG$v)
  i32.const 104
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 392
  i32.const 2
  i32.const 504
  call $assembly/internal/Test/throws
  i32.const 632
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 848
  i32.const 4
  i32.const 944
  call $assembly/internal/Test/throws
  i32.const 1064
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1248
  i32.const 6
  i32.const 1344
  call $assembly/internal/Test/throws
  i32.const 1472
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1248
  i32.const 8
  i32.const 1680
  call $assembly/internal/Test/throws
  i32.const 1792
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 1872
  i32.const 10
  i32.const 1984
  call $assembly/internal/Test/throws
  i32.const 2096
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 2296
  i32.const 12
  i32.const 2400
  call $assembly/internal/Test/throws
  i32.const 2528
  i32.const 13
  i32.const 2632
  call $assembly/internal/Test/throws
  i32.const 2768
  i32.const 14
  i32.const 2872
  call $assembly/internal/Test/throws
  i32.const 3016
  i32.const 15
  i32.const 3120
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 60 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 61 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toBe.spec (; 62 ;) (type $FUNCSIG$v)
  global.get $~lib/memory/HEAP_BASE
  i32.const 7
  i32.add
  i32.const 7
  i32.const -1
  i32.xor
  i32.and
  global.set $~lib/allocator/arena/startOffset
  global.get $~lib/allocator/arena/startOffset
  global.set $~lib/allocator/arena/offset
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toBe.spec/vec1
  i32.const 0
  f64.const 4
  f64.const 5
  f64.const 6
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toBe.spec/vec2
  i32.const 80
  i32.const 16
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 63 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 64 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toBe.spec
 )
 (func $null (; 65 ;) (type $FUNCSIG$v)
 )
)
