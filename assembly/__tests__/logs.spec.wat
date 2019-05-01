(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iiiiii (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (import "__aspect" "logNull" (func $assembly/internal/log/logNull))
 (import "__aspect" "logString" (func $assembly/internal/log/logString (param i32)))
 (import "__aspect" "logReference" (func $assembly/internal/log/logReference (param i32 i32)))
 (import "__aspect" "reportBeforeAll" (func $assembly/internal/Test/reportBeforeAll (param i32)))
 (import "__aspect" "reportAfterAll" (func $assembly/internal/Test/reportAfterAll (param i32)))
 (import "__aspect" "reportBeforeEach" (func $assembly/internal/Test/reportBeforeEach (param i32)))
 (import "__aspect" "reportAfterEach" (func $assembly/internal/Test/reportAfterEach (param i32)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "logValue" (func $assembly/internal/log/logInteger (param i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportTodo" (func $assembly/internal/Test/reportTodo (param i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00l\00o\00g\00s\00")
 (data (i32.const 32) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00B\00e\00f\00o\00r\00e\00 \00A\00l\00l\00")
 (data (i32.const 72) "\10\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00A\00f\00t\00e\00r\00 \00A\00l\00l\00")
 (data (i32.const 112) "\10\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00B\00e\00f\00o\00r\00e\00 \00E\00a\00c\00h\00")
 (data (i32.const 152) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00A\00f\00t\00e\00r\00 \00E\00a\00c\00h\00")
 (data (i32.const 192) "\10\00\00\00\18\00\00\00\00\00\00\00\00\00\00\00l\00o\00g\00 \00a\00 \00s\00t\00r\00i\00n\00g\00")
 (data (i32.const 232) "\10\00\00\00\"\00\00\00\00\00\00\00\00\00\00\00S\00o\00m\00e\00 \00s\00t\00r\00i\00n\00g\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 288) "\10\00\00\00\18\00\00\00\00\00\00\00\00\00\00\00l\00o\00g\00 \00a\00 \00n\00u\00m\00b\00e\00r\00")
 (data (i32.const 328) "\10\00\00\00$\00\00\00\00\00\00\00\00\00\00\00l\00o\00g\00 \00a\00n\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00")
 (data (i32.const 384) "\10\00\00\00&\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 440) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 496) "\10\00\00\00$\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 552) "\10\00\00\00\1e\00\00\00\00\00\00\00\00\00\00\00l\00o\00g\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 600) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00l\00o\00g\00 \00a\00 \00n\00u\00l\00l\00")
 (data (i32.const 640) "\10\00\00\008\00\00\00\00\00\00\00\00\00\00\00T\00h\00i\00s\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00a\00 \00v\00a\00l\00i\00d\00 \00t\00o\00d\00o\00.\00")
 (table $0 12 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/logs.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/util/runtime/MAX_BYTELENGTH i32 (i32.const 1073741808))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 11))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 712))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/string/String#get:length (; 13 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
  i32.const 1
  i32.shr_u
 )
 (func $~lib/util/string/compareImpl (; 14 ;) (type $FUNCSIG$iiiiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
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
     i32.load16_u
     local.get $7
     i32.load16_u
     i32.sub
     local.tee $5
     i32.eqz
    else     
     i32.const 0
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
 (func $~lib/string/String.__eq (; 15 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  if (result i32)
   i32.const 1
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
  call $~lib/string/String#get:length
  local.set $2
  local.get $2
  local.get $1
  call $~lib/string/String#get:length
  i32.ne
  if
   i32.const 0
   return
  end
  local.get $0
  i32.const 0
  local.get $1
  i32.const 0
  local.get $2
  call $~lib/util/string/compareImpl
  i32.eqz
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 16 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|0 (; 17 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 48
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   block (result i32)
    local.get $0
    drop
    i32.const 1
   end
   if
    local.get $0
    call $assembly/internal/log/logString
   else    
    block (result i32)
     local.get $0
     drop
     i32.const 0
    end
    if
     local.get $0
     local.set $1
     local.get $1
     local.get $1
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     call $assembly/internal/log/logReference
    else     
     local.get $0
     i32.const 0
     call $assembly/internal/log/logReference
    end
   end
  end
 )
 (func $assembly/internal/Test/beforeAll (; 18 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportBeforeAll
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|1 (; 19 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 88
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   block (result i32)
    local.get $0
    drop
    i32.const 1
   end
   if
    local.get $0
    call $assembly/internal/log/logString
   else    
    block (result i32)
     local.get $0
     drop
     i32.const 0
    end
    if
     local.get $0
     local.set $1
     local.get $1
     local.get $1
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     call $assembly/internal/log/logReference
    else     
     local.get $0
     i32.const 0
     call $assembly/internal/log/logReference
    end
   end
  end
 )
 (func $assembly/internal/Test/afterAll (; 20 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterAll
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|2 (; 21 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 128
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   block (result i32)
    local.get $0
    drop
    i32.const 1
   end
   if
    local.get $0
    call $assembly/internal/log/logString
   else    
    block (result i32)
     local.get $0
     drop
     i32.const 0
    end
    if
     local.get $0
     local.set $1
     local.get $1
     local.get $1
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     call $assembly/internal/log/logReference
    else     
     local.get $0
     i32.const 0
     call $assembly/internal/log/logReference
    end
   end
  end
 )
 (func $assembly/internal/Test/beforeEach (; 22 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportBeforeEach
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|3 (; 23 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 168
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   block (result i32)
    local.get $0
    drop
    i32.const 1
   end
   if
    local.get $0
    call $assembly/internal/log/logString
   else    
    block (result i32)
     local.get $0
     drop
     i32.const 0
    end
    if
     local.get $0
     local.set $1
     local.get $1
     local.get $1
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     call $assembly/internal/log/logReference
    else     
     local.get $0
     i32.const 0
     call $assembly/internal/log/logReference
    end
   end
  end
 )
 (func $assembly/internal/Test/afterEach (; 24 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportAfterEach
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|4 (; 25 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 248
  local.set $0
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   call $assembly/internal/log/logNull
  else   
   block (result i32)
    local.get $0
    drop
    i32.const 1
   end
   if
    local.get $0
    call $assembly/internal/log/logString
   else    
    block (result i32)
     local.get $0
     drop
     i32.const 0
    end
    if
     local.get $0
     local.set $1
     local.get $1
     local.get $1
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     call $assembly/internal/log/logReference
    else     
     local.get $0
     i32.const 0
     call $assembly/internal/log/logReference
    end
   end
  end
 )
 (func $assembly/internal/Test/test (; 26 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|5 (; 27 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 42
  local.set $0
  local.get $0
  call $assembly/internal/log/logInteger
 )
 (func $~lib/util/runtime/adjust (; 28 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/allocator/arena/__mem_allocate (; 29 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.allocate (; 30 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 31 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.fill (; 32 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  block $~lib/util/memory/memset|inlined.0
   local.get $2
   i32.eqz
   if
    br $~lib/util/memory/memset|inlined.0
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
    br $~lib/util/memory/memset|inlined.0
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
    br $~lib/util/memory/memset|inlined.0
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
    br $~lib/util/memory/memset|inlined.0
   end
   i32.const 0
   local.get $0
   i32.sub
   i32.const 3
   i32.and
   local.set $5
   local.get $0
   local.get $5
   i32.add
   local.set $0
   local.get $2
   local.get $5
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
    br $~lib/util/memory/memset|inlined.0
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
    br $~lib/util/memory/memset|inlined.0
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
   local.set $5
   local.get $0
   local.get $5
   i32.add
   local.set $0
   local.get $2
   local.get $5
   i32.sub
   local.set $2
   local.get $4
   i64.extend_i32_u
   local.get $4
   i64.extend_i32_u
   i64.const 32
   i64.shl
   i64.or
   local.set $6
   block $break|0
    loop $continue|0
     local.get $2
     i32.const 32
     i32.ge_u
     if
      block
       local.get $0
       local.get $6
       i64.store
       local.get $0
       i32.const 8
       i32.add
       local.get $6
       i64.store
       local.get $0
       i32.const 16
       i32.add
       local.get $6
       i64.store
       local.get $0
       i32.const 24
       i32.add
       local.get $6
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
  end
 )
 (func $~lib/util/runtime/register (; 33 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/memory/HEAP_BASE
  i32.gt_u
  i32.eqz
  if
   i32.const 0
   i32.const 456
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
   i32.const 456
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
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 34 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  global.get $~lib/util/runtime/MAX_BYTELENGTH
  i32.gt_u
  if
   i32.const 0
   i32.const 400
   i32.const 54
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/util/runtime/allocate
  local.set $2
  local.get $2
  i32.const 0
  local.get $1
  call $~lib/memory/memory.fill
  local.get $2
  i32.const 15
  call $~lib/util/runtime/register
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 35 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $1
  global.get $~lib/util/runtime/MAX_BYTELENGTH
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 0
   i32.const 400
   i32.const 12
   i32.const 57
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 0
  local.get $1
  local.get $2
  i32.shl
  local.tee $1
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 12
    call $~lib/util/runtime/allocate
    i32.const 14
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
   i32.const 0
   i32.store offset=8
   local.get $0
  end
  local.get $3
  i32.store
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#constructor (; 36 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 17
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#__set (; 37 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 0
   i32.const 512
   i32.const 116
   i32.const 44
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/typedarray/Uint8Array#get:buffer (; 38 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load
 )
 (func $~lib/allocator/arena/__mem_free (; 39 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $~lib/memory/memory.free (; 40 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $~lib/allocator/arena/__mem_free
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|6 (; 41 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
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
    local.get $0
    local.get $1
    local.get $1
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
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
   call $~lib/typedarray/Uint8Array#get:buffer
   local.set $1
   local.get $1
   i32.const 0
   i32.eq
   if
    call $assembly/internal/log/logNull
   else    
    block (result i32)
     local.get $1
     drop
     i32.const 0
    end
    if
     local.get $1
     call $assembly/internal/log/logString
    else     
     block (result i32)
      local.get $1
      drop
      i32.const 1
     end
     if
      local.get $1
      local.set $2
      local.get $2
      local.get $2
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/log/logReference
     else      
      local.get $1
      i32.const 0
      call $assembly/internal/log/logReference
     end
    end
   end
  end
  local.get $0
  call $~lib/typedarray/Uint8Array#get:buffer
  call $~lib/memory/memory.free
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 42 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 24
    call $~lib/util/runtime/allocate
    i32.const 18
    call $~lib/util/runtime/register
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
 (func $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|7 (; 43 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
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
   block (result i32)
    local.get $0
    drop
    i32.const 0
   end
   if
    local.get $0
    call $assembly/internal/log/logString
   else    
    block (result i32)
     local.get $0
     drop
     i32.const 0
    end
    if
     local.get $0
     local.set $1
     local.get $1
     local.get $1
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     call $assembly/internal/log/logReference
    else     
     local.get $0
     i32.const 24
     call $assembly/internal/log/logReference
    end
   end
  end
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0~anonymous|8 (; 44 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  local.set $0
  local.get $0
  i32.const 0
  i32.eq
  if
   call $assembly/internal/log/logNull
  else   
   block (result i32)
    local.get $0
    drop
    i32.const 0
   end
   if
    local.get $0
    call $assembly/internal/log/logString
   else    
    block (result i32)
     local.get $0
     drop
     i32.const 0
    end
    if
     local.get $0
     local.set $1
     local.get $1
     local.get $1
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     call $assembly/internal/log/logReference
    else     
     local.get $0
     i32.const 24
     call $assembly/internal/log/logReference
    end
   end
  end
 )
 (func $assembly/internal/Test/todo (; 45 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $assembly/internal/Test/reportTodo
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0 (; 46 ;) (type $FUNCSIG$v)
  i32.const 1
  call $assembly/internal/Test/beforeAll
  i32.const 2
  call $assembly/internal/Test/afterAll
  i32.const 3
  call $assembly/internal/Test/beforeEach
  i32.const 4
  call $assembly/internal/Test/afterEach
  i32.const 208
  i32.const 5
  call $assembly/internal/Test/test
  i32.const 304
  i32.const 6
  call $assembly/internal/Test/test
  i32.const 344
  i32.const 7
  call $assembly/internal/Test/test
  i32.const 568
  i32.const 8
  call $assembly/internal/Test/test
  i32.const 616
  i32.const 9
  call $assembly/internal/Test/test
  i32.const 656
  call $assembly/internal/Test/todo
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
 (func $start:assembly/__tests__/logs.spec (; 49 ;) (type $FUNCSIG$v)
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
  i32.const 10
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 50 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 51 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/logs.spec
 )
 (func $null (; 52 ;) (type $FUNCSIG$v)
 )
)
