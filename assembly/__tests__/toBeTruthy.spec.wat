(module
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$id (func (param f64) (result i32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$vd (func (param f64)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedTruthy" (func $assembly/internal/Expectation/reportExpectedTruthy (param i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/Expectation/reportActualNull))
 (import "__aspect" "reportActualReference" (func $assembly/internal/Expectation/reportActualReference (param i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\n\00\00\00t\00o\00B\00e\00T\00r\00u\00t\00h\00y\00")
 (data (i32.const 32) "\1c\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \001\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 96) "\00\00\00\00")
 (data (i32.const 104) " \00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 176) "\1a\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00r\00r\00o\00r\00 \00i\00f\00 \001\00 \00i\00s\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 232) "\0b\00\00\001\00 \00i\00s\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 264) "\1f\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00t\00r\00u\00e\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 336) "\1c\00\00\00T\00r\00u\00e\00 \00i\00s\00 \00t\00r\00u\00t\00h\00y\00 \00b\00y\00 \00d\00e\00f\00i\00n\00i\00t\00i\00o\00n\00")
 (data (i32.const 400) "\"\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00r\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 472) "\0e\00\00\00t\00r\00u\00e\00 \00i\00s\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 504) "+\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00z\00e\00r\00o\00 \00n\00u\00m\00b\00e\00r\00s\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 600) "\0f\00\00\000\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 640) "\1f\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \000\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 712) "$\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00f\00a\00l\00s\00e\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 792) "!\00\00\00F\00a\00l\00s\00e\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00 \00b\00y\00 \00d\00e\00f\00i\00n\00i\00t\00i\00o\00n\00")
 (data (i32.const 864) "#\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00f\00a\00l\00s\00e\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 944) "\13\00\00\00f\00a\00l\00s\00e\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 992) "\"\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00N\00a\00N\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1064) "\18\00\00\00N\00a\00N\00 \00i\00s\00 \00a\00l\00w\00a\00y\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1120) " \00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00N\00a\00N\00 \00i\00s\00 \00n\00o\00t\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 1192) "\11\00\00\00N\00a\00N\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1232) "#\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00u\00l\00l\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1312) "\12\00\00\00N\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1352) "\"\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00n\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1424) ".\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00o\00n\00-\00n\00u\00l\00l\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 1520) "\1f\00\00\00N\00o\00n\00-\00n\00u\00l\00l\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00t\00r\00u\00t\00h\00y\00.\00")
 (data (i32.const 1592) "A\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00n\00o\00n\00-\00n\00u\00l\00l\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (table $0 17 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toBeTruthy.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/__tests__/toBeTruthy.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 16))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 1728))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $start:~lib/allocator/arena (; 11 ;) (type $FUNCSIG$v)
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
 )
 (func $~lib/allocator/arena/__memory_allocate (; 12 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.allocate (; 13 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__memory_allocate
  return
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 14 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 24
    call $~lib/memory/memory.allocate
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
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 15 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/memory/memory.allocate
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
 (func $assembly/internal/Expectation/expect<i32> (; 16 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 17 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $~lib/allocator/arena/__memory_free (; 18 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 19 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.0
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.0
  end
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|0 (; 20 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 96
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 225
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Test/it (; 21 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 22 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|1 (; 23 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $0
  i32.const 96
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 225
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Test/throws (; 24 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $assembly/internal/Expectation/Expectation<bool>#constructor (; 25 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 5
    call $~lib/memory/memory.allocate
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
  i32.const 0
  i32.ne
  i32.store8 offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<bool> (; 26 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<bool>#reportActual (; 27 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<bool>#cleanup (; 28 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.1
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.1
  end
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|2 (; 29 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<bool>
  local.set $0
  i32.const 336
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  i32.const 0
  i32.eq
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 225
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<bool>#get:not (; 30 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|3 (; 31 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<bool>
  call $assembly/internal/Expectation/Expectation<bool>#get:not
  local.set $0
  i32.const 96
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  i32.const 0
  i32.eq
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 225
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|4 (; 32 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $0
  i32.const 600
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 225
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|5 (; 33 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 96
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 225
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|6 (; 34 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<bool>
  call $assembly/internal/Expectation/Expectation<bool>#get:not
  local.set $0
  i32.const 792
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  i32.const 0
  i32.eq
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 225
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|7 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<bool>
  local.set $0
  i32.const 96
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  i32.const 0
  i32.eq
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 225
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (; 36 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 16
    call $~lib/memory/memory.allocate
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
 (func $assembly/internal/Expectation/expect<f64> (; 37 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<f64>#get:not (; 38 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportActual (; 39 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  f64.load offset=8
  call $assembly/internal/Expectation/reportActualFloat
 )
 (func $assembly/internal/Expectation/Expectation<f64>#cleanup (; 40 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.2
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.2
  end
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|8 (; 41 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $0
  i32.const 1064
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  block $~lib/builtins/isNaN<f64>|inlined.0 (result i32)
   local.get $0
   f64.load offset=8
   local.set $2
   local.get $2
   local.get $2
   f64.ne
  end
  local.tee $3
  i32.const 0
  i32.ne
  if (result i32)
   local.get $3
  else   
   local.get $0
   f64.load offset=8
   f64.const 0
   f64.eq
  end
  local.set $3
  local.get $0
  i32.load
  local.get $3
  i32.const 0
  i32.ne
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 221
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|9 (; 42 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $0
  i32.const 1064
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  block $~lib/builtins/isNaN<f64>|inlined.1 (result i32)
   local.get $0
   f64.load offset=8
   local.set $2
   local.get $2
   local.get $2
   f64.ne
  end
  local.tee $3
  i32.const 0
  i32.ne
  if (result i32)
   local.get $3
  else   
   local.get $0
   f64.load offset=8
   f64.const 0
   f64.eq
  end
  local.set $3
  local.get $0
  i32.load
  local.get $3
  i32.const 0
  i32.ne
  i32.eqz
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 104
   i32.const 221
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 43 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/memory/memory.allocate
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 44 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 45 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual (; 46 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   call $assembly/internal/Expectation/reportActualNull
  else   
   local.get $0
   i32.load offset=4
   i32.const 24
   call $assembly/internal/Expectation/reportActualReference
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup (; 47 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.3
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.3
  end
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|10 (; 48 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $0
  i32.const 1312
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   local.get $0
   i32.load
   i32.eqz
   if
    local.get $1
    i32.const 104
    i32.const 209
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   i32.load
   i32.eqz
   i32.eqz
   if
    local.get $1
    i32.const 104
    i32.const 215
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|11 (; 49 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  i32.const 96
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   local.get $0
   i32.load
   i32.eqz
   if
    local.get $1
    i32.const 104
    i32.const 209
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   i32.load
   i32.eqz
   i32.eqz
   if
    local.get $1
    i32.const 104
    i32.const 215
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|12 (; 50 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toBeTruthy.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  i32.const 1520
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   local.get $0
   i32.load
   i32.eqz
   if
    local.get $1
    i32.const 104
    i32.const 209
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   i32.load
   i32.eqz
   i32.eqz
   if
    local.get $1
    i32.const 104
    i32.const 215
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0~anonymous|13 (; 51 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toBeTruthy.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $0
  i32.const 96
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedTruthy
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   local.get $0
   i32.load
   i32.eqz
   if
    local.get $1
    i32.const 104
    i32.const 209
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   i32.load
   i32.eqz
   i32.eqz
   if
    local.get $1
    i32.const 104
    i32.const 215
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBeTruthy.spec~anonymous|0 (; 52 ;) (type $FUNCSIG$v)
  i32.const 32
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 176
  i32.const 2
  i32.const 232
  call $assembly/internal/Test/throws
  i32.const 264
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 400
  i32.const 4
  i32.const 472
  call $assembly/internal/Test/throws
  i32.const 504
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 640
  i32.const 6
  i32.const 600
  call $assembly/internal/Test/throws
  i32.const 712
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 864
  i32.const 8
  i32.const 944
  call $assembly/internal/Test/throws
  i32.const 992
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 1120
  i32.const 10
  i32.const 1192
  call $assembly/internal/Test/throws
  i32.const 1232
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 1352
  i32.const 12
  i32.const 1312
  call $assembly/internal/Test/throws
  i32.const 1424
  i32.const 13
  call $assembly/internal/Test/it
  i32.const 1592
  i32.const 14
  i32.const 1520
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 53 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 54 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toBeTruthy.spec (; 55 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toBeTruthy.spec/vec1
  i32.const 8
  i32.const 15
  call $assembly/internal/Describe/describe
 )
 (func $start (; 56 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toBeTruthy.spec
 )
 (func $null (; 57 ;) (type $FUNCSIG$v)
 )
)
