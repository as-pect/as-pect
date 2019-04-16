(module
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/Expectation/reportActualNull))
 (import "__aspect" "reportActualReference" (func $assembly/internal/Expectation/reportActualReference (param i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/Expectation/reportExpectedNull (param i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/Expectation/reportExpectedReference (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\13\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 56) "\1c\00\00\00~\00l\00i\00b\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 120) "\0d\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00")
 (data (i32.const 152) "@\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00")
 (data (i32.const 288) "\00\00\00\00")
 (data (i32.const 296) " \00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 368) ",\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 464) "=\00\00\00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 592) "1\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00t\00h\00a\00t\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 696) "0\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 800) "=\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 928) "=\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1056) "K\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 1216) "?\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1352) "A\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1488) "P\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 1656) "@\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 1792) "D\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00n\00u\00l\00l\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00 \00v\00a\00l\00u\00e\00s\00")
 (data (i32.const 1936) ";\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00s\00t\00r\00i\00t\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 2064) ">\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 2192) "H\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2344) "H\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2496) "$\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 2576) "R\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00q\00u\00a\00l\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00o\00t\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 2744) "_\00\00\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (data (i32.const 2944) "(\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 3032) "R\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 3200) "_\00\00\00N\00o\00n\00-\00s\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (table $0 21 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/vec2 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/vec3 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buffsize (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buff1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buff2 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buff3 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 20))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 3396))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $start:~lib/allocator/arena (; 12 ;) (type $FUNCSIG$v)
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
 (func $~lib/allocator/arena/__memory_allocate (; 13 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.allocate (; 14 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__memory_allocate
  return
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 15 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
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
 (func $~lib/internal/arraybuffer/computeSize (; 16 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/internal/arraybuffer/allocateUnsafe (; 17 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741816
  i32.le_u
  i32.eqz
  if
   i32.const 0
   i32.const 56
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
 (func $~lib/internal/memory/memset (; 18 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 19 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 1073741816
  i32.gt_u
  if
   i32.const 0
   i32.const 8
   i32.const 47
   i32.const 40
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  local.get $2
  i32.const 0
  i32.ne
  i32.eqz
  if
   local.get $3
   i32.const 8
   i32.add
   local.set $4
   i32.const 0
   local.set $5
   local.get $1
   local.set $6
   local.get $4
   local.get $5
   local.get $6
   call $~lib/internal/memory/memset
  end
  local.get $3
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 20 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 21 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportActual (; 22 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  call $assembly/internal/Expectation/reportActualInteger
 )
 (func $assembly/internal/Expectation/Expectation<i32>#reportExpected (; 23 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedInteger
 )
 (func $~lib/allocator/arena/__memory_free (; 24 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $assembly/internal/Expectation/Expectation<i32>#cleanup (; 25 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 (; 26 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.0
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.set $0
   i32.const 3
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<i32>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.0
   end
   block $assembly/internal/Expectation/Expectation<i32>#toBe|inlined.0
    local.get $0
    local.set $3
    local.get $1
    local.set $4
    i32.const 288
    local.set $5
    local.get $3
    call $assembly/internal/Expectation/Expectation<i32>#reportActual
    local.get $3
    local.get $4
    call $assembly/internal/Expectation/Expectation<i32>#reportExpected
    local.get $3
    i32.load
    local.get $4
    local.get $3
    i32.load offset=4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 296
     i32.const 106
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $3
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
   end
  end
 )
 (func $assembly/internal/Test/it (; 27 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 28 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 (; 29 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.1
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   call $assembly/internal/Expectation/Expectation<i32>#get:not
   local.set $0
   i32.const 3
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<i32>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.1
   end
   block $assembly/internal/Expectation/Expectation<i32>#toBe|inlined.1
    local.get $0
    local.set $3
    local.get $1
    local.set $4
    i32.const 288
    local.set $5
    local.get $3
    call $assembly/internal/Expectation/Expectation<i32>#reportActual
    local.get $3
    local.get $4
    call $assembly/internal/Expectation/Expectation<i32>#reportExpected
    local.get $3
    i32.load
    local.get $4
    local.get $3
    i32.load offset=4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 296
     i32.const 106
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $3
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
   end
  end
 )
 (func $assembly/internal/Test/throws (; 30 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 (; 31 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.2
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   call $assembly/internal/Expectation/Expectation<i32>#get:not
   local.set $0
   i32.const 1
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<i32>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.2
   end
   block $assembly/internal/Expectation/Expectation<i32>#toBe|inlined.2
    local.get $0
    local.set $3
    local.get $1
    local.set $4
    i32.const 288
    local.set $5
    local.get $3
    call $assembly/internal/Expectation/Expectation<i32>#reportActual
    local.get $3
    local.get $4
    call $assembly/internal/Expectation/Expectation<i32>#reportExpected
    local.get $3
    i32.load
    local.get $4
    local.get $3
    i32.load offset=4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 296
     i32.const 106
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $3
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
   end
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 (; 32 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.3
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.set $0
   i32.const 1
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<i32>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<i32>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.3
   end
   block $assembly/internal/Expectation/Expectation<i32>#toBe|inlined.3
    local.get $0
    local.set $3
    local.get $1
    local.set $4
    i32.const 288
    local.set $5
    local.get $3
    call $assembly/internal/Expectation/Expectation<i32>#reportActual
    local.get $3
    local.get $4
    call $assembly/internal/Expectation/Expectation<i32>#reportExpected
    local.get $3
    i32.load
    local.get $4
    local.get $3
    i32.load offset=4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 296
     i32.const 106
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $3
    call $assembly/internal/Expectation/Expectation<i32>#cleanup
   end
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 33 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 34 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual (; 35 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   call $assembly/internal/Expectation/reportActualNull
  else   
   local.get $0
   i32.load offset=4
   i32.const 24
   call $assembly/internal/Expectation/reportActualReference
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected (; 36 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $1
  i32.const 0
  i32.eq
  if
   local.get $0
   i32.load
   call $assembly/internal/Expectation/reportExpectedNull
  else   
   local.get $1
   i32.const 24
   local.get $0
   i32.load
   call $assembly/internal/Expectation/reportExpectedReference
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup (; 37 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/internal/memory/memcmp (; 38 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  local.get $1
  i32.eq
  if
   i32.const 0
   return
  end
  block $break|0
   loop $continue|0
    local.get $2
    i32.const 0
    i32.ne
    local.tee $3
    if (result i32)
     local.get $0
     i32.load8_u
     local.get $1
     i32.load8_u
     i32.eq
    else     
     local.get $3
    end
    if
     block
      local.get $2
      i32.const 1
      i32.sub
      local.set $2
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      local.get $1
      i32.const 1
      i32.add
      local.set $1
     end
     br $continue|0
    end
   end
  end
  local.get $2
  if (result i32)
   local.get $0
   i32.load8_u
   local.get $1
   i32.load8_u
   i32.sub
  else   
   i32.const 0
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 (; 39 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/vec3
   local.set $1
   i32.const 1056
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   end
   block $~lib/memory/memory.compare|inlined.0 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 40 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 (; 41 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/vec3
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   end
   block $~lib/memory/memory.compare|inlined.1 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 (; 42 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/vec2
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   end
   block $~lib/memory/memory.compare|inlined.2 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 (; 43 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/vec2
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   end
   block $~lib/memory/memory.compare|inlined.3 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 (; 44 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $0
   i32.const 0
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   end
   block $~lib/memory/memory.compare|inlined.4 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 (; 45 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $0
   i32.const 0
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   end
   block $~lib/memory/memory.compare|inlined.5 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 (; 46 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $0
   i32.const 0
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   end
   block $~lib/memory/memory.compare|inlined.6 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 (; 47 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $0
   i32.const 0
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   end
   block $~lib/memory/memory.compare|inlined.7 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 (; 48 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   end
   block $~lib/memory/memory.compare|inlined.8 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 (; 49 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   local.set $1
   i32.const 288
   local.set $2
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportActual
   local.get $0
   local.get $1
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#reportExpected
   local.get $1
   local.get $0
   i32.load offset=4
   i32.eq
   if
    local.get $0
    i32.load
    i32.eqz
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 132
     i32.const 6
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   end
   local.get $1
   i32.const 0
   i32.eq
   local.tee $3
   if (result i32)
    local.get $3
   else    
    local.get $0
    i32.load offset=4
    i32.const 0
    i32.eq
   end
   if
    local.get $0
    i32.load
    i32.eqz
    if
     local.get $2
     i32.const 296
     i32.const 140
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
    local.get $0
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   end
   block $~lib/memory/memory.compare|inlined.9 (result i32)
    local.get $1
    local.set $3
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 24
    local.set $5
    local.get $3
    local.get $4
    local.get $5
    call $~lib/internal/memory/memcmp
   end
   local.set $5
   local.get $0
   i32.load
   local.get $5
   i32.const 0
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $2
    i32.const 296
    i32.const 150
    i32.const 6
    call $~lib/env/abort
    unreachable
   end
   local.get $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#cleanup
   br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor (; 50 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer> (; 51 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup (; 52 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.2
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.2
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 (; 53 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $1
   i32.const 288
   local.set $2
   block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqualArrayBuffer|inlined.0
    local.get $0
    local.set $3
    local.get $1
    local.set $4
    local.get $2
    local.set $5
    local.get $4
    local.set $6
    local.get $3
    i32.load offset=4
    local.set $7
    local.get $6
    i32.const 0
    i32.eq
    if
     local.get $3
     i32.load
     call $assembly/internal/Expectation/reportExpectedNull
    else     
     block $~lib/arraybuffer/ArrayBuffer#get:data|inlined.0 (result i32)
      local.get $6
      local.set $8
      local.get $8
      i32.const 8
      i32.add
     end
     local.get $6
     i32.load
     local.get $3
     i32.load
     call $assembly/internal/Expectation/reportExpectedReference
    end
    local.get $7
    i32.const 0
    i32.eq
    if
     call $assembly/internal/Expectation/reportActualNull
    else     
     block $~lib/arraybuffer/ArrayBuffer#get:data|inlined.1 (result i32)
      local.get $7
      local.set $8
      local.get $8
      i32.const 8
      i32.add
     end
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportActualReference
    end
    local.get $6
    i32.const 0
    i32.eq
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    local.set $9
    local.get $8
    local.get $9
    i32.xor
    if
     local.get $3
     i32.load
     i32.eqz
     if
      local.get $5
      i32.const 296
      i32.const 188
      i32.const 6
      call $~lib/env/abort
      unreachable
     end
    else     
     local.get $7
     i32.load
     local.get $6
     i32.load
     i32.eq
     local.set $10
     block $~lib/memory/memory.compare|inlined.10 (result i32)
      local.get $7
      local.set $11
      local.get $6
      local.set $12
      local.get $7
      i32.load
      local.set $13
      local.get $11
      local.get $12
      local.get $13
      call $~lib/internal/memory/memcmp
     end
     i32.const 0
     i32.eq
     local.set $13
     local.get $3
     i32.load
     local.get $10
     if (result i32)
      local.get $13
     else      
      local.get $10
     end
     i32.xor
     i32.eqz
     if
      local.get $5
      i32.const 296
      i32.const 194
      i32.const 6
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $3
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
   end
   br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not (; 54 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 (; 55 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $1
   i32.const 288
   local.set $2
   block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqualArrayBuffer|inlined.1
    local.get $0
    local.set $3
    local.get $1
    local.set $4
    local.get $2
    local.set $5
    local.get $4
    local.set $6
    local.get $3
    i32.load offset=4
    local.set $7
    local.get $6
    i32.const 0
    i32.eq
    if
     local.get $3
     i32.load
     call $assembly/internal/Expectation/reportExpectedNull
    else     
     block $~lib/arraybuffer/ArrayBuffer#get:data|inlined.2 (result i32)
      local.get $6
      local.set $8
      local.get $8
      i32.const 8
      i32.add
     end
     local.get $6
     i32.load
     local.get $3
     i32.load
     call $assembly/internal/Expectation/reportExpectedReference
    end
    local.get $7
    i32.const 0
    i32.eq
    if
     call $assembly/internal/Expectation/reportActualNull
    else     
     block $~lib/arraybuffer/ArrayBuffer#get:data|inlined.3 (result i32)
      local.get $7
      local.set $8
      local.get $8
      i32.const 8
      i32.add
     end
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportActualReference
    end
    local.get $6
    i32.const 0
    i32.eq
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    local.set $9
    local.get $8
    local.get $9
    i32.xor
    if
     local.get $3
     i32.load
     i32.eqz
     if
      local.get $5
      i32.const 296
      i32.const 188
      i32.const 6
      call $~lib/env/abort
      unreachable
     end
    else     
     local.get $7
     i32.load
     local.get $6
     i32.load
     i32.eq
     local.set $10
     block $~lib/memory/memory.compare|inlined.11 (result i32)
      local.get $7
      local.set $11
      local.get $6
      local.set $12
      local.get $7
      i32.load
      local.set $13
      local.get $11
      local.get $12
      local.get $13
      call $~lib/internal/memory/memcmp
     end
     i32.const 0
     i32.eq
     local.set $13
     local.get $3
     i32.load
     local.get $10
     if (result i32)
      local.get $13
     else      
      local.get $10
     end
     i32.xor
     i32.eqz
     if
      local.get $5
      i32.const 296
      i32.const 194
      i32.const 6
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $3
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
   end
   br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 (; 56 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $1
   i32.const 288
   local.set $2
   block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqualArrayBuffer|inlined.2
    local.get $0
    local.set $3
    local.get $1
    local.set $4
    local.get $2
    local.set $5
    local.get $4
    local.set $6
    local.get $3
    i32.load offset=4
    local.set $7
    local.get $6
    i32.const 0
    i32.eq
    if
     local.get $3
     i32.load
     call $assembly/internal/Expectation/reportExpectedNull
    else     
     block $~lib/arraybuffer/ArrayBuffer#get:data|inlined.4 (result i32)
      local.get $6
      local.set $8
      local.get $8
      i32.const 8
      i32.add
     end
     local.get $6
     i32.load
     local.get $3
     i32.load
     call $assembly/internal/Expectation/reportExpectedReference
    end
    local.get $7
    i32.const 0
    i32.eq
    if
     call $assembly/internal/Expectation/reportActualNull
    else     
     block $~lib/arraybuffer/ArrayBuffer#get:data|inlined.5 (result i32)
      local.get $7
      local.set $8
      local.get $8
      i32.const 8
      i32.add
     end
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportActualReference
    end
    local.get $6
    i32.const 0
    i32.eq
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    local.set $9
    local.get $8
    local.get $9
    i32.xor
    if
     local.get $3
     i32.load
     i32.eqz
     if
      local.get $5
      i32.const 296
      i32.const 188
      i32.const 6
      call $~lib/env/abort
      unreachable
     end
    else     
     local.get $7
     i32.load
     local.get $6
     i32.load
     i32.eq
     local.set $10
     block $~lib/memory/memory.compare|inlined.12 (result i32)
      local.get $7
      local.set $11
      local.get $6
      local.set $12
      local.get $7
      i32.load
      local.set $13
      local.get $11
      local.get $12
      local.get $13
      call $~lib/internal/memory/memcmp
     end
     i32.const 0
     i32.eq
     local.set $13
     local.get $3
     i32.load
     local.get $10
     if (result i32)
      local.get $13
     else      
      local.get $10
     end
     i32.xor
     i32.eqz
     if
      local.get $5
      i32.const 296
      i32.const 194
      i32.const 6
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $3
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
   end
   br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 (; 57 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.set $0
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $1
   i32.const 288
   local.set $2
   block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqualArrayBuffer|inlined.3
    local.get $0
    local.set $3
    local.get $1
    local.set $4
    local.get $2
    local.set $5
    local.get $4
    local.set $6
    local.get $3
    i32.load offset=4
    local.set $7
    local.get $6
    i32.const 0
    i32.eq
    if
     local.get $3
     i32.load
     call $assembly/internal/Expectation/reportExpectedNull
    else     
     block $~lib/arraybuffer/ArrayBuffer#get:data|inlined.6 (result i32)
      local.get $6
      local.set $8
      local.get $8
      i32.const 8
      i32.add
     end
     local.get $6
     i32.load
     local.get $3
     i32.load
     call $assembly/internal/Expectation/reportExpectedReference
    end
    local.get $7
    i32.const 0
    i32.eq
    if
     call $assembly/internal/Expectation/reportActualNull
    else     
     block $~lib/arraybuffer/ArrayBuffer#get:data|inlined.7 (result i32)
      local.get $7
      local.set $8
      local.get $8
      i32.const 8
      i32.add
     end
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportActualReference
    end
    local.get $6
    i32.const 0
    i32.eq
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    local.set $9
    local.get $8
    local.get $9
    i32.xor
    if
     local.get $3
     i32.load
     i32.eqz
     if
      local.get $5
      i32.const 296
      i32.const 188
      i32.const 6
      call $~lib/env/abort
      unreachable
     end
    else     
     local.get $7
     i32.load
     local.get $6
     i32.load
     i32.eq
     local.set $10
     block $~lib/memory/memory.compare|inlined.13 (result i32)
      local.get $7
      local.set $11
      local.get $6
      local.set $12
      local.get $7
      i32.load
      local.set $13
      local.get $11
      local.get $12
      local.get $13
      call $~lib/internal/memory/memcmp
     end
     i32.const 0
     i32.eq
     local.set $13
     local.get $3
     i32.load
     local.get $10
     if (result i32)
      local.get $13
     else      
      local.get $10
     end
     i32.xor
     i32.eqz
     if
      local.get $5
      i32.const 296
      i32.const 194
      i32.const 6
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $3
    call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#cleanup
   end
   br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
  end
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0 (; 58 ;) (type $FUNCSIG$v)
  i32.const 152
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 368
  i32.const 2
  i32.const 464
  call $assembly/internal/Test/throws
  i32.const 592
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 696
  i32.const 4
  i32.const 800
  call $assembly/internal/Test/throws
  i32.const 928
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1216
  i32.const 6
  i32.const 1056
  call $assembly/internal/Test/throws
  i32.const 1352
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1216
  i32.const 8
  i32.const 1488
  call $assembly/internal/Test/throws
  i32.const 1656
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 1792
  i32.const 10
  i32.const 288
  call $assembly/internal/Test/throws
  i32.const 1936
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 2064
  i32.const 12
  i32.const 2192
  call $assembly/internal/Test/throws
  i32.const 1936
  i32.const 13
  call $assembly/internal/Test/it
  i32.const 2064
  i32.const 14
  i32.const 2344
  call $assembly/internal/Test/throws
  i32.const 2496
  i32.const 15
  call $assembly/internal/Test/it
  i32.const 2576
  i32.const 16
  i32.const 2744
  call $assembly/internal/Test/throws
  i32.const 2944
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 3032
  i32.const 18
  i32.const 3200
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 59 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 60 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toStrictEqual.spec (; 61 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 i32)
  call $start:~lib/allocator/arena
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/vec1
  i32.const 0
  f64.const 4
  f64.const 5
  f64.const 6
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/vec2
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/vec3
  i32.const 3
  i32.const 3
  i32.shl
  global.set $assembly/__tests__/toStrictEqual.spec/buffsize
  i32.const 0
  global.get $assembly/__tests__/toStrictEqual.spec/buffsize
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/buff1
  i32.const 0
  global.get $assembly/__tests__/toStrictEqual.spec/buffsize
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/buff2
  i32.const 0
  global.get $assembly/__tests__/toStrictEqual.spec/buffsize
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/buff3
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   local.set $0
   i32.const 0
   local.set $1
   f64.const 1
   local.set $2
   i32.const 0
   local.set $3
   local.get $0
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $2
   f64.store offset=8
  end
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $3
   i32.const 0
   local.set $1
   f64.const 1
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store offset=8
  end
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $0
   i32.const 0
   local.set $1
   f64.const 4
   local.set $2
   i32.const 0
   local.set $3
   local.get $0
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $2
   f64.store offset=8
  end
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   local.set $3
   i32.const 1
   local.set $1
   f64.const 2
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store offset=8
  end
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.4
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $0
   i32.const 1
   local.set $1
   f64.const 2
   local.set $2
   i32.const 0
   local.set $3
   local.get $0
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $2
   f64.store offset=8
  end
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.5
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $3
   i32.const 1
   local.set $1
   f64.const 5
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store offset=8
  end
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.6
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   local.set $0
   i32.const 2
   local.set $1
   f64.const 3
   local.set $2
   i32.const 0
   local.set $3
   local.get $0
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $2
   f64.store offset=8
  end
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.7
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   local.set $3
   i32.const 2
   local.set $1
   f64.const 3
   local.set $2
   i32.const 0
   local.set $0
   local.get $3
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $0
   i32.add
   local.get $2
   f64.store offset=8
  end
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.8
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   local.set $0
   i32.const 2
   local.set $1
   f64.const 6
   local.set $2
   i32.const 0
   local.set $3
   local.get $0
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $2
   f64.store offset=8
  end
  i32.const 120
  i32.const 19
  call $assembly/internal/Describe/describe
 )
 (func $start (; 62 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toStrictEqual.spec
 )
 (func $null (; 63 ;) (type $FUNCSIG$v)
 )
)
