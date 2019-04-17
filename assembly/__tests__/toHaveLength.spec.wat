(module
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$viiiii (func (param i32 i32 i32 i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viij (func (param i32 i32 i64)))
 (type $FUNCSIG$viif (func (param i32 i32 f32)))
 (type $FUNCSIG$viid (func (param i32 i32 f64)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\n\00\00\00U\00i\00n\00t\008\00A\00r\00r\00a\00y\00")
 (data (i32.const 32) "\1e\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00T\00y\00p\00e\00d\00A\00r\00r\00a\00y\00 \00t\00y\00p\00e\00:\00 \00")
 (data (i32.const 96) "\04\00\00\00n\00u\00l\00l\00")
 (data (i32.const 112) "\0e\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s\00")
 (data (i32.const 144) "\00\00\00\00")
 (data (i32.const 152) "\17\00\00\00~\00l\00i\00b\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s\00")
 (data (i32.const 208) "\1d\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 272) "\1b\00\00\00~\00l\00i\00b\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 336) "\1c\00\00\00~\00l\00i\00b\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 400) "3\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00n\00u\00l\00l\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 512) " \00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 584) "A\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 720) "6\00\00\00W\00h\00e\00n\00 \00l\00e\00n\00g\00t\00h\00 \00i\00s\00 \00e\00q\00u\00a\00l\00,\00 \00n\00e\00g\00a\00t\00e\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 832) "\11\00\00\00U\00i\00n\00t\008\00C\00l\00a\00m\00p\00e\00d\00A\00r\00r\00a\00y\00")
 (data (i32.const 872) "\t\00\00\00I\00n\00t\008\00A\00r\00r\00a\00y\00")
 (data (i32.const 896) "\0b\00\00\00U\00i\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 928) "\n\00\00\00I\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 952) "\0b\00\00\00U\00i\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 984) "\n\00\00\00I\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1008) "\0b\00\00\00U\00i\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1040) "\n\00\00\00I\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1064) "\0c\00\00\00F\00l\00o\00a\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1096) "\0c\00\00\00F\00l\00o\00a\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1128) "\0c\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1160) "h\04\00\00\03\00\00\00")
 (data (i32.const 1168) "\13\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00A\00r\00r\00a\00y\00s\00")
 (data (i32.const 1216) "\1b\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00c\00u\00s\00t\00o\00m\00 \00c\00l\00a\00s\00s\00e\00s\00")
 (data (i32.const 1280) "4\00\00\00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1392) "\1b\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 1456) ":\00\00\00W\00h\00e\00n\00 \00t\00h\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00,\00 \00i\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00a\00n\00 \00e\00r\00r\00o\00r\00.\00")
 (data (i32.const 1576) "4\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 1688) "\"\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00")
 (data (i32.const 1760) ">\00\00\00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00u\00s\00e\00d\00")
 (data (i32.const 1888) "l\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00T\00y\00p\00e\00d\00A\00r\00r\00a\00y\00s\00,\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00,\00 \00A\00r\00r\00a\00y\00s\00,\00 \00a\00n\00d\00 \00c\00l\00a\00s\00s\00e\00s\00 \00t\00h\00a\00t\00 \00h\00a\00v\00e\00 \00a\00 \00l\00e\00n\00g\00t\00h\00 \00p\00r\00o\00p\00e\00r\00t\00y\00.\00")
 (data (i32.const 2112) "4\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (table $0 45 funcref)
 (elem (i32.const 0) $null $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/toHaveLength.spec~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|2)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 4))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/toHaveLength.spec/valueArray (mut i32) (i32.const 1160))
 (global $assembly/__tests__/toHaveLength.spec/customExample (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 2220))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $start:~lib/allocator/arena (; 8 ;) (type $FUNCSIG$v)
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
 (func $~lib/allocator/arena/__memory_allocate (; 9 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/internal/string/allocateUnsafe (; 10 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 0
  i32.gt_s
  local.tee $1
  if (result i32)
   local.get $0
   i32.const 536870910
   i32.le_s
  else   
   local.get $1
  end
  i32.eqz
  if
   i32.const 0
   i32.const 152
   i32.const 14
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $~lib/memory/memory.allocate|inlined.0 (result i32)
   i32.const 4
   local.get $0
   i32.const 1
   i32.shl
   i32.add
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_allocate
   br $~lib/memory/memory.allocate|inlined.0
  end
  local.set $2
  local.get $2
  local.get $0
  i32.store
  local.get $2
 )
 (func $~lib/internal/memory/memcpy (; 11 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $break|0
   loop $continue|0
    local.get $2
    if (result i32)
     local.get $1
     i32.const 3
     i32.and
    else     
     local.get $2
    end
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
     br $continue|0
    end
   end
  end
  local.get $0
  i32.const 3
  i32.and
  i32.const 0
  i32.eq
  if
   block $break|1
    loop $continue|1
     local.get $2
     i32.const 16
     i32.ge_u
     if
      block
       local.get $0
       local.get $1
       i32.load
       i32.store
       local.get $0
       i32.const 4
       i32.add
       local.get $1
       i32.const 4
       i32.add
       i32.load
       i32.store
       local.get $0
       i32.const 8
       i32.add
       local.get $1
       i32.const 8
       i32.add
       i32.load
       i32.store
       local.get $0
       i32.const 12
       i32.add
       local.get $1
       i32.const 12
       i32.add
       i32.load
       i32.store
       local.get $1
       i32.const 16
       i32.add
       local.set $1
       local.get $0
       i32.const 16
       i32.add
       local.set $0
       local.get $2
       i32.const 16
       i32.sub
       local.set $2
      end
      br $continue|1
     end
    end
   end
   local.get $2
   i32.const 8
   i32.and
   if
    local.get $0
    local.get $1
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.get $1
    i32.const 4
    i32.add
    i32.load
    i32.store
    local.get $0
    i32.const 8
    i32.add
    local.set $0
    local.get $1
    i32.const 8
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 4
   i32.and
   if
    local.get $0
    local.get $1
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    local.get $1
    i32.const 4
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 2
   i32.and
   if
    local.get $0
    local.get $1
    i32.load16_u
    i32.store16
    local.get $0
    i32.const 2
    i32.add
    local.set $0
    local.get $1
    i32.const 2
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 1
   i32.and
   if
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
   return
  end
  local.get $2
  i32.const 32
  i32.ge_u
  if
   block $break|2
    block $case2|2
     block $case1|2
      block $case0|2
       local.get $0
       i32.const 3
       i32.and
       local.set $5
       local.get $5
       i32.const 1
       i32.eq
       br_if $case0|2
       local.get $5
       i32.const 2
       i32.eq
       br_if $case1|2
       local.get $5
       i32.const 3
       i32.eq
       br_if $case2|2
       br $break|2
      end
      block
       local.get $1
       i32.load
       local.set $3
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
       i32.const 3
       i32.sub
       local.set $2
       block $break|3
        loop $continue|3
         local.get $2
         i32.const 17
         i32.ge_u
         if
          block
           local.get $1
           i32.const 1
           i32.add
           i32.load
           local.set $4
           local.get $0
           local.get $3
           i32.const 24
           i32.shr_u
           local.get $4
           i32.const 8
           i32.shl
           i32.or
           i32.store
           local.get $1
           i32.const 5
           i32.add
           i32.load
           local.set $3
           local.get $0
           i32.const 4
           i32.add
           local.get $4
           i32.const 24
           i32.shr_u
           local.get $3
           i32.const 8
           i32.shl
           i32.or
           i32.store
           local.get $1
           i32.const 9
           i32.add
           i32.load
           local.set $4
           local.get $0
           i32.const 8
           i32.add
           local.get $3
           i32.const 24
           i32.shr_u
           local.get $4
           i32.const 8
           i32.shl
           i32.or
           i32.store
           local.get $1
           i32.const 13
           i32.add
           i32.load
           local.set $3
           local.get $0
           i32.const 12
           i32.add
           local.get $4
           i32.const 24
           i32.shr_u
           local.get $3
           i32.const 8
           i32.shl
           i32.or
           i32.store
           local.get $1
           i32.const 16
           i32.add
           local.set $1
           local.get $0
           i32.const 16
           i32.add
           local.set $0
           local.get $2
           i32.const 16
           i32.sub
           local.set $2
          end
          br $continue|3
         end
        end
       end
       br $break|2
       unreachable
      end
      unreachable
     end
     block
      local.get $1
      i32.load
      local.set $3
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
      i32.const 2
      i32.sub
      local.set $2
      block $break|4
       loop $continue|4
        local.get $2
        i32.const 18
        i32.ge_u
        if
         block
          local.get $1
          i32.const 2
          i32.add
          i32.load
          local.set $4
          local.get $0
          local.get $3
          i32.const 16
          i32.shr_u
          local.get $4
          i32.const 16
          i32.shl
          i32.or
          i32.store
          local.get $1
          i32.const 6
          i32.add
          i32.load
          local.set $3
          local.get $0
          i32.const 4
          i32.add
          local.get $4
          i32.const 16
          i32.shr_u
          local.get $3
          i32.const 16
          i32.shl
          i32.or
          i32.store
          local.get $1
          i32.const 10
          i32.add
          i32.load
          local.set $4
          local.get $0
          i32.const 8
          i32.add
          local.get $3
          i32.const 16
          i32.shr_u
          local.get $4
          i32.const 16
          i32.shl
          i32.or
          i32.store
          local.get $1
          i32.const 14
          i32.add
          i32.load
          local.set $3
          local.get $0
          i32.const 12
          i32.add
          local.get $4
          i32.const 16
          i32.shr_u
          local.get $3
          i32.const 16
          i32.shl
          i32.or
          i32.store
          local.get $1
          i32.const 16
          i32.add
          local.set $1
          local.get $0
          i32.const 16
          i32.add
          local.set $0
          local.get $2
          i32.const 16
          i32.sub
          local.set $2
         end
         br $continue|4
        end
       end
      end
      br $break|2
      unreachable
     end
     unreachable
    end
    block
     local.get $1
     i32.load
     local.set $3
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
     block $break|5
      loop $continue|5
       local.get $2
       i32.const 19
       i32.ge_u
       if
        block
         local.get $1
         i32.const 3
         i32.add
         i32.load
         local.set $4
         local.get $0
         local.get $3
         i32.const 8
         i32.shr_u
         local.get $4
         i32.const 24
         i32.shl
         i32.or
         i32.store
         local.get $1
         i32.const 7
         i32.add
         i32.load
         local.set $3
         local.get $0
         i32.const 4
         i32.add
         local.get $4
         i32.const 8
         i32.shr_u
         local.get $3
         i32.const 24
         i32.shl
         i32.or
         i32.store
         local.get $1
         i32.const 11
         i32.add
         i32.load
         local.set $4
         local.get $0
         i32.const 8
         i32.add
         local.get $3
         i32.const 8
         i32.shr_u
         local.get $4
         i32.const 24
         i32.shl
         i32.or
         i32.store
         local.get $1
         i32.const 15
         i32.add
         i32.load
         local.set $3
         local.get $0
         i32.const 12
         i32.add
         local.get $4
         i32.const 8
         i32.shr_u
         local.get $3
         i32.const 24
         i32.shl
         i32.or
         i32.store
         local.get $1
         i32.const 16
         i32.add
         local.set $1
         local.get $0
         i32.const 16
         i32.add
         local.set $0
         local.get $2
         i32.const 16
         i32.sub
         local.set $2
        end
        br $continue|5
       end
      end
     end
     br $break|2
     unreachable
    end
    unreachable
   end
  end
  local.get $2
  i32.const 16
  i32.and
  if
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
  local.get $2
  i32.const 8
  i32.and
  if
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
  local.get $2
  i32.const 4
  i32.and
  if
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
  local.get $2
  i32.const 2
  i32.and
  if
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
  local.get $2
  i32.const 1
  i32.and
  if
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
 )
 (func $~lib/internal/memory/memmove (; 12 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $0
  local.get $1
  i32.eq
  if
   return
  end
  local.get $1
  local.get $2
  i32.add
  local.get $0
  i32.le_u
  local.tee $3
  if (result i32)
   local.get $3
  else   
   local.get $0
   local.get $2
   i32.add
   local.get $1
   i32.le_u
  end
  if
   local.get $0
   local.get $1
   local.get $2
   call $~lib/internal/memory/memcpy
   return
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
         return
        end
        local.get $2
        i32.const 1
        i32.sub
        local.set $2
        block (result i32)
         local.get $0
         local.tee $3
         i32.const 1
         i32.add
         local.set $0
         local.get $3
        end
        block (result i32)
         local.get $1
         local.tee $3
         i32.const 1
         i32.add
         local.set $1
         local.get $3
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
        local.tee $3
        i32.const 1
        i32.add
        local.set $0
        local.get $3
       end
       block (result i32)
        local.get $1
        local.tee $3
        i32.const 1
        i32.add
        local.set $1
        local.get $3
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
         return
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
 )
 (func $~lib/internal/string/copyUnsafe (; 13 ;) (type $FUNCSIG$viiiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  i32.const 4
  i32.add
  local.set $5
  local.get $2
  local.get $3
  i32.const 1
  i32.shl
  i32.add
  i32.const 4
  i32.add
  local.set $6
  local.get $4
  i32.const 1
  i32.shl
  local.set $7
  local.get $5
  local.get $6
  local.get $7
  call $~lib/internal/memory/memmove
 )
 (func $~lib/string/String#concat (; 14 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 0
   i32.const 112
   i32.const 110
   i32.const 4
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 0
  i32.eq
  if
   i32.const 96
   local.set $1
  end
  local.get $0
  i32.load
  local.set $2
  local.get $1
  i32.load
  local.set $3
  local.get $2
  local.get $3
  i32.add
  local.set $4
  local.get $4
  i32.const 0
  i32.eq
  if
   i32.const 144
   return
  end
  local.get $4
  call $~lib/internal/string/allocateUnsafe
  local.set $5
  local.get $5
  i32.const 0
  local.get $0
  i32.const 0
  local.get $2
  call $~lib/internal/string/copyUnsafe
  local.get $5
  local.get $2
  local.get $1
  i32.const 0
  local.get $3
  call $~lib/internal/string/copyUnsafe
  local.get $5
 )
 (func $~lib/string/String.__concat (; 15 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 96
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/string/String#concat
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
   i32.const 336
   i32.const 26
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $~lib/memory/memory.allocate|inlined.1 (result i32)
   local.get $0
   call $~lib/internal/arraybuffer/computeSize
   local.set $2
   local.get $2
   call $~lib/allocator/arena/__memory_allocate
   br $~lib/memory/memory.allocate|inlined.1
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
 (func $~lib/memory/memory.allocate (; 19 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__memory_allocate
  return
 )
 (func $~lib/internal/typedarray/TypedArray<u8>#constructor (; 20 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
   i32.const 272
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
 (func $~lib/typedarray/Uint8Array#constructor (; 21 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/internal/typedarray/TypedArray<u8>#__set (; 22 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 0
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<u8,u32>|inlined.0
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
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor (; 23 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array> (; 24 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor
 )
 (func $~lib/allocator/arena/__memory_free (; 25 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup (; 26 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 (; 27 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8Array,u8>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<u8>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<u8>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<u8>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u8>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 0
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint8Array,u8>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Test/it (; 28 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not (; 29 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 (; 30 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8Array,u8>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<u8>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<u8>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<u8>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u8>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 0
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#cleanup
   end
  end
 )
 (func $assembly/internal/Test/throws (; 31 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 (; 32 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 2
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 33 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 34 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8> (; 35 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 3
  call $assembly/internal/Describe/describe
 )
 (func $~lib/typedarray/Uint8ClampedArray#constructor (; 36 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/typedarray/Uint8Array#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/clampToByte (; 37 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 31
  i32.shr_s
  i32.const -1
  i32.xor
  i32.const 255
  local.get $0
  i32.sub
  i32.const 31
  i32.shr_s
  local.get $0
  i32.or
  i32.and
 )
 (func $~lib/typedarray/Uint8ClampedArray#__set (; 38 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $~lib/typedarray/clampToByte
  call $~lib/internal/typedarray/TypedArray<u8>#__set
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor (; 39 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray> (; 40 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup (; 41 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 (; 42 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
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
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u8>#get:length|inlined.2 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 0
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint8ClampedArray,u8>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not (; 43 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 (; 44 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
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
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u8>#get:length|inlined.3 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 0
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 (; 45 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 6
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8> (; 46 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 7
  call $assembly/internal/Describe/describe
 )
 (func $~lib/internal/typedarray/TypedArray<i8>#constructor (; 47 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
   i32.const 272
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
  block $~lib/memory/memory.fill|inlined.1
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
 (func $~lib/typedarray/Int8Array#constructor (; 48 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<i8>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<i8>#__set (; 49 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 0
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<i8,i32>|inlined.0
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
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor (; 50 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array> (; 51 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup (; 52 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 (; 53 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int8Array,i8>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int8Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<i8>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<i8>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<i8>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<i8>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 0
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Int8Array,i8>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not (; 54 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 (; 55 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int8Array,i8>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int8Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<i8>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<i8>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<i8>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<i8>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 0
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 (; 56 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 8
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 9
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8> (; 57 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 10
  call $assembly/internal/Describe/describe
 )
 (func $~lib/internal/typedarray/TypedArray<u16>#constructor (; 58 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 536870908
  i32.gt_u
  if
   i32.const 0
   i32.const 272
   i32.const 23
   i32.const 34
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 1
  i32.shl
  local.set $2
  local.get $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  block $~lib/memory/memory.fill|inlined.2
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
 (func $~lib/typedarray/Uint16Array#constructor (; 59 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<u16>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<u16>#__set (; 60 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<u16,u32>|inlined.0
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
   i32.const 1
   i32.shl
   i32.add
   local.get $6
   i32.add
   local.get $5
   i32.store16 offset=8
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor (; 61 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array> (; 62 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup (; 63 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.3
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.3
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 (; 64 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint16Array,u16>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint16Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<u16>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<u16>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<u16>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u16>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 1
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint16Array,u16>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not (; 65 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 (; 66 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint16Array,u16>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint16Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<u16>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<u16>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<u16>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u16>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 1
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 (; 67 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 12
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16> (; 68 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 13
  call $assembly/internal/Describe/describe
 )
 (func $~lib/internal/typedarray/TypedArray<i16>#constructor (; 69 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 536870908
  i32.gt_u
  if
   i32.const 0
   i32.const 272
   i32.const 23
   i32.const 34
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 1
  i32.shl
  local.set $2
  local.get $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  block $~lib/memory/memory.fill|inlined.3
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
 (func $~lib/typedarray/Int16Array#constructor (; 70 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<i16>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<i16>#__set (; 71 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<i16,i32>|inlined.0
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
   i32.const 1
   i32.shl
   i32.add
   local.get $6
   i32.add
   local.get $5
   i32.store16 offset=8
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor (; 72 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array> (; 73 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup (; 74 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.4
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.4
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 (; 75 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int16Array,i16>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int16Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<i16>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<i16>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<i16>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<i16>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 1
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Int16Array,i16>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not (; 76 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 (; 77 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int16Array,i16>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int16Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<i16>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<i16>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<i16>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<i16>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 1
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 (; 78 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 14
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 15
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16> (; 79 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 16
  call $assembly/internal/Describe/describe
 )
 (func $~lib/internal/typedarray/TypedArray<u32>#constructor (; 80 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 268435454
  i32.gt_u
  if
   i32.const 0
   i32.const 272
   i32.const 23
   i32.const 34
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 2
  i32.shl
  local.set $2
  local.get $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  block $~lib/memory/memory.fill|inlined.4
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
 (func $~lib/typedarray/Uint32Array#constructor (; 81 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<u32>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<u32>#__set (; 82 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<u32,u32>|inlined.0
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
   i32.const 2
   i32.shl
   i32.add
   local.get $6
   i32.add
   local.get $5
   i32.store offset=8
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor (; 83 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array> (; 84 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup (; 85 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.5
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.5
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 (; 86 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint32Array,u32>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<u32>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<u32>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<u32>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u32>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 2
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint32Array,u32>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not (; 87 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 (; 88 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint32Array,u32>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<u32>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<u32>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<u32>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u32>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 2
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 (; 89 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 18
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32> (; 90 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 19
  call $assembly/internal/Describe/describe
 )
 (func $~lib/internal/typedarray/TypedArray<i32>#constructor (; 91 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 268435454
  i32.gt_u
  if
   i32.const 0
   i32.const 272
   i32.const 23
   i32.const 34
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 2
  i32.shl
  local.set $2
  local.get $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  block $~lib/memory/memory.fill|inlined.5
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
 (func $~lib/typedarray/Int32Array#constructor (; 92 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<i32>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<i32>#__set (; 93 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<i32,i32>|inlined.0
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
   i32.const 2
   i32.shl
   i32.add
   local.get $6
   i32.add
   local.get $5
   i32.store offset=8
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor (; 94 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array> (; 95 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup (; 96 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.6
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.6
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 (; 97 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int32Array,i32>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<i32>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<i32>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<i32>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<i32>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 2
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Int32Array,i32>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not (; 98 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 (; 99 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int32Array,i32>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i32.const 0
   call $~lib/internal/typedarray/TypedArray<i32>#__set
   local.get $0
   i32.const 1
   i32.const 1
   call $~lib/internal/typedarray/TypedArray<i32>#__set
   local.get $0
   i32.const 2
   i32.const 2
   call $~lib/internal/typedarray/TypedArray<i32>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<i32>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 2
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 (; 100 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 20
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 21
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32> (; 101 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 22
  call $assembly/internal/Describe/describe
 )
 (func $~lib/internal/typedarray/TypedArray<u64>#constructor (; 102 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 134217727
  i32.gt_u
  if
   i32.const 0
   i32.const 272
   i32.const 23
   i32.const 34
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 3
  i32.shl
  local.set $2
  local.get $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  block $~lib/memory/memory.fill|inlined.6
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
 (func $~lib/typedarray/Uint64Array#constructor (; 103 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<u64>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<u64>#__set (; 104 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<u64,u64>|inlined.0
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
   i32.const 3
   i32.shl
   i32.add
   local.get $6
   i32.add
   local.get $5
   i64.store offset=8
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor (; 105 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array> (; 106 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup (; 107 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.7
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.7
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 (; 108 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint64Array,u64>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i64.const 0
   call $~lib/internal/typedarray/TypedArray<u64>#__set
   local.get $0
   i32.const 1
   i64.const 1
   call $~lib/internal/typedarray/TypedArray<u64>#__set
   local.get $0
   i32.const 2
   i64.const 2
   call $~lib/internal/typedarray/TypedArray<u64>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u64>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 3
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Uint64Array,u64>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not (; 109 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 (; 110 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint64Array,u64>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i64.const 0
   call $~lib/internal/typedarray/TypedArray<u64>#__set
   local.get $0
   i32.const 1
   i64.const 1
   call $~lib/internal/typedarray/TypedArray<u64>#__set
   local.get $0
   i32.const 2
   i64.const 2
   call $~lib/internal/typedarray/TypedArray<u64>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<u64>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 3
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 (; 111 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 23
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 24
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64> (; 112 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 25
  call $assembly/internal/Describe/describe
 )
 (func $~lib/internal/typedarray/TypedArray<i64>#constructor (; 113 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 134217727
  i32.gt_u
  if
   i32.const 0
   i32.const 272
   i32.const 23
   i32.const 34
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 3
  i32.shl
  local.set $2
  local.get $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  block $~lib/memory/memory.fill|inlined.7
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
 (func $~lib/typedarray/Int64Array#constructor (; 114 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<i64>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<i64>#__set (; 115 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<i64,i64>|inlined.0
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
   i32.const 3
   i32.shl
   i32.add
   local.get $6
   i32.add
   local.get $5
   i64.store offset=8
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor (; 116 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array> (; 117 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup (; 118 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.8
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.8
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 (; 119 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int64Array,i64>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i64.const 0
   call $~lib/internal/typedarray/TypedArray<i64>#__set
   local.get $0
   i32.const 1
   i64.const 1
   call $~lib/internal/typedarray/TypedArray<i64>#__set
   local.get $0
   i32.const 2
   i64.const 2
   call $~lib/internal/typedarray/TypedArray<i64>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<i64>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 3
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Int64Array,i64>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not (; 120 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 (; 121 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int64Array,i64>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   i64.const 0
   call $~lib/internal/typedarray/TypedArray<i64>#__set
   local.get $0
   i32.const 1
   i64.const 1
   call $~lib/internal/typedarray/TypedArray<i64>#__set
   local.get $0
   i32.const 2
   i64.const 2
   call $~lib/internal/typedarray/TypedArray<i64>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<i64>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 3
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 (; 122 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 26
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 27
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64> (; 123 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 28
  call $assembly/internal/Describe/describe
 )
 (func $~lib/internal/typedarray/TypedArray<f32>#constructor (; 124 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 268435454
  i32.gt_u
  if
   i32.const 0
   i32.const 272
   i32.const 23
   i32.const 34
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 2
  i32.shl
  local.set $2
  local.get $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  block $~lib/memory/memory.fill|inlined.8
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
 (func $~lib/typedarray/Float32Array#constructor (; 125 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<f32>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<f32>#__set (; 126 ;) (type $FUNCSIG$viif) (param $0 i32) (param $1 i32) (param $2 f32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f32)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<f32,f32>|inlined.0
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
   i32.const 2
   i32.shl
   i32.add
   local.get $6
   i32.add
   local.get $5
   f32.store offset=8
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor (; 127 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array> (; 128 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup (; 129 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.9
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.9
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 (; 130 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float32Array,f32>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   f32.const 0
   call $~lib/internal/typedarray/TypedArray<f32>#__set
   local.get $0
   i32.const 1
   f32.const 1
   call $~lib/internal/typedarray/TypedArray<f32>#__set
   local.get $0
   i32.const 2
   f32.const 2
   call $~lib/internal/typedarray/TypedArray<f32>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<f32>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 2
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Float32Array,f32>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not (; 131 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 (; 132 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float32Array,f32>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float32Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   f32.const 0
   call $~lib/internal/typedarray/TypedArray<f32>#__set
   local.get $0
   i32.const 1
   f32.const 1
   call $~lib/internal/typedarray/TypedArray<f32>#__set
   local.get $0
   i32.const 2
   f32.const 2
   call $~lib/internal/typedarray/TypedArray<f32>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<f32>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 2
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 (; 133 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 29
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 30
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32> (; 134 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 31
  call $assembly/internal/Describe/describe
 )
 (func $~lib/internal/typedarray/TypedArray<f64>#constructor (; 135 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 134217727
  i32.gt_u
  if
   i32.const 0
   i32.const 272
   i32.const 23
   i32.const 34
   call $~lib/env/abort
   unreachable
  end
  local.get $1
  i32.const 3
  i32.shl
  local.set $2
  local.get $2
  call $~lib/internal/arraybuffer/allocateUnsafe
  local.set $3
  block $~lib/memory/memory.fill|inlined.9
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
 (func $~lib/typedarray/Float64Array#constructor (; 136 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  local.get $1
  call $~lib/internal/typedarray/TypedArray<f64>#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/internal/typedarray/TypedArray<f64>#__set (; 137 ;) (type $FUNCSIG$viid) (param $0 i32) (param $1 i32) (param $2 f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 0
   i32.const 272
   i32.const 50
   i32.const 63
   call $~lib/env/abort
   unreachable
  end
  block $~lib/internal/arraybuffer/STORE<f64,f64>|inlined.0
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
   i32.const 3
   i32.shl
   i32.add
   local.get $6
   i32.add
   local.get $5
   f64.store offset=8
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor (; 138 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array> (; 139 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup (; 140 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.10
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.10
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 (; 141 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float64Array,f64>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   f64.const 0
   call $~lib/internal/typedarray/TypedArray<f64>#__set
   local.get $0
   i32.const 1
   f64.const 1
   call $~lib/internal/typedarray/TypedArray<f64>#__set
   local.get $0
   i32.const 2
   f64.const 2
   call $~lib/internal/typedarray/TypedArray<f64>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength|inlined.0
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<f64>#get:length|inlined.0 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 3
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
   end
  end
  block $assembly/__tests__/toHaveLength.spec/free<~lib/typedarray/Float64Array,f64>|inlined.0
   local.get $1
   local.set $3
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not (; 142 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 (; 143 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float64Array,f64>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float64Array#constructor
   local.set $0
   local.get $0
   i32.const 0
   f64.const 0
   call $~lib/internal/typedarray/TypedArray<f64>#__set
   local.get $0
   i32.const 1
   f64.const 1
   call $~lib/internal/typedarray/TypedArray<f64>#__set
   local.get $0
   i32.const 2
   f64.const 2
   call $~lib/internal/typedarray/TypedArray<f64>#__set
   local.get $0
  end
  local.set $1
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength|inlined.1
   local.get $1
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not
   local.set $0
   i32.const 3
   local.set $2
   i32.const 144
   local.set $3
   local.get $0
   i32.load offset=4
   i32.const 0
   i32.eq
   if
    i32.const 0
    i32.eqz
    if
     i32.const 400
     i32.const 512
     i32.const 468
     i32.const 8
     call $~lib/env/abort
     unreachable
    end
   else    
    local.get $0
    local.set $4
    block $~lib/internal/typedarray/TypedArray<f64>#get:length|inlined.1 (result i32)
     local.get $0
     i32.load offset=4
     local.set $5
     local.get $5
     i32.load offset=8
     i32.const 3
     i32.shr_u
    end
    local.set $5
    local.get $2
    local.set $6
    local.get $3
    local.set $7
    local.get $5
    call $assembly/internal/Expectation/reportActualInteger
    local.get $6
    local.get $4
    i32.load
    call $assembly/internal/Expectation/reportExpectedInteger
    local.get $4
    i32.load
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 512
     i32.const 512
     i32.const 4
     call $~lib/env/abort
     unreachable
    end
    local.get $4
    call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#cleanup
   end
  end
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 (; 144 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 32
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 33
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64> (; 145 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 32
  local.get $0
  call $~lib/string/String.__concat
  i32.const 34
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 146 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/array/Array<i32>> (; 147 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup (; 148 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.11
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.11
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 (; 149 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $assembly/__tests__/toHaveLength.spec/valueArray
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.set $0
  i32.const 3
  local.set $1
  i32.const 144
  local.set $2
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 400
    i32.const 512
    i32.const 468
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   local.set $3
   block $~lib/array/Array<i32>#get:length|inlined.0 (result i32)
    local.get $0
    i32.load offset=4
    local.set $4
    local.get $4
    i32.load offset=4
   end
   local.set $4
   local.get $1
   local.set $5
   local.get $2
   local.set $6
   local.get $4
   call $assembly/internal/Expectation/reportActualInteger
   local.get $5
   local.get $3
   i32.load
   call $assembly/internal/Expectation/reportExpectedInteger
   local.get $3
   i32.load
   local.get $4
   local.get $5
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $6
    i32.const 512
    i32.const 512
    i32.const 4
    call $~lib/env/abort
    unreachable
   end
   local.get $3
   call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 150 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 (; 151 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $assembly/__tests__/toHaveLength.spec/valueArray
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.set $0
  i32.const 3
  local.set $1
  i32.const 144
  local.set $2
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 400
    i32.const 512
    i32.const 468
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   local.set $3
   block $~lib/array/Array<i32>#get:length|inlined.1 (result i32)
    local.get $0
    i32.load offset=4
    local.set $4
    local.get $4
    i32.load offset=4
   end
   local.set $4
   local.get $1
   local.set $5
   local.get $2
   local.set $6
   local.get $4
   call $assembly/internal/Expectation/reportActualInteger
   local.get $5
   local.get $3
   i32.load
   call $assembly/internal/Expectation/reportExpectedInteger
   local.get $3
   i32.load
   local.get $4
   local.get $5
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $6
    i32.const 512
    i32.const 512
    i32.const 4
    call $~lib/env/abort
    unreachable
   end
   local.get $3
   call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#cleanup
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0 (; 152 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 35
  call $assembly/internal/Test/it
  i32.const 584
  i32.const 36
  i32.const 720
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/Example#constructor (; 153 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   call $~lib/memory/memory.allocate
   local.set $0
  end
  local.get $0
  i32.const 3
  i32.store
  local.get $0
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor (; 154 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example> (; 155 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup (; 156 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  call $assembly/internal/Expectation/clearExpected
  block $~lib/memory/memory.free|inlined.12
   local.get $0
   local.set $1
   local.get $1
   call $~lib/allocator/arena/__memory_free
   br $~lib/memory/memory.free|inlined.12
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 (; 157 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $assembly/__tests__/toHaveLength.spec/customExample
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  local.set $0
  i32.const 3
  local.set $1
  i32.const 144
  local.set $2
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 400
    i32.const 512
    i32.const 468
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   local.set $3
   local.get $0
   i32.load offset=4
   i32.load
   local.set $4
   local.get $1
   local.set $5
   local.get $2
   local.set $6
   local.get $4
   call $assembly/internal/Expectation/reportActualInteger
   local.get $5
   local.get $3
   i32.load
   call $assembly/internal/Expectation/reportExpectedInteger
   local.get $3
   i32.load
   local.get $4
   local.get $5
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $6
    i32.const 512
    i32.const 512
    i32.const 4
    call $~lib/env/abort
    unreachable
   end
   local.get $3
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not (; 158 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 (; 159 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $assembly/__tests__/toHaveLength.spec/customExample
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
  local.set $0
  i32.const 3
  local.set $1
  i32.const 144
  local.set $2
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 400
    i32.const 512
    i32.const 468
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   local.set $3
   local.get $0
   i32.load offset=4
   i32.load
   local.set $4
   local.get $1
   local.set $5
   local.get $2
   local.set $6
   local.get $4
   call $assembly/internal/Expectation/reportActualInteger
   local.get $5
   local.get $3
   i32.load
   call $assembly/internal/Expectation/reportExpectedInteger
   local.get $3
   i32.load
   local.get $4
   local.get $5
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $6
    i32.const 512
    i32.const 512
    i32.const 4
    call $~lib/env/abort
    unreachable
   end
   local.get $3
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 (; 160 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  local.set $0
  i32.const 3
  local.set $1
  i32.const 144
  local.set $2
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 400
    i32.const 512
    i32.const 468
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   local.set $3
   local.get $0
   i32.load offset=4
   i32.load
   local.set $4
   local.get $1
   local.set $5
   local.get $2
   local.set $6
   local.get $4
   call $assembly/internal/Expectation/reportActualInteger
   local.get $5
   local.get $3
   i32.load
   call $assembly/internal/Expectation/reportExpectedInteger
   local.get $3
   i32.load
   local.get $4
   local.get $5
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $6
    i32.const 512
    i32.const 512
    i32.const 4
    call $~lib/env/abort
    unreachable
   end
   local.get $3
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 (; 161 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
  local.set $0
  i32.const 3
  local.set $1
  i32.const 144
  local.set $2
  local.get $0
  i32.load offset=4
  i32.const 0
  i32.eq
  if
   i32.const 0
   i32.eqz
   if
    i32.const 400
    i32.const 512
    i32.const 468
    i32.const 8
    call $~lib/env/abort
    unreachable
   end
  else   
   local.get $0
   local.set $3
   local.get $0
   i32.load offset=4
   i32.load
   local.set $4
   local.get $1
   local.set $5
   local.get $2
   local.set $6
   local.get $4
   call $assembly/internal/Expectation/reportActualInteger
   local.get $5
   local.get $3
   i32.load
   call $assembly/internal/Expectation/reportExpectedInteger
   local.get $3
   i32.load
   local.get $4
   local.get $5
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $6
    i32.const 512
    i32.const 512
    i32.const 4
    call $~lib/env/abort
    unreachable
   end
   local.get $3
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#cleanup
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1 (; 162 ;) (type $FUNCSIG$v)
  i32.const 208
  i32.const 38
  call $assembly/internal/Test/it
  i32.const 1280
  i32.const 39
  i32.const 720
  call $assembly/internal/Test/throws
  i32.const 1392
  i32.const 40
  i32.const 1456
  call $assembly/internal/Test/throws
  i32.const 1576
  i32.const 41
  i32.const 1456
  call $assembly/internal/Test/throws
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 163 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 164 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 (; 165 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 3
  call $assembly/internal/Expectation/expect<i32>
  local.set $0
  i32.const 3
  local.set $1
  i32.const 144
  local.set $2
  i32.const 0
  i32.eqz
  if
   i32.const 1888
   i32.const 512
   i32.const 504
   i32.const 6
   call $~lib/env/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2 (; 166 ;) (type $FUNCSIG$v)
  i32.const 1760
  i32.const 43
  i32.const 2112
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/__tests__/toHaveLength.spec (; 167 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
  i32.const 8
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>
  i32.const 832
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>
  i32.const 872
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>
  i32.const 896
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>
  i32.const 928
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>
  i32.const 952
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>
  i32.const 984
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>
  i32.const 1008
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>
  i32.const 1040
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>
  i32.const 1064
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>
  i32.const 1096
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>
  i32.const 1168
  i32.const 37
  call $assembly/internal/Describe/describe
  i32.const 0
  call $assembly/__tests__/toHaveLength.spec/Example#constructor
  global.set $assembly/__tests__/toHaveLength.spec/customExample
  i32.const 1216
  i32.const 42
  call $assembly/internal/Describe/describe
  i32.const 1688
  i32.const 44
  call $assembly/internal/Describe/describe
 )
 (func $start (; 168 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toHaveLength.spec
 )
 (func $null (; 169 ;) (type $FUNCSIG$v)
 )
)
