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
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedTruthy" (func $assembly/internal/Expectation/reportExpectedTruthy (param i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/Expectation/reportActualNull))
 (import "__aspect" "reportActualString" (func $assembly/internal/Expectation/reportActualString (param i32)))
 (import "__aspect" "reportActualReference" (func $assembly/internal/Expectation/reportActualReference (param i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 64) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00T\00r\00u\00t\00h\00y\00")
 (data (i32.const 104) "\10\00\00\008\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \001\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 176) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 192) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 272) "\10\00\00\004\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00r\00r\00o\00r\00 \00i\00f\00 \001\00 \00i\00s\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 344) "\10\00\00\00\16\00\00\00\00\00\00\00\00\00\00\001\00 \00i\00s\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 384) "\10\00\00\00>\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00t\00r\00u\00e\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 464) "\10\00\00\008\00\00\00\00\00\00\00\00\00\00\00T\00r\00u\00e\00 \00i\00s\00 \00t\00r\00u\00t\00h\00y\00 \00b\00y\00 \00d\00e\00f\00i\00n\00i\00t\00i\00o\00n\00")
 (data (i32.const 536) "\10\00\00\00D\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00r\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 624) "\10\00\00\00\1c\00\00\00\00\00\00\00\00\00\00\00t\00r\00u\00e\00 \00i\00s\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 672) "\10\00\00\00V\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00z\00e\00r\00o\00 \00n\00u\00m\00b\00e\00r\00s\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 776) "\10\00\00\00\1e\00\00\00\00\00\00\00\00\00\00\000\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 824) "\10\00\00\00>\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \000\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 904) "\10\00\00\00H\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00f\00a\00l\00s\00e\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 992) "\10\00\00\00B\00\00\00\00\00\00\00\00\00\00\00F\00a\00l\00s\00e\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00 \00b\00y\00 \00d\00e\00f\00i\00n\00i\00t\00i\00o\00n\00")
 (data (i32.const 1080) "\10\00\00\00F\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00f\00a\00l\00s\00e\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1168) "\10\00\00\00&\00\00\00\00\00\00\00\00\00\00\00f\00a\00l\00s\00e\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1224) "\10\00\00\00D\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00N\00a\00N\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1312) "\10\00\00\000\00\00\00\00\00\00\00\00\00\00\00N\00a\00N\00 \00i\00s\00 \00a\00l\00w\00a\00y\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1376) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00N\00a\00N\00 \00i\00s\00 \00n\00o\00t\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 1456) "\10\00\00\00\"\00\00\00\00\00\00\00\00\00\00\00N\00a\00N\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1512) "\10\00\00\00F\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00u\00l\00l\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1600) "\10\00\00\00$\00\00\00\00\00\00\00\00\00\00\00N\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1656) "\10\00\00\00D\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00n\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1744) "\10\00\00\00\\\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00o\00n\00-\00n\00u\00l\00l\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1856) "\10\00\00\00>\00\00\00\00\00\00\00\00\00\00\00N\00o\00n\00-\00n\00u\00l\00l\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00t\00r\00u\00t\00h\00y\00.\00")
 (data (i32.const 1936) "\10\00\00\00\82\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00n\00o\00n\00-\00n\00u\00l\00l\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (table $0 17 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/__tests__/toBeTruthy.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 16))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 2084))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/util/runtime/adjust (; 12 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/allocator/arena/__mem_allocate (; 13 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.allocate (; 14 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 15 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/runtime/register (; 16 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 17 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 18 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 19 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 20 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $~lib/allocator/arena/__mem_free (; 21 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $~lib/memory/memory.free (; 22 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $~lib/allocator/arena/__mem_free
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 23 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|0 (; 24 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<i32>
  local.set $1
  i32.const 192
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 226
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Test/it (; 25 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 26 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|1 (; 27 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $1
  i32.const 192
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 226
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Test/throws (; 28 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $assembly/internal/Expectation/Expectation<bool>#constructor (; 29 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 5
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
   i32.store8 offset=4
   local.get $0
  end
  local.get $1
  i32.store8 offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<bool> (; 30 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<bool>#reportActual (; 31 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<bool>#cleanup (; 32 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|2 (; 33 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<bool>
  local.set $1
  i32.const 480
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<bool>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  i32.const 0
  i32.eq
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 226
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<bool>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<bool>#get:not (; 34 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|3 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<bool>
  call $assembly/internal/Expectation/Expectation<bool>#get:not
  local.set $1
  i32.const 192
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<bool>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  i32.const 0
  i32.eq
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 226
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<bool>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|4 (; 36 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $1
  i32.const 792
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 226
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|5 (; 37 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.set $1
  i32.const 192
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 226
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|6 (; 38 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<bool>
  call $assembly/internal/Expectation/Expectation<bool>#get:not
  local.set $1
  i32.const 1008
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<bool>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  i32.const 0
  i32.eq
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 226
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<bool>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|7 (; 39 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<bool>
  local.set $1
  i32.const 192
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<bool>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  i32.const 0
  i32.eq
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 226
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<bool>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (; 40 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
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
 (func $assembly/internal/Expectation/expect<f64> (; 41 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<f64>#get:not (; 42 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportActual (; 43 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  f64.load offset=8
  call $assembly/internal/Expectation/reportActualFloat
 )
 (func $~lib/builtins/isNaN<f64> (; 44 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  local.get $0
  local.get $0
  f64.ne
 )
 (func $assembly/internal/Expectation/Expectation<f64>#cleanup (; 45 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|8 (; 46 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $1
  i32.const 1328
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isNaN<f64>
  if (result i32)
   i32.const 1
  else   
   local.get $1
   f64.load offset=8
   f64.const 0
   f64.eq
  end
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 222
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|9 (; 47 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $1
  i32.const 1328
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  f64.load offset=8
  call $~lib/builtins/isNaN<f64>
  if (result i32)
   i32.const 1
  else   
   local.get $1
   f64.load offset=8
   f64.const 0
   f64.eq
  end
  local.set $2
  local.get $1
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 208
   i32.const 222
   i32.const 8
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 48 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 21
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 49 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 50 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 51 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual (; 52 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/string/String#get:length (; 53 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
  i32.const 1
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup (; 54 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|10 (; 55 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $1
  i32.const 1616
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   local.get $1
   i32.load
   i32.eqz
   if
    local.get $0
    i32.const 208
    i32.const 209
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $1
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $1
    i32.load offset=4
    local.set $2
    local.get $1
    i32.load
    local.get $2
    call $~lib/string/String#get:length
    i32.const 0
    i32.ne
    i32.xor
    i32.eqz
    if
     local.get $0
     i32.const 208
     i32.const 213
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    local.get $1
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 208
     i32.const 216
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|11 (; 56 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $1
  i32.const 192
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   local.get $1
   i32.load
   i32.eqz
   if
    local.get $0
    i32.const 208
    i32.const 209
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $1
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $1
    i32.load offset=4
    local.set $2
    local.get $1
    i32.load
    local.get $2
    call $~lib/string/String#get:length
    i32.const 0
    i32.ne
    i32.xor
    i32.eqz
    if
     local.get $0
     i32.const 208
     i32.const 213
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    local.get $1
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 208
     i32.const 216
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|12 (; 57 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBeTruthy.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $1
  i32.const 1872
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   local.get $1
   i32.load
   i32.eqz
   if
    local.get $0
    i32.const 208
    i32.const 209
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $1
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $1
    i32.load offset=4
    local.set $2
    local.get $1
    i32.load
    local.get $2
    call $~lib/string/String#get:length
    i32.const 0
    i32.ne
    i32.xor
    i32.eqz
    if
     local.get $0
     i32.const 208
     i32.const 213
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    local.get $1
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 208
     i32.const 216
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|13 (; 58 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBeTruthy.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $1
  i32.const 192
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   local.get $1
   i32.load
   i32.eqz
   if
    local.get $0
    i32.const 208
    i32.const 209
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $1
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $1
    i32.load offset=4
    local.set $2
    local.get $1
    i32.load
    local.get $2
    call $~lib/string/String#get:length
    i32.const 0
    i32.ne
    i32.xor
    i32.eqz
    if
     local.get $0
     i32.const 208
     i32.const 213
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    local.get $1
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $0
     i32.const 208
     i32.const 216
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0 (; 59 ;) (type $FUNCSIG$v)
  i32.const 120
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 288
  i32.const 2
  i32.const 360
  call $assembly/internal/Test/throws
  i32.const 400
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 552
  i32.const 4
  i32.const 640
  call $assembly/internal/Test/throws
  i32.const 688
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 840
  i32.const 6
  i32.const 792
  call $assembly/internal/Test/throws
  i32.const 920
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1096
  i32.const 8
  i32.const 1184
  call $assembly/internal/Test/throws
  i32.const 1240
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 1392
  i32.const 10
  i32.const 1472
  call $assembly/internal/Test/throws
  i32.const 1528
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 1672
  i32.const 12
  i32.const 1616
  call $assembly/internal/Test/throws
  i32.const 1760
  i32.const 13
  call $assembly/internal/Test/it
  i32.const 1952
  i32.const 14
  i32.const 1872
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
 (func $start:assembly/__tests__/toBeTruthy.spec (; 62 ;) (type $FUNCSIG$v)
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
  global.set $assembly/__tests__/toBeTruthy.spec/vec1
  i32.const 80
  i32.const 15
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 63 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 64 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toBeTruthy.spec
 )
 (func $null (; 65 ;) (type $FUNCSIG$v)
 )
)
