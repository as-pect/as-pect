(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vd (func (param f64)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$iiiiii (func (param i32 i32 i32 i32 i32) (result i32)))
 (import "__aspect" "performanceEnabled" (func $assembly/internal/performance/performanceEnabled (param i32)))
 (import "__aspect" "maxSamples" (func $assembly/internal/performance/maxSamples (param f64)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "logNull" (func $assembly/internal/log/logNull))
 (import "__aspect" "logString" (func $assembly/internal/log/logString (param i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\0b\00\00\00p\00e\00r\00f\00o\00r\00m\00a\00n\00c\00e\00")
 (data (i32.const 40) "+\00\00\00T\00h\00i\00s\00 \00i\00s\00 \00a\00 \00t\00e\00s\00t\00 \00w\00i\00t\00h\00 \00s\00o\00m\00e\00 \00p\00e\00r\00f\00o\00r\00m\00a\00n\00c\00e\00 \00v\00a\00l\00u\00e\00s\00")
 (data (i32.const 136) "*\00\00\00T\00h\00i\00s\00 \00i\00s\00 \00a\00 \00t\00e\00s\00t\00 \00w\00i\00t\00h\00o\00u\00t\00 \00p\00e\00r\00f\00o\00r\00m\00a\00n\00c\00e\00 \00e\00n\00a\00b\00l\00e\00d\00")
 (data (i32.const 224) "\17\00\00\00T\00h\00i\00s\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00v\00i\00s\00i\00b\00l\00e\00.\00")
 (table $0 5 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/performance.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/performance.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/performance.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $assembly/internal/noOp/noOp i32 (i32.const 4))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 276))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $start:assembly/__tests__/performance.spec~anonymous|0~anonymous|0 (; 7 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  f64.const 1
  local.set $0
  block $break|0
   i32.const 1
   local.set $1
   loop $repeat|0
    local.get $1
    i32.const 10000
    i32.lt_s
    i32.eqz
    br_if $break|0
    local.get $0
    local.get $1
    f64.convert_i32_s
    f64.mul
    local.get $0
    f64.div
    f64.const 1
    f64.add
    local.set $0
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
 )
 (func $assembly/internal/Test/test (; 8 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $~lib/internal/string/compareUnsafe (; 9 ;) (type $FUNCSIG$iiiiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
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
 (func $~lib/string/String.__eq (; 10 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $start:assembly/__tests__/performance.spec~anonymous|0~anonymous|1 (; 11 ;) (type $FUNCSIG$v)
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
 (func $start:assembly/__tests__/performance.spec~anonymous|0 (; 12 ;) (type $FUNCSIG$v)
  i32.const 1
  call $assembly/internal/performance/performanceEnabled
  f64.const 1001
  call $assembly/internal/performance/maxSamples
  i32.const 40
  i32.const 1
  call $assembly/internal/Test/test
  i32.const 0
  call $assembly/internal/performance/performanceEnabled
  i32.const 136
  i32.const 2
  call $assembly/internal/Test/test
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 13 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 14 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/performance.spec (; 15 ;) (type $FUNCSIG$v)
  i32.const 8
  i32.const 3
  call $assembly/internal/Describe/describe
 )
 (func $start:~lib/allocator/arena (; 16 ;) (type $FUNCSIG$v)
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
 (func $start:assembly/index (; 17 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
 )
 (func $start (; 18 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/performance.spec
  call $start:assembly/index
 )
 (func $null (; 19 ;) (type $FUNCSIG$v)
 )
)
