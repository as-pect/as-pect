(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (import "linked" "getValue" (func $assembly/__tests__/customImports.spec/getValue (result i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "logValue" (func $assembly/internal/log/logInteger (param i32)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00l\00i\00n\00k\00e\00d\00 \00f\00u\00n\00c\00t\00i\00o\00n\00s\00")
 (data (i32.const 48) "\10\00\00\00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00l\00i\00n\00k\00e\00d\00")
 (data (i32.const 88) "\00\00\00\00")
 (data (i32.const 96) " \00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (table $0 4 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/customImports.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/customImports.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 3))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 164))
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
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 12 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 13 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 14 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportExpected (; 15 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedInteger
 )
 (func $~lib/allocator/arena/__memory_free (; 16 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 17 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/customImports.spec~anonymous|0~anonymous|0 (; 18 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  call $assembly/__tests__/customImports.spec/getValue
  local.set $0
  block $assembly/internal/Expectation/Expectation<i32>#toBe|inlined.0
   local.get $0
   call $assembly/internal/Expectation/expect<i32>
   local.set $1
   i32.const 42
   local.set $2
   i32.const 88
   local.set $3
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#reportActual
   local.get $1
   local.get $2
   call $assembly/internal/Expectation/Expectation<i32>#reportExpected
   local.get $1
   i32.load
   local.get $2
   local.get $1
   i32.load offset=4
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $3
    i32.const 96
    i32.const 106
    i32.const 4
    call $~lib/env/abort
    unreachable
   end
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#cleanup
  end
  block $assembly/internal/log/log<i32>|inlined.0
   local.get $0
   local.set $3
   local.get $3
   call $assembly/internal/log/logInteger
  end
 )
 (func $assembly/internal/Test/it (; 19 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $start:assembly/__tests__/customImports.spec~anonymous|0 (; 20 ;) (type $FUNCSIG$v)
  i32.const 48
  i32.const 1
  call $assembly/internal/Test/it
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 21 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 22 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/customImports.spec (; 23 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
  i32.const 8
  i32.const 2
  call $assembly/internal/Describe/describe
 )
 (func $start (; 24 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/customImports.spec
 )
 (func $null (; 25 ;) (type $FUNCSIG$v)
 )
)
