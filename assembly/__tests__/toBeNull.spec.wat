(module
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/Expectation/reportActualNull))
 (import "__aspect" "reportActualString" (func $assembly/internal/Expectation/reportActualString (param i32)))
 (import "__aspect" "reportActualReference" (func $assembly/internal/Expectation/reportActualReference (param i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/Expectation/reportExpectedNull (param i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 64) "\10\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00N\00u\00l\00l\00")
 (data (i32.const 96) "\10\00\00\00:\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00u\00l\00l\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 176) "\10\00\00\006\00\00\00\00\00\00\00\00\00\00\00n\00u\00l\00l\00 \00s\00h\00o\00u\00l\00d\00 \00a\00l\00w\00a\00y\00s\00 \00b\00e\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 248) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 328) "\10\00\00\00^\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00n\00u\00l\00l\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 440) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 456) "\10\00\00\00F\00\00\00\00\00\00\00\00\00\00\00N\00u\00l\00l\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 544) "\10\00\00\00N\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00t\00o\00 \00n\00o\00t\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 640) "\10\00\00\00F\00\00\00\00\00\00\00\00\00\00\00R\00e\00f\00e\00r\00e\00n\00c\00e\00 \00v\00a\00l\00u\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00b\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 728) "\10\00\00\00z\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 872) "\10\00\00\00\86\00\00\00\00\00\00\00\00\00\00\00R\00e\00f\00e\00r\00e\00n\00c\00e\00 \00v\00a\00l\00u\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00n\00\'\00t\00 \00n\00u\00l\00l\00 \00s\00h\00o\00u\00l\00d\00n\00\'\00t\00 \00b\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00b\00e\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 1024) "\10\00\00\00h\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00o\00B\00e\00N\00u\00l\00l\00 \00i\00s\00 \00c\00a\00l\00l\00e\00d\00 \00w\00i\00t\00h\00 \00a\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00")
 (data (i32.const 1144) "\10\00\00\00^\00\00\00\00\00\00\00\00\00\00\00V\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00t\00o\00B\00e\00N\00u\00l\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00")
 (table $0 8 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBeNull.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/__tests__/toBeNull.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 7))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 1256))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/util/runtime/adjust (; 11 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/allocator/arena/__mem_allocate (; 12 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 14 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/runtime/register (; 15 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/memory/HEAP_BASE
  i32.gt_u
  i32.eqz
  if
   i32.const 0
   i32.const 24
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
   i32.const 24
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
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 16 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 24
    call $~lib/util/runtime/allocate
    i32.const 17
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
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 17 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 18 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 19 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual (; 20 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   call $assembly/internal/Expectation/reportActualNull
  else   
   block (result i32)
    local.get $0
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $0
    i32.load offset=4
    call $assembly/internal/Expectation/reportActualString
   else    
    block (result i32)
     local.get $0
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $0
     i32.load offset=4
     local.set $1
     local.get $1
     local.get $1
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     call $assembly/internal/Expectation/reportActualReference
    else     
     local.get $0
     i32.load offset=4
     i32.const 24
     call $assembly/internal/Expectation/reportActualReference
    end
   end
  end
 )
 (func $~lib/allocator/arena/__mem_free (; 21 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $~lib/memory/memory.free (; 22 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $~lib/allocator/arena/__mem_free
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup (; 23 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|0 (; 24 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $1
  i32.const 192
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedNull
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 264
   i32.const 377
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $assembly/internal/Test/it (; 25 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 26 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|1 (; 27 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $1
  i32.const 456
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedNull
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 264
   i32.const 377
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $assembly/internal/Test/throws (; 28 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|2 (; 29 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toBeNull.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $1
  i32.const 656
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedNull
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 264
   i32.const 377
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|3 (; 30 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toBeNull.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $1
  i32.const 456
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedNull
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  i32.const 0
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $0
   i32.const 264
   i32.const 377
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 31 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 19
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
 (func $assembly/internal/Expectation/expect<i32> (; 32 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 33 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 34 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeNull.spec~anonymous|0~anonymous|4 (; 35 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.set $1
  i32.const 456
  local.set $0
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#reportActual
  local.get $1
  i32.load
  call $assembly/internal/Expectation/reportExpectedNull
  local.get $1
  i32.load
  i32.eqz
  if
   local.get $0
   i32.const 264
   i32.const 386
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $assembly/internal/Expectation/Expectation<i32>#cleanup
 )
 (func $start:assembly/__tests__/toBeNull.spec~anonymous|0 (; 36 ;) (type $FUNCSIG$v)
  i32.const 112
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 344
  i32.const 2
  i32.const 472
  call $assembly/internal/Test/throws
  i32.const 560
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 744
  i32.const 4
  i32.const 888
  call $assembly/internal/Test/throws
  i32.const 1040
  i32.const 5
  i32.const 1160
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 37 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 38 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toBeNull.spec (; 39 ;) (type $FUNCSIG$v)
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
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toBeNull.spec/vec1
  i32.const 80
  i32.const 6
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 40 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 41 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toBeNull.spec
 )
 (func $null (; 42 ;) (type $FUNCSIG$v)
 )
)
