(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$id (func (param f64) (result i32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vd (func (param f64)))
 (type $FUNCSIG$vdi (func (param f64 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedFloat (param f64 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00\0e\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00N\00a\00N\00")
 (data (i32.const 40) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00 \00N\00a\00N\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 120) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 176) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00N\00a\00N\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 216) "\10\00\00\00d\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00N\00a\00N\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00m\00u\00s\00t\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00a\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 336) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 416) "\10\00\00\00<\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00N\00a\00N\00 \00i\00s\00 \00n\00o\00t\00 \00N\00a\00N\00")
 (data (i32.const 496) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 512) "\10\00\00\00\1e\00\00\00\00\00\00\00\00\00\00\00N\00a\00N\00 \00m\00u\00s\00t\00 \00b\00e\00 \00N\00a\00N\00")
 (data (i32.const 560) "\10\00\00\00^\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00o\00r\00m\00a\00l\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00s\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00N\00a\00N\00")
 (data (i32.const 672) "\10\00\00\00\1e\00\00\00\00\00\00\00\00\00\00\001\000\00.\000\00 \00i\00s\00 \00n\00o\00t\00 \00N\00a\00N\00")
 (data (i32.const 720) "\10\00\00\00t\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00n\00o\00r\00m\00a\00l\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00b\00e\00 \00N\00a\00N\00")
 (data (i32.const 856) "\10\00\00\00N\00\00\00\00\00\00\00\00\00\00\00N\00o\00r\00m\00a\00l\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00N\00a\00N\00 \00v\00a\00l\00u\00e\00s\00.\00")
 (data (i32.const 952) "\10\00\00\00d\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00i\00n\00g\00 \00t\00o\00B\00e\00N\00a\00N\00 \00o\00n\00 \00a\00n\00 \00i\00n\00t\00e\00g\00e\00r\00 \00t\00y\00p\00e\00")
 (data (i32.const 1072) "\10\00\00\00F\00\00\00\00\00\00\00\00\00\00\00N\00o\00r\00m\00a\00l\00 \00i\00n\00t\00e\00g\00e\00r\00 \00v\00a\00l\00u\00e\00s\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1160) "\10\00\00\00\a8\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00i\00n\00g\00 \00t\00o\00B\00e\00N\00a\00N\00 \00o\00n\00 \00a\00n\00 \00i\00n\00t\00e\00g\00e\00r\00 \00t\00y\00p\00e\00,\00 \00e\00v\00e\00n\00 \00i\00f\00 \00t\00h\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 1344) "\10\00\00\00n\00\00\00\00\00\00\00\00\00\00\00N\00o\00r\00m\00a\00l\00 \00i\00n\00t\00e\00g\00e\00r\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00.\00")
 (data (i32.const 1472) "\10\00\00\00j\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00")
 (data (i32.const 1600) "\10\00\00\00R\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00N\00a\00N\00 \00m\00u\00s\00t\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00u\00s\00i\00n\00g\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 1704) "\10\00\00\00h\00\00\00\00\00\00\00\00\00\00\00R\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00.\00")
 (data (i32.const 1824) "\10\00\00\00\ae\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00,\00 \00e\00v\00e\00n\00 \00i\00f\00 \00t\00h\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 2016) "\10\00\00\00\ac\00\00\00\00\00\00\00\00\00\00\00R\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00,\00 \00e\00v\00e\00n\00 \00i\00f\00 \00t\00h\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00.\00")
 (table $0 11 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toBeNaN.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 10))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 2204))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/util/runtime/adjust (; 9 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/allocator/arena/__mem_allocate (; 10 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.allocate (; 11 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 12 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/runtime/register (; 13 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/memory/HEAP_BASE
  i32.gt_u
  i32.eqz
  if
   i32.const 0
   i32.const 136
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
   i32.const 136
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
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (; 14 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 16
    call $~lib/util/runtime/allocate
    i32.const 17
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
 (func $assembly/internal/Expectation/expect<f64> (; 15 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportActual (; 16 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  f64.load offset=8
  call $assembly/internal/Expectation/reportActualFloat
 )
 (func $~lib/builtins/isNaN<f64> (; 17 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  local.get $0
  local.get $0
  f64.ne
 )
 (func $~lib/allocator/arena/__mem_free (; 18 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $~lib/memory/memory.free (; 19 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $~lib/allocator/arena/__mem_free
 )
 (func $assembly/internal/Expectation/Expectation<f64>#cleanup (; 20 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|0 (; 21 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $1
  i32.const 192
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  f64.const nan:0x8000000000000
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 1
  i32.eqz
  if
   i32.const 232
   i32.const 352
   i32.const 433
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isNaN<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 352
   i32.const 438
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Test/it (; 22 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<f64>#get:not (; 23 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|1 (; 24 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $1
  i32.const 512
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  f64.const nan:0x8000000000000
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 1
  i32.eqz
  if
   i32.const 232
   i32.const 352
   i32.const 433
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isNaN<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 352
   i32.const 438
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Test/throws (; 25 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|2 (; 26 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const 10
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $1
  i32.const 688
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  f64.const nan:0x8000000000000
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 1
  i32.eqz
  if
   i32.const 232
   i32.const 352
   i32.const 433
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isNaN<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 352
   i32.const 438
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|3 (; 27 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const 10
  call $assembly/internal/Expectation/expect<f64>
  local.set $1
  i32.const 512
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  f64.const nan:0x8000000000000
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 1
  i32.eqz
  if
   i32.const 232
   i32.const 352
   i32.const 433
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isNaN<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 352
   i32.const 438
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 28 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 29 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 30 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $~lib/builtins/isNaN<i32> (; 31 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  local.get $0
  i32.ne
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 32 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|4 (; 33 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 10
  call $assembly/internal/Expectation/expect<i32>
  local.set $1
  i32.const 512
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  f64.const nan:0x8000000000000
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 0
  i32.eqz
  if
   i32.const 232
   i32.const 352
   i32.const 433
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=4
  call $~lib/builtins/isNaN<i32>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 352
   i32.const 438
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 34 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|5 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 10
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $1
  i32.const 512
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  f64.const nan:0x8000000000000
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 0
  i32.eqz
  if
   i32.const 232
   i32.const 352
   i32.const 433
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=4
  call $~lib/builtins/isNaN<i32>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 352
   i32.const 438
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 36 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 37 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|6 (; 38 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $1
  i32.const 512
  local.set $0
  i32.const 0
  i32.eqz
  if
   i32.const 1616
   i32.const 352
   i32.const 427
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 39 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|7 (; 40 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $1
  i32.const 512
  local.set $0
  i32.const 0
  i32.eqz
  if
   i32.const 1616
   i32.const 352
   i32.const 427
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0 (; 41 ;) (type $FUNCSIG$v)
  i32.const 56
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 432
  i32.const 2
  i32.const 528
  call $assembly/internal/Test/throws
  i32.const 576
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 736
  i32.const 4
  i32.const 872
  call $assembly/internal/Test/throws
  i32.const 968
  i32.const 5
  i32.const 1088
  call $assembly/internal/Test/throws
  i32.const 1176
  i32.const 6
  i32.const 1360
  call $assembly/internal/Test/throws
  i32.const 1488
  i32.const 7
  i32.const 1720
  call $assembly/internal/Test/throws
  i32.const 1840
  i32.const 8
  i32.const 2032
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 42 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 43 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toBeNaN.spec (; 44 ;) (type $FUNCSIG$v)
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
  i32.const 24
  i32.const 9
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 45 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 46 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toBeNaN.spec
 )
 (func $null (; 47 ;) (type $FUNCSIG$v)
 )
)
