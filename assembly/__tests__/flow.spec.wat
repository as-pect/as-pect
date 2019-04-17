(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (import "__aspect" "reportBeforeAll" (func $assembly/internal/Test/reportBeforeAll (param i32)))
 (import "__aspect" "reportBeforeEach" (func $assembly/internal/Test/reportBeforeEach (param i32)))
 (import "__aspect" "reportAfterEach" (func $assembly/internal/Test/reportAfterEach (param i32)))
 (import "__aspect" "reportAfterAll" (func $assembly/internal/Test/reportAfterAll (param i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 8) "\04\00\00\00f\00l\00o\00w\00")
 (data (i32.const 24) "\1c\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00a\00l\00l\00 \00b\00e\00f\00o\00r\00e\00E\00a\00c\00h\00 \00t\00w\00i\00c\00e\00")
 (data (i32.const 88) " \00\00\00b\00e\00f\00o\00r\00e\00E\00a\00c\00h\00 \00r\00u\00n\00 \00c\00o\00u\00n\00t\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \004\00")
 (data (i32.const 160) "\1f\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00f\00l\00o\00w\00.\00s\00p\00e\00c\00.\00t\00s\00")
 (data (i32.const 232) "\1a\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00a\00l\00l\00 \00b\00e\00f\00o\00r\00e\00A\00l\00l\00 \00o\00n\00c\00e\00")
 (data (i32.const 288) "\1f\00\00\00b\00e\00f\00o\00r\00e\00A\00l\00l\00 \00r\00u\00n\00 \00c\00o\00u\00n\00t\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \001\00")
 (data (i32.const 360) "\1b\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00a\00l\00l\00 \00a\00f\00t\00e\00r\00E\00a\00c\00h\00 \00t\00w\00i\00c\00e\00")
 (data (i32.const 424) "\1f\00\00\00a\00f\00t\00e\00r\00E\00a\00c\00h\00 \00r\00u\00n\00 \00c\00o\00u\00n\00t\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \004\00")
 (data (i32.const 496) "\19\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00a\00l\00l\00 \00a\00f\00t\00e\00r\00A\00l\00l\00 \00o\00n\00c\00e\00")
 (data (i32.const 552) "\1e\00\00\00a\00f\00t\00e\00r\00A\00l\00l\00 \00r\00u\00n\00 \00c\00o\00u\00n\00t\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \001\00")
 (data (i32.const 616) "\17\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00a\00l\00l\00 \00a\00l\00l\00 \004\00 \00t\00e\00s\00t\00s\00")
 (data (i32.const 672) "\1a\00\00\00t\00e\00s\00t\00 \00r\00u\00n\00 \00c\00o\00u\00n\00t\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \004\00")
 (data (i32.const 728) "\0c\00\00\00e\00x\00a\00m\00p\00l\00e\00 \00t\00e\00s\00t\00")
 (data (i32.const 760) "\1c\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00u\00n\00 \00t\00h\00i\00s\00 \00e\00x\00a\00m\00p\00l\00e\00 \00t\00e\00s\00t\00")
 (data (i32.const 824) "\14\00\00\00t\00h\00i\00s\00 \00t\00e\00s\00t\00 \00s\00h\00o\00u\00l\00d\00 \00r\00u\00n\00")
 (data (i32.const 872) "\00\00\00\00")
 (table $0 17 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/flow.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|4 $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|5 $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|6 $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|7 $start:assembly/__tests__/flow.spec~anonymous|1)
 (global $assembly/__tests__/flow.spec/beforeEachRan (mut i32) (i32.const 0))
 (global $assembly/__tests__/flow.spec/beforeAllRan (mut i32) (i32.const 0))
 (global $assembly/__tests__/flow.spec/afterEachRan (mut i32) (i32.const 0))
 (global $assembly/__tests__/flow.spec/afterAllRan (mut i32) (i32.const 0))
 (global $assembly/__tests__/flow.spec/testCount (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 7))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 876))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|0 (; 9 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/beforeEachRan
  i32.const 4
  i32.eq
  i32.eqz
  if
   i32.const 88
   i32.const 160
   i32.const 21
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
 )
 (func $assembly/internal/Test/it (; 10 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|1 (; 11 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/beforeAllRan
  i32.const 1
  i32.eq
  i32.eqz
  if
   i32.const 288
   i32.const 160
   i32.const 29
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|2 (; 12 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/afterEachRan
  i32.const 4
  i32.eq
  i32.eqz
  if
   i32.const 424
   i32.const 160
   i32.const 37
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|3 (; 13 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/afterAllRan
  i32.const 1
  i32.eq
  i32.eqz
  if
   i32.const 552
   i32.const 160
   i32.const 45
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|0~anonymous|4 (; 14 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/testCount
  i32.const 4
  i32.eq
  i32.eqz
  if
   i32.const 672
   i32.const 160
   i32.const 52
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|0 (; 15 ;) (type $FUNCSIG$v)
  i32.const 24
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 232
  i32.const 2
  call $assembly/internal/Test/it
  i32.const 360
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 496
  i32.const 4
  call $assembly/internal/Test/it
  i32.const 616
  i32.const 5
  call $assembly/internal/Test/it
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 16 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 17 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|0 (; 18 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/beforeAllRan
  i32.const 1
  i32.add
  global.set $assembly/__tests__/flow.spec/beforeAllRan
 )
 (func $assembly/internal/Test/beforeAll (; 19 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportBeforeAll
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|1 (; 20 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/beforeEachRan
  i32.const 1
  i32.add
  global.set $assembly/__tests__/flow.spec/beforeEachRan
 )
 (func $assembly/internal/Test/beforeEach (; 21 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportBeforeEach
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|2 (; 22 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/afterEachRan
  i32.const 1
  i32.add
  global.set $assembly/__tests__/flow.spec/afterEachRan
 )
 (func $assembly/internal/Test/afterEach (; 23 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterEach
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|3 (; 24 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/afterAllRan
  i32.const 1
  i32.add
  global.set $assembly/__tests__/flow.spec/afterAllRan
 )
 (func $assembly/internal/Test/afterAll (; 25 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterAll
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|4 (; 26 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/testCount
  i32.const 1
  i32.add
  global.set $assembly/__tests__/flow.spec/testCount
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|5 (; 27 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/testCount
  i32.const 1
  i32.add
  global.set $assembly/__tests__/flow.spec/testCount
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|6 (; 28 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/testCount
  i32.const 1
  i32.add
  global.set $assembly/__tests__/flow.spec/testCount
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|1~anonymous|7 (; 29 ;) (type $FUNCSIG$v)
  global.get $assembly/__tests__/flow.spec/testCount
  i32.const 1
  i32.add
  global.set $assembly/__tests__/flow.spec/testCount
  unreachable
 )
 (func $assembly/internal/Test/throws (; 30 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/flow.spec~anonymous|1 (; 31 ;) (type $FUNCSIG$v)
  i32.const 8
  call $assembly/internal/Test/beforeAll
  i32.const 9
  call $assembly/internal/Test/beforeEach
  i32.const 10
  call $assembly/internal/Test/afterEach
  i32.const 11
  call $assembly/internal/Test/afterAll
  i32.const 760
  i32.const 12
  call $assembly/internal/Test/it
  i32.const 760
  i32.const 13
  call $assembly/internal/Test/it
  i32.const 760
  i32.const 14
  call $assembly/internal/Test/it
  i32.const 824
  i32.const 15
  i32.const 872
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/__tests__/flow.spec (; 32 ;) (type $FUNCSIG$v)
  i32.const 8
  i32.const 6
  call $assembly/internal/Describe/describe
  i32.const 728
  i32.const 16
  call $assembly/internal/Describe/describe
 )
 (func $start:~lib/allocator/arena (; 33 ;) (type $FUNCSIG$v)
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
 (func $start:assembly/index (; 34 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
 )
 (func $start (; 35 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/flow.spec
  call $start:assembly/index
 )
 (func $null (; 36 ;) (type $FUNCSIG$v)
 )
)
