(module
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viij (func (param i32 i32 i64)))
 (type $FUNCSIG$viif (func (param i32 i32 f32)))
 (type $FUNCSIG$viid (func (param i32 i32 f64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00U\00i\00n\00t\008\00A\00r\00r\00a\00y\00")
 (data (i32.const 48) "\10\00\00\00<\00\00\00\00\00\00\00\00\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00T\00y\00p\00e\00d\00A\00r\00r\00a\00y\00 \00t\00y\00p\00e\00:\00 \00")
 (data (i32.const 128) "\10\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00n\00u\00l\00l\00")
 (data (i32.const 152) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 168) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 224) "\10\00\00\00:\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 304) "\10\00\00\00&\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 360) "\10\00\00\00$\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 416) "\10\00\00\00f\00\00\00\00\00\00\00\00\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00n\00u\00l\00l\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 536) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 616) "\10\00\00\00\82\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 768) "\10\00\00\00l\00\00\00\00\00\00\00\00\00\00\00W\00h\00e\00n\00 \00l\00e\00n\00g\00t\00h\00 \00i\00s\00 \00e\00q\00u\00a\00l\00,\00 \00n\00e\00g\00a\00t\00e\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 896) "\10\00\00\00\"\00\00\00\00\00\00\00\00\00\00\00U\00i\00n\00t\008\00C\00l\00a\00m\00p\00e\00d\00A\00r\00r\00a\00y\00")
 (data (i32.const 952) "\10\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00I\00n\00t\008\00A\00r\00r\00a\00y\00")
 (data (i32.const 992) "\10\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00U\00i\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1032) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00I\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1072) "\10\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00U\00i\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1112) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00I\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1152) "\10\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00U\00i\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1192) "\10\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00I\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1232) "\10\00\00\00\18\00\00\00\00\00\00\00\00\00\00\00F\00l\00o\00a\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1272) "\10\00\00\00\18\00\00\00\00\00\00\00\00\00\00\00F\00l\00o\00a\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1312) "\0f\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 1344) "\'\00\00\00\10\00\00\00\00\00\00\00\00\00\00\000\05\00\000\05\00\00\0c\00\00\00\03\00\00\00")
 (data (i32.const 1376) "\10\00\00\00&\00\00\00\00\00\00\00\00\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00A\00r\00r\00a\00y\00s\00")
 (data (i32.const 1432) "\10\00\00\006\00\00\00\00\00\00\00\00\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00c\00u\00s\00t\00o\00m\00 \00c\00l\00a\00s\00s\00e\00s\00")
 (data (i32.const 1504) "\10\00\00\00h\00\00\00\00\00\00\00\00\00\00\00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1624) "\10\00\00\006\00\00\00\00\00\00\00\00\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 1696) "\10\00\00\00t\00\00\00\00\00\00\00\00\00\00\00W\00h\00e\00n\00 \00t\00h\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00,\00 \00i\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00a\00n\00 \00e\00r\00r\00o\00r\00.\00")
 (data (i32.const 1832) "\10\00\00\00h\00\00\00\00\00\00\00\00\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 1952) "\10\00\00\00D\00\00\00\00\00\00\00\00\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00")
 (data (i32.const 2040) "\10\00\00\00|\00\00\00\00\00\00\00\00\00\00\00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00u\00s\00e\00d\00")
 (data (i32.const 2184) "\10\00\00\00\d8\00\00\00\00\00\00\00\00\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00T\00y\00p\00e\00d\00A\00r\00r\00a\00y\00s\00,\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00,\00 \00A\00r\00r\00a\00y\00s\00,\00 \00a\00n\00d\00 \00c\00l\00a\00s\00s\00e\00s\00 \00t\00h\00a\00t\00 \00h\00a\00v\00e\00 \00a\00 \00l\00e\00n\00g\00t\00h\00 \00p\00r\00o\00p\00e\00r\00t\00y\00.\00")
 (data (i32.const 2416) "\10\00\00\00h\00\00\00\00\00\00\00\00\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (table $0 45 funcref)
 (elem (i32.const 0) $null $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/toHaveLength.spec~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|2)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $~lib/util/runtime/MAX_BYTELENGTH i32 (i32.const 1073741808))
 (global $assembly/internal/noOp/noOp i32 (i32.const 4))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/toHaveLength.spec/valueArray (mut i32) (i32.const 1360))
 (global $assembly/__tests__/toHaveLength.spec/customExample (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 2536))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/string/String#get:length (; 8 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
  i32.const 1
  i32.shr_u
 )
 (func $~lib/util/runtime/adjust (; 9 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/allocator/arena/__mem_allocate (; 10 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 12 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.copy (; 13 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $~lib/util/memory/memmove|inlined.0
   local.get $0
   local.get $1
   i32.eq
   if
    br $~lib/util/memory/memmove|inlined.0
   end
   local.get $0
   local.get $1
   i32.lt_u
   if
    local.get $1
    i32.const 7
    i32.and
    local.get $0
    i32.const 7
    i32.and
    i32.eq
    if
     block $break|0
      loop $continue|0
       local.get $0
       i32.const 7
       i32.and
       if
        block
         local.get $2
         i32.eqz
         if
          br $~lib/util/memory/memmove|inlined.0
         end
         local.get $2
         i32.const 1
         i32.sub
         local.set $2
         block (result i32)
          local.get $0
          local.tee $5
          i32.const 1
          i32.add
          local.set $0
          local.get $5
         end
         block (result i32)
          local.get $1
          local.tee $5
          i32.const 1
          i32.add
          local.set $1
          local.get $5
         end
         i32.load8_u
         i32.store8
        end
        br $continue|0
       end
      end
     end
     block $break|1
      loop $continue|1
       local.get $2
       i32.const 8
       i32.ge_u
       if
        block
         local.get $0
         local.get $1
         i64.load
         i64.store
         local.get $2
         i32.const 8
         i32.sub
         local.set $2
         local.get $0
         i32.const 8
         i32.add
         local.set $0
         local.get $1
         i32.const 8
         i32.add
         local.set $1
        end
        br $continue|1
       end
      end
     end
    end
    block $break|2
     loop $continue|2
      local.get $2
      if
       block
        block (result i32)
         local.get $0
         local.tee $5
         i32.const 1
         i32.add
         local.set $0
         local.get $5
        end
        block (result i32)
         local.get $1
         local.tee $5
         i32.const 1
         i32.add
         local.set $1
         local.get $5
        end
        i32.load8_u
        i32.store8
        local.get $2
        i32.const 1
        i32.sub
        local.set $2
       end
       br $continue|2
      end
     end
    end
   else    
    local.get $1
    i32.const 7
    i32.and
    local.get $0
    i32.const 7
    i32.and
    i32.eq
    if
     block $break|3
      loop $continue|3
       local.get $0
       local.get $2
       i32.add
       i32.const 7
       i32.and
       if
        block
         local.get $2
         i32.eqz
         if
          br $~lib/util/memory/memmove|inlined.0
         end
         local.get $0
         local.get $2
         i32.const 1
         i32.sub
         local.tee $2
         i32.add
         local.get $1
         local.get $2
         i32.add
         i32.load8_u
         i32.store8
        end
        br $continue|3
       end
      end
     end
     block $break|4
      loop $continue|4
       local.get $2
       i32.const 8
       i32.ge_u
       if
        block
         local.get $2
         i32.const 8
         i32.sub
         local.set $2
         local.get $0
         local.get $2
         i32.add
         local.get $1
         local.get $2
         i32.add
         i64.load
         i64.store
        end
        br $continue|4
       end
      end
     end
    end
    block $break|5
     loop $continue|5
      local.get $2
      if
       local.get $0
       local.get $2
       i32.const 1
       i32.sub
       local.tee $2
       i32.add
       local.get $1
       local.get $2
       i32.add
       i32.load8_u
       i32.store8
       br $continue|5
      end
     end
    end
   end
  end
 )
 (func $~lib/util/runtime/register (; 14 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/memory/HEAP_BASE
  i32.gt_u
  i32.eqz
  if
   i32.const 0
   i32.const 184
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
   i32.const 184
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
 (func $~lib/string/String#concat (; 15 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.const 0
  i32.eq
  if
   i32.const 144
   local.set $1
  end
  local.get $0
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $2
  local.get $1
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $3
  local.get $2
  local.get $3
  i32.add
  local.set $4
  local.get $4
  i32.const 0
  i32.eq
  if
   i32.const 168
   return
  end
  local.get $4
  call $~lib/util/runtime/allocate
  local.set $5
  local.get $5
  local.get $0
  local.get $2
  call $~lib/memory/memory.copy
  local.get $5
  local.get $2
  i32.add
  local.get $1
  local.get $3
  call $~lib/memory/memory.copy
  local.get $5
  i32.const 16
  call $~lib/util/runtime/register
 )
 (func $~lib/string/String.__concat (; 16 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.const 144
  local.get $0
  i32.const 0
  i32.ne
  select
  local.get $1
  call $~lib/string/String#concat
 )
 (func $~lib/memory/memory.fill (; 17 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 18 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  global.get $~lib/util/runtime/MAX_BYTELENGTH
  i32.gt_u
  if
   i32.const 0
   i32.const 320
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
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 19 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $1
  global.get $~lib/util/runtime/MAX_BYTELENGTH
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 0
   i32.const 320
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
 (func $~lib/typedarray/Uint8Array#constructor (; 20 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Uint8Array#__set (; 21 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 0
   i32.const 376
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor (; 22 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array> (; 23 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (; 24 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/typedarray/Uint8Array#get:length (; 25 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $~lib/allocator/arena/__mem_free (; 26 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $~lib/memory/memory.free (; 27 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $~lib/allocator/arena/__mem_free
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup (; 28 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 29 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  i32.load offset=4
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 (; 30 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8Array,u8>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 1
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint8Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint8Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint8Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint8Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint8Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint8Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint8Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint8Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint8Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint8Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint8Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint8Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint8Array,u8>|inlined.0
  end
 )
 (func $assembly/internal/Test/it (; 31 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not (; 32 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 (; 33 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8Array,u8>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 1
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint8Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint8Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint8Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint8Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint8Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint8Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint8Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint8Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint8Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint8Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint8Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint8Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/internal/Test/throws (; 34 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 (; 35 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 2
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 36 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 37 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8> (; 38 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 3
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Uint8ClampedArray#constructor (; 39 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 19
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint8ClampedArray#__set (; 40 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 198
   i32.const 44
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.const 31
  i32.shr_s
  i32.const -1
  i32.xor
  i32.const 255
  local.get $2
  i32.sub
  i32.const 31
  i32.shr_s
  local.get $2
  i32.or
  i32.and
  i32.store8
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor (; 41 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 29
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray> (; 42 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor
 )
 (func $~lib/typedarray/Uint8ClampedArray#get:length (; 43 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup (; 44 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 (; 45 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8ClampedArray,u8>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8ClampedArray#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint8ClampedArray#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 1
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint8ClampedArray#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint8ClampedArray#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint8ClampedArray#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint8ClampedArray#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint8ClampedArray#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint8ClampedArray#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint8ClampedArray#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint8ClampedArray#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint8ClampedArray#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint8ClampedArray#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint8ClampedArray#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint8ClampedArray,u8>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not (; 46 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 (; 47 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8ClampedArray,u8>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8ClampedArray#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint8ClampedArray#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 1
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint8ClampedArray#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint8ClampedArray#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint8ClampedArray#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint8ClampedArray#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint8ClampedArray#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint8ClampedArray#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint8ClampedArray#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint8ClampedArray#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint8ClampedArray#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint8ClampedArray#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint8ClampedArray#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 (; 48 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 6
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8> (; 49 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 7
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Int8Array#constructor (; 50 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 20
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int8Array#__set (; 51 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 34
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor (; 52 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 30
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array> (; 53 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor
 )
 (func $~lib/typedarray/Int8Array#get:length (; 54 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup (; 55 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 (; 56 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int8Array,i8>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int8Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int8Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int8Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int8Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Int8Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Int8Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 1
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Int8Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Int8Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Int8Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Int8Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Int8Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Int8Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Int8Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Int8Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Int8Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Int8Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Int8Array,i8>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not (; 57 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 (; 58 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int8Array,i8>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int8Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int8Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int8Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int8Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Int8Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Int8Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 1
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Int8Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Int8Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Int8Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Int8Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Int8Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Int8Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Int8Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Int8Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Int8Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Int8Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 (; 59 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 8
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 9
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8> (; 60 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 10
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Uint16Array#constructor (; 61 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 21
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 1
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint16Array#__set (; 62 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 362
   i32.const 63
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  local.get $2
  i32.store16
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor (; 63 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 31
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array> (; 64 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor
 )
 (func $~lib/typedarray/Uint16Array#get:length (; 65 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup (; 66 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 (; 67 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint16Array,u16>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint16Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint16Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint16Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint16Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint16Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint16Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint16Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 1
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint16Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint16Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint16Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint16Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint16Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint16Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint16Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint16Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint16Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint16Array,u16>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not (; 68 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 (; 69 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint16Array,u16>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint16Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint16Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint16Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint16Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint16Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint16Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint16Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 1
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint16Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint16Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint16Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint16Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint16Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint16Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint16Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint16Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint16Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 (; 70 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 12
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16> (; 71 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 13
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Int16Array#constructor (; 72 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 22
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 1
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int16Array#__set (; 73 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 280
   i32.const 63
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  local.get $2
  i32.store16
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor (; 74 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 32
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array> (; 75 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor
 )
 (func $~lib/typedarray/Int16Array#get:length (; 76 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup (; 77 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 (; 78 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int16Array,i16>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int16Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int16Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int16Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int16Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Int16Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Int16Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Int16Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Int16Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 1
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Int16Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Int16Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Int16Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Int16Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Int16Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Int16Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Int16Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Int16Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Int16Array,i16>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not (; 79 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 (; 80 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int16Array,i16>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int16Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int16Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int16Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int16Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Int16Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Int16Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Int16Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Int16Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 1
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Int16Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Int16Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Int16Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Int16Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Int16Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Int16Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Int16Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Int16Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 (; 81 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 14
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 15
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16> (; 82 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 16
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Uint32Array#constructor (; 83 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 23
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint32Array#__set (; 84 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 526
   i32.const 63
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor (; 85 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 33
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array> (; 86 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor
 )
 (func $~lib/typedarray/Uint32Array#get:length (; 87 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup (; 88 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 (; 89 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint32Array,u32>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint32Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint32Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint32Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint32Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint32Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint32Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint32Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint32Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 1
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint32Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint32Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint32Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint32Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint32Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint32Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint32Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint32Array,u32>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not (; 90 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 (; 91 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint32Array,u32>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint32Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint32Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint32Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint32Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint32Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint32Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint32Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint32Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 1
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint32Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint32Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint32Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint32Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint32Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint32Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint32Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 (; 92 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 18
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32> (; 93 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 19
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Int32Array#constructor (; 94 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 24
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int32Array#__set (; 95 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 444
   i32.const 63
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor (; 96 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 34
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array> (; 97 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor
 )
 (func $~lib/typedarray/Int32Array#get:length (; 98 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup (; 99 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 (; 100 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int32Array,i32>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int32Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int32Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int32Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Int32Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Int32Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Int32Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Int32Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Int32Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Int32Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 1
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Int32Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Int32Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Int32Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Int32Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Int32Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Int32Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Int32Array,i32>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not (; 101 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 (; 102 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int32Array,i32>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int32Array#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int32Array#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int32Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Int32Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Int32Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Int32Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Int32Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Int32Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Int32Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 1
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Int32Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Int32Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Int32Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Int32Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Int32Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Int32Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 (; 103 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 20
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 21
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32> (; 104 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 22
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Uint64Array#constructor (; 105 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 25
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 3
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint64Array#__set (; 106 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 690
   i32.const 63
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 3
  i32.shl
  i32.add
  local.get $2
  i64.store
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor (; 107 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 35
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array> (; 108 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor
 )
 (func $~lib/typedarray/Uint64Array#get:length (; 109 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup (; 110 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 (; 111 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint64Array,u64>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i64.const 0
   call $~lib/typedarray/Uint64Array#__set
   local.get $0
   i32.const 1
   i64.const 1
   call $~lib/typedarray/Uint64Array#__set
   local.get $0
   i32.const 2
   i64.const 2
   call $~lib/typedarray/Uint64Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint64Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint64Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint64Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint64Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint64Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint64Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint64Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 1
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint64Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint64Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint64Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint64Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint64Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint64Array,u64>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not (; 112 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 (; 113 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint64Array,u64>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i64.const 0
   call $~lib/typedarray/Uint64Array#__set
   local.get $0
   i32.const 1
   i64.const 1
   call $~lib/typedarray/Uint64Array#__set
   local.get $0
   i32.const 2
   i64.const 2
   call $~lib/typedarray/Uint64Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Uint64Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Uint64Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Uint64Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Uint64Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Uint64Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Uint64Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Uint64Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 1
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Uint64Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Uint64Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Uint64Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Uint64Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Uint64Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 (; 114 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 23
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 24
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64> (; 115 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 25
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Int64Array#constructor (; 116 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 26
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 3
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int64Array#__set (; 117 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 608
   i32.const 63
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 3
  i32.shl
  i32.add
  local.get $2
  i64.store
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor (; 118 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 36
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array> (; 119 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor
 )
 (func $~lib/typedarray/Int64Array#get:length (; 120 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup (; 121 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 (; 122 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int64Array,i64>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i64.const 0
   call $~lib/typedarray/Int64Array#__set
   local.get $0
   i32.const 1
   i64.const 1
   call $~lib/typedarray/Int64Array#__set
   local.get $0
   i32.const 2
   i64.const 2
   call $~lib/typedarray/Int64Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Int64Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Int64Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Int64Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Int64Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Int64Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Int64Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Int64Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Int64Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 1
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Int64Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Int64Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Int64Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Int64Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Int64Array,i64>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not (; 123 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 (; 124 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int64Array,i64>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i64.const 0
   call $~lib/typedarray/Int64Array#__set
   local.get $0
   i32.const 1
   i64.const 1
   call $~lib/typedarray/Int64Array#__set
   local.get $0
   i32.const 2
   i64.const 2
   call $~lib/typedarray/Int64Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Int64Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Int64Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Int64Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Int64Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Int64Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Int64Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Int64Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Int64Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 1
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Int64Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Int64Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Int64Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Int64Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 (; 125 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 26
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 27
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64> (; 126 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 28
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Float32Array#constructor (; 127 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 27
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Float32Array#__set (; 128 ;) (type $FUNCSIG$viif) (param $0 i32) (param $1 i32) (param $2 f32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 772
   i32.const 63
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  f32.store
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor (; 129 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 37
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array> (; 130 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor
 )
 (func $~lib/typedarray/Float32Array#get:length (; 131 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup (; 132 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 (; 133 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float32Array,f32>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   f32.const 0
   call $~lib/typedarray/Float32Array#__set
   local.get $0
   i32.const 1
   f32.const 1
   call $~lib/typedarray/Float32Array#__set
   local.get $0
   i32.const 2
   f32.const 2
   call $~lib/typedarray/Float32Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Float32Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Float32Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Float32Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Float32Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Float32Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Float32Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Float32Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Float32Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Float32Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 1
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Float32Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Float32Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Float32Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Float32Array,f32>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not (; 134 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 (; 135 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float32Array,f32>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   f32.const 0
   call $~lib/typedarray/Float32Array#__set
   local.get $0
   i32.const 1
   f32.const 1
   call $~lib/typedarray/Float32Array#__set
   local.get $0
   i32.const 2
   f32.const 2
   call $~lib/typedarray/Float32Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Float32Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Float32Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Float32Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Float32Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Float32Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Float32Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Float32Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Float32Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Float32Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 1
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Float32Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Float32Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Float32Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 (; 136 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 29
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 30
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32> (; 137 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 31
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Float64Array#constructor (; 138 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   call $~lib/util/runtime/allocate
   i32.const 28
   call $~lib/util/runtime/register
  end
  local.get $1
  i32.const 3
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Float64Array#__set (; 139 ;) (type $FUNCSIG$viid) (param $0 i32) (param $1 i32) (param $2 f64)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 376
   i32.const 854
   i32.const 63
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 3
  i32.shl
  i32.add
  local.get $2
  f64.store
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor (; 140 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 38
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array> (; 141 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor
 )
 (func $~lib/typedarray/Float64Array#get:length (; 142 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup (; 143 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 (; 144 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float64Array,f64>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   f64.const 0
   call $~lib/typedarray/Float64Array#__set
   local.get $0
   i32.const 1
   f64.const 1
   call $~lib/typedarray/Float64Array#__set
   local.get $0
   i32.const 2
   f64.const 2
   call $~lib/typedarray/Float64Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Float64Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Float64Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Float64Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Float64Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Float64Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Float64Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Float64Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Float64Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Float64Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Float64Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 1
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Float64Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#assertLength|inlined.11
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#assertLength|inlined.12
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Float64Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Float64Array,f64>|inlined.0
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not (; 145 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 (; 146 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float64Array,f64>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   f64.const 0
   call $~lib/typedarray/Float64Array#__set
   local.get $0
   i32.const 1
   f64.const 1
   call $~lib/typedarray/Float64Array#__set
   local.get $0
   i32.const 2
   f64.const 2
   call $~lib/typedarray/Float64Array#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not
   local.set $3
   i32.const 3
   local.set $2
   i32.const 168
   local.set $0
   local.get $3
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 432
     i32.const 552
     i32.const 470
     i32.const 8
     call $~lib/builtins/abort
     unreachable
    end
   else    
    block (result i32)
     local.get $3
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $3
     local.set $7
     local.get $3
     i32.load offset=4
     call $~lib/typedarray/Float64Array#get:length
     local.set $6
     local.get $2
     local.set $5
     local.get $0
     local.set $4
     local.get $6
     call $assembly/internal/Expectation/reportActualInteger
     local.get $5
     local.get $7
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $7
     i32.load
     local.get $6
     local.get $5
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $4
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $7
     call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
    else     
     block (result i32)
      local.get $3
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $3
      local.set $7
      local.get $3
      i32.load offset=4
      call $~lib/typedarray/Float64Array#get:length
      local.set $6
      local.get $2
      local.set $5
      local.get $0
      local.set $4
      local.get $6
      call $assembly/internal/Expectation/reportActualInteger
      local.get $5
      local.get $7
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $7
      i32.load
      local.get $6
      local.get $5
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $4
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
     else      
      block (result i32)
       local.get $3
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $3
       local.set $7
       local.get $3
       i32.load offset=4
       call $~lib/typedarray/Float64Array#get:length
       local.set $6
       local.get $2
       local.set $5
       local.get $0
       local.set $4
       local.get $6
       call $assembly/internal/Expectation/reportActualInteger
       local.get $5
       local.get $7
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $7
       i32.load
       local.get $6
       local.get $5
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $7
       call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
      else       
       block (result i32)
        local.get $3
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $3
        local.set $7
        local.get $3
        i32.load offset=4
        call $~lib/typedarray/Float64Array#get:length
        local.set $6
        local.get $2
        local.set $5
        local.get $0
        local.set $4
        local.get $6
        call $assembly/internal/Expectation/reportActualInteger
        local.get $5
        local.get $7
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $7
        i32.load
        local.get $6
        local.get $5
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $4
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $7
        call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
       else        
        block (result i32)
         local.get $3
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $3
         local.set $7
         local.get $3
         i32.load offset=4
         call $~lib/typedarray/Float64Array#get:length
         local.set $6
         local.get $2
         local.set $5
         local.get $0
         local.set $4
         local.get $6
         call $assembly/internal/Expectation/reportActualInteger
         local.get $5
         local.get $7
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $7
         i32.load
         local.get $6
         local.get $5
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $4
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $7
         call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
        else         
         block (result i32)
          local.get $3
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $3
          local.set $7
          local.get $3
          i32.load offset=4
          call $~lib/typedarray/Float64Array#get:length
          local.set $6
          local.get $2
          local.set $5
          local.get $0
          local.set $4
          local.get $6
          call $assembly/internal/Expectation/reportActualInteger
          local.get $5
          local.get $7
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $7
          i32.load
          local.get $6
          local.get $5
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $4
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $7
          call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
         else          
          block (result i32)
           local.get $3
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $3
           local.set $7
           local.get $3
           i32.load offset=4
           call $~lib/typedarray/Float64Array#get:length
           local.set $6
           local.get $2
           local.set $5
           local.get $0
           local.set $4
           local.get $6
           call $assembly/internal/Expectation/reportActualInteger
           local.get $5
           local.get $7
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $7
           i32.load
           local.get $6
           local.get $5
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $4
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $7
           call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
          else           
           block (result i32)
            local.get $3
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $3
            local.set $7
            local.get $3
            i32.load offset=4
            call $~lib/typedarray/Float64Array#get:length
            local.set $6
            local.get $2
            local.set $5
            local.get $0
            local.set $4
            local.get $6
            call $assembly/internal/Expectation/reportActualInteger
            local.get $5
            local.get $7
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $7
            i32.load
            local.get $6
            local.get $5
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $4
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $7
            call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
           else            
            block (result i32)
             local.get $3
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $3
             local.set $7
             local.get $3
             i32.load offset=4
             call $~lib/typedarray/Float64Array#get:length
             local.set $6
             local.get $2
             local.set $5
             local.get $0
             local.set $4
             local.get $6
             call $assembly/internal/Expectation/reportActualInteger
             local.get $5
             local.get $7
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $7
             i32.load
             local.get $6
             local.get $5
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $4
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $7
             call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
            else             
             block (result i32)
              local.get $3
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $3
              local.set $7
              local.get $3
              i32.load offset=4
              call $~lib/typedarray/Float64Array#get:length
              local.set $6
              local.get $2
              local.set $5
              local.get $0
              local.set $4
              local.get $6
              call $assembly/internal/Expectation/reportActualInteger
              local.get $5
              local.get $7
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $7
              i32.load
              local.get $6
              local.get $5
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $4
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $7
              call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
             else              
              block (result i32)
               local.get $3
               i32.load offset=4
               drop
               i32.const 1
              end
              if
               local.get $3
               local.set $7
               local.get $3
               i32.load offset=4
               call $~lib/typedarray/Float64Array#get:length
               local.set $6
               local.get $2
               local.set $5
               local.get $0
               local.set $4
               local.get $6
               call $assembly/internal/Expectation/reportActualInteger
               local.get $5
               local.get $7
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $7
               i32.load
               local.get $6
               local.get $5
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $4
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $7
               call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
              else               
               block (result i32)
                local.get $3
                i32.load offset=4
                drop
                i32.const 0
               end
               if
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#assertLength|inlined.24
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
                end
               else                
                local.get $3
                i32.load offset=4
                local.set $4
                block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#assertLength|inlined.25
                 local.get $3
                 local.set $8
                 local.get $4
                 call $~lib/typedarray/Float64Array#get:length
                 local.set $7
                 local.get $2
                 local.set $6
                 local.get $0
                 local.set $5
                 local.get $7
                 call $assembly/internal/Expectation/reportActualInteger
                 local.get $6
                 local.get $8
                 i32.load
                 call $assembly/internal/Expectation/reportExpectedInteger
                 local.get $8
                 i32.load
                 local.get $7
                 local.get $6
                 i32.eq
                 i32.xor
                 i32.eqz
                 if
                  local.get $5
                  i32.const 552
                  i32.const 518
                  i32.const 4
                  call $~lib/builtins/abort
                  unreachable
                 end
                 local.get $8
                 call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 (; 147 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 32
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 33
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64> (; 148 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 64
  local.get $0
  call $~lib/string/String.__concat
  i32.const 34
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 149 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 40
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
 (func $assembly/internal/Expectation/expect<~lib/array/Array<i32>> (; 150 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor
 )
 (func $~lib/array/Array<i32>#get:length (; 151 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup (; 152 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 (; 153 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $assembly/__tests__/toHaveLength.spec/valueArray
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.set $2
  i32.const 3
  local.set $1
  i32.const 168
  local.set $0
  local.get $2
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 432
    i32.const 552
    i32.const 470
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $2
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $2
    local.set $6
    local.get $2
    i32.load offset=4
    call $~lib/array/Array<i32>#get:length
    local.set $5
    local.get $1
    local.set $4
    local.get $0
    local.set $3
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $4
    local.get $6
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $6
    i32.load
    local.get $5
    local.get $4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $3
     i32.const 552
     i32.const 518
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $6
    call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
   else    
    block (result i32)
     local.get $2
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $2
     local.set $6
     local.get $2
     i32.load offset=4
     call $~lib/array/Array<i32>#get:length
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $5
     call $assembly/internal/Expectation/reportActualInteger
     local.get $4
     local.get $6
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $6
     i32.load
     local.get $5
     local.get $4
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $3
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $6
     call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
    else     
     block (result i32)
      local.get $2
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $2
      local.set $6
      local.get $2
      i32.load offset=4
      call $~lib/array/Array<i32>#get:length
      local.set $5
      local.get $1
      local.set $4
      local.get $0
      local.set $3
      local.get $5
      call $assembly/internal/Expectation/reportActualInteger
      local.get $4
      local.get $6
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $6
      i32.load
      local.get $5
      local.get $4
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $6
      call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
     else      
      block (result i32)
       local.get $2
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $2
       local.set $6
       local.get $2
       i32.load offset=4
       call $~lib/array/Array<i32>#get:length
       local.set $5
       local.get $1
       local.set $4
       local.get $0
       local.set $3
       local.get $5
       call $assembly/internal/Expectation/reportActualInteger
       local.get $4
       local.get $6
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $6
       i32.load
       local.get $5
       local.get $4
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $3
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $6
       call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
      else       
       block (result i32)
        local.get $2
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $2
        local.set $6
        local.get $2
        i32.load offset=4
        call $~lib/array/Array<i32>#get:length
        local.set $5
        local.get $1
        local.set $4
        local.get $0
        local.set $3
        local.get $5
        call $assembly/internal/Expectation/reportActualInteger
        local.get $4
        local.get $6
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $6
        i32.load
        local.get $5
        local.get $4
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $3
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $6
        call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
       else        
        block (result i32)
         local.get $2
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $2
         local.set $6
         local.get $2
         i32.load offset=4
         call $~lib/array/Array<i32>#get:length
         local.set $5
         local.get $1
         local.set $4
         local.get $0
         local.set $3
         local.get $5
         call $assembly/internal/Expectation/reportActualInteger
         local.get $4
         local.get $6
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $6
         i32.load
         local.get $5
         local.get $4
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $3
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $6
         call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
        else         
         block (result i32)
          local.get $2
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $2
          local.set $6
          local.get $2
          i32.load offset=4
          call $~lib/array/Array<i32>#get:length
          local.set $5
          local.get $1
          local.set $4
          local.get $0
          local.set $3
          local.get $5
          call $assembly/internal/Expectation/reportActualInteger
          local.get $4
          local.get $6
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $6
          i32.load
          local.get $5
          local.get $4
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $3
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $6
          call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
         else          
          block (result i32)
           local.get $2
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $2
           local.set $6
           local.get $2
           i32.load offset=4
           call $~lib/array/Array<i32>#get:length
           local.set $5
           local.get $1
           local.set $4
           local.get $0
           local.set $3
           local.get $5
           call $assembly/internal/Expectation/reportActualInteger
           local.get $4
           local.get $6
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $6
           i32.load
           local.get $5
           local.get $4
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $3
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $6
           call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
          else           
           block (result i32)
            local.get $2
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $2
            local.set $6
            local.get $2
            i32.load offset=4
            call $~lib/array/Array<i32>#get:length
            local.set $5
            local.get $1
            local.set $4
            local.get $0
            local.set $3
            local.get $5
            call $assembly/internal/Expectation/reportActualInteger
            local.get $4
            local.get $6
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $6
            i32.load
            local.get $5
            local.get $4
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $3
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $6
            call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
           else            
            block (result i32)
             local.get $2
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $2
             local.set $6
             local.get $2
             i32.load offset=4
             call $~lib/array/Array<i32>#get:length
             local.set $5
             local.get $1
             local.set $4
             local.get $0
             local.set $3
             local.get $5
             call $assembly/internal/Expectation/reportActualInteger
             local.get $4
             local.get $6
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $6
             i32.load
             local.get $5
             local.get $4
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $3
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $6
             call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
            else             
             block (result i32)
              local.get $2
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $2
              local.set $6
              local.get $2
              i32.load offset=4
              call $~lib/array/Array<i32>#get:length
              local.set $5
              local.get $1
              local.set $4
              local.get $0
              local.set $3
              local.get $5
              call $assembly/internal/Expectation/reportActualInteger
              local.get $4
              local.get $6
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $6
              i32.load
              local.get $5
              local.get $4
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $3
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $6
              call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
             else              
              block (result i32)
               local.get $2
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#assertLength|inlined.11
                local.get $2
                local.set $7
                local.get $3
                call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
               end
              else               
               local.get $2
               local.set $6
               local.get $2
               i32.load offset=4
               call $~lib/array/Array<i32>#get:length
               local.set $5
               local.get $1
               local.set $4
               local.get $0
               local.set $3
               local.get $5
               call $assembly/internal/Expectation/reportActualInteger
               local.get $4
               local.get $6
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $6
               i32.load
               local.get $5
               local.get $4
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $3
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $6
               call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 154 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 (; 155 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $assembly/__tests__/toHaveLength.spec/valueArray
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.set $2
  i32.const 3
  local.set $1
  i32.const 168
  local.set $0
  local.get $2
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 432
    i32.const 552
    i32.const 470
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $2
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $2
    local.set $6
    local.get $2
    i32.load offset=4
    call $~lib/array/Array<i32>#get:length
    local.set $5
    local.get $1
    local.set $4
    local.get $0
    local.set $3
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $4
    local.get $6
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $6
    i32.load
    local.get $5
    local.get $4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $3
     i32.const 552
     i32.const 518
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $6
    call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
   else    
    block (result i32)
     local.get $2
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $2
     local.set $6
     local.get $2
     i32.load offset=4
     call $~lib/array/Array<i32>#get:length
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $5
     call $assembly/internal/Expectation/reportActualInteger
     local.get $4
     local.get $6
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $6
     i32.load
     local.get $5
     local.get $4
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $3
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $6
     call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
    else     
     block (result i32)
      local.get $2
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $2
      local.set $6
      local.get $2
      i32.load offset=4
      call $~lib/array/Array<i32>#get:length
      local.set $5
      local.get $1
      local.set $4
      local.get $0
      local.set $3
      local.get $5
      call $assembly/internal/Expectation/reportActualInteger
      local.get $4
      local.get $6
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $6
      i32.load
      local.get $5
      local.get $4
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $6
      call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
     else      
      block (result i32)
       local.get $2
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $2
       local.set $6
       local.get $2
       i32.load offset=4
       call $~lib/array/Array<i32>#get:length
       local.set $5
       local.get $1
       local.set $4
       local.get $0
       local.set $3
       local.get $5
       call $assembly/internal/Expectation/reportActualInteger
       local.get $4
       local.get $6
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $6
       i32.load
       local.get $5
       local.get $4
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $3
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $6
       call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
      else       
       block (result i32)
        local.get $2
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $2
        local.set $6
        local.get $2
        i32.load offset=4
        call $~lib/array/Array<i32>#get:length
        local.set $5
        local.get $1
        local.set $4
        local.get $0
        local.set $3
        local.get $5
        call $assembly/internal/Expectation/reportActualInteger
        local.get $4
        local.get $6
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $6
        i32.load
        local.get $5
        local.get $4
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $3
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $6
        call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
       else        
        block (result i32)
         local.get $2
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $2
         local.set $6
         local.get $2
         i32.load offset=4
         call $~lib/array/Array<i32>#get:length
         local.set $5
         local.get $1
         local.set $4
         local.get $0
         local.set $3
         local.get $5
         call $assembly/internal/Expectation/reportActualInteger
         local.get $4
         local.get $6
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $6
         i32.load
         local.get $5
         local.get $4
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $3
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $6
         call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
        else         
         block (result i32)
          local.get $2
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $2
          local.set $6
          local.get $2
          i32.load offset=4
          call $~lib/array/Array<i32>#get:length
          local.set $5
          local.get $1
          local.set $4
          local.get $0
          local.set $3
          local.get $5
          call $assembly/internal/Expectation/reportActualInteger
          local.get $4
          local.get $6
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $6
          i32.load
          local.get $5
          local.get $4
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $3
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $6
          call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
         else          
          block (result i32)
           local.get $2
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $2
           local.set $6
           local.get $2
           i32.load offset=4
           call $~lib/array/Array<i32>#get:length
           local.set $5
           local.get $1
           local.set $4
           local.get $0
           local.set $3
           local.get $5
           call $assembly/internal/Expectation/reportActualInteger
           local.get $4
           local.get $6
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $6
           i32.load
           local.get $5
           local.get $4
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $3
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $6
           call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
          else           
           block (result i32)
            local.get $2
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $2
            local.set $6
            local.get $2
            i32.load offset=4
            call $~lib/array/Array<i32>#get:length
            local.set $5
            local.get $1
            local.set $4
            local.get $0
            local.set $3
            local.get $5
            call $assembly/internal/Expectation/reportActualInteger
            local.get $4
            local.get $6
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $6
            i32.load
            local.get $5
            local.get $4
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $3
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $6
            call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
           else            
            block (result i32)
             local.get $2
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $2
             local.set $6
             local.get $2
             i32.load offset=4
             call $~lib/array/Array<i32>#get:length
             local.set $5
             local.get $1
             local.set $4
             local.get $0
             local.set $3
             local.get $5
             call $assembly/internal/Expectation/reportActualInteger
             local.get $4
             local.get $6
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $6
             i32.load
             local.get $5
             local.get $4
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $3
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $6
             call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
            else             
             block (result i32)
              local.get $2
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $2
              local.set $6
              local.get $2
              i32.load offset=4
              call $~lib/array/Array<i32>#get:length
              local.set $5
              local.get $1
              local.set $4
              local.get $0
              local.set $3
              local.get $5
              call $assembly/internal/Expectation/reportActualInteger
              local.get $4
              local.get $6
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $6
              i32.load
              local.get $5
              local.get $4
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $3
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $6
              call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
             else              
              block (result i32)
               local.get $2
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#assertLength|inlined.24
                local.get $2
                local.set $7
                local.get $3
                call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
               end
              else               
               local.get $2
               local.set $6
               local.get $2
               i32.load offset=4
               call $~lib/array/Array<i32>#get:length
               local.set $5
               local.get $1
               local.set $4
               local.get $0
               local.set $3
               local.get $5
               call $assembly/internal/Expectation/reportActualInteger
               local.get $4
               local.get $6
               i32.load
               call $assembly/internal/Expectation/reportExpectedInteger
               local.get $6
               i32.load
               local.get $5
               local.get $4
               i32.eq
               i32.xor
               i32.eqz
               if
                local.get $3
                i32.const 552
                i32.const 518
                i32.const 4
                call $~lib/builtins/abort
                unreachable
               end
               local.get $6
               call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0 (; 156 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 35
  call $assembly/internal/Test/it
  i32.const 632
  i32.const 36
  i32.const 784
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/Example#constructor (; 157 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   call $~lib/util/runtime/allocate
   i32.const 41
   call $~lib/util/runtime/register
   local.set $0
  end
  local.get $0
  i32.const 3
  i32.store
  local.get $0
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor (; 158 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 42
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example> (; 159 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup (; 160 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 (; 161 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $assembly/__tests__/toHaveLength.spec/customExample
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  local.set $2
  i32.const 3
  local.set $1
  i32.const 168
  local.set $0
  local.get $2
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 432
    i32.const 552
    i32.const 470
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $2
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $2
    local.set $6
    local.get $2
    i32.load offset=4
    i32.load
    local.set $5
    local.get $1
    local.set $4
    local.get $0
    local.set $3
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $4
    local.get $6
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $6
    i32.load
    local.get $5
    local.get $4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $3
     i32.const 552
     i32.const 518
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $6
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
   else    
    block (result i32)
     local.get $2
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $2
     local.set $6
     local.get $2
     i32.load offset=4
     i32.load
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $5
     call $assembly/internal/Expectation/reportActualInteger
     local.get $4
     local.get $6
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $6
     i32.load
     local.get $5
     local.get $4
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $3
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $6
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
    else     
     block (result i32)
      local.get $2
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $2
      local.set $6
      local.get $2
      i32.load offset=4
      i32.load
      local.set $5
      local.get $1
      local.set $4
      local.get $0
      local.set $3
      local.get $5
      call $assembly/internal/Expectation/reportActualInteger
      local.get $4
      local.get $6
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $6
      i32.load
      local.get $5
      local.get $4
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $6
      call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
     else      
      block (result i32)
       local.get $2
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $2
       local.set $6
       local.get $2
       i32.load offset=4
       i32.load
       local.set $5
       local.get $1
       local.set $4
       local.get $0
       local.set $3
       local.get $5
       call $assembly/internal/Expectation/reportActualInteger
       local.get $4
       local.get $6
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $6
       i32.load
       local.get $5
       local.get $4
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $3
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $6
       call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
      else       
       block (result i32)
        local.get $2
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $2
        local.set $6
        local.get $2
        i32.load offset=4
        i32.load
        local.set $5
        local.get $1
        local.set $4
        local.get $0
        local.set $3
        local.get $5
        call $assembly/internal/Expectation/reportActualInteger
        local.get $4
        local.get $6
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $6
        i32.load
        local.get $5
        local.get $4
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $3
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $6
        call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
       else        
        block (result i32)
         local.get $2
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $2
         local.set $6
         local.get $2
         i32.load offset=4
         i32.load
         local.set $5
         local.get $1
         local.set $4
         local.get $0
         local.set $3
         local.get $5
         call $assembly/internal/Expectation/reportActualInteger
         local.get $4
         local.get $6
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $6
         i32.load
         local.get $5
         local.get $4
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $3
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $6
         call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
        else         
         block (result i32)
          local.get $2
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $2
          local.set $6
          local.get $2
          i32.load offset=4
          i32.load
          local.set $5
          local.get $1
          local.set $4
          local.get $0
          local.set $3
          local.get $5
          call $assembly/internal/Expectation/reportActualInteger
          local.get $4
          local.get $6
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $6
          i32.load
          local.get $5
          local.get $4
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $3
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $6
          call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
         else          
          block (result i32)
           local.get $2
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $2
           local.set $6
           local.get $2
           i32.load offset=4
           i32.load
           local.set $5
           local.get $1
           local.set $4
           local.get $0
           local.set $3
           local.get $5
           call $assembly/internal/Expectation/reportActualInteger
           local.get $4
           local.get $6
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $6
           i32.load
           local.get $5
           local.get $4
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $3
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $6
           call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
          else           
           block (result i32)
            local.get $2
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $2
            local.set $6
            local.get $2
            i32.load offset=4
            i32.load
            local.set $5
            local.get $1
            local.set $4
            local.get $0
            local.set $3
            local.get $5
            call $assembly/internal/Expectation/reportActualInteger
            local.get $4
            local.get $6
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $6
            i32.load
            local.get $5
            local.get $4
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $3
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $6
            call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
           else            
            block (result i32)
             local.get $2
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $2
             local.set $6
             local.get $2
             i32.load offset=4
             i32.load
             local.set $5
             local.get $1
             local.set $4
             local.get $0
             local.set $3
             local.get $5
             call $assembly/internal/Expectation/reportActualInteger
             local.get $4
             local.get $6
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $6
             i32.load
             local.get $5
             local.get $4
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $3
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $6
             call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
            else             
             block (result i32)
              local.get $2
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $2
              local.set $6
              local.get $2
              i32.load offset=4
              i32.load
              local.set $5
              local.get $1
              local.set $4
              local.get $0
              local.set $3
              local.get $5
              call $assembly/internal/Expectation/reportActualInteger
              local.get $4
              local.get $6
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $6
              i32.load
              local.get $5
              local.get $4
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $3
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $6
              call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
             else              
              block (result i32)
               local.get $2
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#assertLength|inlined.11
                local.get $2
                local.set $7
                local.get $3
                call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
               end
              else               
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#assertLength|inlined.12
                local.get $2
                local.set $7
                local.get $3
                i32.load
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not (; 162 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 (; 163 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $assembly/__tests__/toHaveLength.spec/customExample
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
  local.set $2
  i32.const 3
  local.set $1
  i32.const 168
  local.set $0
  local.get $2
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 432
    i32.const 552
    i32.const 470
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $2
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $2
    local.set $6
    local.get $2
    i32.load offset=4
    i32.load
    local.set $5
    local.get $1
    local.set $4
    local.get $0
    local.set $3
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $4
    local.get $6
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $6
    i32.load
    local.get $5
    local.get $4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $3
     i32.const 552
     i32.const 518
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $6
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
   else    
    block (result i32)
     local.get $2
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $2
     local.set $6
     local.get $2
     i32.load offset=4
     i32.load
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $5
     call $assembly/internal/Expectation/reportActualInteger
     local.get $4
     local.get $6
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $6
     i32.load
     local.get $5
     local.get $4
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $3
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $6
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
    else     
     block (result i32)
      local.get $2
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $2
      local.set $6
      local.get $2
      i32.load offset=4
      i32.load
      local.set $5
      local.get $1
      local.set $4
      local.get $0
      local.set $3
      local.get $5
      call $assembly/internal/Expectation/reportActualInteger
      local.get $4
      local.get $6
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $6
      i32.load
      local.get $5
      local.get $4
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $6
      call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
     else      
      block (result i32)
       local.get $2
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $2
       local.set $6
       local.get $2
       i32.load offset=4
       i32.load
       local.set $5
       local.get $1
       local.set $4
       local.get $0
       local.set $3
       local.get $5
       call $assembly/internal/Expectation/reportActualInteger
       local.get $4
       local.get $6
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $6
       i32.load
       local.get $5
       local.get $4
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $3
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $6
       call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
      else       
       block (result i32)
        local.get $2
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $2
        local.set $6
        local.get $2
        i32.load offset=4
        i32.load
        local.set $5
        local.get $1
        local.set $4
        local.get $0
        local.set $3
        local.get $5
        call $assembly/internal/Expectation/reportActualInteger
        local.get $4
        local.get $6
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $6
        i32.load
        local.get $5
        local.get $4
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $3
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $6
        call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
       else        
        block (result i32)
         local.get $2
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $2
         local.set $6
         local.get $2
         i32.load offset=4
         i32.load
         local.set $5
         local.get $1
         local.set $4
         local.get $0
         local.set $3
         local.get $5
         call $assembly/internal/Expectation/reportActualInteger
         local.get $4
         local.get $6
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $6
         i32.load
         local.get $5
         local.get $4
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $3
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $6
         call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
        else         
         block (result i32)
          local.get $2
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $2
          local.set $6
          local.get $2
          i32.load offset=4
          i32.load
          local.set $5
          local.get $1
          local.set $4
          local.get $0
          local.set $3
          local.get $5
          call $assembly/internal/Expectation/reportActualInteger
          local.get $4
          local.get $6
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $6
          i32.load
          local.get $5
          local.get $4
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $3
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $6
          call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
         else          
          block (result i32)
           local.get $2
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $2
           local.set $6
           local.get $2
           i32.load offset=4
           i32.load
           local.set $5
           local.get $1
           local.set $4
           local.get $0
           local.set $3
           local.get $5
           call $assembly/internal/Expectation/reportActualInteger
           local.get $4
           local.get $6
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $6
           i32.load
           local.get $5
           local.get $4
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $3
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $6
           call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
          else           
           block (result i32)
            local.get $2
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $2
            local.set $6
            local.get $2
            i32.load offset=4
            i32.load
            local.set $5
            local.get $1
            local.set $4
            local.get $0
            local.set $3
            local.get $5
            call $assembly/internal/Expectation/reportActualInteger
            local.get $4
            local.get $6
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $6
            i32.load
            local.get $5
            local.get $4
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $3
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $6
            call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
           else            
            block (result i32)
             local.get $2
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $2
             local.set $6
             local.get $2
             i32.load offset=4
             i32.load
             local.set $5
             local.get $1
             local.set $4
             local.get $0
             local.set $3
             local.get $5
             call $assembly/internal/Expectation/reportActualInteger
             local.get $4
             local.get $6
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $6
             i32.load
             local.get $5
             local.get $4
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $3
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $6
             call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
            else             
             block (result i32)
              local.get $2
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $2
              local.set $6
              local.get $2
              i32.load offset=4
              i32.load
              local.set $5
              local.get $1
              local.set $4
              local.get $0
              local.set $3
              local.get $5
              call $assembly/internal/Expectation/reportActualInteger
              local.get $4
              local.get $6
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $6
              i32.load
              local.get $5
              local.get $4
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $3
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $6
              call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
             else              
              block (result i32)
               local.get $2
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#assertLength|inlined.24
                local.get $2
                local.set $7
                local.get $3
                call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
               end
              else               
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#assertLength|inlined.25
                local.get $2
                local.set $7
                local.get $3
                i32.load
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 (; 164 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  local.set $2
  i32.const 3
  local.set $1
  i32.const 168
  local.set $0
  local.get $2
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 432
    i32.const 552
    i32.const 470
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $2
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $2
    local.set $6
    local.get $2
    i32.load offset=4
    i32.load
    local.set $5
    local.get $1
    local.set $4
    local.get $0
    local.set $3
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $4
    local.get $6
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $6
    i32.load
    local.get $5
    local.get $4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $3
     i32.const 552
     i32.const 518
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $6
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
   else    
    block (result i32)
     local.get $2
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $2
     local.set $6
     local.get $2
     i32.load offset=4
     i32.load
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $5
     call $assembly/internal/Expectation/reportActualInteger
     local.get $4
     local.get $6
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $6
     i32.load
     local.get $5
     local.get $4
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $3
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $6
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
    else     
     block (result i32)
      local.get $2
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $2
      local.set $6
      local.get $2
      i32.load offset=4
      i32.load
      local.set $5
      local.get $1
      local.set $4
      local.get $0
      local.set $3
      local.get $5
      call $assembly/internal/Expectation/reportActualInteger
      local.get $4
      local.get $6
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $6
      i32.load
      local.get $5
      local.get $4
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $6
      call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
     else      
      block (result i32)
       local.get $2
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $2
       local.set $6
       local.get $2
       i32.load offset=4
       i32.load
       local.set $5
       local.get $1
       local.set $4
       local.get $0
       local.set $3
       local.get $5
       call $assembly/internal/Expectation/reportActualInteger
       local.get $4
       local.get $6
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $6
       i32.load
       local.get $5
       local.get $4
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $3
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $6
       call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
      else       
       block (result i32)
        local.get $2
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $2
        local.set $6
        local.get $2
        i32.load offset=4
        i32.load
        local.set $5
        local.get $1
        local.set $4
        local.get $0
        local.set $3
        local.get $5
        call $assembly/internal/Expectation/reportActualInteger
        local.get $4
        local.get $6
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $6
        i32.load
        local.get $5
        local.get $4
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $3
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $6
        call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
       else        
        block (result i32)
         local.get $2
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $2
         local.set $6
         local.get $2
         i32.load offset=4
         i32.load
         local.set $5
         local.get $1
         local.set $4
         local.get $0
         local.set $3
         local.get $5
         call $assembly/internal/Expectation/reportActualInteger
         local.get $4
         local.get $6
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $6
         i32.load
         local.get $5
         local.get $4
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $3
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $6
         call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
        else         
         block (result i32)
          local.get $2
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $2
          local.set $6
          local.get $2
          i32.load offset=4
          i32.load
          local.set $5
          local.get $1
          local.set $4
          local.get $0
          local.set $3
          local.get $5
          call $assembly/internal/Expectation/reportActualInteger
          local.get $4
          local.get $6
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $6
          i32.load
          local.get $5
          local.get $4
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $3
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $6
          call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
         else          
          block (result i32)
           local.get $2
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $2
           local.set $6
           local.get $2
           i32.load offset=4
           i32.load
           local.set $5
           local.get $1
           local.set $4
           local.get $0
           local.set $3
           local.get $5
           call $assembly/internal/Expectation/reportActualInteger
           local.get $4
           local.get $6
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $6
           i32.load
           local.get $5
           local.get $4
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $3
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $6
           call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
          else           
           block (result i32)
            local.get $2
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $2
            local.set $6
            local.get $2
            i32.load offset=4
            i32.load
            local.set $5
            local.get $1
            local.set $4
            local.get $0
            local.set $3
            local.get $5
            call $assembly/internal/Expectation/reportActualInteger
            local.get $4
            local.get $6
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $6
            i32.load
            local.get $5
            local.get $4
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $3
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $6
            call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
           else            
            block (result i32)
             local.get $2
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $2
             local.set $6
             local.get $2
             i32.load offset=4
             i32.load
             local.set $5
             local.get $1
             local.set $4
             local.get $0
             local.set $3
             local.get $5
             call $assembly/internal/Expectation/reportActualInteger
             local.get $4
             local.get $6
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $6
             i32.load
             local.get $5
             local.get $4
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $3
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $6
             call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
            else             
             block (result i32)
              local.get $2
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $2
              local.set $6
              local.get $2
              i32.load offset=4
              i32.load
              local.set $5
              local.get $1
              local.set $4
              local.get $0
              local.set $3
              local.get $5
              call $assembly/internal/Expectation/reportActualInteger
              local.get $4
              local.get $6
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $6
              i32.load
              local.get $5
              local.get $4
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $3
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $6
              call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
             else              
              block (result i32)
               local.get $2
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#assertLength|inlined.37
                local.get $2
                local.set $7
                local.get $3
                call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
               end
              else               
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#assertLength|inlined.38
                local.get $2
                local.set $7
                local.get $3
                i32.load
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 (; 165 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
  local.set $2
  i32.const 3
  local.set $1
  i32.const 168
  local.set $0
  local.get $2
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 432
    i32.const 552
    i32.const 470
    i32.const 8
    call $~lib/builtins/abort
    unreachable
   end
  else   
   block (result i32)
    local.get $2
    i32.load offset=4
    drop
    i32.const 0
   end
   if
    local.get $2
    local.set $6
    local.get $2
    i32.load offset=4
    i32.load
    local.set $5
    local.get $1
    local.set $4
    local.get $0
    local.set $3
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $4
    local.get $6
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $6
    i32.load
    local.get $5
    local.get $4
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $3
     i32.const 552
     i32.const 518
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $6
    call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
   else    
    block (result i32)
     local.get $2
     i32.load offset=4
     drop
     i32.const 0
    end
    if
     local.get $2
     local.set $6
     local.get $2
     i32.load offset=4
     i32.load
     local.set $5
     local.get $1
     local.set $4
     local.get $0
     local.set $3
     local.get $5
     call $assembly/internal/Expectation/reportActualInteger
     local.get $4
     local.get $6
     i32.load
     call $assembly/internal/Expectation/reportExpectedInteger
     local.get $6
     i32.load
     local.get $5
     local.get $4
     i32.eq
     i32.xor
     i32.eqz
     if
      local.get $3
      i32.const 552
      i32.const 518
      i32.const 4
      call $~lib/builtins/abort
      unreachable
     end
     local.get $6
     call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
    else     
     block (result i32)
      local.get $2
      i32.load offset=4
      drop
      i32.const 0
     end
     if
      local.get $2
      local.set $6
      local.get $2
      i32.load offset=4
      i32.load
      local.set $5
      local.get $1
      local.set $4
      local.get $0
      local.set $3
      local.get $5
      call $assembly/internal/Expectation/reportActualInteger
      local.get $4
      local.get $6
      i32.load
      call $assembly/internal/Expectation/reportExpectedInteger
      local.get $6
      i32.load
      local.get $5
      local.get $4
      i32.eq
      i32.xor
      i32.eqz
      if
       local.get $3
       i32.const 552
       i32.const 518
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
      local.get $6
      call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
     else      
      block (result i32)
       local.get $2
       i32.load offset=4
       drop
       i32.const 0
      end
      if
       local.get $2
       local.set $6
       local.get $2
       i32.load offset=4
       i32.load
       local.set $5
       local.get $1
       local.set $4
       local.get $0
       local.set $3
       local.get $5
       call $assembly/internal/Expectation/reportActualInteger
       local.get $4
       local.get $6
       i32.load
       call $assembly/internal/Expectation/reportExpectedInteger
       local.get $6
       i32.load
       local.get $5
       local.get $4
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $3
        i32.const 552
        i32.const 518
        i32.const 4
        call $~lib/builtins/abort
        unreachable
       end
       local.get $6
       call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
      else       
       block (result i32)
        local.get $2
        i32.load offset=4
        drop
        i32.const 0
       end
       if
        local.get $2
        local.set $6
        local.get $2
        i32.load offset=4
        i32.load
        local.set $5
        local.get $1
        local.set $4
        local.get $0
        local.set $3
        local.get $5
        call $assembly/internal/Expectation/reportActualInteger
        local.get $4
        local.get $6
        i32.load
        call $assembly/internal/Expectation/reportExpectedInteger
        local.get $6
        i32.load
        local.get $5
        local.get $4
        i32.eq
        i32.xor
        i32.eqz
        if
         local.get $3
         i32.const 552
         i32.const 518
         i32.const 4
         call $~lib/builtins/abort
         unreachable
        end
        local.get $6
        call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
       else        
        block (result i32)
         local.get $2
         i32.load offset=4
         drop
         i32.const 0
        end
        if
         local.get $2
         local.set $6
         local.get $2
         i32.load offset=4
         i32.load
         local.set $5
         local.get $1
         local.set $4
         local.get $0
         local.set $3
         local.get $5
         call $assembly/internal/Expectation/reportActualInteger
         local.get $4
         local.get $6
         i32.load
         call $assembly/internal/Expectation/reportExpectedInteger
         local.get $6
         i32.load
         local.get $5
         local.get $4
         i32.eq
         i32.xor
         i32.eqz
         if
          local.get $3
          i32.const 552
          i32.const 518
          i32.const 4
          call $~lib/builtins/abort
          unreachable
         end
         local.get $6
         call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
        else         
         block (result i32)
          local.get $2
          i32.load offset=4
          drop
          i32.const 0
         end
         if
          local.get $2
          local.set $6
          local.get $2
          i32.load offset=4
          i32.load
          local.set $5
          local.get $1
          local.set $4
          local.get $0
          local.set $3
          local.get $5
          call $assembly/internal/Expectation/reportActualInteger
          local.get $4
          local.get $6
          i32.load
          call $assembly/internal/Expectation/reportExpectedInteger
          local.get $6
          i32.load
          local.get $5
          local.get $4
          i32.eq
          i32.xor
          i32.eqz
          if
           local.get $3
           i32.const 552
           i32.const 518
           i32.const 4
           call $~lib/builtins/abort
           unreachable
          end
          local.get $6
          call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
         else          
          block (result i32)
           local.get $2
           i32.load offset=4
           drop
           i32.const 0
          end
          if
           local.get $2
           local.set $6
           local.get $2
           i32.load offset=4
           i32.load
           local.set $5
           local.get $1
           local.set $4
           local.get $0
           local.set $3
           local.get $5
           call $assembly/internal/Expectation/reportActualInteger
           local.get $4
           local.get $6
           i32.load
           call $assembly/internal/Expectation/reportExpectedInteger
           local.get $6
           i32.load
           local.get $5
           local.get $4
           i32.eq
           i32.xor
           i32.eqz
           if
            local.get $3
            i32.const 552
            i32.const 518
            i32.const 4
            call $~lib/builtins/abort
            unreachable
           end
           local.get $6
           call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
          else           
           block (result i32)
            local.get $2
            i32.load offset=4
            drop
            i32.const 0
           end
           if
            local.get $2
            local.set $6
            local.get $2
            i32.load offset=4
            i32.load
            local.set $5
            local.get $1
            local.set $4
            local.get $0
            local.set $3
            local.get $5
            call $assembly/internal/Expectation/reportActualInteger
            local.get $4
            local.get $6
            i32.load
            call $assembly/internal/Expectation/reportExpectedInteger
            local.get $6
            i32.load
            local.get $5
            local.get $4
            i32.eq
            i32.xor
            i32.eqz
            if
             local.get $3
             i32.const 552
             i32.const 518
             i32.const 4
             call $~lib/builtins/abort
             unreachable
            end
            local.get $6
            call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
           else            
            block (result i32)
             local.get $2
             i32.load offset=4
             drop
             i32.const 0
            end
            if
             local.get $2
             local.set $6
             local.get $2
             i32.load offset=4
             i32.load
             local.set $5
             local.get $1
             local.set $4
             local.get $0
             local.set $3
             local.get $5
             call $assembly/internal/Expectation/reportActualInteger
             local.get $4
             local.get $6
             i32.load
             call $assembly/internal/Expectation/reportExpectedInteger
             local.get $6
             i32.load
             local.get $5
             local.get $4
             i32.eq
             i32.xor
             i32.eqz
             if
              local.get $3
              i32.const 552
              i32.const 518
              i32.const 4
              call $~lib/builtins/abort
              unreachable
             end
             local.get $6
             call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
            else             
             block (result i32)
              local.get $2
              i32.load offset=4
              drop
              i32.const 0
             end
             if
              local.get $2
              local.set $6
              local.get $2
              i32.load offset=4
              i32.load
              local.set $5
              local.get $1
              local.set $4
              local.get $0
              local.set $3
              local.get $5
              call $assembly/internal/Expectation/reportActualInteger
              local.get $4
              local.get $6
              i32.load
              call $assembly/internal/Expectation/reportExpectedInteger
              local.get $6
              i32.load
              local.get $5
              local.get $4
              i32.eq
              i32.xor
              i32.eqz
              if
               local.get $3
               i32.const 552
               i32.const 518
               i32.const 4
               call $~lib/builtins/abort
               unreachable
              end
              local.get $6
              call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
             else              
              block (result i32)
               local.get $2
               i32.load offset=4
               drop
               i32.const 0
              end
              if
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#assertLength|inlined.50
                local.get $2
                local.set $7
                local.get $3
                call $~lib/arraybuffer/ArrayBuffer#get:byteLength
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
               end
              else               
               local.get $2
               i32.load offset=4
               local.set $3
               block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#assertLength|inlined.51
                local.get $2
                local.set $7
                local.get $3
                i32.load
                local.set $6
                local.get $1
                local.set $5
                local.get $0
                local.set $4
                local.get $6
                call $assembly/internal/Expectation/reportActualInteger
                local.get $5
                local.get $7
                i32.load
                call $assembly/internal/Expectation/reportExpectedInteger
                local.get $7
                i32.load
                local.get $6
                local.get $5
                i32.eq
                i32.xor
                i32.eqz
                if
                 local.get $4
                 i32.const 552
                 i32.const 518
                 i32.const 4
                 call $~lib/builtins/abort
                 unreachable
                end
                local.get $7
                call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
               end
              end
             end
            end
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1 (; 166 ;) (type $FUNCSIG$v)
  i32.const 240
  i32.const 38
  call $assembly/internal/Test/it
  i32.const 1520
  i32.const 39
  i32.const 784
  call $assembly/internal/Test/throws
  i32.const 1640
  i32.const 40
  i32.const 1712
  call $assembly/internal/Test/throws
  i32.const 1848
  i32.const 41
  i32.const 1712
  call $assembly/internal/Test/throws
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 167 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 43
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
 (func $assembly/internal/Expectation/expect<i32> (; 168 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 (; 169 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 3
  call $assembly/internal/Expectation/expect<i32>
  local.set $2
  i32.const 3
  local.set $1
  i32.const 168
  local.set $0
  i32.const 0
  i32.eqz
  if
   i32.const 2200
   i32.const 552
   i32.const 510
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2 (; 170 ;) (type $FUNCSIG$v)
  i32.const 2056
  i32.const 43
  i32.const 2432
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/__tests__/toHaveLength.spec (; 171 ;) (type $FUNCSIG$v)
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
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>
  i32.const 912
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>
  i32.const 968
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>
  i32.const 1008
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>
  i32.const 1048
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>
  i32.const 1088
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>
  i32.const 1128
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>
  i32.const 1168
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>
  i32.const 1208
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>
  i32.const 1248
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>
  i32.const 1288
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>
  i32.const 1392
  i32.const 37
  call $assembly/internal/Describe/describe
  i32.const 0
  call $assembly/__tests__/toHaveLength.spec/Example#constructor
  global.set $assembly/__tests__/toHaveLength.spec/customExample
  i32.const 1448
  i32.const 42
  call $assembly/internal/Describe/describe
  i32.const 1968
  i32.const 44
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 172 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 173 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toHaveLength.spec
 )
 (func $null (; 174 ;) (type $FUNCSIG$v)
 )
)
