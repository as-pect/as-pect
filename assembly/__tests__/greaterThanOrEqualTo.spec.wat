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
 (type $FUNCSIG$di (func (param i32) (result f64)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedFloat (param f64 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/Expectation/reportActualNull))
 (import "__aspect" "reportActualReference" (func $assembly/internal/Expectation/reportActualReference (param i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/Expectation/reportExpectedNull (param i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/Expectation/reportExpectedReference (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\19\00\00\00G\00r\00e\00a\00t\00e\00r\00T\00h\00a\00n\00O\00r\00E\00q\00u\00a\00l\00T\00o\00 \00(\00>\00=\00)\00")
 (data (i32.const 64) "T\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00g\00r\00e\00a\00t\00e\00r\00 \00t\00h\00a\00n\00 \00o\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 240) "6\00\00\00A\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00w\00i\00t\00h\00 \00l\00a\00r\00g\00e\00r\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 352) " \00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 424) "B\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 560) "\00\00\00\00")
 (data (i32.const 568) "o\00\00\00N\00e\00g\00a\00t\00e\00d\00 \00t\00o\00B\00e\00G\00r\00e\00a\00t\00e\00r\00T\00h\00a\00n\00O\00r\00E\00q\00u\00a\00l\00T\00o\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 800) "X\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00g\00r\00e\00a\00t\00e\00r\00 \00t\00h\00a\00n\00 \00o\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 984) "U\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00g\00r\00e\00a\00t\00e\00r\00 \00t\00h\00a\00n\00 \00o\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1160) "F\00\00\00I\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00l\00e\00s\00s\00 \00t\00h\00a\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 1304) "I\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00e\00q\00u\00a\00l\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00g\00r\00e\00a\00t\00e\00r\00 \00t\00h\00a\00n\00 \00o\00r\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 1456) "&\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 1536) "@\00\00\00I\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00e\00q\00u\00a\00l\00s\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 1672) ")\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 1760) ".\00\00\00V\00a\00l\00u\00e\00 \00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00 \00f\00a\00i\00l\00s\00,\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00.\00")
 (data (i32.const 1856) ",\00\00\00V\00a\00l\00u\00e\00 \00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00 \00f\00a\00i\00l\00s\00,\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00.\00")
 (data (i32.const 1952) "-\00\00\00I\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00.\00")
 (data (i32.const 2048) "+\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 2144) "/\00\00\00I\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00.\00")
 (data (i32.const 2248) "3\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00e\00r\00i\00f\00y\00 \00o\00n\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00g\00r\00e\00a\00t\00e\00r\00 \00t\00h\00a\00n\00 \00a\00n\00o\00t\00h\00e\00r\00")
 (data (i32.const 2360) "g\00\00\00O\00p\00e\00r\00a\00t\00o\00r\00 \00o\00v\00e\00r\00l\00o\00a\00d\00i\00n\00g\00 \00s\00h\00o\00u\00l\00d\00 \00a\00l\00l\00o\00w\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00t\00o\00 \00v\00e\00r\00i\00f\00y\00 \00t\00h\00a\00t\00 \00o\00n\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00g\00r\00e\00a\00t\00e\00r\00 \00t\00h\00a\00n\00 \00a\00n\00o\00t\00h\00e\00r\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 2576) "2\00\00\00N\00u\00l\00l\00a\00b\00l\00e\00 \00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00 \00f\00a\00i\00l\00s\00,\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2680) "0\00\00\00N\00u\00l\00l\00a\00b\00l\00e\00 \00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00 \00f\00a\00i\00l\00s\00,\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2784) "(\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 2872) "O\00\00\00T\00h\00e\00 \00t\00o\00B\00e\00G\00r\00e\00a\00t\00e\00r\00T\00h\00a\00n\00O\00r\00E\00q\00u\00a\00l\00T\00o\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 3040) "*\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 3128) "Q\00\00\00T\00h\00e\00 \00t\00o\00B\00e\00G\00r\00e\00a\00t\00e\00r\00T\00h\00a\00n\00O\00r\00E\00q\00u\00a\00l\00T\00o\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (table $0 14 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/__tests__/greaterThanOrEqualTo.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/greaterThanOrEqualTo.spec/vec2 (mut i32) (i32.const 0))
 (global $assembly/__tests__/greaterThanOrEqualTo.spec/vec3 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 13))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 3296))
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
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|0 (; 24 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 0
  local.set $1
  i32.const 240
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $1
  i32.ge_s
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
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
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|1 (; 27 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $0
  i32.const 0
  local.set $1
  i32.const 560
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $1
  i32.ge_s
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
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
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|2 (; 29 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $0
  i32.const 42
  local.set $1
  i32.const 560
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $1
  i32.ge_s
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|3 (; 30 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 42
  local.set $1
  i32.const 560
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $1
  i32.ge_s
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|4 (; 31 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 42
  local.set $1
  i32.const 560
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $1
  i32.ge_s
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|5 (; 32 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $0
  i32.const 42
  local.set $1
  i32.const 560
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $1
  i32.ge_s
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (; 33 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
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
 (func $assembly/internal/Expectation/expect<f64> (; 34 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportActual (; 35 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  f64.load offset=8
  call $assembly/internal/Expectation/reportActualFloat
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportExpected (; 36 ;) (type $FUNCSIG$vid) (param $0 i32) (param $1 f64)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
 )
 (func $assembly/internal/Expectation/Expectation<f64>#cleanup (; 37 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|6 (; 38 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 f64)
  (local $2 i32)
  (local $3 f64)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $0
  f64.const 0
  local.set $1
  i32.const 560
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  block $~lib/builtins/isNaN<f64>|inlined.0 (result i32)
   local.get $1
   local.set $3
   local.get $3
   local.get $3
   f64.ne
  end
  i32.const 0
  i32.ne
  i32.eqz
  i32.eqz
  if
   i32.const 1760
   i32.const 352
   i32.const 317
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  block $~lib/builtins/isNaN<f64>|inlined.1 (result i32)
   local.get $0
   f64.load offset=8
   local.set $3
   local.get $3
   local.get $3
   f64.ne
  end
  i32.const 0
  i32.ne
  i32.eqz
  i32.eqz
  if
   i32.const 1856
   i32.const 352
   i32.const 318
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  i32.load
  local.get $0
  f64.load offset=8
  local.get $1
  f64.ge
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|7 (; 39 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 f64)
  (local $2 i32)
  (local $3 f64)
  f64.const 0
  call $assembly/internal/Expectation/expect<f64>
  local.set $0
  f64.const nan:0x8000000000000
  local.set $1
  i32.const 560
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  block $~lib/builtins/isNaN<f64>|inlined.2 (result i32)
   local.get $1
   local.set $3
   local.get $3
   local.get $3
   f64.ne
  end
  i32.const 0
  i32.ne
  i32.eqz
  i32.eqz
  if
   i32.const 1760
   i32.const 352
   i32.const 317
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  block $~lib/builtins/isNaN<f64>|inlined.3 (result i32)
   local.get $0
   f64.load offset=8
   local.set $3
   local.get $3
   local.get $3
   f64.ne
  end
  i32.const 0
  i32.ne
  i32.eqz
  i32.eqz
  if
   i32.const 1856
   i32.const 352
   i32.const 318
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  i32.load
  local.get $0
  f64.load offset=8
  local.get $1
  f64.ge
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 40 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 41 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual (; 42 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected (; 43 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $assembly/__tests__/setup/Vec3/Vec3#magnitude (; 44 ;) (type $FUNCSIG$di) (param $0 i32) (result f64)
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
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup (; 45 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|8 (; 46 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 f64)
  global.get $assembly/__tests__/greaterThanOrEqualTo.spec/vec3
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  global.get $assembly/__tests__/greaterThanOrEqualTo.spec/vec1
  local.set $1
  i32.const 2360
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $1
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2576
   i32.const 352
   i32.const 311
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2680
   i32.const 352
   i32.const 312
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  i32.load
  block $assembly/__tests__/setup/Vec3/Vec3#__greaterThanOrEqualTo|inlined.0 (result i32)
   local.get $0
   i32.load offset=4
   local.set $3
   local.get $1
   local.set $4
   local.get $3
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $5
   local.get $4
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $6
   local.get $5
   local.get $6
   f64.ge
  end
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|9 (; 47 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 f64)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  global.get $assembly/__tests__/greaterThanOrEqualTo.spec/vec3
  local.set $1
  i32.const 560
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $1
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2576
   i32.const 352
   i32.const 311
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2680
   i32.const 352
   i32.const 312
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  i32.load
  block $assembly/__tests__/setup/Vec3/Vec3#__greaterThanOrEqualTo|inlined.1 (result i32)
   local.get $0
   i32.load offset=4
   local.set $3
   local.get $1
   local.set $4
   local.get $3
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $5
   local.get $4
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $6
   local.get $5
   local.get $6
   f64.ge
  end
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0~anonymous|10 (; 48 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 f64)
  global.get $assembly/__tests__/greaterThanOrEqualTo.spec/vec3
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  i32.const 0
  local.set $1
  i32.const 560
  local.set $2
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
  local.get $1
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2576
   i32.const 352
   i32.const 311
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2680
   i32.const 352
   i32.const 312
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  i32.load
  block $assembly/__tests__/setup/Vec3/Vec3#__greaterThanOrEqualTo|inlined.2 (result i32)
   local.get $0
   i32.load offset=4
   local.set $3
   local.get $1
   local.set $4
   local.get $3
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $5
   local.get $4
   call $assembly/__tests__/setup/Vec3/Vec3#magnitude
   local.set $6
   local.get $5
   local.get $6
   f64.ge
  end
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $2
   i32.const 352
   i32.const 322
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec~anonymous|0 (; 49 ;) (type $FUNCSIG$v)
  i32.const 64
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 424
  i32.const 2
  i32.const 568
  call $assembly/internal/Test/throws
  i32.const 800
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 984
  i32.const 4
  i32.const 1160
  call $assembly/internal/Test/throws
  i32.const 1304
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1456
  i32.const 6
  i32.const 1536
  call $assembly/internal/Test/throws
  i32.const 1672
  i32.const 7
  i32.const 1952
  call $assembly/internal/Test/throws
  i32.const 2048
  i32.const 8
  i32.const 2144
  call $assembly/internal/Test/throws
  i32.const 2248
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 2784
  i32.const 10
  i32.const 2872
  call $assembly/internal/Test/throws
  i32.const 3040
  i32.const 11
  i32.const 3128
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 50 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 51 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/greaterThanOrEqualTo.spec (; 52 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/greaterThanOrEqualTo.spec/vec1
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/greaterThanOrEqualTo.spec/vec2
  i32.const 0
  f64.const 4
  f64.const 5
  f64.const 6
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/greaterThanOrEqualTo.spec/vec3
  i32.const 8
  i32.const 12
  call $assembly/internal/Describe/describe
 )
 (func $start (; 53 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/greaterThanOrEqualTo.spec
 )
 (func $null (; 54 ;) (type $FUNCSIG$v)
 )
)
