(module
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$viij (func (param i32 i32 i64)))
 (type $FUNCSIG$viif (func (param i32 i32 f32)))
 (type $FUNCSIG$viid (func (param i32 i32 f64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/comparison/lengthComparison/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/comparison/lengthComparison/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/comparison/lengthComparison/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00")
 (data (i32.const 56) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00a\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00")
 (data (i32.const 112) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00p\00u\00r\00e\00.\00t\00s\00")
 (data (i32.const 160) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00")
 (data (i32.const 216) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s\00")
 (data (i32.const 256) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00U\00i\00n\00t\008\00A\00r\00r\00a\00y\00")
 (data (i32.const 296) "<\00\00\00\01\00\00\00\01\00\00\00<\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00T\00y\00p\00e\00d\00A\00r\00r\00a\00y\00 \00t\00y\00p\00e\00:\00 \00")
 (data (i32.const 376) "\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00n\00u\00l\00l\00")
 (data (i32.const 400) "\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00")
 (data (i32.const 416) ":\00\00\00\01\00\00\00\01\00\00\00:\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 496) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 544) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 600) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 656) "f\00\00\00\01\00\00\00\01\00\00\00f\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00n\00u\00l\00l\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 776) "`\00\00\00\01\00\00\00\01\00\00\00`\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00l\00e\00n\00g\00t\00h\00C\00o\00m\00p\00a\00r\00i\00s\00o\00n\00.\00t\00s\00")
 (data (i32.const 888) "\82\00\00\00\01\00\00\00\01\00\00\00\82\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1040) "l\00\00\00\01\00\00\00\01\00\00\00l\00\00\00W\00h\00e\00n\00 \00l\00e\00n\00g\00t\00h\00 \00i\00s\00 \00e\00q\00u\00a\00l\00,\00 \00n\00e\00g\00a\00t\00e\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1168) "\"\00\00\00\01\00\00\00\01\00\00\00\"\00\00\00U\00i\00n\00t\008\00C\00l\00a\00m\00p\00e\00d\00A\00r\00r\00a\00y\00")
 (data (i32.const 1224) "\12\00\00\00\01\00\00\00\01\00\00\00\12\00\00\00I\00n\00t\008\00A\00r\00r\00a\00y\00")
 (data (i32.const 1264) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1304) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1344) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1384) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1424) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1464) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1504) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00F\00l\00o\00a\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1544) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00F\00l\00o\00a\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1584) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 1616) "\10\00\00\00\01\00\00\00\19\00\00\00\10\00\00\00@\06\00\00@\06\00\00\0c\00\00\00\03\00\00\00")
 (data (i32.const 1648) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00A\00r\00r\00a\00y\00s\00")
 (data (i32.const 1704) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00c\00u\00s\00t\00o\00m\00 \00c\00l\00a\00s\00s\00e\00s\00")
 (data (i32.const 1776) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1896) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 1968) "t\00\00\00\01\00\00\00\01\00\00\00t\00\00\00W\00h\00e\00n\00 \00t\00h\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00,\00 \00i\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00a\00n\00 \00e\00r\00r\00o\00r\00.\00")
 (data (i32.const 2104) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 2224) "D\00\00\00\01\00\00\00\01\00\00\00D\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00")
 (data (i32.const 2312) "|\00\00\00\01\00\00\00\01\00\00\00|\00\00\00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00u\00s\00e\00d\00")
 (data (i32.const 2456) "\d8\00\00\00\01\00\00\00\01\00\00\00\d8\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00T\00y\00p\00e\00d\00A\00r\00r\00a\00y\00s\00,\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00,\00 \00A\00r\00r\00a\00y\00s\00,\00 \00a\00n\00d\00 \00c\00l\00a\00s\00s\00e\00s\00 \00t\00h\00a\00t\00 \00h\00a\00v\00e\00 \00a\00 \00l\00e\00n\00g\00t\00h\00 \00p\00r\00o\00p\00e\00r\00t\00y\00.\00")
 (data (i32.const 2688) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 2808) "\1e\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00I\00\00\00\02\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00")
 (table $0 45 funcref)
 (elem (i32.const 0) $null $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/toHaveLength.spec~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|2)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 4))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/toHaveLength.spec/valueArray (mut i32) (i32.const 1632))
 (global $assembly/__tests__/toHaveLength.spec/customExample (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/started (mut i32) (i32.const 0))
 (global $~lib/rt/RTTI_BASE i32 (i32.const 2808))
 (global $~lib/heap/HEAP_BASE i32 (i32.const 3052))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__realloc" (func $~lib/rt/tlsf/__realloc))
 (export "__free" (func $~lib/rt/tlsf/__free))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__instanceof" (func $~lib/rt/__instanceof))
 (export "__typeinfo" (func $~lib/rt/__typeinfo))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__main" (func $assembly/index/__main))
 (export "__call" (func $assembly/internal/call/__call))
 (func $~lib/rt/tlsf/removeBlock (; 8 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
  local.get $1
  i32.load
  local.set $2
  local.get $2
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 276
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $3
  local.get $3
  i32.const 16
  i32.ge_u
  if (result i32)
   local.get $3
   i32.const 1073741808
   i32.lt_u
  else   
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 278
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $4
   local.get $3
   i32.const 4
   i32.shr_u
   local.set $5
  else   
   i32.const 31
   local.get $3
   i32.clz
   i32.sub
   local.set $4
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $5
   local.get $4
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $4
  end
  local.get $4
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $5
   i32.const 16
   i32.lt_u
  else   
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 291
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=16
  local.set $6
  local.get $1
  i32.load offset=20
  local.set $7
  local.get $6
  if
   local.get $6
   local.get $7
   i32.store offset=20
  end
  local.get $7
  if
   local.get $7
   local.get $6
   i32.store offset=16
  end
  local.get $1
  block $~lib/rt/tlsf/GETHEAD|inlined.0 (result i32)
   local.get $0
   local.set $10
   local.get $4
   local.set $9
   local.get $5
   local.set $8
   local.get $10
   local.get $9
   i32.const 4
   i32.shl
   local.get $8
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  end
  i32.eq
  if
   block $~lib/rt/tlsf/SETHEAD|inlined.1
    local.get $0
    local.set $11
    local.get $4
    local.set $10
    local.get $5
    local.set $9
    local.get $7
    local.set $8
    local.get $11
    local.get $10
    i32.const 4
    i32.shl
    local.get $9
    i32.add
    i32.const 2
    i32.shl
    i32.add
    local.get $8
    i32.store offset=96
   end
   local.get $7
   i32.eqz
   if
    block $~lib/rt/tlsf/GETSL|inlined.0 (result i32)
     local.get $0
     local.set $9
     local.get $4
     local.set $8
     local.get $9
     local.get $8
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
    end
    local.set $8
    block $~lib/rt/tlsf/SETSL|inlined.1
     local.get $0
     local.set $11
     local.get $4
     local.set $10
     local.get $8
     i32.const 1
     local.get $5
     i32.shl
     i32.const -1
     i32.xor
     i32.and
     local.tee $8
     local.set $9
     local.get $11
     local.get $10
     i32.const 2
     i32.shl
     i32.add
     local.get $9
     i32.store offset=4
    end
    local.get $8
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const 1
     local.get $4
     i32.shl
     i32.const -1
     i32.xor
     i32.and
     i32.store
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (; 9 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 204
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load
  local.set $2
  local.get $2
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 206
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETRIGHT|inlined.0 (result i32)
   local.get $1
   local.set $3
   local.get $3
   i32.const 16
   i32.add
   local.get $3
   i32.load
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
  end
  local.set $4
  local.get $4
  i32.load
  local.set $5
  local.get $5
  i32.const 1
  i32.and
  if
   local.get $2
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.add
   local.get $5
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $3
   local.get $3
   i32.const 1073741808
   i32.lt_u
   if
    local.get $0
    local.get $4
    call $~lib/rt/tlsf/removeBlock
    local.get $1
    local.get $2
    i32.const 3
    i32.and
    local.get $3
    i32.or
    local.tee $2
    i32.store
    block $~lib/rt/tlsf/GETRIGHT|inlined.1 (result i32)
     local.get $1
     local.set $6
     local.get $6
     i32.const 16
     i32.add
     local.get $6
     i32.load
     i32.const 3
     i32.const -1
     i32.xor
     i32.and
     i32.add
    end
    local.set $4
    local.get $4
    i32.load
    local.set $5
   end
  end
  local.get $2
  i32.const 2
  i32.and
  if
   block $~lib/rt/tlsf/GETFREELEFT|inlined.0 (result i32)
    local.get $1
    local.set $3
    local.get $3
    i32.const 4
    i32.sub
    i32.load
   end
   local.set $3
   local.get $3
   i32.load
   local.set $6
   local.get $6
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 24
    i32.const 227
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
   local.get $6
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.add
   local.get $2
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $7
   local.get $7
   i32.const 1073741808
   i32.lt_u
   if
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/removeBlock
    local.get $3
    local.get $6
    i32.const 3
    i32.and
    local.get $7
    i32.or
    local.tee $2
    i32.store
    local.get $3
    local.set $1
   end
  end
  local.get $4
  local.get $5
  i32.const 2
  i32.or
  i32.store
  local.get $2
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $8
  local.get $8
  i32.const 16
  i32.ge_u
  if (result i32)
   local.get $8
   i32.const 1073741808
   i32.lt_u
  else   
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 242
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 16
  i32.add
  local.get $8
  i32.add
  local.get $4
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 243
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $8
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $9
   local.get $8
   i32.const 4
   i32.shr_u
   local.set $10
  else   
   i32.const 31
   local.get $8
   i32.clz
   i32.sub
   local.set $9
   local.get $8
   local.get $9
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $10
   local.get $9
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $9
  end
  local.get $9
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $10
   i32.const 16
   i32.lt_u
  else   
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 259
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETHEAD|inlined.1 (result i32)
   local.get $0
   local.set $3
   local.get $9
   local.set $6
   local.get $10
   local.set $7
   local.get $3
   local.get $6
   i32.const 4
   i32.shl
   local.get $7
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  end
  local.set $11
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  local.get $11
  i32.store offset=20
  local.get $11
  if
   local.get $11
   local.get $1
   i32.store offset=16
  end
  block $~lib/rt/tlsf/SETHEAD|inlined.2
   local.get $0
   local.set $12
   local.get $9
   local.set $3
   local.get $10
   local.set $6
   local.get $1
   local.set $7
   local.get $12
   local.get $3
   i32.const 4
   i32.shl
   local.get $6
   i32.add
   i32.const 2
   i32.shl
   i32.add
   local.get $7
   i32.store offset=96
  end
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $9
  i32.shl
  i32.or
  i32.store
  block $~lib/rt/tlsf/SETSL|inlined.2
   local.get $0
   local.set $3
   local.get $9
   local.set $6
   block $~lib/rt/tlsf/GETSL|inlined.1 (result i32)
    local.get $0
    local.set $13
    local.get $9
    local.set $12
    local.get $13
    local.get $12
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
   end
   i32.const 1
   local.get $10
   i32.shl
   i32.or
   local.set $7
   local.get $3
   local.get $6
   i32.const 2
   i32.shl
   i32.add
   local.get $7
   i32.store offset=4
  end
 )
 (func $~lib/rt/tlsf/addMemory (; 10 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $1
  local.get $2
  i32.le_u
  if (result i32)
   local.get $1
   i32.const 15
   i32.and
   i32.eqz
  else   
   i32.const 0
  end
  if (result i32)
   local.get $2
   i32.const 15
   i32.and
   i32.eqz
  else   
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 385
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETTAIL|inlined.0 (result i32)
   local.get $0
   local.set $3
   local.get $3
   i32.load offset=1568
  end
  local.set $4
  i32.const 0
  local.set $5
  local.get $4
  if
   local.get $1
   local.get $4
   i32.const 16
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 24
    i32.const 395
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   i32.const 16
   i32.sub
   local.get $4
   i32.eq
   if
    local.get $1
    i32.const 16
    i32.sub
    local.set $1
    local.get $4
    i32.load
    local.set $5
   else    
    nop
   end
  else   
   local.get $1
   local.get $0
   i32.const 1572
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 24
    i32.const 407
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $2
  local.get $1
  i32.sub
  local.set $6
  local.get $6
  i32.const 48
  i32.lt_u
  if
   i32.const 0
   return
  end
  local.get $6
  i32.const 2
  i32.const 16
  i32.mul
  i32.sub
  local.set $7
  local.get $1
  local.set $8
  local.get $8
  local.get $7
  i32.const 1
  i32.or
  local.get $5
  i32.const 2
  i32.and
  i32.or
  i32.store
  local.get $8
  i32.const 0
  i32.store offset=16
  local.get $8
  i32.const 0
  i32.store offset=20
  local.get $1
  local.get $6
  i32.add
  i32.const 16
  i32.sub
  local.set $4
  local.get $4
  i32.const 0
  i32.const 2
  i32.or
  i32.store
  block $~lib/rt/tlsf/SETTAIL|inlined.1
   local.get $0
   local.set $9
   local.get $4
   local.set $3
   local.get $9
   local.get $3
   i32.store offset=1568
  end
  local.get $0
  local.get $8
  call $~lib/rt/tlsf/insertBlock
  i32.const 1
 )
 (func $~lib/rt/tlsf/initializeRoot (; 11 ;) (type $FUNCSIG$v)
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
  global.get $~lib/heap/HEAP_BASE
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $0
  memory.size
  local.set $1
  local.get $0
  i32.const 1572
  i32.add
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $2
  local.get $2
  local.get $1
  i32.gt_s
  if (result i32)
   local.get $2
   local.get $1
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else   
   i32.const 0
  end
  if
   unreachable
  end
  local.get $0
  local.set $3
  local.get $3
  i32.const 0
  i32.store
  block $~lib/rt/tlsf/SETTAIL|inlined.0
   local.get $3
   local.set $5
   i32.const 0
   local.set $4
   local.get $5
   local.get $4
   i32.store offset=1568
  end
  block $break|0
   i32.const 0
   local.set $4
   loop $repeat|0
    local.get $4
    i32.const 23
    i32.lt_u
    i32.eqz
    br_if $break|0
    block $~lib/rt/tlsf/SETSL|inlined.0
     local.get $3
     local.set $7
     local.get $4
     local.set $6
     i32.const 0
     local.set $5
     local.get $7
     local.get $6
     i32.const 2
     i32.shl
     i32.add
     local.get $5
     i32.store offset=4
    end
    block $break|1
     i32.const 0
     local.set $5
     loop $repeat|1
      local.get $5
      i32.const 16
      i32.lt_u
      i32.eqz
      br_if $break|1
      block $~lib/rt/tlsf/SETHEAD|inlined.0
       local.get $3
       local.set $9
       local.get $4
       local.set $8
       local.get $5
       local.set $7
       i32.const 0
       local.set $6
       local.get $9
       local.get $8
       i32.const 4
       i32.shl
       local.get $7
       i32.add
       i32.const 2
       i32.shl
       i32.add
       local.get $6
       i32.store offset=96
      end
      local.get $5
      i32.const 1
      i32.add
      local.set $5
      br $repeat|1
      unreachable
     end
     unreachable
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $3
  local.get $0
  i32.const 1572
  i32.add
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  memory.size
  i32.const 16
  i32.shl
  call $~lib/rt/tlsf/addMemory
  drop
  local.get $3
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/tlsf/prepareSize (; 12 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741808
  i32.ge_u
  if
   i32.const 72
   i32.const 24
   i32.const 447
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.tee $1
  i32.const 16
  local.tee $2
  local.get $1
  local.get $2
  i32.gt_u
  select
 )
 (func $~lib/rt/tlsf/searchBlock (; 13 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $2
   local.get $1
   i32.const 4
   i32.shr_u
   local.set $3
  else   
   local.get $1
   i32.const 536870904
   i32.lt_u
   if (result i32)
    local.get $1
    i32.const 1
    i32.const 27
    local.get $1
    i32.clz
    i32.sub
    i32.shl
    i32.add
    i32.const 1
    i32.sub
   else    
    local.get $1
   end
   local.set $4
   i32.const 31
   local.get $4
   i32.clz
   i32.sub
   local.set $2
   local.get $4
   local.get $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $3
   local.get $2
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $2
  end
  local.get $2
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 16
   i32.lt_u
  else   
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 337
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  block $~lib/rt/tlsf/GETSL|inlined.2 (result i32)
   local.get $0
   local.set $5
   local.get $2
   local.set $4
   local.get $5
   local.get $4
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=4
  end
  i32.const 0
  i32.const -1
  i32.xor
  local.get $3
  i32.shl
  i32.and
  local.set $6
  i32.const 0
  local.set $7
  local.get $6
  i32.eqz
  if
   local.get $0
   i32.load
   i32.const 0
   i32.const -1
   i32.xor
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.set $4
   local.get $4
   i32.eqz
   if
    i32.const 0
    local.set $7
   else    
    local.get $4
    i32.ctz
    local.set $2
    block $~lib/rt/tlsf/GETSL|inlined.3 (result i32)
     local.get $0
     local.set $8
     local.get $2
     local.set $5
     local.get $8
     local.get $5
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
    end
    local.set $6
    local.get $6
    i32.eqz
    if
     i32.const 0
     i32.const 24
     i32.const 350
     i32.const 17
     call $~lib/builtins/abort
     unreachable
    end
    block $~lib/rt/tlsf/GETHEAD|inlined.2 (result i32)
     local.get $0
     local.set $9
     local.get $2
     local.set $8
     local.get $6
     i32.ctz
     local.set $5
     local.get $9
     local.get $8
     i32.const 4
     i32.shl
     local.get $5
     i32.add
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=96
    end
    local.set $7
   end
  else   
   block $~lib/rt/tlsf/GETHEAD|inlined.3 (result i32)
    local.get $0
    local.set $8
    local.get $2
    local.set $5
    local.get $6
    i32.ctz
    local.set $4
    local.get $8
    local.get $5
    i32.const 4
    i32.shl
    local.get $4
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
   end
   local.set $7
  end
  local.get $7
 )
 (func $~lib/rt/tlsf/growMemory (; 14 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  memory.size
  local.set $2
  local.get $1
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $3
  local.get $2
  local.tee $4
  local.get $3
  local.tee $5
  local.get $4
  local.get $5
  i32.gt_s
  select
  local.set $6
  local.get $6
  memory.grow
  i32.const 0
  i32.lt_s
  if
   local.get $3
   memory.grow
   i32.const 0
   i32.lt_s
   if
    unreachable
   end
  end
  memory.size
  local.set $7
  local.get $0
  local.get $2
  i32.const 16
  i32.shl
  local.get $7
  i32.const 16
  i32.shl
  call $~lib/rt/tlsf/addMemory
  drop
 )
 (func $~lib/rt/tlsf/prepareBlock (; 15 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.set $3
  local.get $2
  i32.const 15
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 364
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $2
  i32.sub
  local.set $4
  local.get $4
  i32.const 32
  i32.ge_u
  if
   local.get $1
   local.get $2
   local.get $3
   i32.const 2
   i32.and
   i32.or
   i32.store
   local.get $1
   i32.const 16
   i32.add
   local.get $2
   i32.add
   local.set $5
   local.get $5
   local.get $4
   i32.const 16
   i32.sub
   i32.const 1
   i32.or
   i32.store
   local.get $0
   local.get $5
   call $~lib/rt/tlsf/insertBlock
  else   
   local.get $1
   local.get $3
   i32.const 1
   i32.const -1
   i32.xor
   i32.and
   i32.store
   block $~lib/rt/tlsf/GETRIGHT|inlined.3 (result i32)
    local.get $1
    local.set $5
    local.get $5
    i32.const 16
    i32.add
    local.get $5
    i32.load
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
   end
   block $~lib/rt/tlsf/GETRIGHT|inlined.2 (result i32)
    local.get $1
    local.set $5
    local.get $5
    i32.const 16
    i32.add
    local.get $5
    i32.load
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
   end
   i32.load
   i32.const 2
   i32.const -1
   i32.xor
   i32.and
   i32.store
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (; 16 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/tlsf/prepareSize
  local.set $2
  local.get $0
  local.get $2
  call $~lib/rt/tlsf/searchBlock
  local.set $3
  local.get $3
  i32.eqz
  if
   local.get $0
   local.get $2
   call $~lib/rt/tlsf/growMemory
   local.get $0
   local.get $2
   call $~lib/rt/tlsf/searchBlock
   local.set $3
   local.get $3
   i32.eqz
   if
    i32.const 0
    i32.const 24
    i32.const 477
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $3
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $2
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 479
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 0
  i32.store offset=4
  local.get $3
  local.get $1
  i32.store offset=12
  local.get $0
  local.get $3
  call $~lib/rt/tlsf/removeBlock
  local.get $0
  local.get $3
  local.get $2
  call $~lib/rt/tlsf/prepareBlock
  local.get $3
 )
 (func $~lib/rt/tlsf/__alloc (; 17 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/rt/tlsf/ROOT
  local.set $2
  local.get $2
  i32.eqz
  if
   call $~lib/rt/tlsf/initializeRoot
   global.get $~lib/rt/tlsf/ROOT
   local.set $2
  end
  local.get $2
  local.get $0
  call $~lib/rt/tlsf/allocateBlock
  local.set $3
  local.get $3
  local.get $1
  i32.store offset=8
  local.get $3
  i32.const 16
  i32.add
 )
 (func $~lib/memory/memory.copy (; 18 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $~lib/util/memory/memmove|inlined.0
   local.get $0
   local.set $5
   local.get $1
   local.set $4
   local.get $2
   local.set $3
   local.get $5
   local.get $4
   i32.eq
   if
    br $~lib/util/memory/memmove|inlined.0
   end
   local.get $5
   local.get $4
   i32.lt_u
   if
    local.get $4
    i32.const 7
    i32.and
    local.get $5
    i32.const 7
    i32.and
    i32.eq
    if
     block $break|0
      loop $continue|0
       local.get $5
       i32.const 7
       i32.and
       if
        local.get $3
        i32.eqz
        if
         br $~lib/util/memory/memmove|inlined.0
        end
        local.get $3
        i32.const 1
        i32.sub
        local.set $3
        block (result i32)
         local.get $5
         local.tee $6
         i32.const 1
         i32.add
         local.set $5
         local.get $6
        end
        block (result i32)
         local.get $4
         local.tee $6
         i32.const 1
         i32.add
         local.set $4
         local.get $6
        end
        i32.load8_u
        i32.store8
        br $continue|0
       end
      end
     end
     block $break|1
      loop $continue|1
       local.get $3
       i32.const 8
       i32.ge_u
       if
        local.get $5
        local.get $4
        i64.load
        i64.store
        local.get $3
        i32.const 8
        i32.sub
        local.set $3
        local.get $5
        i32.const 8
        i32.add
        local.set $5
        local.get $4
        i32.const 8
        i32.add
        local.set $4
        br $continue|1
       end
      end
     end
    end
    block $break|2
     loop $continue|2
      local.get $3
      if
       block (result i32)
        local.get $5
        local.tee $6
        i32.const 1
        i32.add
        local.set $5
        local.get $6
       end
       block (result i32)
        local.get $4
        local.tee $6
        i32.const 1
        i32.add
        local.set $4
        local.get $6
       end
       i32.load8_u
       i32.store8
       local.get $3
       i32.const 1
       i32.sub
       local.set $3
       br $continue|2
      end
     end
    end
   else    
    local.get $4
    i32.const 7
    i32.and
    local.get $5
    i32.const 7
    i32.and
    i32.eq
    if
     block $break|3
      loop $continue|3
       local.get $5
       local.get $3
       i32.add
       i32.const 7
       i32.and
       if
        local.get $3
        i32.eqz
        if
         br $~lib/util/memory/memmove|inlined.0
        end
        local.get $5
        local.get $3
        i32.const 1
        i32.sub
        local.tee $3
        i32.add
        local.get $4
        local.get $3
        i32.add
        i32.load8_u
        i32.store8
        br $continue|3
       end
      end
     end
     block $break|4
      loop $continue|4
       local.get $3
       i32.const 8
       i32.ge_u
       if
        local.get $3
        i32.const 8
        i32.sub
        local.set $3
        local.get $5
        local.get $3
        i32.add
        local.get $4
        local.get $3
        i32.add
        i64.load
        i64.store
        br $continue|4
       end
      end
     end
    end
    block $break|5
     loop $continue|5
      local.get $3
      if
       local.get $5
       local.get $3
       i32.const 1
       i32.sub
       local.tee $3
       i32.add
       local.get $4
       local.get $3
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
 (func $~lib/rt/tlsf/reallocateBlock (; 19 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $2
  call $~lib/rt/tlsf/prepareSize
  local.set $3
  local.get $1
  i32.load
  local.set $4
  local.get $4
  i32.const 1
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 493
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  local.get $4
  i32.const -4
  i32.and
  i32.le_u
  if
   local.get $0
   local.get $1
   local.get $3
   call $~lib/rt/tlsf/prepareBlock
   local.get $1
   local.get $2
   i32.store offset=12
   local.get $1
   return
  end
  block $~lib/rt/tlsf/GETRIGHT|inlined.4 (result i32)
   local.get $1
   local.set $5
   local.get $5
   i32.const 16
   i32.add
   local.get $5
   i32.load
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
  end
  local.set $6
  local.get $6
  i32.load
  local.set $7
  local.get $7
  i32.const 1
  i32.and
  if
   local.get $4
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.add
   local.get $7
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $5
   local.get $5
   local.get $3
   i32.ge_u
   if
    local.get $0
    local.get $6
    call $~lib/rt/tlsf/removeBlock
    local.get $1
    local.get $4
    i32.const 3
    i32.and
    local.get $5
    i32.or
    i32.store
    local.get $1
    local.get $2
    i32.store offset=12
    local.get $0
    local.get $1
    local.get $3
    call $~lib/rt/tlsf/prepareBlock
    local.get $1
    return
   end
  end
  local.get $0
  local.get $2
  call $~lib/rt/tlsf/allocateBlock
  local.set $8
  local.get $8
  local.get $1
  i32.load offset=4
  i32.store offset=4
  local.get $8
  local.get $1
  i32.load offset=8
  i32.store offset=8
  local.get $8
  i32.const 16
  i32.add
  local.get $1
  i32.const 16
  i32.add
  local.get $2
  call $~lib/memory/memory.copy
  local.get $1
  local.get $4
  i32.const 1
  i32.or
  i32.store
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
  local.get $8
 )
 (func $~lib/rt/tlsf/__realloc (; 20 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 553
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 0
  i32.ne
  if (result i32)
   local.get $0
   i32.const 15
   i32.and
   i32.eqz
  else   
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 554
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  i32.const 16
  i32.sub
  local.get $1
  call $~lib/rt/tlsf/reallocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/rt/tlsf/freeBlock (; 21 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $1
  i32.load
  local.set $2
  local.get $2
  i32.const 1
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 531
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $2
  i32.const 1
  i32.or
  i32.store
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/__free (; 22 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 561
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 0
  i32.ne
  if (result i32)
   local.get $0
   i32.const 15
   i32.and
   i32.eqz
  else   
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 562
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  i32.const 16
  i32.sub
  call $~lib/rt/tlsf/freeBlock
 )
 (func $~lib/rt/pure/increment (; 23 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 268435455
  i32.const -1
  i32.xor
  i32.and
  local.get $1
  i32.const 1
  i32.add
  i32.const 268435455
  i32.const -1
  i32.xor
  i32.and
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 128
   i32.const 104
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  i32.store offset=4
  local.get $0
  i32.load
  i32.const 1
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 128
   i32.const 107
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/rt/pure/__retain (; 24 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/heap/HEAP_BASE
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/increment
  end
  local.get $0
 )
 (func $~lib/rt/__typeinfo (; 25 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/rt/RTTI_BASE
  local.set $1
  local.get $0
  local.get $1
  i32.load
  i32.gt_u
  if
   i32.const 176
   i32.const 232
   i32.const 22
   i32.const 27
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 4
  i32.add
  local.get $0
  i32.const 8
  i32.mul
  i32.add
  i32.load
 )
 (func $~lib/rt/pure/growRoots (; 26 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/rt/pure/ROOTS
  local.set $0
  global.get $~lib/rt/pure/CUR
  local.get $0
  i32.sub
  local.set $1
  local.get $1
  i32.const 2
  i32.mul
  local.tee $2
  i32.const 64
  i32.const 2
  i32.shl
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  local.set $4
  local.get $4
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $5
  local.get $5
  local.get $0
  local.get $1
  call $~lib/memory/memory.copy
  local.get $5
  global.set $~lib/rt/pure/ROOTS
  local.get $5
  local.get $1
  i32.add
  global.set $~lib/rt/pure/CUR
  local.get $5
  local.get $4
  i32.add
  global.set $~lib/rt/pure/END
 )
 (func $~lib/rt/pure/appendRoot (; 27 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  global.get $~lib/rt/pure/CUR
  local.set $1
  local.get $1
  global.get $~lib/rt/pure/END
  i32.ge_u
  if
   call $~lib/rt/pure/growRoots
   global.get $~lib/rt/pure/CUR
   local.set $1
  end
  local.get $1
  local.get $0
  i32.store
  local.get $1
  i32.const 1
  i32.add
  global.set $~lib/rt/pure/CUR
 )
 (func $~lib/rt/pure/decrement (; 28 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 268435455
  i32.and
  local.set $2
  local.get $0
  i32.load
  i32.const 1
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 128
   i32.const 115
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.const 1
  i32.eq
  if
   local.get $0
   i32.const 16
   i32.add
   i32.const 1
   call $~lib/rt/__visit_members
   local.get $1
   i32.const -2147483648
   i32.and
   i32.eqz
   if
    global.get $~lib/rt/tlsf/ROOT
    local.get $0
    call $~lib/rt/tlsf/freeBlock
   else    
    local.get $0
    i32.const -2147483648
    i32.const 0
    i32.or
    i32.const 0
    i32.or
    i32.store offset=4
   end
  else   
   local.get $2
   i32.const 0
   i32.gt_u
   i32.eqz
   if
    i32.const 0
    i32.const 128
    i32.const 124
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   i32.load offset=8
   call $~lib/rt/__typeinfo
   i32.const 8
   i32.and
   i32.eqz
   if
    local.get $0
    i32.const -2147483648
    i32.const 805306368
    i32.or
    local.get $2
    i32.const 1
    i32.sub
    i32.or
    i32.store offset=4
    local.get $1
    i32.const -2147483648
    i32.and
    i32.eqz
    if
     local.get $0
     call $~lib/rt/pure/appendRoot
    end
   else    
    local.get $0
    local.get $1
    i32.const 268435455
    i32.const -1
    i32.xor
    i32.and
    local.get $2
    i32.const 1
    i32.sub
    i32.or
    i32.store offset=4
   end
  end
 )
 (func $~lib/rt/pure/__release (; 29 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.get $~lib/heap/HEAP_BASE
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/decrement
  end
 )
 (func $~lib/rt/pure/markGray (; 30 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 1879048192
  i32.and
  i32.const 268435456
  i32.ne
  if
   local.get $0
   local.get $1
   i32.const 1879048192
   i32.const -1
   i32.xor
   i32.and
   i32.const 268435456
   i32.or
   i32.store offset=4
   local.get $0
   i32.const 16
   i32.add
   i32.const 2
   call $~lib/rt/__visit_members
  end
 )
 (func $~lib/rt/pure/scanBlack (; 31 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 1879048192
  i32.const -1
  i32.xor
  i32.and
  i32.const 0
  i32.or
  i32.store offset=4
  local.get $0
  i32.const 16
  i32.add
  i32.const 4
  call $~lib/rt/__visit_members
 )
 (func $~lib/rt/pure/scan (; 32 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 1879048192
  i32.and
  i32.const 268435456
  i32.eq
  if
   local.get $1
   i32.const 268435455
   i32.and
   i32.const 0
   i32.gt_u
   if
    local.get $0
    call $~lib/rt/pure/scanBlack
   else    
    local.get $0
    local.get $1
    i32.const 1879048192
    i32.const -1
    i32.xor
    i32.and
    i32.const 536870912
    i32.or
    i32.store offset=4
    local.get $0
    i32.const 16
    i32.add
    i32.const 3
    call $~lib/rt/__visit_members
   end
  end
 )
 (func $~lib/rt/pure/collectWhite (; 33 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 1879048192
  i32.and
  i32.const 536870912
  i32.eq
  if (result i32)
   local.get $1
   i32.const -2147483648
   i32.and
   i32.eqz
  else   
   i32.const 0
  end
  if
   local.get $0
   i32.const 16
   i32.add
   i32.const 5
   call $~lib/rt/__visit_members
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  call $~lib/rt/tlsf/freeBlock
 )
 (func $~lib/rt/pure/__collect (; 34 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/rt/pure/ROOTS
  local.set $0
  local.get $0
  local.set $1
  block $break|0
   block
    local.get $1
    local.set $2
    global.get $~lib/rt/pure/CUR
    local.set $3
   end
   loop $repeat|0
    local.get $2
    local.get $3
    i32.lt_u
    i32.eqz
    br_if $break|0
    local.get $2
    i32.load
    local.set $4
    local.get $4
    i32.load offset=4
    local.set $5
    local.get $5
    i32.const 1879048192
    i32.and
    i32.const 805306368
    i32.eq
    if (result i32)
     local.get $5
     i32.const 268435455
     i32.and
     i32.const 0
     i32.gt_u
    else     
     i32.const 0
    end
    if
     local.get $4
     call $~lib/rt/pure/markGray
     local.get $1
     local.get $4
     i32.store
     local.get $1
     i32.const 4
     i32.add
     local.set $1
    else     
     local.get $5
     i32.const 1879048192
     i32.and
     i32.const 0
     i32.eq
     if (result i32)
      local.get $5
      i32.const 268435455
      i32.and
      i32.eqz
     else      
      i32.const 0
     end
     if
      global.get $~lib/rt/tlsf/ROOT
      local.get $4
      call $~lib/rt/tlsf/freeBlock
     else      
      local.get $4
      local.get $5
      i32.const -2147483648
      i32.const -1
      i32.xor
      i32.and
      i32.store offset=4
     end
    end
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $1
  global.set $~lib/rt/pure/CUR
  block $break|1
   local.get $0
   local.set $5
   loop $repeat|1
    local.get $5
    local.get $1
    i32.lt_u
    i32.eqz
    br_if $break|1
    local.get $5
    i32.load
    call $~lib/rt/pure/scan
    local.get $5
    i32.const 4
    i32.add
    local.set $5
    br $repeat|1
    unreachable
   end
   unreachable
  end
  block $break|2
   local.get $0
   local.set $5
   loop $repeat|2
    local.get $5
    local.get $1
    i32.lt_u
    i32.eqz
    br_if $break|2
    local.get $5
    i32.load
    local.set $4
    local.get $4
    local.get $4
    i32.load offset=4
    i32.const -2147483648
    i32.const -1
    i32.xor
    i32.and
    i32.store offset=4
    local.get $4
    call $~lib/rt/pure/collectWhite
    local.get $5
    i32.const 4
    i32.add
    local.set $5
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  global.set $~lib/rt/pure/CUR
 )
 (func $~lib/rt/__instanceof (; 35 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=8
  local.set $2
  global.get $~lib/rt/RTTI_BASE
  local.set $3
  local.get $2
  local.get $3
  i32.load
  i32.le_u
  if
   loop $continue|0
    local.get $2
    local.get $1
    i32.eq
    if
     i32.const 1
     return
    end
    local.get $3
    i32.const 4
    i32.add
    local.get $2
    i32.const 8
    i32.mul
    i32.add
    i32.load offset=4
    local.tee $2
    br_if $continue|0
   end
  end
  i32.const 0
 )
 (func $~lib/rt/pure/__retainRelease (; 36 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  local.get $0
  i32.ne
  if
   global.get $~lib/heap/HEAP_BASE
   local.set $2
   local.get $1
   local.get $2
   i32.gt_u
   if
    local.get $1
    i32.const 16
    i32.sub
    call $~lib/rt/pure/increment
   end
   local.get $0
   local.get $2
   i32.gt_u
   if
    local.get $0
    i32.const 16
    i32.sub
    call $~lib/rt/pure/decrement
   end
  end
  local.get $1
 )
 (func $~lib/string/String#get:length (; 37 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/string/String#concat (; 38 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $1
  i32.const 0
  i32.eq
  if
   local.get $1
   i32.const 392
   call $~lib/rt/pure/__retainRelease
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
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $1
   call $~lib/rt/pure/__release
   local.get $5
   return
  end
  local.get $4
  i32.const 1
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $6
  local.get $0
  local.get $2
  call $~lib/memory/memory.copy
  local.get $6
  local.get $2
  i32.add
  local.get $1
  local.get $3
  call $~lib/memory/memory.copy
  local.get $6
  local.set $5
  local.get $1
  call $~lib/rt/pure/__release
  local.get $5
 )
 (func $~lib/string/String.__concat (; 39 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.const 392
  local.get $0
  i32.const 0
  i32.ne
  select
  local.get $1
  call $~lib/string/String#concat
  local.set $2
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 40 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.const 1073741808
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 512
   i32.const 560
   i32.const 14
   i32.const 56
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $2
  i32.shl
  local.tee $1
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $3
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 12
    i32.const 2
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $4
  local.get $4
  i32.load
  local.get $3
  call $~lib/rt/pure/__retainRelease
  i32.store
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#constructor (; 41 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 3
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#__set (; 42 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 115
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor (; 43 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 4
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array> (; 44 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (; 45 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/typedarray/Uint8Array#get:length (; 46 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 (; 47 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8Array,u8>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint8Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint8Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint8Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint8Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint8Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/it (; 48 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not (; 49 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 (; 50 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8Array,u8>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint8Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint8Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint8Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint8Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint8Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/throws (; 51 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 (; 52 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 2
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 53 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 54 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8> (; 55 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 3
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint8ClampedArray#constructor (; 56 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 5
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint8ClampedArray#__set (; 57 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 197
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor (; 58 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 6
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray> (; 59 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Uint8ClampedArray#get:length (; 60 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 (; 61 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8ClampedArray,u8>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8ClampedArray#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint8ClampedArray>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint8ClampedArray#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not (; 62 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 (; 63 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint8ClampedArray,u8>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint8ClampedArray#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint8ClampedArray#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint8ClampedArray>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint8ClampedArray#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 (; 64 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 6
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8> (; 65 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 7
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int8Array#constructor (; 66 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 7
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int8Array#__set (; 67 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 33
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor (; 68 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 8
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array> (; 69 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Int8Array#get:length (; 70 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 (; 71 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int8Array,i8>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int8Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int8Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int8Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int8Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int8Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Int8Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not (; 72 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 (; 73 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int8Array,i8>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int8Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int8Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int8Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int8Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int8Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Int8Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 (; 74 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 8
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 9
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8> (; 75 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 10
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint16Array#constructor (; 76 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 9
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 1
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint16Array#__set (; 77 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 361
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor (; 78 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 10
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array> (; 79 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Uint16Array#get:length (; 80 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 (; 81 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint16Array,u16>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint16Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint16Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint16Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint16Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint16Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint16Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not (; 82 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 (; 83 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint16Array,u16>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint16Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint16Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint16Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint16Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint16Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint16Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 (; 84 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 12
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16> (; 85 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 13
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int16Array#constructor (; 86 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 11
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 1
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int16Array#__set (; 87 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 279
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor (; 88 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 12
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array> (; 89 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Int16Array#get:length (; 90 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 (; 91 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int16Array,i16>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int16Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int16Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int16Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int16Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int16Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Int16Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not (; 92 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 (; 93 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int16Array,i16>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int16Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int16Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int16Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int16Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int16Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Int16Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 (; 94 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 14
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 15
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16> (; 95 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 16
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint32Array#constructor (; 96 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 13
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint32Array#__set (; 97 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 525
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor (; 98 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 14
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array> (; 99 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Uint32Array#get:length (; 100 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 (; 101 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint32Array,u32>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint32Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint32Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint32Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint32Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint32Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint32Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not (; 102 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 (; 103 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint32Array,u32>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint32Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint32Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Uint32Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Uint32Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint32Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint32Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 (; 104 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 18
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32> (; 105 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 19
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int32Array#constructor (; 106 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 15
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int32Array#__set (; 107 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 443
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor (; 108 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 16
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array> (; 109 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Int32Array#get:length (; 110 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 (; 111 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int32Array,i32>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int32Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int32Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int32Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int32Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int32Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Int32Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not (; 112 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 (; 113 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int32Array,i32>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int32Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Int32Array#__set
   local.get $1
   i32.const 1
   i32.const 1
   call $~lib/typedarray/Int32Array#__set
   local.get $1
   i32.const 2
   i32.const 2
   call $~lib/typedarray/Int32Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int32Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Int32Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 (; 114 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 20
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 21
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32> (; 115 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 22
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint64Array#constructor (; 116 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 17
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 3
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint64Array#__set (; 117 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 689
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor (; 118 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 18
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array> (; 119 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Uint64Array#get:length (; 120 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 (; 121 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint64Array,u64>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint64Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i64.const 0
   call $~lib/typedarray/Uint64Array#__set
   local.get $1
   i32.const 1
   i64.const 1
   call $~lib/typedarray/Uint64Array#__set
   local.get $1
   i32.const 2
   i64.const 2
   call $~lib/typedarray/Uint64Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint64Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint64Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not (; 122 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 (; 123 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Uint64Array,u64>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Uint64Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i64.const 0
   call $~lib/typedarray/Uint64Array#__set
   local.get $1
   i32.const 1
   i64.const 1
   call $~lib/typedarray/Uint64Array#__set
   local.get $1
   i32.const 2
   i64.const 2
   call $~lib/typedarray/Uint64Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint64Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint64Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 (; 124 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 23
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 24
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64> (; 125 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 25
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int64Array#constructor (; 126 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 19
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 3
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int64Array#__set (; 127 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 607
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor (; 128 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 20
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array> (; 129 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Int64Array#get:length (; 130 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 (; 131 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int64Array,i64>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int64Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i64.const 0
   call $~lib/typedarray/Int64Array#__set
   local.get $1
   i32.const 1
   i64.const 1
   call $~lib/typedarray/Int64Array#__set
   local.get $1
   i32.const 2
   i64.const 2
   call $~lib/typedarray/Int64Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int64Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Int64Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not (; 132 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 (; 133 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Int64Array,i64>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Int64Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   i64.const 0
   call $~lib/typedarray/Int64Array#__set
   local.get $1
   i32.const 1
   i64.const 1
   call $~lib/typedarray/Int64Array#__set
   local.get $1
   i32.const 2
   i64.const 2
   call $~lib/typedarray/Int64Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int64Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Int64Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 (; 134 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 26
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 27
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64> (; 135 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 28
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float32Array#constructor (; 136 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 21
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Float32Array#__set (; 137 ;) (type $FUNCSIG$viif) (param $0 i32) (param $1 i32) (param $2 f32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 771
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor (; 138 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 22
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array> (; 139 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Float32Array#get:length (; 140 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 (; 141 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float32Array,f32>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float32Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   f32.const 0
   call $~lib/typedarray/Float32Array#__set
   local.get $1
   i32.const 1
   f32.const 1
   call $~lib/typedarray/Float32Array#__set
   local.get $1
   i32.const 2
   f32.const 2
   call $~lib/typedarray/Float32Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Float32Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Float32Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not (; 142 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 (; 143 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float32Array,f32>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float32Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   f32.const 0
   call $~lib/typedarray/Float32Array#__set
   local.get $1
   i32.const 1
   f32.const 1
   call $~lib/typedarray/Float32Array#__set
   local.get $1
   i32.const 2
   f32.const 2
   call $~lib/typedarray/Float32Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Float32Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Float32Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 (; 144 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 29
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 30
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32> (; 145 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 31
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float64Array#constructor (; 146 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 23
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 3
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Float64Array#__set (; 147 ;) (type $FUNCSIG$viid) (param $0 i32) (param $1 i32) (param $2 f64)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 853
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor (; 148 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 24
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array> (; 149 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Float64Array#get:length (; 150 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 (; 151 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float64Array,f64>|inlined.0 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float64Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   f64.const 0
   call $~lib/typedarray/Float64Array#__set
   local.get $1
   i32.const 1
   f64.const 1
   call $~lib/typedarray/Float64Array#__set
   local.get $1
   i32.const 2
   f64.const 2
   call $~lib/typedarray/Float64Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
   local.tee $0
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Float64Array>|inlined.0
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $4
    local.set $8
    local.get $5
    i32.load
    local.set $7
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if
      local.get $9
      i32.const 4
      i32.sub
      i32.load
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Float64Array#get:length
      local.set $10
     end
    end
    local.get $10
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $8
    local.get $7
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $9
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not (; 152 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 (; 153 ;) (type $FUNCSIG$v)
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
  block $assembly/__tests__/toHaveLength.spec/create<~lib/typedarray/Float64Array,f64>|inlined.1 (result i32)
   i32.const 0
   i32.const 3
   call $~lib/typedarray/Float64Array#constructor
   local.tee $0
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $1
   i32.const 0
   f64.const 0
   call $~lib/typedarray/Float64Array#__set
   local.get $1
   i32.const 1
   f64.const 1
   call $~lib/typedarray/Float64Array#__set
   local.get $1
   i32.const 2
   f64.const 2
   call $~lib/typedarray/Float64Array#__set
   local.get $1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
  end
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $3
  block $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not
   local.tee $2
   local.set $6
   i32.const 3
   local.set $5
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Float64Array>|inlined.1
    local.get $6
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $5
    local.set $9
    local.get $6
    i32.load
    local.set $8
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if
      local.get $10
      i32.const 4
      i32.sub
      i32.load
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Float64Array#get:length
      local.set $11
     end
    end
    local.get $11
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $9
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $10
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 (; 154 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 32
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 33
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64> (; 155 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 34
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 156 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 26
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/array/Array<i32>> (; 157 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/array/Array<i32>#get:length (; 158 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 (; 159 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength|inlined.0
   global.get $assembly/__tests__/toHaveLength.spec/valueArray
   call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
   local.tee $0
   local.set $3
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $1
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/array/Array<i32>>|inlined.0
    local.get $3
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $2
    local.set $6
    local.get $3
    i32.load
    local.set $5
    local.get $1
    call $~lib/rt/pure/__retain
    local.set $4
    i32.const 0
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $7
      drop
      i32.const 0
     end
     if
      local.get $7
      i32.const 4
      i32.sub
      i32.load
      local.set $8
     else      
      local.get $7
      call $~lib/array/Array<i32>#get:length
      local.set $8
     end
    end
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $6
    local.get $5
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $5
    local.get $8
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $4
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $7
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
   end
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 160 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 (; 161 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength|inlined.1
   global.get $assembly/__tests__/toHaveLength.spec/valueArray
   call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
   local.tee $1
   local.set $4
   i32.const 3
   local.set $3
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/array/Array<i32>>|inlined.1
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $8
    local.get $3
    local.set $7
    local.get $4
    i32.load
    local.set $6
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $5
    i32.const 0
    local.set $9
    local.get $8
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $8
      drop
      i32.const 0
     end
     if
      local.get $8
      i32.const 4
      i32.sub
      i32.load
      local.set $9
     else      
      local.get $8
      call $~lib/array/Array<i32>#get:length
      local.set $9
     end
    end
    local.get $9
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $7
    local.get $6
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $6
    local.get $9
    local.get $7
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $8
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0 (; 162 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 35
  call $assembly/internal/Test/it
  i32.const 904
  i32.const 36
  i32.const 1056
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/Example#constructor (; 163 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 27
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 3
  i32.store
  local.get $0
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor (; 164 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 28
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example> (; 165 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 (; 166 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.0
   global.get $assembly/__tests__/toHaveLength.spec/customExample
   call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   local.set $3
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $1
   block $assembly/internal/comparison/lengthComparison/lengthComparison<assembly/__tests__/toHaveLength.spec/Example>|inlined.0
    local.get $3
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $2
    local.set $6
    local.get $3
    i32.load
    local.set $5
    local.get $1
    call $~lib/rt/pure/__retain
    local.set $4
    i32.const 0
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $7
      drop
      i32.const 0
     end
     if
      local.get $7
      i32.const 4
      i32.sub
      i32.load
      local.set $8
     else      
      local.get $7
      i32.load
      local.set $8
     end
    end
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $6
    local.get $5
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $5
    local.get $8
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $4
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $7
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
   end
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not (; 167 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 (; 168 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.1
   global.get $assembly/__tests__/toHaveLength.spec/customExample
   call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
   local.tee $1
   local.set $4
   i32.const 3
   local.set $3
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<assembly/__tests__/toHaveLength.spec/Example>|inlined.1
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $8
    local.get $3
    local.set $7
    local.get $4
    i32.load
    local.set $6
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $5
    i32.const 0
    local.set $9
    local.get $8
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $8
      drop
      i32.const 0
     end
     if
      local.get $8
      i32.const 4
      i32.sub
      i32.load
      local.set $9
     else      
      local.get $8
      i32.load
      local.set $9
     end
    end
    local.get $9
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $7
    local.get $6
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $6
    local.get $9
    local.get $7
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $8
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 (; 169 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.2
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   local.set $3
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $1
   block $assembly/internal/comparison/lengthComparison/lengthComparison<assembly/__tests__/toHaveLength.spec/Example>|inlined.2
    local.get $3
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $2
    local.set $6
    local.get $3
    i32.load
    local.set $5
    local.get $1
    call $~lib/rt/pure/__retain
    local.set $4
    i32.const 0
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $7
      drop
      i32.const 0
     end
     if
      local.get $7
      i32.const 4
      i32.sub
      i32.load
      local.set $8
     else      
      local.get $7
      i32.load
      local.set $8
     end
    end
    local.get $8
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $6
    local.get $5
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $5
    local.get $8
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $4
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $7
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
   end
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 (; 170 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.3
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
   local.tee $1
   local.set $4
   i32.const 3
   local.set $3
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   block $assembly/internal/comparison/lengthComparison/lengthComparison<assembly/__tests__/toHaveLength.spec/Example>|inlined.3
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $8
    local.get $3
    local.set $7
    local.get $4
    i32.load
    local.set $6
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $5
    i32.const 0
    local.set $9
    local.get $8
    i32.const 0
    i32.eq
    if
     i32.const 0
     i32.eqz
     if
      i32.const 672
      i32.const 792
      i32.const 19
      i32.const 6
      call $~lib/builtins/abort
      unreachable
     end
    else     
     block (result i32)
      local.get $8
      drop
      i32.const 0
     end
     if
      local.get $8
      i32.const 4
      i32.sub
      i32.load
      local.set $9
     else      
      local.get $8
      i32.load
      local.set $9
     end
    end
    local.get $9
    call $assembly/internal/comparison/lengthComparison/reportActualInteger
    local.get $7
    local.get $6
    call $assembly/internal/comparison/lengthComparison/reportExpectedInteger
    local.get $6
    local.get $9
    local.get $7
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 792
     i32.const 29
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    call $assembly/internal/comparison/lengthComparison/clearExpected
    local.get $8
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
   end
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1 (; 171 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 38
  call $assembly/internal/Test/it
  i32.const 1792
  i32.const 39
  i32.const 1056
  call $assembly/internal/Test/throws
  i32.const 1912
  i32.const 40
  i32.const 1984
  call $assembly/internal/Test/throws
  i32.const 2120
  i32.const 41
  i32.const 1984
  call $assembly/internal/Test/throws
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 172 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 29
    call $~lib/rt/tlsf/__alloc
    call $~lib/rt/pure/__retain
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
 (func $assembly/internal/Expectation/expect<i32> (; 173 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 (; 174 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toHaveLength|inlined.0
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.tee $0
   local.set $3
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $1
   block $assembly/internal/comparison/lengthComparison/lengthComparison<i32>|inlined.0
    local.get $3
    i32.load offset=4
    local.set $7
    local.get $2
    local.set $6
    local.get $3
    i32.load
    local.set $5
    local.get $1
    call $~lib/rt/pure/__retain
    local.set $4
    i32.const 0
    local.set $8
    i32.const 0
    i32.eqz
    if
     i32.const 2472
     i32.const 792
     i32.const 32
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    local.get $4
    call $~lib/rt/pure/__release
   end
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2 (; 175 ;) (type $FUNCSIG$v)
  i32.const 2328
  i32.const 43
  i32.const 2704
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/__tests__/toHaveLength.spec (; 176 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 272
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>
  i32.const 1184
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>
  i32.const 1240
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>
  i32.const 1280
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>
  i32.const 1320
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>
  i32.const 1360
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>
  i32.const 1400
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>
  i32.const 1440
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>
  i32.const 1480
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>
  i32.const 1520
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>
  i32.const 1560
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>
  i32.const 1664
  i32.const 37
  call $assembly/internal/Describe/describe
  i32.const 0
  call $assembly/__tests__/toHaveLength.spec/Example#constructor
  global.set $assembly/__tests__/toHaveLength.spec/customExample
  i32.const 1720
  i32.const 42
  call $assembly/internal/Describe/describe
  i32.const 2240
  i32.const 44
  call $assembly/internal/Describe/describe
 )
 (func $assembly/index/__main (; 177 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  i32.eqz
  if
   call $start
   i32.const 1
   global.set $~lib/started
  end
 )
 (func $assembly/internal/call/__call (; 178 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 179 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toHaveLength.spec
 )
 (func $~lib/array/Array<i32>#__visit_impl (; 180 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/pure/__visit (; 181 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  global.get $~lib/heap/HEAP_BASE
  i32.lt_u
  if
   return
  end
  local.get $0
  i32.const 16
  i32.sub
  local.set $2
  block $break|0
   block $case5|0
    block $case4|0
     block $case3|0
      block $case2|0
       block $case1|0
        block $case0|0
         local.get $1
         local.set $3
         local.get $3
         i32.const 1
         i32.eq
         br_if $case0|0
         local.get $3
         i32.const 2
         i32.eq
         br_if $case1|0
         local.get $3
         i32.const 3
         i32.eq
         br_if $case2|0
         local.get $3
         i32.const 4
         i32.eq
         br_if $case3|0
         local.get $3
         i32.const 5
         i32.eq
         br_if $case4|0
         br $case5|0
        end
        block
         local.get $2
         call $~lib/rt/pure/decrement
         br $break|0
         unreachable
        end
        unreachable
       end
       block
        local.get $2
        i32.load offset=4
        i32.const 268435455
        i32.and
        i32.const 0
        i32.gt_u
        i32.eqz
        if
         i32.const 0
         i32.const 128
         i32.const 75
         i32.const 17
         call $~lib/builtins/abort
         unreachable
        end
        local.get $2
        local.get $2
        i32.load offset=4
        i32.const 1
        i32.sub
        i32.store offset=4
        local.get $2
        call $~lib/rt/pure/markGray
        br $break|0
        unreachable
       end
       unreachable
      end
      block
       local.get $2
       call $~lib/rt/pure/scan
       br $break|0
       unreachable
      end
      unreachable
     end
     block
      local.get $2
      i32.load offset=4
      local.set $3
      local.get $3
      i32.const 268435455
      i32.const -1
      i32.xor
      i32.and
      local.get $3
      i32.const 1
      i32.add
      i32.const 268435455
      i32.const -1
      i32.xor
      i32.and
      i32.eq
      i32.eqz
      if
       i32.const 0
       i32.const 128
       i32.const 86
       i32.const 6
       call $~lib/builtins/abort
       unreachable
      end
      local.get $2
      local.get $3
      i32.const 1
      i32.add
      i32.store offset=4
      local.get $3
      i32.const 1879048192
      i32.and
      i32.const 0
      i32.ne
      if
       local.get $2
       call $~lib/rt/pure/scanBlack
      end
      br $break|0
      unreachable
     end
     unreachable
    end
    block
     local.get $2
     call $~lib/rt/pure/collectWhite
     br $break|0
     unreachable
    end
    unreachable
   end
   i32.const 0
   i32.eqz
   if
    i32.const 0
    i32.const 128
    i32.const 97
    i32.const 24
    call $~lib/builtins/abort
    unreachable
   end
  end
 )
 (func $~lib/rt/__visit_members (; 182 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block
   end
   block $switch$1$leave
    block $switch$1$default
     block $switch$1$case$27
      block $switch$1$case$6
       block $switch$1$case$4
        block $switch$1$case$2
         local.get $0
         i32.const 8
         i32.sub
         i32.load
         br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$27 $switch$1$case$6 $switch$1$case$2 $switch$1$case$6 $switch$1$case$2 $switch$1$default
        end
        block
         block
          return
          unreachable
         end
         unreachable
         unreachable
        end
        unreachable
       end
       block
        br $block$4$break
        unreachable
       end
       unreachable
      end
      block
       block
        block
         local.get $0
         i32.load offset=4
         local.tee $2
         if
          local.get $2
          local.get $1
          call $~lib/rt/pure/__visit
         end
         return
         unreachable
        end
        unreachable
        unreachable
       end
       unreachable
       unreachable
      end
      unreachable
     end
     block
      block
       local.get $0
       local.get $1
       call $~lib/array/Array<i32>#__visit_impl
       block
        br $block$4$break
        unreachable
       end
       unreachable
       unreachable
      end
      unreachable
      unreachable
     end
     unreachable
    end
    block
     block
      unreachable
      unreachable
     end
     unreachable
     unreachable
    end
    unreachable
   end
  end
  block
   block
    local.get $0
    i32.load
    local.tee $2
    if
     local.get $2
     local.get $1
     call $~lib/rt/pure/__visit
    end
    return
    unreachable
   end
   unreachable
   unreachable
  end
  unreachable
 )
 (func $null (; 183 ;) (type $FUNCSIG$v)
 )
)
