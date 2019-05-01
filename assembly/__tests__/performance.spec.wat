(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vd (func (param f64)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iiiiii (func (param i32 i32 i32 i32 i32) (result i32)))
 (import "__aspect" "performanceEnabled" (func $assembly/internal/performance/performanceEnabled (param i32)))
 (import "__aspect" "maxSamples" (func $assembly/internal/performance/maxSamples (param f64)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "logNull" (func $assembly/internal/log/logNull))
 (import "__aspect" "logString" (func $assembly/internal/log/logString (param i32)))
 (import "__aspect" "logReference" (func $assembly/internal/log/logReference (param i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00p\00e\00r\00f\00o\00r\00m\00a\00n\00c\00e\00")
 (data (i32.const 48) "\10\00\00\00V\00\00\00\00\00\00\00\00\00\00\00T\00h\00i\00s\00 \00i\00s\00 \00a\00 \00t\00e\00s\00t\00 \00w\00i\00t\00h\00 \00s\00o\00m\00e\00 \00p\00e\00r\00f\00o\00r\00m\00a\00n\00c\00e\00 \00v\00a\00l\00u\00e\00s\00")
 (data (i32.const 152) "\10\00\00\00T\00\00\00\00\00\00\00\00\00\00\00T\00h\00i\00s\00 \00i\00s\00 \00a\00 \00t\00e\00s\00t\00 \00w\00i\00t\00h\00o\00u\00t\00 \00p\00e\00r\00f\00o\00r\00m\00a\00n\00c\00e\00 \00e\00n\00a\00b\00l\00e\00d\00")
 (data (i32.const 256) "\10\00\00\00.\00\00\00\00\00\00\00\00\00\00\00T\00h\00i\00s\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00v\00i\00s\00i\00b\00l\00e\00.\00")
 (table $0 5 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/performance.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/performance.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/performance.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $assembly/internal/noOp/noOp i32 (i32.const 4))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $start:assembly/__tests__/performance.spec~anonymous|0~anonymous|0 (; 8 ;) (type $FUNCSIG$v)
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
 (func $assembly/internal/Test/test (; 9 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $~lib/string/String#get:length (; 10 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
  i32.const 1
  i32.shr_u
 )
 (func $~lib/util/string/compareImpl (; 11 ;) (type $FUNCSIG$iiiiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
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
 (func $~lib/string/String.__eq (; 12 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 13 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
 )
 (func $start:assembly/__tests__/performance.spec~anonymous|0~anonymous|1 (; 14 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 272
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
 (func $start:assembly/__tests__/performance.spec~anonymous|0 (; 15 ;) (type $FUNCSIG$v)
  i32.const 1
  call $assembly/internal/performance/performanceEnabled
  f64.const 1001
  call $assembly/internal/performance/maxSamples
  i32.const 64
  i32.const 1
  call $assembly/internal/Test/test
  i32.const 0
  call $assembly/internal/performance/performanceEnabled
  i32.const 168
  i32.const 2
  call $assembly/internal/Test/test
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
 (func $start:assembly/__tests__/performance.spec (; 18 ;) (type $FUNCSIG$v)
  i32.const 24
  i32.const 3
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 19 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 20 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/performance.spec
 )
 (func $null (; 21 ;) (type $FUNCSIG$v)
 )
)
