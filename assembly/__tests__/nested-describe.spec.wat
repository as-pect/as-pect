(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedTruthy" (func $assembly/internal/Expectation/reportExpectedTruthy (param i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (import "__aspect" "reportBeforeEach" (func $assembly/internal/Test/reportBeforeEach (param i32)))
 (import "__aspect" "reportBeforeAll" (func $assembly/internal/Test/reportBeforeAll (param i32)))
 (import "__aspect" "reportAfterEach" (func $assembly/internal/Test/reportAfterEach (param i32)))
 (import "__aspect" "reportAfterAll" (func $assembly/internal/Test/reportAfterAll (param i32)))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00n\00e\00s\00t\00e\00d\00 \00d\00e\00s\00c\00r\00i\00b\00e\00s\00")
 (data (i32.const 48) "\0e\00\00\00i\00n\00n\00e\00r\00 \00d\00e\00s\00c\00r\00i\00b\00e\00")
 (data (i32.const 80) "\19\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00u\00n\00 \00t\00h\00e\00 \00i\00n\00n\00e\00r\00 \00t\00e\00s\00t\00")
 (data (i32.const 136) "\00\00\00\00")
 (data (i32.const 144) " \00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 216) "\13\00\00\00n\00e\00s\00t\00e\00d\00 \00c\00o\00n\00t\00r\00o\00l\00 \00f\00l\00o\00w\00")
 (data (i32.const 264) "\0b\00\00\00r\00u\00n\00s\00 \00s\00e\00c\00o\00n\00d\00")
 (data (i32.const 296) "\n\00\00\00s\00e\00c\00o\00n\00d\00T\00e\00s\00t\00")
 (data (i32.const 320) "\1a\00\00\00a\00f\00t\00e\00r\00E\00a\00c\00h\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 376) "\19\00\00\00a\00f\00t\00e\00r\00A\00l\00l\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 432) "\05\00\00\00i\00n\00n\00e\00r\00")
 (data (i32.const 448) "\t\00\00\00f\00i\00r\00s\00t\00T\00e\00s\00t\00")
 (data (i32.const 472) "\1b\00\00\00b\00e\00f\00o\00r\00e\00E\00a\00c\00h\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (data (i32.const 536) "\1a\00\00\00b\00e\00f\00o\00r\00e\00A\00l\00l\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00t\00r\00u\00t\00h\00y\00")
 (table $0 14 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/nested-describe.spec~anonymous|0~anonymous|0~anonymous|0 $start:assembly/__tests__/nested-describe.spec~anonymous|0~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $start:assembly/__tests__/nested-describe.spec~anonymous|0 $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|4~anonymous|0 $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|4 $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|5~anonymous|0 $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|5 $start:assembly/__tests__/nested-describe.spec~anonymous|1)
 (global $assembly/__tests__/nested-describe.spec/outer (mut i32) (i32.const 1))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 3))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/nested-describe.spec/beforeEachFlag (mut i32) (i32.const 0))
 (global $assembly/__tests__/nested-describe.spec/beforeAllFlag (mut i32) (i32.const 0))
 (global $assembly/__tests__/nested-describe.spec/afterEachFlag (mut i32) (i32.const 0))
 (global $assembly/__tests__/nested-describe.spec/afterAllFlag (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 592))
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
 (func $assembly/internal/Expectation/Expectation<bool>#constructor (; 14 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<bool> (; 15 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<bool>#reportActual (; 16 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load8_u offset=4
  i32.const 0
  i32.ne
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $~lib/allocator/arena/__memory_free (; 17 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $assembly/internal/Expectation/Expectation<bool>#cleanup (; 18 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|0~anonymous|0~anonymous|0 (; 19 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/nested-describe.spec/outer
  call $assembly/internal/Expectation/expect<bool>
  local.set $0
  i32.const 136
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
   i32.const 144
   i32.const 225
   i32.const 8
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#cleanup
 )
 (func $assembly/internal/Test/it (; 20 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|0~anonymous|0 (; 21 ;) (type $FUNCSIG$v)
  i32.const 80
  i32.const 1
  call $assembly/internal/Test/it
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 22 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 23 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|0 (; 24 ;) (type $FUNCSIG$v)
  i32.const 48
  i32.const 2
  call $assembly/internal/Describe/describe
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|0 (; 25 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/nested-describe.spec/beforeEachFlag
  i32.const 1
  i32.add
  global.set $assembly/__tests__/nested-describe.spec/beforeEachFlag
 )
 (func $assembly/internal/Test/beforeEach (; 26 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportBeforeEach
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|1 (; 27 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/nested-describe.spec/beforeAllFlag
  i32.const 1
  i32.add
  global.set $assembly/__tests__/nested-describe.spec/beforeAllFlag
 )
 (func $assembly/internal/Test/beforeAll (; 28 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportBeforeAll
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|2 (; 29 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/nested-describe.spec/afterEachFlag
  i32.const 1
  i32.add
  global.set $assembly/__tests__/nested-describe.spec/afterEachFlag
 )
 (func $assembly/internal/Test/afterEach (; 30 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterEach
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|3 (; 31 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/nested-describe.spec/afterAllFlag
  i32.const 1
  i32.add
  global.set $assembly/__tests__/nested-describe.spec/afterAllFlag
 )
 (func $assembly/internal/Test/afterAll (; 32 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterAll
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 33 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 34 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 35 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 36 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|4~anonymous|0 (; 37 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toBeTruthy|inlined.0
   global.get $assembly/__tests__/nested-describe.spec/afterEachFlag
   call $assembly/internal/Expectation/expect<i32>
   local.set $0
   i32.const 320
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
    i32.const 144
    i32.const 225
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<i32>#cleanup
  end
  block $assembly/internal/Expectation/Expectation<i32>#toBeTruthy|inlined.1
   global.get $assembly/__tests__/nested-describe.spec/afterAllFlag
   call $assembly/internal/Expectation/expect<i32>
   local.set $1
   i32.const 376
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
    i32.const 144
    i32.const 225
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#cleanup
  end
 )
 (func $assembly/internal/Test/test (; 38 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|4 (; 39 ;) (type $FUNCSIG$v)
  i32.const 296
  i32.const 9
  call $assembly/internal/Test/test
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|5~anonymous|0 (; 40 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toBeTruthy|inlined.2
   global.get $assembly/__tests__/nested-describe.spec/beforeEachFlag
   call $assembly/internal/Expectation/expect<i32>
   local.set $0
   i32.const 472
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
    i32.const 144
    i32.const 225
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<i32>#cleanup
  end
  block $assembly/internal/Expectation/Expectation<i32>#toBeTruthy|inlined.3
   global.get $assembly/__tests__/nested-describe.spec/beforeAllFlag
   call $assembly/internal/Expectation/expect<i32>
   local.set $1
   i32.const 536
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
    i32.const 144
    i32.const 225
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#cleanup
  end
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|1~anonymous|5 (; 41 ;) (type $FUNCSIG$v)
  i32.const 448
  i32.const 11
  call $assembly/internal/Test/test
 )
 (func $start:assembly/__tests__/nested-describe.spec~anonymous|1 (; 42 ;) (type $FUNCSIG$v)
  i32.const 5
  call $assembly/internal/Test/beforeEach
  i32.const 6
  call $assembly/internal/Test/beforeAll
  i32.const 7
  call $assembly/internal/Test/afterEach
  i32.const 8
  call $assembly/internal/Test/afterAll
  i32.const 264
  i32.const 10
  call $assembly/internal/Describe/describe
  i32.const 432
  i32.const 12
  call $assembly/internal/Describe/describe
 )
 (func $start:assembly/__tests__/nested-describe.spec (; 43 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
  i32.const 8
  i32.const 4
  call $assembly/internal/Describe/describe
  i32.const 216
  i32.const 13
  call $assembly/internal/Describe/describe
 )
 (func $start (; 44 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/nested-describe.spec
 )
 (func $null (; 45 ;) (type $FUNCSIG$v)
 )
)
