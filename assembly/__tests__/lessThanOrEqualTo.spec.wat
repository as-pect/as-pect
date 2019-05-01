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
 (type $FUNCSIG$di (func (param i32) (result f64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedFloat (param f64 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/Expectation/reportActualNull))
 (import "__aspect" "reportActualString" (func $assembly/internal/Expectation/reportActualString (param i32)))
 (import "__aspect" "reportActualReference" (func $assembly/internal/Expectation/reportActualReference (param i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/Expectation/reportExpectedNull (param i32)))
 (import "__aspect" "reportExpectedString" (func $assembly/internal/Expectation/reportExpectedString (param i32 i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/Expectation/reportExpectedReference (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 64) "\10\00\00\00,\00\00\00\00\00\00\00\00\00\00\00L\00e\00s\00s\00T\00h\00a\00n\00O\00r\00E\00q\00u\00a\00l\00T\00o\00 \00(\00<\00=\00)\00")
 (data (i32.const 128) "\10\00\00\00\a2\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00o\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 312) "\10\00\00\00n\00\00\00\00\00\00\00\00\00\00\00A\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00w\00i\00t\00h\00 \00s\00m\00a\00l\00l\00e\00r\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 440) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 520) "\10\00\00\00\84\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 672) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 688) "\10\00\00\00\e0\00\00\00\00\00\00\00\00\00\00\00N\00e\00g\00a\00t\00e\00d\00 \00t\00o\00B\00e\00L\00e\00s\00s\00T\00h\00a\00n\00O\00r\00E\00q\00u\00a\00l\00T\00o\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 928) "\10\00\00\00\aa\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00o\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1120) "\10\00\00\00\a4\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00o\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1304) "\10\00\00\00\8c\00\00\00\00\00\00\00\00\00\00\00I\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 1464) "\10\00\00\00\8c\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00o\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 1624) "\10\00\00\00L\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 1720) "\10\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00I\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00e\00q\00u\00a\00l\00s\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 1864) "\10\00\00\00R\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 1968) "\10\00\00\00\\\00\00\00\00\00\00\00\00\00\00\00V\00a\00l\00u\00e\00 \00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00 \00f\00a\00i\00l\00s\00,\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00.\00")
 (data (i32.const 2080) "\10\00\00\00X\00\00\00\00\00\00\00\00\00\00\00V\00a\00l\00u\00e\00 \00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00 \00f\00a\00i\00l\00s\00,\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00.\00")
 (data (i32.const 2184) "\10\00\00\00Z\00\00\00\00\00\00\00\00\00\00\00I\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00.\00")
 (data (i32.const 2296) "\10\00\00\00V\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 2400) "\10\00\00\00^\00\00\00\00\00\00\00\00\00\00\00I\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00.\00")
 (data (i32.const 2512) "\10\00\00\00`\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00e\00r\00i\00f\00y\00 \00o\00n\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00a\00n\00o\00t\00h\00e\00r\00")
 (data (i32.const 2624) "\10\00\00\00\c8\00\00\00\00\00\00\00\00\00\00\00O\00p\00e\00r\00a\00t\00o\00r\00 \00o\00v\00e\00r\00l\00o\00a\00d\00i\00n\00g\00 \00s\00h\00o\00u\00l\00d\00 \00a\00l\00l\00o\00w\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00t\00o\00 \00v\00e\00r\00i\00f\00y\00 \00t\00h\00a\00t\00 \00o\00n\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00a\00n\00o\00t\00h\00e\00r\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 2840) "\10\00\00\00d\00\00\00\00\00\00\00\00\00\00\00N\00u\00l\00l\00a\00b\00l\00e\00 \00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00 \00f\00a\00i\00l\00s\00,\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2960) "\10\00\00\00`\00\00\00\00\00\00\00\00\00\00\00N\00u\00l\00l\00a\00b\00l\00e\00 \00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00 \00f\00a\00i\00l\00s\00,\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 3072) "\10\00\00\00P\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 3168) "\10\00\00\00\98\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00t\00o\00B\00e\00L\00e\00s\00s\00T\00h\00a\00n\00O\00r\00E\00q\00u\00a\00l\00T\00o\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 3336) "\10\00\00\00T\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 3440) "\10\00\00\00\9c\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00t\00o\00B\00e\00L\00e\00s\00s\00T\00h\00a\00n\00O\00r\00E\00q\00u\00a\00l\00T\00o\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (table $0 14 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/__tests__/lessThanOrEqualTo.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/lessThanOrEqualTo.spec/vec2 (mut i32) (i32.const 0))
 (global $assembly/__tests__/lessThanOrEqualTo.spec/vec3 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 13))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 3612))
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
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|0 (; 29 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.set $2
  i32.const 42
  local.set $1
  i32.const 328
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $2
  i32.load offset=4
  local.get $1
  i32.le_s
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 456
   i32.const 368
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
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|1 (; 32 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $2
  i32.const 42
  local.set $1
  i32.const 688
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $2
  i32.load offset=4
  local.get $1
  i32.le_s
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 456
   i32.const 368
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
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|2 (; 34 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $2
  i32.const 0
  local.set $1
  i32.const 688
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $2
  i32.load offset=4
  local.get $1
  i32.le_s
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 456
   i32.const 368
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|3 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  local.set $2
  i32.const 0
  local.set $1
  i32.const 688
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $2
  i32.load offset=4
  local.get $1
  i32.le_s
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 456
   i32.const 368
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|4 (; 36 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  local.set $2
  i32.const 42
  local.set $1
  i32.const 688
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $2
  i32.load offset=4
  local.get $1
  i32.le_s
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 456
   i32.const 368
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|5 (; 37 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $2
  i32.const 42
  local.set $1
  i32.const 688
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $2
  i32.load offset=4
  local.get $1
  i32.le_s
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 456
   i32.const 368
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (; 38 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 16
    call $~lib/util/runtime/allocate
    i32.const 19
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
 (func $assembly/internal/Expectation/expect<f64> (; 39 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportActual (; 40 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  f64.load offset=8
  call $assembly/internal/Expectation/reportActualFloat
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportExpected (; 41 ;) (type $FUNCSIG$vid) (param $0 i32) (param $1 f64)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
 )
 (func $~lib/builtins/isNaN<f64> (; 42 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  local.get $0
  local.get $0
  f64.ne
 )
 (func $assembly/internal/Expectation/Expectation<f64>#cleanup (; 43 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|6 (; 44 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $2
  f64.const 0
  local.set $0
  i32.const 688
  local.set $1
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  local.get $0
  call $~lib/builtins/isNaN<f64>
  i32.eqz
  i32.eqz
  if
   i32.const 1984
   i32.const 456
   i32.const 363
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  f64.load offset=8
  call $~lib/builtins/isNaN<f64>
  i32.eqz
  i32.eqz
  if
   i32.const 2096
   i32.const 456
   i32.const 364
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.load
  local.get $2
  f64.load offset=8
  local.get $0
  f64.le
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 456
   i32.const 368
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|7 (; 45 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  f64.const 0
  call $assembly/internal/Expectation/expect<f64>
  local.set $2
  f64.const nan:0x8000000000000
  local.set $0
  i32.const 688
  local.set $1
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  local.get $0
  call $~lib/builtins/isNaN<f64>
  i32.eqz
  i32.eqz
  if
   i32.const 1984
   i32.const 456
   i32.const 363
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  f64.load offset=8
  call $~lib/builtins/isNaN<f64>
  i32.eqz
  i32.eqz
  if
   i32.const 2096
   i32.const 456
   i32.const 364
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.load
  local.get $2
  f64.load offset=8
  local.get $0
  f64.le
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 456
   i32.const 368
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 46 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 20
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 47 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 48 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual (; 49 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected (; 50 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $assembly/__tests__/setup/Vec3/Vec3#magnitude (; 51 ;) (type $FUNCSIG$di) (param $0 i32) (result f64)
  local.get $0
  f64.load
  local.get $0
  f64.load
  f64.mul
  local.get $0
  f64.load offset=8
  local.get $0
  f64.load offset=8
  f64.mul
  f64.add
  local.get $0
  f64.load offset=16
  local.get $0
  f64.load offset=16
  f64.mul
  f64.add
  f64.sqrt
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup (; 52 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|8 (; 53 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 f64)
  global.get $assembly/__tests__/lessThanOrEqualTo.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $2
  global.get $assembly/__tests__/lessThanOrEqualTo.spec/vec3
  local.set $1
  i32.const 2640
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $1
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2856
   i32.const 456
   i32.const 357
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.load offset=4
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2976
   i32.const 456
   i32.const 358
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.load
  block $assembly/__tests__/setup/Vec3/Vec3#__lessThanOrEqualTo|inlined.0 (result i32)
   local.get $2
   i32.load offset=4
   local.set $4
   local.get $1
   local.set $3
   local.get $4
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $5
   local.get $3
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $6
   local.get $5
   local.get $6
   f64.le
  end
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 456
   i32.const 368
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|9 (; 54 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 f64)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $2
  global.get $assembly/__tests__/lessThanOrEqualTo.spec/vec3
  local.set $1
  i32.const 688
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $1
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2856
   i32.const 456
   i32.const 357
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.load offset=4
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2976
   i32.const 456
   i32.const 358
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.load
  block $assembly/__tests__/setup/Vec3/Vec3#__lessThanOrEqualTo|inlined.1 (result i32)
   local.get $2
   i32.load offset=4
   local.set $4
   local.get $1
   local.set $3
   local.get $4
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $5
   local.get $3
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $6
   local.get $5
   local.get $6
   f64.le
  end
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 456
   i32.const 368
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0~anonymous|10 (; 55 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 f64)
  global.get $assembly/__tests__/lessThanOrEqualTo.spec/vec3
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $2
  i32.const 0
  local.set $1
  i32.const 688
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $1
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2856
   i32.const 456
   i32.const 357
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.load offset=4
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2976
   i32.const 456
   i32.const 358
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.load
  block $assembly/__tests__/setup/Vec3/Vec3#__lessThanOrEqualTo|inlined.2 (result i32)
   local.get $2
   i32.load offset=4
   local.set $4
   local.get $1
   local.set $3
   local.get $4
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $5
   local.get $3
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $6
   local.get $5
   local.get $6
   f64.le
  end
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 456
   i32.const 368
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec~anonymous|0 (; 56 ;) (type $FUNCSIG$v)
  i32.const 144
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 536
  i32.const 2
  i32.const 704
  call $assembly/internal/Test/throws
  i32.const 944
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 1136
  i32.const 4
  i32.const 1320
  call $assembly/internal/Test/throws
  i32.const 1480
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1640
  i32.const 6
  i32.const 1736
  call $assembly/internal/Test/throws
  i32.const 1880
  i32.const 7
  i32.const 2200
  call $assembly/internal/Test/throws
  i32.const 2312
  i32.const 8
  i32.const 2416
  call $assembly/internal/Test/throws
  i32.const 2528
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 3088
  i32.const 10
  i32.const 3184
  call $assembly/internal/Test/throws
  i32.const 3352
  i32.const 11
  i32.const 3456
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 57 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 58 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/lessThanOrEqualTo.spec (; 59 ;) (type $FUNCSIG$v)
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
  global.set $assembly/__tests__/lessThanOrEqualTo.spec/vec1
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/lessThanOrEqualTo.spec/vec2
  i32.const 0
  f64.const 4
  f64.const 5
  f64.const 6
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/lessThanOrEqualTo.spec/vec3
  i32.const 80
  i32.const 12
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 60 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 61 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/lessThanOrEqualTo.spec
 )
 (func $null (; 62 ;) (type $FUNCSIG$v)
 )
)
