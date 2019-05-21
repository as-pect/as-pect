(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$iiiiii (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (import "__aspect" "logNull" (func $assembly/internal/log/logNull))
 (import "__aspect" "logString" (func $assembly/internal/log/logString (param i32)))
 (import "__aspect" "reportBeforeAll" (func $assembly/internal/Test/reportBeforeAll (param i32)))
 (import "__aspect" "reportAfterAll" (func $assembly/internal/Test/reportAfterAll (param i32)))
 (import "__aspect" "reportBeforeEach" (func $assembly/internal/Test/reportBeforeEach (param i32)))
 (import "__aspect" "reportAfterEach" (func $assembly/internal/Test/reportAfterEach (param i32)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "logValue" (func $assembly/internal/log/logInteger (param i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "logReference" (func $assembly/internal/log/logReference (param i32 i32)))
 (import "__aspect" "reportTodo" (func $assembly/internal/Test/reportTodo (param i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\1b\00\00\00b\00e\00f\00o\00r\00e\00 \00a\00l\00l\00 \00o\00u\00t\00s\00i\00d\00e\00 \00d\00e\00s\00c\00r\00i\00b\00e\00")
 (data (i32.const 72) "\1a\00\00\00a\00f\00t\00e\00r\00 \00a\00l\00l\00 \00o\00u\00t\00s\00i\00d\00e\00 \00d\00e\00s\00c\00r\00i\00b\00e\00")
 (data (i32.const 128) "\04\00\00\00l\00o\00g\00s\00")
 (data (i32.const 144) "\n\00\00\00B\00e\00f\00o\00r\00e\00 \00A\00l\00l\00")
 (data (i32.const 168) "\t\00\00\00A\00f\00t\00e\00r\00 \00A\00l\00l\00")
 (data (i32.const 192) "\0b\00\00\00B\00e\00f\00o\00r\00e\00 \00E\00a\00c\00h\00")
 (data (i32.const 224) "\n\00\00\00A\00f\00t\00e\00r\00 \00E\00a\00c\00h\00")
 (data (i32.const 248) "\0c\00\00\00l\00o\00g\00 \00a\00 \00s\00t\00r\00i\00n\00g\00")
 (data (i32.const 280) "\11\00\00\00S\00o\00m\00e\00 \00s\00t\00r\00i\00n\00g\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 320) "\0c\00\00\00l\00o\00g\00 \00a\00 \00n\00u\00m\00b\00e\00r\00")
 (data (i32.const 352) "\12\00\00\00l\00o\00g\00 \00a\00n\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00")
 (data (i32.const 392) "\1b\00\00\00~\00l\00i\00b\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 456) "\1c\00\00\00~\00l\00i\00b\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 520) "\0f\00\00\00l\00o\00g\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 560) "\n\00\00\00l\00o\00g\00 \00a\00 \00n\00u\00l\00l\00")
 (data (i32.const 584) "\1c\00\00\00T\00h\00i\00s\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00a\00 \00v\00a\00l\00i\00d\00 \00t\00o\00d\00o\00.\00")
 (table $0 14 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/logs.spec~anonymous|0 $start:assembly/__tests__/logs.spec~anonymous|1 $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|1 $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|2 $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|3 $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|4 $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|5 $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|6 $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|7 $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|8 $start:assembly/__tests__/logs.spec~anonymous|2 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 13))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 644))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $~lib/internal/string/compareUnsafe (; 13 ;) (type $FUNCSIG$iiiiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 0
  local.set $5
  local.get $0
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  local.set $6
  local.get $2
  local.get $3
  i32.const 1
  i32.shl
  i32.add
  local.set $7
  block $break|0
   loop $continue|0
    local.get $4
    if (result i32)
     local.get $6
     i32.load16_u offset=4
     local.get $7
     i32.load16_u offset=4
     i32.sub
     local.tee $5
     i32.eqz
    else     
     local.get $4
    end
    if
     block
      local.get $4
      i32.const 1
      i32.sub
      local.set $4
      local.get $6
      i32.const 2
      i32.add
      local.set $6
      local.get $7
      i32.const 2
      i32.add
      local.set $7
     end
     br $continue|0
    end
   end
  end
  local.get $5
 )
 (func $~lib/string/String.__eq (; 14 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $1
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $0
  i32.const 0
  i32.eq
  local.tee $2
  if (result i32)
   local.get $2
  else   
   local.get $1
   i32.const 0
   i32.eq
  end
  if
   i32.const 0
   return
  end
  local.get $0
  i32.load
  local.set $3
  local.get $3
  local.get $1
  i32.load
  i32.ne
  if
   i32.const 0
   return
  end
  local.get $0
  i32.const 0
  local.get $1
  i32.const 0
  local.get $3
  call $~lib/internal/string/compareUnsafe
  i32.eqz
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0 (; 15 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 8
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   local.get $0
   call $assembly/internal/log/logString
  end
 )
 (func $assembly/internal/Test/beforeAll (; 16 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportBeforeAll
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|1 (; 17 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 72
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   local.get $0
   call $assembly/internal/log/logString
  end
 )
 (func $assembly/internal/Test/afterAll (; 18 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterAll
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|0 (; 19 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 144
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   local.get $0
   call $assembly/internal/log/logString
  end
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|1 (; 20 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 168
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   local.get $0
   call $assembly/internal/log/logString
  end
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|2 (; 21 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 192
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   local.get $0
   call $assembly/internal/log/logString
  end
 )
 (func $assembly/internal/Test/beforeEach (; 22 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportBeforeEach
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|3 (; 23 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 224
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   local.get $0
   call $assembly/internal/log/logString
  end
 )
 (func $assembly/internal/Test/afterEach (; 24 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterEach
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|4 (; 25 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 280
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   local.get $0
   call $assembly/internal/log/logString
  end
 )
 (func $assembly/internal/Test/test (; 26 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|5 (; 27 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 42
  local.set $0
  local.get $0
  call $assembly/internal/log/logInteger
 )
 (func $~lib/internal/arraybuffer/computeSize (; 28 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 1
  i32.const 32
  local.get $0
  i32.const 8
  i32.add
  i32.const 1
  i32.sub
  i32.clz
  i32.sub
  i32.shl
 )
 (func $start:~lib/allocator/arena (; 29 ;) (type $FUNCSIG$v)
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
 (func $~lib/allocator/arena/__memory_allocate (; 30 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/internal/arraybuffer/allocateUnsafe (; 31 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741816
  i32.le_u
  i32.eqz
  if
   i32.const 0
   i32.const 456
   i32.const 26
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $~lib/memory/memory.allocate|inlined.0 (result i32)
   local.get $0
   call $~lib/internal/arraybuffer/computeSize
   local.set $2
   local.get $2
   call $~lib/allocator/arena/__memory_allocate
   br $~lib/memory/memory.allocate|inlined.0
  end
  local.set $1
  local.get $1
  local.get $0
  i32.store
  local.get $1
 )
 (func $~lib/internal/memory/memset (; 32 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  local.get $2
  i32.eqz
  if
   return
  end
  local.get $0
  local.get $1
  i32.store8
  local.get $0
  local.get $2
  i32.add
  i32.const 1
  i32.sub
  local.get $1
  i32.store8
  local.get $2
  i32.const 2
  i32.le_u
  if
   return
  end
  local.get $0
  i32.const 1
  i32.add
  local.get $1
  i32.store8
  local.get $0
  i32.const 2
  i32.add
  local.get $1
  i32.store8
  local.get $0
  local.get $2
  i32.add
  i32.const 2
  i32.sub
  local.get $1
  i32.store8
  local.get $0
  local.get $2
  i32.add
  i32.const 3
  i32.sub
  local.get $1
  i32.store8
  local.get $2
  i32.const 6
  i32.le_u
  if
   return
  end
  local.get $0
  i32.const 3
  i32.add
  local.get $1
  i32.store8
  local.get $0
  local.get $2
  i32.add
  i32.const 4
  i32.sub
  local.get $1
  i32.store8
  local.get $2
  i32.const 8
  i32.le_u
  if
   return
  end
  i32.const 0
  local.get $0
  i32.sub
  i32.const 3
  i32.and
  local.set $3
  local.get $0
  local.get $3
  i32.add
  local.set $0
  local.get $2
  local.get $3
  i32.sub
  local.set $2
  local.get $2
  i32.const -4
  i32.and
  local.set $2
  i32.const -1
  i32.const 255
  i32.div_u
  local.get $1
  i32.const 255
  i32.and
  i32.mul
  local.set $4
  local.get $0
  local.get $4
  i32.store
  local.get $0
  local.get $2
  i32.add
  i32.const 4
  i32.sub
  local.get $4
  i32.store
  local.get $2
  i32.const 8
  i32.le_u
  if
   return
  end
  local.get $0
  i32.const 4
  i32.add
  local.get $4
  i32.store
  local.get $0
  i32.const 8
  i32.add
  local.get $4
  i32.store
  local.get $0
  local.get $2
  i32.add
  i32.const 12
  i32.sub
  local.get $4
  i32.store
  local.get $0
  local.get $2
  i32.add
  i32.const 8
  i32.sub
  local.get $4
  i32.store
  local.get $2
  i32.const 24
  i32.le_u
  if
   return
  end
  local.get $0
  i32.const 12
  i32.add
  local.get $4
  i32.store
  local.get $0
  i32.const 16
  i32.add
  local.get $4
  i32.store
  local.get $0
  i32.const 20
  i32.add
  local.get $4
  i32.store
  local.get $0
  i32.const 24
  i32.add
  local.get $4
  i32.store
  local.get $0
  local.get $2
  i32.add
  i32.const 28
  i32.sub
  local.get $4
  i32.store
  local.get $0
  local.get $2
  i32.add
  i32.const 24
  i32.sub
  local.get $4
  i32.store
  local.get $0
  local.get $2
  i32.add
  i32.const 20
  i32.sub
  local.get $4
  i32.store
  local.get $0
  local.get $2
  i32.add
  i32.const 16
  i32.sub
  local.get $4
  i32.store
  i32.const 24
  local.get $0
  i32.const 4
  i32.and
  i32.add
  local.set $3
  local.get $0
  local.get $3
  i32.add
  local.set $0
  local.get $2
  local.get $3
  i32.sub
  local.set $2
  local.get $4
  i64.extend_i32_u
  local.get $4
  i64.extend_i32_u
  i64.const 32
  i64.shl
  i64.or
  local.set $5
  block $break|0
   loop $continue|0
    local.get $2
    i32.const 32
    i32.ge_u
    if
     block
      local.get $0
      local.get $5
      i64.store
      local.get $0
      i32.const 8
      i32.add
      local.get $5
      i64.store
      local.get $0
      i32.const 16
      i32.add
      local.get $5
      i64.store
      local.get $0
      i32.const 24
      i32.add
      local.get $5
      i64.store
      local.get $2
      i32.const 32
      i32.sub
      local.set $2
      local.get $0
      i32.const 32
      i32.add
      local.set $0
     end
     br $continue|0
    end
   end
  end
 )
 (func $~lib/memory/memory.allocate (; 33 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__memory_allocate
  return
 )
 (func $~lib/internal/typedarray/TypedArray<u8>#constructor (; 34 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 1073741816
  i32.gt_u
  if
   i32.const 0
   i32.const 392
   i32.const 23
   i32.const 34
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 0
  i32.shl
  local.set $2
  local.get $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  block $~lib/memory/memory.fill|inlined.0
   local.get $3
   i32.const 8
   i32.add
   local.set $4
   i32.const 0
   local.set $5
   local.get $2
   local.set $6
   local.get $4
   local.get $5
   local.get $6
   call $~lib/internal/memory/memset
  end
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 12
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
   i32.const 0
   i32.store offset=8
   local.get $0
  end
  local.get $3
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  local.get $2
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#constructor (; 35 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<u8>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<u8>#__unchecked_set (; 36 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load
  local.set $3
  local.get $1
  local.set $4
  local.get $2
  local.set $5
  local.get $0
  i32.load offset=4
  local.set $6
  local.get $3
  local.get $4
  i32.const 0
  i32.shl
  i32.add
  local.get $6
  i32.add
  local.get $5
  i32.store8 offset=8
 )
 (func $~lib/internal/typedarray/TypedArray<u8>#__unchecked_get (; 37 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.set $2
  local.get $1
  local.set $3
  local.get $0
  i32.load offset=4
  local.set $4
  local.get $2
  local.get $3
  i32.const 0
  i32.shl
  i32.add
  local.get $4
  i32.add
  i32.load8_u offset=8
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|6 (; 38 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 0
  i32.const 8
  call $~lib/typedarray/Uint8Array#constructor
  local.set $0
  block $break|0
   i32.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    i32.const 8
    i32.lt_s
    i32.eqz
    br_if $break|0
    block (result i32)
     local.get $0
     local.tee $2
     local.get $1
     local.tee $3
     local.get $1
     i32.const 255
     i32.and
     call $~lib/internal/typedarray/TypedArray<u8>#__unchecked_set
     local.get $2
     local.get $3
     call $~lib/internal/typedarray/TypedArray<u8>#__unchecked_get
    end
    drop
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  block $assembly/internal/log/log<~lib/arraybuffer/ArrayBuffer>|inlined.0
   local.get $0
   i32.load
   local.set $1
   local.get $1
   i32.const 0
   i32.eq
   if
    call $assembly/internal/log/logNull
   else    
    block $~lib/arraybuffer/ArrayBuffer#get:data|inlined.0 (result i32)
     local.get $1
     local.set $2
     local.get $2
     i32.const 8
     i32.add
    end
    local.get $1
    i32.load
    call $assembly/internal/log/logReference
   end
  end
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 39 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
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
 (func $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|7 (; 40 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  local.set $0
  local.get $0
  i32.const 0
  i32.eq
  if
   call $assembly/internal/log/logNull
  else   
   local.get $0
   i32.const 24
   call $assembly/internal/log/logReference
  end
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2~anonymous|8 (; 41 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 0
  local.set $0
  local.get $0
  i32.const 0
  i32.eq
  if
   call $assembly/internal/log/logNull
  else   
   local.get $0
   i32.const 24
   call $assembly/internal/log/logReference
  end
 )
 (func $assembly/internal/Test/todo (; 42 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportTodo
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2 (; 43 ;) (type $FUNCSIG$v)
  i32.const 3
  call $assembly/internal/Test/beforeAll
  i32.const 4
  call $assembly/internal/Test/afterAll
  i32.const 5
  call $assembly/internal/Test/beforeEach
  i32.const 6
  call $assembly/internal/Test/afterEach
  i32.const 248
  i32.const 7
  call $assembly/internal/Test/test
  i32.const 320
  i32.const 8
  call $assembly/internal/Test/test
  i32.const 352
  i32.const 9
  call $assembly/internal/Test/test
  i32.const 520
  i32.const 10
  call $assembly/internal/Test/test
  i32.const 560
  i32.const 11
  call $assembly/internal/Test/test
  i32.const 584
  call $assembly/internal/Test/todo
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
 (func $start:assembly/__tests__/logs.spec (; 46 ;) (type $FUNCSIG$v)
  i32.const 1
  call $assembly/internal/Test/beforeAll
  i32.const 2
  call $assembly/internal/Test/afterAll
  call $start:~lib/allocator/arena
  i32.const 128
  i32.const 12
  call $assembly/internal/Describe/describe
 )
 (func $start (; 47 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/logs.spec
 )
 (func $null (; 48 ;) (type $FUNCSIG$v)
 )
)
