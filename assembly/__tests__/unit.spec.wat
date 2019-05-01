(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00u\00n\00i\00t\00 \00t\00y\00p\00e\00s\00")
 (data (i32.const 48) "\10\00\00\00N\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00r\00e\00a\00t\00e\00 \00i\00n\00s\00t\00a\00n\00c\00e\00o\00f\00 \00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00<\00T\00>\00")
 (data (i32.const 144) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 200) "\10\00\00\00R\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00r\00e\00s\00u\00l\00t\00 \00i\00s\00 \00n\00o\00t\00 \00i\00n\00s\00t\00a\00n\00c\00e\00o\00f\00 \00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00")
 (data (i32.const 304) "\10\00\00\00>\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00u\00n\00i\00t\00.\00s\00p\00e\00c\00.\00t\00s\00")
 (data (i32.const 384) "\10\00\00\00R\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00r\00e\00a\00t\00e\00 \00a\00n\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00w\00i\00t\00h\00 \00a\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 488) "\10\00\00\00j\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00e\00x\00p\00e\00c\00t\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00r\00e\00p\00o\00r\00t\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 616) "\10\00\00\00>\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00n\00e\00g\00a\00t\00e\00 \00t\00h\00e\00 \00_\00n\00o\00t\00 \00p\00r\00o\00p\00e\00r\00t\00y\00")
 (data (i32.const 696) "\10\00\00\00H\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00e\00x\00p\00e\00c\00t\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00w\00a\00s\00 \00n\00o\00t\00 \00n\00e\00g\00a\00t\00e\00d\00.\00")
 (table $0 6 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/unit.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/unit.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/unit.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/unit.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 5))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 784))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/util/runtime/adjust (; 4 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/allocator/arena/__mem_allocate (; 5 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.allocate (; 6 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 7 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/runtime/register (; 8 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/memory/HEAP_BASE
  i32.gt_u
  i32.eqz
  if
   i32.const 0
   i32.const 160
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
   i32.const 160
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
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 9 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 10 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $start:assembly/__tests__/unit.spec~anonymous|0~anonymous|0 (; 11 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  block (result i32)
   local.get $0
   drop
   i32.const 1
  end
  i32.eqz
  if
   i32.const 216
   i32.const 320
   i32.const 8
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $assembly/internal/Test/it (; 12 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $start:assembly/__tests__/unit.spec~anonymous|0~anonymous|1 (; 13 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.eq
  i32.eqz
  if
   i32.const 504
   i32.const 320
   i32.const 13
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 14 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/unit.spec~anonymous|0~anonymous|2 (; 15 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<i32>
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.set $0
  local.get $0
  i32.const 0
  i32.add
  i32.load8_u
  local.set $1
  local.get $1
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 712
   i32.const 320
   i32.const 19
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/unit.spec~anonymous|0 (; 16 ;) (type $FUNCSIG$v)
  i32.const 64
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 400
  i32.const 2
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 3
  call $assembly/internal/Test/it
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 17 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 18 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/unit.spec (; 19 ;) (type $FUNCSIG$v)
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
  i32.const 4
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 20 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 21 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/unit.spec
 )
 (func $null (; 22 ;) (type $FUNCSIG$v)
 )
)
