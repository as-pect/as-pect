(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$id (func (param f64) (result i32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vd (func (param f64)))
 (type $FUNCSIG$vdi (func (param f64 i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedFloat (param f64 i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\07\00\00\00t\00o\00B\00e\00N\00a\00N\00")
 (data (i32.const 32) " \00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00 \00N\00a\00N\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 104) "\n\00\00\00N\00a\00N\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 128) "2\00\00\00t\00o\00B\00e\00N\00a\00N\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00m\00u\00s\00t\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00a\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 232) " \00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 304) "\1e\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00N\00a\00N\00 \00i\00s\00 \00n\00o\00t\00 \00N\00a\00N\00")
 (data (i32.const 368) "\00\00\00\00")
 (data (i32.const 376) "\0f\00\00\00N\00a\00N\00 \00m\00u\00s\00t\00 \00b\00e\00 \00N\00a\00N\00")
 (data (i32.const 416) "/\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00o\00r\00m\00a\00l\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00s\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00N\00a\00N\00")
 (data (i32.const 520) "\0f\00\00\001\000\00.\000\00 \00i\00s\00 \00n\00o\00t\00 \00N\00a\00N\00")
 (data (i32.const 560) ":\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00n\00o\00r\00m\00a\00l\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00b\00e\00 \00N\00a\00N\00")
 (data (i32.const 680) "\'\00\00\00N\00o\00r\00m\00a\00l\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00N\00a\00N\00 \00v\00a\00l\00u\00e\00s\00.\00")
 (data (i32.const 768) "2\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00i\00n\00g\00 \00t\00o\00B\00e\00N\00a\00N\00 \00o\00n\00 \00a\00n\00 \00i\00n\00t\00e\00g\00e\00r\00 \00t\00y\00p\00e\00")
 (data (i32.const 872) "#\00\00\00N\00o\00r\00m\00a\00l\00 \00i\00n\00t\00e\00g\00e\00r\00 \00v\00a\00l\00u\00e\00s\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 952) "T\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00i\00n\00g\00 \00t\00o\00B\00e\00N\00a\00N\00 \00o\00n\00 \00a\00n\00 \00i\00n\00t\00e\00g\00e\00r\00 \00t\00y\00p\00e\00,\00 \00e\00v\00e\00n\00 \00i\00f\00 \00t\00h\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 1128) "7\00\00\00N\00o\00r\00m\00a\00l\00 \00i\00n\00t\00e\00g\00e\00r\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00a\00l\00w\00a\00y\00s\00 \00t\00h\00r\00o\00w\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00.\00")
 (data (i32.const 1248) "5\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00")
 (data (i32.const 1360) ")\00\00\00t\00o\00B\00e\00N\00a\00N\00 \00m\00u\00s\00t\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00u\00s\00i\00n\00g\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 1448) "4\00\00\00R\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00.\00")
 (data (i32.const 1560) "W\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00,\00 \00e\00v\00e\00n\00 \00i\00f\00 \00t\00h\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 1744) "V\00\00\00R\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00N\00a\00N\00,\00 \00e\00v\00e\00n\00 \00i\00f\00 \00t\00h\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00.\00")
 (table $0 11 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toBeNaN.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 10))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 1920))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $start:~lib/allocator/arena (; 9 ;) (type $FUNCSIG$v)
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
 (func $~lib/allocator/arena/__memory_allocate (; 10 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
  call $~lib/allocator/arena/__memory_allocate
  return
 )
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (; 12 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
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
 (func $assembly/internal/Expectation/expect<f64> (; 13 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportActual (; 14 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  f64.load offset=8
  call $assembly/internal/Expectation/reportActualFloat
 )
 (func $~lib/allocator/arena/__memory_free (; 15 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $assembly/internal/Expectation/Expectation<f64>#cleanup (; 16 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|0 (; 17 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $0
  i32.const 104
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  f64.const nan:0x8000000000000
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 1
  i32.eqz
  if
   i32.const 128
   i32.const 232
   i32.const 431
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  block $~lib/builtins/isNaN<f64>|inlined.0 (result i32)
   local.get $0
   f64.load offset=8
   local.set $2
   local.get $2
   local.get $2
   f64.ne
  end
  local.set $3
  local.get $0
  i32.load
  local.get $3
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 232
   i32.const 436
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Test/it (; 18 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<f64>#get:not (; 19 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|1 (; 20 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $0
  i32.const 368
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  f64.const nan:0x8000000000000
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 1
  i32.eqz
  if
   i32.const 128
   i32.const 232
   i32.const 431
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  block $~lib/builtins/isNaN<f64>|inlined.1 (result i32)
   local.get $0
   f64.load offset=8
   local.set $2
   local.get $2
   local.get $2
   f64.ne
  end
  local.set $3
  local.get $0
  i32.load
  local.get $3
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 232
   i32.const 436
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Test/throws (; 21 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|2 (; 22 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 i32)
  f64.const 10
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $0
  i32.const 520
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  f64.const nan:0x8000000000000
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 1
  i32.eqz
  if
   i32.const 128
   i32.const 232
   i32.const 431
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  block $~lib/builtins/isNaN<f64>|inlined.2 (result i32)
   local.get $0
   f64.load offset=8
   local.set $2
   local.get $2
   local.get $2
   f64.ne
  end
  local.set $3
  local.get $0
  i32.load
  local.get $3
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 232
   i32.const 436
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|3 (; 23 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 i32)
  f64.const 10
  call $assembly/internal/Expectation/expect<f64>
  local.set $0
  i32.const 368
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  f64.const nan:0x8000000000000
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 1
  i32.eqz
  if
   i32.const 128
   i32.const 232
   i32.const 431
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  block $~lib/builtins/isNaN<f64>|inlined.3 (result i32)
   local.get $0
   f64.load offset=8
   local.set $2
   local.get $2
   local.get $2
   f64.ne
  end
  local.set $3
  local.get $0
  i32.load
  local.get $3
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 232
   i32.const 436
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 24 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 25 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 26 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 27 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|4 (; 28 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 10
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 368
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  f64.const nan:0x8000000000000
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 0
  i32.eqz
  if
   i32.const 128
   i32.const 232
   i32.const 431
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  block $~lib/builtins/isNaN<i32>|inlined.0 (result i32)
   local.get $0
   i32.load offset=4
   local.set $2
   local.get $2
   local.get $2
   i32.ne
  end
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 232
   i32.const 436
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 29 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|5 (; 30 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 10
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $0
  i32.const 368
  local.set $1
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  f64.const nan:0x8000000000000
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
  i32.const 0
  i32.eqz
  if
   i32.const 128
   i32.const 232
   i32.const 431
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
  block $~lib/builtins/isNaN<i32>|inlined.1 (result i32)
   local.get $0
   i32.load offset=4
   local.set $2
   local.get $2
   local.get $2
   i32.ne
  end
  local.set $2
  local.get $0
  i32.load
  local.get $2
  i32.const 0
  i32.ne
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 232
   i32.const 436
   i32.const 6
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
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|6 (; 33 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $0
  i32.const 368
  local.set $1
  i32.const 0
  i32.eqz
  if
   i32.const 1360
   i32.const 232
   i32.const 425
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 34 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0~anonymous|7 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $0
  i32.const 368
  local.set $1
  i32.const 0
  i32.eqz
  if
   i32.const 1360
   i32.const 232
   i32.const 425
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/toBeNaN.spec~anonymous|0 (; 36 ;) (type $FUNCSIG$v)
  i32.const 32
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 304
  i32.const 2
  i32.const 376
  call $assembly/internal/Test/throws
  i32.const 416
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 560
  i32.const 4
  i32.const 680
  call $assembly/internal/Test/throws
  i32.const 768
  i32.const 5
  i32.const 872
  call $assembly/internal/Test/throws
  i32.const 952
  i32.const 6
  i32.const 1128
  call $assembly/internal/Test/throws
  i32.const 1248
  i32.const 7
  i32.const 1448
  call $assembly/internal/Test/throws
  i32.const 1560
  i32.const 8
  i32.const 1744
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 37 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 38 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toBeNaN.spec (; 39 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
  i32.const 8
  i32.const 9
  call $assembly/internal/Describe/describe
 )
 (func $start (; 40 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toBeNaN.spec
 )
 (func $null (; 41 ;) (type $FUNCSIG$v)
 )
)
