(module
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$id (func (param f64) (result i32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$vd (func (param f64)))
 (type $FUNCSIG$vid (func (param i32 f64)))
 (type $FUNCSIG$vdi (func (param f64 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/Expectation/reportActualNull))
 (import "__aspect" "reportActualReference" (func $assembly/internal/Expectation/reportActualReference (param i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/Expectation/reportExpectedNull (param i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/Expectation/reportExpectedReference (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedFloat (param f64 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\04\00\00\00t\00o\00B\00e\00")
 (data (i32.const 24) "1\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00v\00a\00l\00u\00e\00s\00 \00t\00o\00 \00b\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 128) "!\00\00\00T\00w\00o\00 \00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00e\00q\00u\00a\00l\00.\00")
 (data (i32.const 200) " \00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 272) "%\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 352) "\00\00\00\00")
 (data (i32.const 360) "7\00\00\00N\00e\00g\00a\00t\00e\00d\00 \00t\00o\00B\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00w\00i\00t\00h\00 \00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 480) "3\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00u\00n\00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00v\00a\00l\00u\00e\00s\00 \00t\00o\00 \00u\00n\00e\00q\00u\00a\00l\00.\00")
 (data (i32.const 592) "\'\00\00\00T\00w\00o\00 \00u\00n\00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00b\00e\00 \00e\00q\00u\00a\00l\00.\00")
 (data (i32.const 680) "\'\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00a\00r\00e\00 \00u\00n\00e\00q\00u\00a\00l\00")
 (data (i32.const 768) "1\00\00\00t\00o\00B\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00w\00i\00t\00h\00 \00u\00n\00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 872) "(\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00i\00t\00s\00e\00l\00f\00")
 (data (i32.const 960) "#\00\00\00T\00h\00e\00 \00s\00a\00m\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00i\00t\00s\00e\00l\00f\00")
 (data (i32.const 1040) "%\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00i\00t\00s\00e\00l\00f\00")
 (data (i32.const 1120) "6\00\00\00N\00e\00g\00a\00t\00e\00d\00 \00t\00o\00B\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00f\00 \00e\00q\00u\00a\00l\00 \00p\00o\00i\00n\00t\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 1232) ",\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00n\00o\00t\00 \00i\00t\00s\00e\00l\00f\00")
 (data (i32.const 1328) "*\00\00\00T\00w\00o\00 \00d\00i\00f\00f\00e\00r\00e\00n\00c\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00n\00\'\00t\00 \00t\00h\00e\00 \00s\00a\00m\00e\00.\00")
 (data (i32.const 1416) "0\00\00\00t\00o\00B\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00f\00 \00u\00n\00e\00q\00u\00a\00l\00 \00p\00o\00i\00n\00t\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 1520) "\1e\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00u\00l\00l\00s\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 1584) "/\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00n\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 1688) "/\00\00\00N\00e\00g\00a\00t\00e\00d\00 \00t\00o\00B\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00s\00 \00o\00f\00 \00n\00u\00l\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1792) "\'\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 1880) "*\00\00\00A\00 \00v\00a\00l\00i\00d\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00b\00e\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 1968) "*\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00")
 (data (i32.const 2056) "5\00\00\00A\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00e\00x\00p\00e\00c\00t\00i\00o\00n\00 \00t\00o\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00i\00t\00\'\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2168) "*\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 2256) "<\00\00\00A\00n\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00c\00a\00n\00 \00n\00e\00v\00e\00r\00 \00b\00e\00 \00N\00a\00N\00,\00 \00a\00n\00d\00 \00n\00e\00v\00e\00r\00 \00e\00q\00u\00a\00l\00s\00 \00a\00n\00y\00t\00h\00i\00n\00g\00.\00")
 (data (i32.const 2384) ",\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 2480) ">\00\00\00A\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00c\00a\00n\00 \00n\00e\00v\00e\00r\00 \00b\00e\00 \00N\00a\00N\00,\00 \00a\00n\00d\00 \00n\00e\00v\00e\00r\00 \00e\00q\00u\00a\00l\00s\00 \00a\00n\00y\00t\00h\00i\00n\00g\00.\00")
 (data (i32.const 2608) "*\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00b\00o\00t\00h\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00N\00a\00N\00")
 (data (i32.const 2696) "\1d\00\00\00N\00a\00N\00 \00i\00s\00 \00n\00o\00t\00 \00e\00v\00e\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00N\00a\00N\00.\00")
 (table $0 18 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|14 $start:assembly/__tests__/toBe.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/__tests__/toBe.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toBe.spec/vec2 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 17))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 2760))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $start:~lib/allocator/arena (; 14 ;) (type $FUNCSIG$v)
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
 (func $~lib/allocator/arena/__memory_allocate (; 15 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
  call $~lib/allocator/arena/__memory_allocate
  return
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 17 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 18 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<i32>#reportExpected (; 21 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedInteger
 )
 (func $~lib/allocator/arena/__memory_free (; 22 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 23 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|0 (; 24 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 42
  local.set $1
  i32.const 128
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
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
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|1 (; 27 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $0
  i32.const 42
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Test/throws (; 28 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|2 (; 29 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $0
  i32.const 42
  local.set $1
  i32.const 592
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|3 (; 30 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 42
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 31 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 32 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual (; 33 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected (; 34 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $1
  i32.const 0
  i32.eq
  if
   local.get $0
   i32.load
   call $assembly/internal/Expectation/reportExpectedNull
  else   
   local.get $1
   i32.const 24
   local.get $0
   i32.load
   call $assembly/internal/Expectation/reportExpectedReference
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup (; 35 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|4 (; 36 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  global.get $assembly/__tests__/toBe.spec/vec1
  local.set $1
  i32.const 960
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 37 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|5 (; 38 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $0
  global.get $assembly/__tests__/toBe.spec/vec1
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|6 (; 39 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $0
  global.get $assembly/__tests__/toBe.spec/vec2
  local.set $1
  i32.const 1328
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|7 (; 40 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  global.get $assembly/__tests__/toBe.spec/vec2
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|8 (; 41 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  i32.const 0
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|9 (; 42 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $0
  i32.const 0
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|10 (; 43 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $0
  i32.const 0
  local.set $1
  i32.const 1880
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|11 (; 44 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toBe.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  i32.const 0
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (; 45 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
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
 (func $assembly/internal/Expectation/expect<f64> (; 46 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportActual (; 47 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  f64.load offset=8
  call $assembly/internal/Expectation/reportActualFloat
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportExpected (; 48 ;) (type $FUNCSIG$vid) (param $0 i32) (param $1 f64)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
 )
 (func $assembly/internal/Expectation/Expectation<f64>#cleanup (; 49 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|12 (; 50 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 f64)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $0
  f64.const 0
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  f64.load offset=8
  f64.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|13 (; 51 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 f64)
  (local $2 i32)
  f64.const 0
  call $assembly/internal/Expectation/expect<f64>
  local.set $0
  f64.const nan:0x8000000000000
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  f64.load offset=8
  f64.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0~anonymous|14 (; 52 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 f64)
  (local $2 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $0
  f64.const nan:0x8000000000000
  local.set $1
  i32.const 352
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  local.get $0
  i32.load
  local.get $1
  local.get $0
  f64.load offset=8
  f64.eq
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 200
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBe.spec~anonymous|0 (; 53 ;) (type $FUNCSIG$v)
  i32.const 24
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 272
  i32.const 2
  i32.const 360
  call $assembly/internal/Test/throws
  i32.const 480
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 680
  i32.const 4
  i32.const 768
  call $assembly/internal/Test/throws
  i32.const 872
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1040
  i32.const 6
  i32.const 1120
  call $assembly/internal/Test/throws
  i32.const 1232
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1040
  i32.const 8
  i32.const 1416
  call $assembly/internal/Test/throws
  i32.const 1520
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 1584
  i32.const 10
  i32.const 1688
  call $assembly/internal/Test/throws
  i32.const 1792
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 1968
  i32.const 12
  i32.const 2056
  call $assembly/internal/Test/throws
  i32.const 2168
  i32.const 13
  i32.const 2256
  call $assembly/internal/Test/throws
  i32.const 2384
  i32.const 14
  i32.const 2480
  call $assembly/internal/Test/throws
  i32.const 2608
  i32.const 15
  i32.const 2696
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 54 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 55 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toBe.spec (; 56 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
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
  i32.const 8
  i32.const 16
  call $assembly/internal/Describe/describe
 )
 (func $start (; 57 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toBe.spec
 )
 (func $null (; 58 ;) (type $FUNCSIG$v)
 )
)
