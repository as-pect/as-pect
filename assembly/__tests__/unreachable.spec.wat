(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (import "__aspect" "reportBeforeEach" (func $assembly/internal/Test/reportBeforeEach (param i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "tryCall" (func $assembly/internal/Expectation/tryCall (param i32) (result i32)))
 (import "__aspect" "reportActualString" (func $assembly/internal/Expectation/reportActualString (param i32)))
 (import "__aspect" "reportExpectedString" (func $assembly/internal/Expectation/reportExpectedString (param i32 i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "reportAfterEach" (func $assembly/internal/Test/reportAfterEach (param i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\0b\00\00\00u\00n\00r\00e\00a\00c\00h\00a\00b\00l\00e\00")
 (data (i32.const 40) "\15\00\00\00g\00a\00r\00u\00n\00t\00e\00e\00d\00 \00u\00n\00r\00e\00a\00c\00h\00a\00b\00l\00e\00")
 (data (i32.const 88) "\16\00\00\00T\00h\00i\00s\00 \00t\00e\00s\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 136) "\13\00\00\00s\00h\00o\00u\00l\00d\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 184) "&\00\00\00u\00n\00r\00e\00a\00c\00h\00a\00b\00l\00e\00 \00i\00n\00s\00t\00r\00u\00c\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 264) "\06\00\00\00t\00h\00r\00o\00w\00s\00")
 (data (i32.const 280) "\n\00\00\00n\00o\00t\00 \00t\00h\00r\00o\00w\00s\00")
 (data (i32.const 304) " \00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 376) "\13\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00u\00n\00 \00n\00o\00r\00m\00a\00l\00l\00y\00")
 (data (i32.const 424) "0\00\00\00e\00x\00p\00e\00c\00t\00F\00n\00.\00n\00o\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00c\00a\00l\00l\00b\00a\00c\00k\00 \00t\00h\00r\00o\00w\00s\00")
 (data (i32.const 528) "\00\00\00\00")
 (data (i32.const 536) "=\00\00\00u\00n\00r\00e\00a\00c\00h\00a\00b\00l\00e\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00n\00e\00g\00a\00t\00e\00d\00 \00t\00o\00T\00h\00r\00o\00w\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 664) "4\00\00\00e\00x\00p\00e\00c\00t\00F\00n\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00c\00a\00l\00l\00b\00a\00c\00k\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 776) "E\00\00\00f\00u\00n\00c\00t\00i\00o\00n\00s\00 \00t\00h\00a\00t\00 \00d\00o\00 \00n\00o\00t\00 \00t\00h\00r\00o\00w\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00t\00o\00T\00h\00r\00o\00w\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (table $0 16 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|2~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|3~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4~anonymous|0~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5~anonymous|0~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/unreachable.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $assembly/__tests__/unreachable.spec/counter (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 15))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 920))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|0 (; 13 ;) (type $FUNCSIG$v)
  i32.const 0
  global.set $assembly/__tests__/unreachable.spec/counter
 )
 (func $assembly/internal/Test/beforeEach (; 14 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportBeforeEach
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|1 (; 15 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/__tests__/unreachable.spec/counter
  unreachable
 )
 (func $assembly/internal/Test/throws (; 16 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|2~anonymous|0 (; 17 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/__tests__/unreachable.spec/counter
  unreachable
 )
 (func $start:~lib/allocator/arena (; 18 ;) (type $FUNCSIG$v)
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
 (func $~lib/allocator/arena/__memory_allocate (; 19 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.allocate (; 20 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__memory_allocate
  return
 )
 (func "$assembly/internal/Expectation/Expectation<() => void>#constructor" (; 21 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expectFn (; 22 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call "$assembly/internal/Expectation/Expectation<() => void>#constructor"
 )
 (func $~lib/allocator/arena/__memory_free (; 23 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func "$assembly/internal/Expectation/Expectation<() => void>#cleanup" (; 24 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|2 (; 25 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 3
  call $assembly/internal/Expectation/expectFn
  local.set $0
  i32.const 184
  local.set $1
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 264
  else   
   i32.const 280
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $0
  i32.load
  if (result i32)
   i32.const 280
  else   
   i32.const 264
  end
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $0
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 304
   i32.const 270
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $assembly/internal/Test/it (; 26 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|3~anonymous|0 (; 27 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/__tests__/unreachable.spec/counter
 )
 (func "$assembly/internal/Expectation/Expectation<() => void>#get:not" (; 28 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|3 (; 29 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 5
  call $assembly/internal/Expectation/expectFn
  call "$assembly/internal/Expectation/Expectation<() => void>#get:not"
  local.set $0
  i32.const 184
  local.set $1
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 264
  else   
   i32.const 280
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $0
  i32.load
  if (result i32)
   i32.const 280
  else   
   i32.const 264
  end
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $0
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 304
   i32.const 270
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4~anonymous|0~anonymous|0 (; 30 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/__tests__/unreachable.spec/counter
  unreachable
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4~anonymous|0 (; 31 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 7
  call $assembly/internal/Expectation/expectFn
  call "$assembly/internal/Expectation/Expectation<() => void>#get:not"
  local.set $0
  i32.const 528
  local.set $1
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 264
  else   
   i32.const 280
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $0
  i32.load
  if (result i32)
   i32.const 280
  else   
   i32.const 264
  end
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $0
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 304
   i32.const 270
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4 (; 32 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 8
  call $assembly/internal/Expectation/expectFn
  local.set $0
  i32.const 536
  local.set $1
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 264
  else   
   i32.const 280
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $0
  i32.load
  if (result i32)
   i32.const 280
  else   
   i32.const 264
  end
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $0
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 304
   i32.const 270
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5~anonymous|0~anonymous|0 (; 33 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/__tests__/unreachable.spec/counter
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5~anonymous|0 (; 34 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 10
  call $assembly/internal/Expectation/expectFn
  local.set $0
  i32.const 528
  local.set $1
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 264
  else   
   i32.const 280
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $0
  i32.load
  if (result i32)
   i32.const 280
  else   
   i32.const 264
  end
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $0
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 304
   i32.const 270
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 11
  call $assembly/internal/Expectation/expectFn
  local.set $0
  i32.const 776
  local.set $1
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 264
  else   
   i32.const 280
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $0
  i32.load
  if (result i32)
   i32.const 280
  else   
   i32.const 264
  end
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $0
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 304
   i32.const 270
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 36 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 37 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 38 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportExpected (; 39 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 40 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|6 (; 41 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/unreachable.spec/counter
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 1
  local.set $1
  i32.const 528
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
   i32.const 304
   i32.const 106
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Test/afterEach (; 42 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterEach
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0 (; 43 ;) (type $FUNCSIG$v)
  i32.const 1
  call $assembly/internal/Test/beforeEach
  i32.const 40
  i32.const 2
  i32.const 88
  call $assembly/internal/Test/throws
  i32.const 136
  i32.const 4
  call $assembly/internal/Test/it
  i32.const 376
  i32.const 6
  call $assembly/internal/Test/it
  i32.const 424
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 664
  i32.const 12
  call $assembly/internal/Test/it
  i32.const 13
  call $assembly/internal/Test/afterEach
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 44 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 45 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/unreachable.spec (; 46 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
  i32.const 8
  i32.const 14
  call $assembly/internal/Describe/describe
 )
 (func $start (; 47 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/unreachable.spec
 )
 (func $null (; 48 ;) (type $FUNCSIG$v)
 )
)
