(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$id (func (param f64) (result i32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vd (func (param f64)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportExpectedFinite" (func $assembly/internal/Expectation/reportExpectedFinite (param i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00F\00i\00n\00i\00t\00e\00")
 (data (i32.const 48) "\10\00\00\00\\\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00o\00r\00m\00a\00l\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00s\00 \00t\00o\00 \00b\00e\00 \00f\00i\00n\00i\00t\00e\00")
 (data (i32.const 160) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 216) "\10\00\00\00\1c\00\00\00\00\00\00\00\00\00\00\001\000\00.\000\00 \00i\00s\00 \00f\00i\00n\00i\00t\00e\00")
 (data (i32.const 264) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 344) "\10\00\00\00d\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00n\00o\00r\00m\00a\00l\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00f\00i\00n\00i\00t\00e\00")
 (data (i32.const 464) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 480) "\10\00\00\00J\00\00\00\00\00\00\00\00\00\00\00N\00o\00r\00m\00a\00l\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00f\00i\00n\00i\00t\00e\00.\00")
 (data (i32.const 576) "\10\00\00\00>\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00f\00o\00r\00 \00i\00n\00t\00e\00g\00e\00r\00 \00v\00a\00l\00u\00e\00s\00")
 (data (i32.const 656) "\10\00\00\00l\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00F\00i\00n\00i\00t\00e\00 \00m\00u\00s\00t\00 \00o\00n\00l\00y\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00w\00i\00t\00h\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 784) "\10\00\00\00f\00\00\00\00\00\00\00\00\00\00\00I\00n\00t\00e\00g\00e\00r\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00t\00h\00i\00s\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 904) "\10\00\00\00h\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00f\00o\00r\00 \00i\00n\00t\00e\00g\00e\00r\00 \00v\00a\00l\00u\00e\00s\00 \00e\00v\00e\00n\00 \00i\00f\00 \00i\00t\00\'\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 1024) "\10\00\00\00N\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00i\00n\00f\00i\00n\00i\00t\00y\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00f\00i\00n\00i\00t\00e\00")
 (data (i32.const 1120) "\10\00\00\00H\00\00\00\00\00\00\00\00\00\00\00I\00n\00f\00i\00n\00i\00t\00y\00 \00i\00s\00 \00n\00o\00t\00 \00f\00i\00n\00i\00t\00e\00 \00b\00y\00 \00d\00e\00f\00i\00n\00i\00t\00i\00o\00n\00")
 (data (i32.const 1208) "\10\00\00\00v\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00n\00f\00i\00n\00i\00t\00y\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00b\00e\00 \00f\00i\00n\00i\00t\00e\00")
 (data (i32.const 1344) "\10\00\00\002\00\00\00\00\00\00\00\00\00\00\00I\00n\00f\00i\00n\00i\00t\00y\00 \00i\00s\00 \00n\00e\00v\00e\00r\00 \00f\00i\00n\00i\00t\00e\00.\00")
 (data (i32.const 1416) "\10\00\00\00D\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00N\00a\00N\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00f\00i\00n\00i\00t\00e\00")
 (data (i32.const 1504) "\10\00\00\00l\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00n\00 \00a\00c\00t\00u\00a\00l\00 \00N\00a\00N\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00b\00e\00 \00f\00i\00n\00i\00t\00e\00")
 (data (i32.const 1632) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00N\00a\00N\00 \00i\00s\00 \00n\00e\00v\00e\00r\00 \00f\00i\00n\00i\00t\00e\00.\00")
 (data (i32.const 1688) "\10\00\00\00p\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00F\00i\00n\00i\00t\00e\00")
 (data (i32.const 1816) "\10\00\00\00b\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00F\00i\00n\00i\00t\00e\00 \00m\00u\00s\00t\00 \00n\00o\00t\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 1936) "\10\00\00\00n\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00F\00i\00n\00i\00t\00e\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 2064) "\10\00\00\00\9e\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00F\00i\00n\00i\00t\00e\00 \00o\00n\00 \00a\00 \00n\00e\00g\00a\00t\00e\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00")
 (table $0 13 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toBeFinite.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 12))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 2240))
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
   i32.const 176
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
   i32.const 176
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
 (func $~lib/builtins/isFinite<f64> (; 17 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  local.get $0
  local.get $0
  f64.sub
  f64.const 0
  f64.eq
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
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|0 (; 21 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const 10
  call $assembly/internal/Expectation/expect<f64>
  local.set $1
  i32.const 232
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFinite
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 280
   i32.const 456
   i32.const 8
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
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|1 (; 24 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const 10
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $1
  i32.const 480
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFinite
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 280
   i32.const 456
   i32.const 8
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
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 26 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 27 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 28 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 29 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|2 (; 30 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.set $1
  i32.const 480
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFinite
  i32.const 0
  i32.eqz
  if
   i32.const 672
   i32.const 280
   i32.const 459
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 31 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|3 (; 32 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $1
  i32.const 480
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFinite
  i32.const 0
  i32.eqz
  if
   i32.const 672
   i32.const 280
   i32.const 459
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|4 (; 33 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const inf
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $1
  i32.const 1136
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFinite
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 280
   i32.const 456
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|5 (; 34 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const inf
  call $assembly/internal/Expectation/expect<f64>
  local.set $1
  i32.const 480
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFinite
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 280
   i32.const 456
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|6 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $1
  i32.const 1136
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFinite
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 280
   i32.const 456
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|7 (; 36 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $1
  i32.const 480
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedFinite
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 280
   i32.const 456
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 37 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 38 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|8 (; 39 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $1
  i32.const 480
  local.set $0
  i32.const 0
  i32.eqz
  if
   i32.const 1832
   i32.const 280
   i32.const 449
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 40 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0~anonymous|9 (; 41 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $1
  i32.const 480
  local.set $0
  i32.const 0
  i32.eqz
  if
   i32.const 1832
   i32.const 280
   i32.const 449
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/toBeFinite.spec~anonymous|0 (; 42 ;) (type $FUNCSIG$v)
  i32.const 64
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 360
  i32.const 2
  i32.const 496
  call $assembly/internal/Test/throws
  i32.const 592
  i32.const 3
  i32.const 800
  call $assembly/internal/Test/throws
  i32.const 920
  i32.const 4
  i32.const 800
  call $assembly/internal/Test/throws
  i32.const 1040
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1224
  i32.const 6
  i32.const 1360
  call $assembly/internal/Test/throws
  i32.const 1432
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1520
  i32.const 8
  i32.const 1648
  call $assembly/internal/Test/throws
  i32.const 1704
  i32.const 9
  i32.const 1952
  call $assembly/internal/Test/throws
  i32.const 2080
  i32.const 10
  i32.const 1952
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 43 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 44 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toBeFinite.spec (; 45 ;) (type $FUNCSIG$v)
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
  i32.const 11
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 46 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 47 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toBeFinite.spec
 )
 (func $null (; 48 ;) (type $FUNCSIG$v)
 )
)
