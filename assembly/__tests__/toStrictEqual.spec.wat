(module
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/Expectation/reportExpectedNull (param i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/Expectation/reportExpectedReference (param i32 i32 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/Expectation/reportActualNull))
 (import "__aspect" "reportActualReference" (func $assembly/internal/Expectation/reportActualReference (param i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualString" (func $assembly/internal/Expectation/reportActualString (param i32)))
 (import "__aspect" "reportExpectedString" (func $assembly/internal/Expectation/reportExpectedString (param i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 64) "\10\00\00\00&\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 120) "\10\00\00\00\1a\00\00\00\00\00\00\00\00\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00")
 (data (i32.const 168) "\10\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00")
 (data (i32.const 312) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 328) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 408) "\10\00\00\00X\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 512) "\10\00\00\00z\00\00\00\00\00\00\00\00\00\00\00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 656) "\10\00\00\00b\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00t\00h\00a\00t\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 776) "\10\00\00\00`\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 888) "\10\00\00\00z\00\00\00\00\00\00\00\00\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1032) "\10\00\00\00z\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1176) "\10\00\00\00\96\00\00\00\00\00\00\00\00\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 1344) "\10\00\00\00~\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1488) "\10\00\00\00\82\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1640) "\10\00\00\00\a0\00\00\00\00\00\00\00\00\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 1816) "\10\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 1960) "\10\00\00\00\88\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00n\00u\00l\00l\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00 \00v\00a\00l\00u\00e\00s\00")
 (data (i32.const 2112) "\10\00\00\00v\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00s\00t\00r\00i\00t\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 2248) "\10\00\00\00|\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 2392) "\10\00\00\00\90\00\00\00\00\00\00\00\00\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2552) "\10\00\00\00\90\00\00\00\00\00\00\00\00\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2712) "\10\00\00\00H\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 2800) "\10\00\00\00\a4\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00q\00u\00a\00l\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00o\00t\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 2984) "\10\00\00\00\be\00\00\00\00\00\00\00\00\00\00\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (data (i32.const 3192) "\10\00\00\00P\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 3288) "\10\00\00\00\a4\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 3472) "\10\00\00\00\be\00\00\00\00\00\00\00\00\00\00\00N\00o\00n\00-\00s\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (table $0 21 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/vec2 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/vec3 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buffsize (mut i32) (i32.const 0))
 (global $~lib/util/runtime/MAX_BYTELENGTH i32 (i32.const 1073741808))
 (global $assembly/__tests__/toStrictEqual.spec/buff1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buff2 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buff3 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 20))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 3680))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/util/runtime/adjust (; 14 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/allocator/arena/__mem_allocate (; 15 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.allocate (; 16 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 17 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/runtime/register (; 18 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 19 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
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
 (func $~lib/memory/memory.fill (; 20 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  block $~lib/util/memory/memset|inlined.0
   local.get $2
   i32.eqz
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   local.get $1
   i32.store8
   local.get $0
   local.get $2
   i32.add
   i32.const 1
   i32.sub
   local.get $1
   i32.store8
   local.get $2
   i32.const 2
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   i32.const 1
   i32.add
   local.get $1
   i32.store8
   local.get $0
   i32.const 2
   i32.add
   local.get $1
   i32.store8
   local.get $0
   local.get $2
   i32.add
   i32.const 2
   i32.sub
   local.get $1
   i32.store8
   local.get $0
   local.get $2
   i32.add
   i32.const 3
   i32.sub
   local.get $1
   i32.store8
   local.get $2
   i32.const 6
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   i32.const 3
   i32.add
   local.get $1
   i32.store8
   local.get $0
   local.get $2
   i32.add
   i32.const 4
   i32.sub
   local.get $1
   i32.store8
   local.get $2
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   i32.const 0
   local.get $0
   i32.sub
   i32.const 3
   i32.and
   local.set $5
   local.get $0
   local.get $5
   i32.add
   local.set $0
   local.get $2
   local.get $5
   i32.sub
   local.set $2
   local.get $2
   i32.const -4
   i32.and
   local.set $2
   i32.const -1
   i32.const 255
   i32.div_u
   local.get $1
   i32.const 255
   i32.and
   i32.mul
   local.set $4
   local.get $0
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 4
   i32.sub
   local.get $4
   i32.store
   local.get $2
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   i32.const 4
   i32.add
   local.get $4
   i32.store
   local.get $0
   i32.const 8
   i32.add
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 12
   i32.sub
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 8
   i32.sub
   local.get $4
   i32.store
   local.get $2
   i32.const 24
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   i32.const 12
   i32.add
   local.get $4
   i32.store
   local.get $0
   i32.const 16
   i32.add
   local.get $4
   i32.store
   local.get $0
   i32.const 20
   i32.add
   local.get $4
   i32.store
   local.get $0
   i32.const 24
   i32.add
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 28
   i32.sub
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 24
   i32.sub
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 20
   i32.sub
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 16
   i32.sub
   local.get $4
   i32.store
   i32.const 24
   local.get $0
   i32.const 4
   i32.and
   i32.add
   local.set $5
   local.get $0
   local.get $5
   i32.add
   local.set $0
   local.get $2
   local.get $5
   i32.sub
   local.set $2
   local.get $4
   i64.extend_i32_u
   local.get $4
   i64.extend_i32_u
   i64.const 32
   i64.shl
   i64.or
   local.set $6
   block $break|0
    loop $continue|0
     local.get $2
     i32.const 32
     i32.ge_u
     if
      block
       local.get $0
       local.get $6
       i64.store
       local.get $0
       i32.const 8
       i32.add
       local.get $6
       i64.store
       local.get $0
       i32.const 16
       i32.add
       local.get $6
       i64.store
       local.get $0
       i32.const 24
       i32.add
       local.get $6
       i64.store
       local.get $2
       i32.const 32
       i32.sub
       local.set $2
       local.get $0
       i32.const 32
       i32.add
       local.set $0
      end
      br $continue|0
     end
    end
   end
  end
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 21 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  global.get $~lib/util/runtime/MAX_BYTELENGTH
  i32.gt_u
  if
   i32.const 0
   i32.const 80
   i32.const 54
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/util/runtime/allocate
  local.set $2
  local.get $2
  i32.const 0
  local.get $1
  call $~lib/memory/memory.fill
  local.get $2
  i32.const 15
  call $~lib/util/runtime/register
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
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 24 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
 )
 (func $~lib/allocator/arena/__mem_free (; 25 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $~lib/memory/memory.free (; 26 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $~lib/allocator/arena/__mem_free
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 27 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 28 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportExpected (; 29 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedInteger
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 (; 30 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.0
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.set $2
   i32.const 3
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<i32>#toStrictEqualArrayBuffer|inlined.0
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.0 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.0 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.0
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<i32>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.0
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<i32>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.0
   end
   block $assembly/internal/Expectation/Expectation<i32>#toBe|inlined.0
    local.get $2
    local.set $7
    local.get $1
    local.set $8
    i32.const 328
    local.set $9
    local.get $7
    call $assembly/internal/Expectation/Expectation<i32>#reportActual
    local.get $7
    local.get $8
    call $assembly/internal/Expectation/Expectation<i32>#reportExpected
    local.get $7
    i32.load
    local.get $8
    local.get $7
    i32.load offset=4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $9
     i32.const 344
     i32.const 106
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $7
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
   end
  end
 )
 (func $assembly/internal/Test/it (; 31 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 32 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 (; 33 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.1
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   call $assembly/internal/Expectation/Expectation<i32>#get:not
   local.set $2
   i32.const 3
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<i32>#toStrictEqualArrayBuffer|inlined.1
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.1 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.1 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.1
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<i32>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.1
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<i32>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.1
   end
   block $assembly/internal/Expectation/Expectation<i32>#toBe|inlined.1
    local.get $2
    local.set $7
    local.get $1
    local.set $8
    i32.const 328
    local.set $9
    local.get $7
    call $assembly/internal/Expectation/Expectation<i32>#reportActual
    local.get $7
    local.get $8
    call $assembly/internal/Expectation/Expectation<i32>#reportExpected
    local.get $7
    i32.load
    local.get $8
    local.get $7
    i32.load offset=4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $9
     i32.const 344
     i32.const 106
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $7
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
   end
  end
 )
 (func $assembly/internal/Test/throws (; 34 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.2
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   call $assembly/internal/Expectation/Expectation<i32>#get:not
   local.set $2
   i32.const 1
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<i32>#toStrictEqualArrayBuffer|inlined.2
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.2 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.2 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.2
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<i32>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.2
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<i32>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.2
   end
   block $assembly/internal/Expectation/Expectation<i32>#toBe|inlined.2
    local.get $2
    local.set $7
    local.get $1
    local.set $8
    i32.const 328
    local.set $9
    local.get $7
    call $assembly/internal/Expectation/Expectation<i32>#reportActual
    local.get $7
    local.get $8
    call $assembly/internal/Expectation/Expectation<i32>#reportExpected
    local.get $7
    i32.load
    local.get $8
    local.get $7
    i32.load offset=4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $9
     i32.const 344
     i32.const 106
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $7
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
   end
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 (; 36 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.3
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.set $2
   i32.const 1
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<i32>#toStrictEqualArrayBuffer|inlined.3
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.3 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.3 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.3
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<i32>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.3
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<i32>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.3
   end
   block $assembly/internal/Expectation/Expectation<i32>#toBe|inlined.3
    local.get $2
    local.set $7
    local.get $1
    local.set $8
    i32.const 328
    local.set $9
    local.get $7
    call $assembly/internal/Expectation/Expectation<i32>#reportActual
    local.get $7
    local.get $8
    call $assembly/internal/Expectation/Expectation<i32>#reportExpected
    local.get $7
    i32.load
    local.get $8
    local.get $7
    i32.load offset=4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $9
     i32.const 344
     i32.const 106
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $7
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
   end
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 37 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 38 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup (; 39 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual (; 40 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected (; 41 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 (; 42 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/vec3
   local.set $1
   i32.const 1192
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.0
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.4 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.4 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.4
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   end
   block $~lib/memory/memory.compare|inlined.5 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.5 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.5
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 43 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 (; 44 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/vec3
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.1
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.6 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.6 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.6
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   end
   block $~lib/memory/memory.compare|inlined.7 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.7 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.7
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 (; 45 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/vec2
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.2
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.8 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.8 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.8
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   end
   block $~lib/memory/memory.compare|inlined.9 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.9 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.9
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 (; 46 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/vec2
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.3
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.10 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.10 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.10
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   end
   block $~lib/memory/memory.compare|inlined.11 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.11 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.11
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 (; 47 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $2
   i32.const 0
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.4
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.12 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.12 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.12
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   end
   block $~lib/memory/memory.compare|inlined.13 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.13 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.13
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 (; 48 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $2
   i32.const 0
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.5
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.14 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.14 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.14
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   end
   block $~lib/memory/memory.compare|inlined.15 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.15 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.15
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 (; 49 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $2
   i32.const 0
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.6
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.16 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.16 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.16
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   end
   block $~lib/memory/memory.compare|inlined.17 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.17 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.17
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 (; 50 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $2
   i32.const 0
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.7
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.18 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.18 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.18
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   end
   block $~lib/memory/memory.compare|inlined.19 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.19 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.19
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 (; 51 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.8
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.20 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.20 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.20
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   end
   block $~lib/memory/memory.compare|inlined.21 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.21 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.21
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 (; 52 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 0
   end
   if
    block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqualArrayBuffer|inlined.9
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.22 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.22 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.22
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   end
   block $~lib/memory/memory.compare|inlined.23 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 24
    local.set $9
    block $~lib/util/memory/memcmp|inlined.23 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.23
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor (; 53 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer> (; 54 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup (; 55 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportActual (; 56 ;) (type $FUNCSIG$vi) (param $0 i32)
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
     i32.const 1
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
     i32.const 0
     call $assembly/internal/Expectation/reportActualReference
    end
   end
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportExpected (; 57 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
     i32.const 1
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
     i32.const 0
     local.get $0
     i32.load
     call $assembly/internal/Expectation/reportExpectedReference
    end
   end
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 (; 58 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 1
   end
   if
    block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqualArrayBuffer|inlined.0
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.24 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.24 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.24
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
   end
   block $~lib/memory/memory.compare|inlined.25 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 0
    local.set $9
    block $~lib/util/memory/memcmp|inlined.25 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.25
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
   br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not (; 59 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 (; 60 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 1
   end
   if
    block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqualArrayBuffer|inlined.1
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.26 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.26 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.26
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
   end
   block $~lib/memory/memory.compare|inlined.27 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 0
    local.set $9
    block $~lib/util/memory/memcmp|inlined.27 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.27
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
   br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 (; 61 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 1
   end
   if
    block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqualArrayBuffer|inlined.2
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.28 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.28 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.28
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
   end
   block $~lib/memory/memory.compare|inlined.29 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 0
    local.set $9
    block $~lib/util/memory/memcmp|inlined.29 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.29
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
   br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 (; 62 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $1
   i32.const 328
   local.set $0
   block (result i32)
    local.get $1
    drop
    i32.const 1
   end
   if
    block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqualArrayBuffer|inlined.3
     local.get $2
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $4
     local.set $6
     local.get $5
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedNull
     else      
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $5
      i32.load
      call $assembly/internal/Expectation/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/Expectation/reportActualNull
     else      
      local.get $7
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/Expectation/reportActualReference
     end
     local.get $6
     i32.const 0
     i32.eq
     local.set $8
     local.get $7
     i32.const 0
     i32.eq
     local.set $9
     local.get $8
     local.get $9
     i32.xor
     if
      local.get $5
      i32.load
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 188
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $7
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      i32.eq
      local.set $10
      block $~lib/memory/memory.compare|inlined.30 (result i32)
       local.get $7
       local.set $13
       local.get $6
       local.set $12
       local.get $7
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $11
       block $~lib/util/memory/memcmp|inlined.30 (result i32)
        local.get $13
        local.set $16
        local.get $12
        local.set $15
        local.get $11
        local.set $14
        local.get $16
        local.get $15
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.30
        end
        block $break|0
         loop $continue|0
          local.get $14
          i32.const 0
          i32.ne
          if (result i32)
           local.get $16
           i32.load8_u
           local.get $15
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           block
            local.get $14
            i32.const 1
            i32.sub
            local.set $14
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            local.get $15
            i32.const 1
            i32.add
            local.set $15
           end
           br $continue|0
          end
         end
        end
        local.get $14
        if (result i32)
         local.get $16
         i32.load8_u
         local.get $15
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $11
      local.get $5
      i32.load
      local.get $10
      if (result i32)
       local.get $11
      else       
       local.get $10
      end
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 344
       i32.const 194
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
     end
     local.get $5
     call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    end
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportActual
   local.get $2
   local.get $1
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#reportExpected
   local.get $1
   local.get $2
   i32.load offset=4
   i32.eq
   if
    local.get $2
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 132
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
   end
   local.get $1
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $2
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $2
    i32.load
    i32.eqz
    if
     local.get $0
     i32.const 344
     i32.const 140
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
    local.get $2
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
   end
   block $~lib/memory/memory.compare|inlined.31 (result i32)
    local.get $1
    local.set $7
    local.get $2
    i32.load offset=4
    local.set $8
    i32.const 0
    local.set $9
    block $~lib/util/memory/memcmp|inlined.31 (result i32)
     local.get $7
     local.set $4
     local.get $8
     local.set $3
     local.get $9
     local.set $6
     local.get $4
     local.get $3
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.31
     end
     block $break|1
      loop $continue|1
       local.get $6
       i32.const 0
       i32.ne
       if (result i32)
        local.get $4
        i32.load8_u
        local.get $3
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        block
         local.get $6
         i32.const 1
         i32.sub
         local.set $6
         local.get $4
         i32.const 1
         i32.add
         local.set $4
         local.get $3
         i32.const 1
         i32.add
         local.set $3
        end
        br $continue|1
       end
      end
     end
     local.get $6
     if (result i32)
      local.get $4
      i32.load8_u
      local.get $3
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $9
   local.get $2
   i32.load
   local.get $9
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $0
    i32.const 344
    i32.const 150
    i32.const 6
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
   br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0 (; 63 ;) (type $FUNCSIG$v)
  i32.const 184
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 424
  i32.const 2
  i32.const 528
  call $assembly/internal/Test/throws
  i32.const 672
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 792
  i32.const 4
  i32.const 904
  call $assembly/internal/Test/throws
  i32.const 1048
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1360
  i32.const 6
  i32.const 1192
  call $assembly/internal/Test/throws
  i32.const 1504
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1360
  i32.const 8
  i32.const 1656
  call $assembly/internal/Test/throws
  i32.const 1832
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 1976
  i32.const 10
  i32.const 328
  call $assembly/internal/Test/throws
  i32.const 2128
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 2264
  i32.const 12
  i32.const 2408
  call $assembly/internal/Test/throws
  i32.const 2128
  i32.const 13
  call $assembly/internal/Test/it
  i32.const 2264
  i32.const 14
  i32.const 2568
  call $assembly/internal/Test/throws
  i32.const 2728
  i32.const 15
  call $assembly/internal/Test/it
  i32.const 2816
  i32.const 16
  i32.const 3000
  call $assembly/internal/Test/throws
  i32.const 3208
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 3304
  i32.const 18
  i32.const 3488
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 64 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 65 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toStrictEqual.spec (; 66 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 i32)
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
  global.set $assembly/__tests__/toStrictEqual.spec/vec1
  i32.const 0
  f64.const 4
  f64.const 5
  f64.const 6
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/vec2
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/vec3
  i32.const 3
  i32.const 3
  i32.shl
  global.set $assembly/__tests__/toStrictEqual.spec/buffsize
  i32.const 0
  global.get $assembly/__tests__/toStrictEqual.spec/buffsize
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/buff1
  i32.const 0
  global.get $assembly/__tests__/toStrictEqual.spec/buffsize
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/buff2
  i32.const 0
  global.get $assembly/__tests__/toStrictEqual.spec/buffsize
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/buff3
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   local.set $3
   i32.const 0
   local.set $1
   f64.const 1
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $3
   i32.const 0
   local.set $1
   f64.const 1
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $3
   i32.const 0
   local.set $1
   f64.const 4
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   local.set $3
   i32.const 1
   local.set $1
   f64.const 2
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.4
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $3
   i32.const 1
   local.set $1
   f64.const 2
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.5
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $3
   i32.const 1
   local.set $1
   f64.const 5
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.6
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   local.set $3
   i32.const 2
   local.set $1
   f64.const 3
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.7
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $3
   i32.const 2
   local.set $1
   f64.const 3
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.8
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $3
   i32.const 2
   local.set $1
   f64.const 6
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store
  end
  i32.const 136
  i32.const 19
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 67 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 68 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toStrictEqual.spec
 )
 (func $null (; 69 ;) (type $FUNCSIG$v)
 )
)
