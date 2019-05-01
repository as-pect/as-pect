(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (import "__aspect" "reportBeforeEach" (func $assembly/internal/Test/reportBeforeEach (param i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "tryCall" (func $assembly/internal/Expectation/tryCall (param i32) (result i32)))
 (import "__aspect" "reportActualString" (func $assembly/internal/Expectation/reportActualString (param i32)))
 (import "__aspect" "reportExpectedString" (func $assembly/internal/Expectation/reportExpectedString (param i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "reportAfterEach" (func $assembly/internal/Test/reportAfterEach (param i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00u\00n\00r\00e\00a\00c\00h\00a\00b\00l\00e\00")
 (data (i32.const 48) "\10\00\00\00*\00\00\00\00\00\00\00\00\00\00\00g\00a\00r\00u\00n\00t\00e\00e\00d\00 \00u\00n\00r\00e\00a\00c\00h\00a\00b\00l\00e\00")
 (data (i32.const 112) "\10\00\00\00,\00\00\00\00\00\00\00\00\00\00\00T\00h\00i\00s\00 \00t\00e\00s\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 176) "\10\00\00\00&\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 232) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 288) "\10\00\00\00L\00\00\00\00\00\00\00\00\00\00\00u\00n\00r\00e\00a\00c\00h\00a\00b\00l\00e\00 \00i\00n\00s\00t\00r\00u\00c\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 384) "\10\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00t\00h\00r\00o\00w\00s\00")
 (data (i32.const 416) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00n\00o\00t\00 \00t\00h\00r\00o\00w\00s\00")
 (data (i32.const 456) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 536) "\10\00\00\00&\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00u\00n\00 \00n\00o\00r\00m\00a\00l\00l\00y\00")
 (data (i32.const 592) "\10\00\00\00`\00\00\00\00\00\00\00\00\00\00\00e\00x\00p\00e\00c\00t\00F\00n\00.\00n\00o\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00c\00a\00l\00l\00b\00a\00c\00k\00 \00t\00h\00r\00o\00w\00s\00")
 (data (i32.const 704) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 720) "\10\00\00\00z\00\00\00\00\00\00\00\00\00\00\00u\00n\00r\00e\00a\00c\00h\00a\00b\00l\00e\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00n\00e\00g\00a\00t\00e\00d\00 \00t\00o\00T\00h\00r\00o\00w\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 864) "\10\00\00\00h\00\00\00\00\00\00\00\00\00\00\00e\00x\00p\00e\00c\00t\00F\00n\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00c\00a\00l\00l\00b\00a\00c\00k\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 984) "\10\00\00\00\8a\00\00\00\00\00\00\00\00\00\00\00f\00u\00n\00c\00t\00i\00o\00n\00s\00 \00t\00h\00a\00t\00 \00d\00o\00 \00n\00o\00t\00 \00t\00h\00r\00o\00w\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00t\00o\00T\00h\00r\00o\00w\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (table $0 16 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|2~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|3~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4~anonymous|0~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5~anonymous|0~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5~anonymous|0 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/unreachable.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $assembly/__tests__/unreachable.spec/counter (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 15))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 1140))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
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
 (func $~lib/util/runtime/adjust (; 18 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/allocator/arena/__mem_allocate (; 19 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 21 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/runtime/register (; 22 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/memory/HEAP_BASE
  i32.gt_u
  i32.eqz
  if
   i32.const 0
   i32.const 248
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
   i32.const 248
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
 (func "$assembly/internal/Expectation/Expectation<() => void>#constructor" (; 23 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 17
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
 (func $assembly/internal/Expectation/expectFn (; 24 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call "$assembly/internal/Expectation/Expectation<() => void>#constructor"
 )
 (func $~lib/allocator/arena/__mem_free (; 25 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $~lib/memory/memory.free (; 26 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $~lib/allocator/arena/__mem_free
 )
 (func "$assembly/internal/Expectation/Expectation<() => void>#cleanup" (; 27 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|2 (; 28 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 3
  call $assembly/internal/Expectation/expectFn
  local.set $1
  i32.const 304
  local.set $0
  local.get $1
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 400
  else   
   i32.const 432
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $1
  i32.load
  if (result i32)
   i32.const 432
  else   
   i32.const 400
  end
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 472
   i32.const 272
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $assembly/internal/Test/it (; 29 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|3~anonymous|0 (; 30 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/__tests__/unreachable.spec/counter
 )
 (func "$assembly/internal/Expectation/Expectation<() => void>#get:not" (; 31 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|3 (; 32 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 5
  call $assembly/internal/Expectation/expectFn
  call "$assembly/internal/Expectation/Expectation<() => void>#get:not"
  local.set $1
  i32.const 304
  local.set $0
  local.get $1
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 400
  else   
   i32.const 432
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $1
  i32.load
  if (result i32)
   i32.const 432
  else   
   i32.const 400
  end
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 472
   i32.const 272
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4~anonymous|0~anonymous|0 (; 33 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/__tests__/unreachable.spec/counter
  unreachable
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4~anonymous|0 (; 34 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 7
  call $assembly/internal/Expectation/expectFn
  call "$assembly/internal/Expectation/Expectation<() => void>#get:not"
  local.set $1
  i32.const 720
  local.set $0
  local.get $1
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 400
  else   
   i32.const 432
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $1
  i32.load
  if (result i32)
   i32.const 432
  else   
   i32.const 400
  end
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 472
   i32.const 272
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|4 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 8
  call $assembly/internal/Expectation/expectFn
  local.set $1
  i32.const 736
  local.set $0
  local.get $1
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 400
  else   
   i32.const 432
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $1
  i32.load
  if (result i32)
   i32.const 432
  else   
   i32.const 400
  end
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 472
   i32.const 272
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5~anonymous|0~anonymous|0 (; 36 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/__tests__/unreachable.spec/counter
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5~anonymous|0 (; 37 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 10
  call $assembly/internal/Expectation/expectFn
  local.set $1
  i32.const 720
  local.set $0
  local.get $1
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 400
  else   
   i32.const 432
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $1
  i32.load
  if (result i32)
   i32.const 432
  else   
   i32.const 400
  end
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 472
   i32.const 272
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|5 (; 38 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 11
  call $assembly/internal/Expectation/expectFn
  local.set $1
  i32.const 1000
  local.set $0
  local.get $1
  i32.load offset=4
  call $assembly/internal/Expectation/tryCall
  i32.const 0
  i32.ne
  i32.eqz
  local.set $2
  local.get $2
  if (result i32)
   i32.const 400
  else   
   i32.const 432
  end
  call $assembly/internal/Expectation/reportActualString
  local.get $1
  i32.load
  if (result i32)
   i32.const 432
  else   
   i32.const 400
  end
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedString
  local.get $1
  i32.load
  local.get $2
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 472
   i32.const 272
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call "$assembly/internal/Expectation/Expectation<() => void>#cleanup"
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 39 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 40 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 41 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportExpected (; 42 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 43 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0~anonymous|6 (; 44 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/unreachable.spec/counter
  call $assembly/internal/Expectation/expect<i32>
  local.set $2
  i32.const 1
  local.set $1
  i32.const 720
  local.set $0
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $2
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportExpected
  local.get $2
  i32.load
  local.get $1
  local.get $2
  i32.load offset=4
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 472
   i32.const 106
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $assembly/internal/Test/afterEach (; 45 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterEach
 )
 (func $start:assembly/__tests__/unreachable.spec~anonymous|0 (; 46 ;) (type $FUNCSIG$v)
  i32.const 1
  call $assembly/internal/Test/beforeEach
  i32.const 64
  i32.const 2
  i32.const 128
  call $assembly/internal/Test/throws
  i32.const 192
  i32.const 4
  call $assembly/internal/Test/it
  i32.const 552
  i32.const 6
  call $assembly/internal/Test/it
  i32.const 608
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 880
  i32.const 12
  call $assembly/internal/Test/it
  i32.const 13
  call $assembly/internal/Test/afterEach
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 47 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 48 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/unreachable.spec (; 49 ;) (type $FUNCSIG$v)
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
  i32.const 14
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 50 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 51 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/unreachable.spec
 )
 (func $null (; 52 ;) (type $FUNCSIG$v)
 )
)
