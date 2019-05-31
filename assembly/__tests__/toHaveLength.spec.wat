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
 (data (i32.const 2808) "^\00\00\00\01\00\00\00\01\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00")
 (data (i32.const 2920) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 2968) "$\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\001\00\00\00\02\00\00\00\10\00\00\00\00\00\00\001\00\00\00\02\00\00\00\10\00\00\00\00\00\00\001\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00Q\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00Q\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\01\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\05\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\0c\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\0d\00\00\02\00\00\00\10\00\00\00\00\00\00\00\93\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\93\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\93 \00\00\02\00\00\00")
 (table $0 45 funcref)
 (elem (i32.const 0) $null $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/toHaveLength.spec~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|2 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $assembly/__tests__/toHaveLength.spec/valueArray (mut i32) (i32.const 1632))
 (global $assembly/__tests__/toHaveLength.spec/customExample (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $assembly/internal/noOp/noOp i32 (i32.const 44))
 (global $assembly/internal/test/Collector/collector (mut i32) (i32.const 0))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $~lib/rt/RTTI_BASE i32 (i32.const 2968))
 (global $~lib/heap/HEAP_BASE i32 (i32.const 3260))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti" (global $~lib/rt/RTTI_BASE))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__run" (func $assembly/index/__run))
 (export "__set_performanceEnabled" (func $assembly/internal/test/Collector/__set_performanceEnabled))
 (export "__set_maxSamples" (func $assembly/internal/test/Collector/__set_maxSamples))
 (export "__set_maxTestRunTime" (func $assembly/internal/test/Collector/__set_maxTestRunTime))
 (export "__set_roundDecimalPlaces" (func $assembly/internal/test/Collector/__set_roundDecimalPlaces))
 (export "__set_recordAverage" (func $assembly/internal/test/Collector/__set_recordAverage))
 (export "__set_recordMedian" (func $assembly/internal/test/Collector/__set_recordMedian))
 (export "__set_recordStdDev" (func $assembly/internal/test/Collector/__set_recordStdDev))
 (export "__set_recordMax" (func $assembly/internal/test/Collector/__set_recordMax))
 (export "__set_recordMin" (func $assembly/internal/test/Collector/__set_recordMin))
 (export "__set_recordVar" (func $assembly/internal/test/Collector/__set_recordVar))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/rt/tlsf/removeBlock (; 1 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/insertBlock (; 2 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/addMemory (; 3 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/initializeRoot (; 4 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/tlsf/prepareSize (; 5 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/searchBlock (; 6 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/growMemory (; 7 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/prepareBlock (; 8 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/allocateBlock (; 9 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/__alloc (; 10 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/pure/increment (; 11 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__retain (; 12 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/freeBlock (; 13 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/__typeinfo (; 14 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/memory/memcpy (; 15 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
     i32.const 0
    end
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
     local.get $2
     i32.const 1
     i32.sub
     local.set $2
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
 (func $~lib/memory/memory.copy (; 16 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
   local.get $4
   local.get $3
   i32.add
   local.get $5
   i32.le_u
   if (result i32)
    i32.const 1
   else    
    local.get $5
    local.get $3
    i32.add
    local.get $4
    i32.le_u
   end
   if
    local.get $5
    local.get $4
    local.get $3
    call $~lib/util/memory/memcpy
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
 (func $~lib/rt/tlsf/__free (; 17 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/growRoots (; 18 ;) (type $FUNCSIG$v)
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
  local.get $0
  if
   local.get $0
   call $~lib/rt/tlsf/__free
  end
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
 (func $~lib/rt/pure/appendRoot (; 19 ;) (type $FUNCSIG$vi) (param $0 i32)
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
  i32.const 4
  i32.add
  global.set $~lib/rt/pure/CUR
 )
 (func $~lib/rt/pure/decrement (; 20 ;) (type $FUNCSIG$vi) (param $0 i32)
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
   i32.const 16
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
 (func $~lib/rt/pure/__release (; 21 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/markGray (; 22 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scanBlack (; 23 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scan (; 24 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/collectWhite (; 25 ;) (type $FUNCSIG$vi) (param $0 i32)
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
   local.get $1
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
   i32.const 5
   call $~lib/rt/__visit_members
   global.get $~lib/rt/tlsf/ROOT
   local.get $0
   call $~lib/rt/tlsf/freeBlock
  end
 )
 (func $~lib/rt/pure/__collect (; 26 ;) (type $FUNCSIG$v)
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
 (func $~lib/string/String#get:length (; 27 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/string/String#concat (; 28 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $1
  i32.const 0
  i32.eq
  if
   block (result i32)
    i32.const 392
    local.tee $2
    local.get $1
    local.tee $3
    i32.ne
    if
     local.get $2
     call $~lib/rt/pure/__retain
     drop
     local.get $3
     call $~lib/rt/pure/__release
    end
    local.get $2
   end
   local.set $1
  end
  local.get $0
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $4
  local.get $1
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $5
  local.get $4
  local.get $5
  i32.add
  local.set $6
  local.get $6
  i32.const 0
  i32.eq
  if
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $6
  i32.const 1
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.set $7
  local.get $7
  local.get $0
  local.get $4
  call $~lib/memory/memory.copy
  local.get $7
  local.get $4
  i32.add
  local.get $1
  local.get $5
  call $~lib/memory/memory.copy
  local.get $7
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $~lib/string/String.__concat (; 29 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 30 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
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
  block (result i32)
   local.get $3
   local.tee $5
   local.get $4
   i32.load
   local.tee $4
   i32.ne
   if
    local.get $5
    call $~lib/rt/pure/__retain
    drop
    local.get $4
    call $~lib/rt/pure/__release
   end
   local.get $5
  end
  i32.store
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#constructor (; 31 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Uint8Array#__set (; 32 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor (; 33 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint8Array> (; 34 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 35 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (; 36 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/typedarray/Uint8Array#get:length (; 37 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 (; 38 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint8Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint8Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.0
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.0
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.0
    end
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
 (func $assembly/internal/test/Test/it (; 39 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not (; 40 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 (; 41 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint8Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint8Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.1
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.1
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.1
    end
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
 (func $assembly/internal/test/Test/throws (; 42 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 (; 43 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 1
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 2
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/internal/test/Describe/describe (; 44 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8> (; 45 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 3
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint8ClampedArray#constructor (; 46 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Uint8ClampedArray#__set (; 47 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor (; 48 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint8ClampedArray> (; 49 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Uint8ClampedArray#get:length (; 50 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 (; 51 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint8ClampedArray#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.2
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.2
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.2
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not (; 52 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 (; 53 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint8ClampedArray#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.3
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.3
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.3
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 (; 54 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 4
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 5
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8> (; 55 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 6
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int8Array#constructor (; 56 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Int8Array#__set (; 57 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor (; 58 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Int8Array> (; 59 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Int8Array#get:length (; 60 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 (; 61 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Int8Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Int8Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.4
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.4
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.4
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not (; 62 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 (; 63 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Int8Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Int8Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.5
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.5
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.5
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 (; 64 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 7
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 8
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8> (; 65 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 9
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint16Array#constructor (; 66 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Uint16Array#__set (; 67 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor (; 68 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint16Array> (; 69 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Uint16Array#get:length (; 70 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 (; 71 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint16Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint16Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.6
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.6
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.6
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not (; 72 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 (; 73 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint16Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint16Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.7
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.7
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.7
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 (; 74 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 10
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 11
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16> (; 75 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 12
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int16Array#constructor (; 76 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Int16Array#__set (; 77 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor (; 78 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Int16Array> (; 79 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Int16Array#get:length (; 80 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 (; 81 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Int16Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Int16Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.8
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.8
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.8
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not (; 82 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 (; 83 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Int16Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Int16Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.9
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.9
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.9
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 (; 84 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 13
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 14
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16> (; 85 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 15
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint32Array#constructor (; 86 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Uint32Array#__set (; 87 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor (; 88 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint32Array> (; 89 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Uint32Array#get:length (; 90 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 (; 91 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint32Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint32Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.10
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.10
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.10
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not (; 92 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 (; 93 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint32Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint32Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.11
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.11
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.11
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 (; 94 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 16
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 17
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32> (; 95 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 18
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int32Array#constructor (; 96 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Int32Array#__set (; 97 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor (; 98 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Int32Array> (; 99 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Int32Array#get:length (; 100 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 (; 101 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Int32Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Int32Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.12
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.12
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.12
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not (; 102 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 (; 103 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Int32Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Int32Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.13
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.13
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.13
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 (; 104 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 19
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 20
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32> (; 105 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 21
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint64Array#constructor (; 106 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Uint64Array#__set (; 107 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor (; 108 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint64Array> (; 109 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Uint64Array#get:length (; 110 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
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
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint64Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Uint64Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.14
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.14
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.14
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not (; 112 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
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
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint64Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Uint64Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.15
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.15
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.15
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 (; 114 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 22
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 23
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64> (; 115 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 24
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int64Array#constructor (; 116 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Int64Array#__set (; 117 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor (; 118 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Int64Array> (; 119 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Int64Array#get:length (; 120 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 (; 121 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Int64Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Int64Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.16
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.16
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.16
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not (; 122 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 (; 123 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Int64Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Int64Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.17
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.17
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.17
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 (; 124 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 25
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 26
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64> (; 125 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 27
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float32Array#constructor (; 126 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Float32Array#__set (; 127 ;) (type $FUNCSIG$viif) (param $0 i32) (param $1 i32) (param $2 f32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor (; 128 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Float32Array> (; 129 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Float32Array#get:length (; 130 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 (; 131 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Float32Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Float32Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.18
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.18
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.18
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not (; 132 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 (; 133 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Float32Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Float32Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.19
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.19
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.19
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 (; 134 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 28
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 29
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32> (; 135 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 30
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float64Array#constructor (; 136 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Float64Array#__set (; 137 ;) (type $FUNCSIG$viid) (param $0 i32) (param $1 i32) (param $2 f64)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor (; 138 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Float64Array> (; 139 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/typedarray/Float64Array#get:length (; 140 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
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
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength|inlined.0
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Float64Array>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $10
     else      
      local.get $9
      call $~lib/typedarray/Float64Array#get:length
      local.set $10
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.20
     local.get $10
     local.set $11
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.20
     local.get $8
     local.set $12
     local.get $7
     local.set $11
    end
    local.get $7
    local.get $10
    local.get $8
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $6
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.20
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not (; 142 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
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
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength|inlined.1
   local.get $3
   call $assembly/internal/test/Expectation/expect<~lib/typedarray/Float64Array>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $11
     else      
      local.get $10
      call $~lib/typedarray/Float64Array#get:length
      local.set $11
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.21
     local.get $11
     local.set $12
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.21
     local.get $9
     local.set $13
     local.get $8
     local.set $12
    end
    local.get $8
    local.get $11
    local.get $9
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $7
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.21
    end
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 (; 144 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 31
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 32
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64> (; 145 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 33
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 146 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<~lib/array/Array<i32>> (; 147 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/array/Array<i32>>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/array/Array<i32>#get:length (; 148 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 (; 149 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength|inlined.0
   global.get $assembly/__tests__/toHaveLength.spec/valueArray
   call $assembly/internal/test/Expectation/expect<~lib/array/Array<i32>>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $8
     else      
      local.get $7
      call $~lib/array/Array<i32>#get:length
      local.set $8
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.22
     local.get $8
     local.set $9
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.22
     local.get $6
     local.set $10
     local.get $5
     local.set $9
    end
    local.get $5
    local.get $8
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $4
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.22
    end
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 150 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 (; 151 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength|inlined.1
   global.get $assembly/__tests__/toHaveLength.spec/valueArray
   call $assembly/internal/test/Expectation/expect<~lib/array/Array<i32>>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/array/Array<i32>>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $9
     else      
      local.get $8
      call $~lib/array/Array<i32>#get:length
      local.set $9
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.23
     local.get $9
     local.set $10
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.23
     local.get $7
     local.set $11
     local.get $6
     local.set $10
    end
    local.get $6
    local.get $9
    local.get $7
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.23
    end
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0 (; 152 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 34
  call $assembly/internal/test/Test/it
  i32.const 904
  i32.const 35
  i32.const 1056
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/Example#constructor (; 153 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor (; 154 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  block (result i32)
   local.get $1
   local.tee $3
   local.get $2
   i32.load offset=4
   local.tee $2
   i32.ne
   if
    local.get $3
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   local.get $3
  end
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/test/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example> (; 155 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 (; 156 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.0
   global.get $assembly/__tests__/toHaveLength.spec/customExample
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $8
     else      
      local.get $7
      i32.load
      local.set $8
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.24
     local.get $8
     local.set $9
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.24
     local.get $6
     local.set $10
     local.get $5
     local.set $9
    end
    local.get $5
    local.get $8
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $4
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.24
    end
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
 (func $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not (; 157 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 (; 158 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.1
   global.get $assembly/__tests__/toHaveLength.spec/customExample
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $9
     else      
      local.get $8
      i32.load
      local.set $9
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.25
     local.get $9
     local.set $10
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.25
     local.get $7
     local.set $11
     local.get $6
     local.set $10
    end
    local.get $6
    local.get $9
    local.get $7
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.25
    end
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 (; 159 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.2
   i32.const 0
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $8
     else      
      local.get $7
      i32.load
      local.set $8
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.26
     local.get $8
     local.set $9
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.26
     local.get $6
     local.set $10
     local.get $5
     local.set $9
    end
    local.get $5
    local.get $8
    local.get $6
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $4
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.26
    end
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 (; 160 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.3
   i32.const 0
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
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
      i32.const 11
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
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.set $9
     else      
      local.get $8
      i32.load
      local.set $9
     end
    end
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.27
     local.get $9
     local.set $10
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.27
     local.get $7
     local.set $11
     local.get $6
     local.set $10
    end
    local.get $6
    local.get $9
    local.get $7
    i32.eq
    i32.xor
    i32.eqz
    if
     local.get $5
     i32.const 792
     i32.const 21
     i32.const 4
     call $~lib/builtins/abort
     unreachable
    end
    block $assembly/internal/report/clearExpected/clearExpected|inlined.27
    end
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1 (; 161 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 37
  call $assembly/internal/test/Test/it
  i32.const 1792
  i32.const 38
  i32.const 1056
  call $assembly/internal/test/Test/throws
  i32.const 1912
  i32.const 39
  i32.const 1984
  call $assembly/internal/test/Test/throws
  i32.const 2120
  i32.const 40
  i32.const 1984
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/internal/test/Expectation/Expectation<i32>#constructor (; 162 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<i32> (; 163 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<i32>#constructor
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 (; 164 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block $assembly/internal/test/Expectation/Expectation<i32>#toHaveLength|inlined.0
   i32.const 3
   call $assembly/internal/test/Expectation/expect<i32>
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
     i32.const 24
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2 (; 165 ;) (type $FUNCSIG$v)
  i32.const 2328
  i32.const 42
  i32.const 2704
  call $assembly/internal/test/Test/throws
 )
 (func $start:assembly/__tests__/toHaveLength.spec (; 166 ;) (type $FUNCSIG$v)
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
  i32.const 36
  call $assembly/internal/test/Describe/describe
  i32.const 0
  call $assembly/__tests__/toHaveLength.spec/Example#constructor
  global.set $assembly/__tests__/toHaveLength.spec/customExample
  i32.const 1720
  i32.const 41
  call $assembly/internal/test/Describe/describe
  i32.const 2240
  i32.const 43
  call $assembly/internal/test/Describe/describe
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 167 ;) (type $FUNCSIG$v)
  nop
 )
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#constructor (; 168 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 16
   i32.const 35
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $1
  if
   local.get $2
   call $~lib/rt/pure/__release
   block
    i32.const 2824
    i32.const 2936
    i32.const 56
    i32.const 20
    call $~lib/builtins/abort
    unreachable
    unreachable
   end
   unreachable
  end
  local.get $0
  local.get $1
  i32.store offset=12
  local.get $0
 )
 (func $assembly/internal/test/Collector/Collector#constructor (; 169 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.eqz
  if
   i32.const 38
   i32.const 30
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 0
  call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#constructor
  local.tee $1
  i32.store
  local.get $0
  i32.const 0
  i32.const 0
  call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#constructor
  local.tee $2
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store8 offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
  i32.const 2000
  i32.store offset=24
  local.get $0
  i32.const 3
  i32.store offset=28
  local.get $0
  i32.const 1
  i32.store8 offset=32
  local.get $0
  i32.const 1
  i32.store8 offset=33
  local.get $0
  i32.const 0
  i32.store8 offset=34
  local.get $0
  i32.const 0
  i32.store8 offset=35
  local.get $0
  i32.const 0
  i32.store8 offset=36
  local.get $0
  i32.const 0
  i32.store8 offset=37
  local.get $0
 )
 (func $start:assembly/internal/test/Collector (; 170 ;) (type $FUNCSIG$v)
  i32.const 0
  call $assembly/internal/test/Collector/Collector#constructor
  global.set $assembly/internal/test/Collector/collector
 )
 (func $start:assembly/index (; 171 ;) (type $FUNCSIG$v)
  call $start:assembly/internal/test/Collector
 )
 (func $assembly/index/__run (; 172 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/test/Collector/__set_performanceEnabled (; 173 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store8 offset=16
 )
 (func $assembly/internal/test/Collector/__set_maxSamples (; 174 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store offset=20
 )
 (func $assembly/internal/test/Collector/__set_maxTestRunTime (; 175 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store offset=24
 )
 (func $assembly/internal/test/Collector/__set_roundDecimalPlaces (; 176 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store offset=28
 )
 (func $assembly/internal/test/Collector/__set_recordAverage (; 177 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store8 offset=32
 )
 (func $assembly/internal/test/Collector/__set_recordMedian (; 178 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store8 offset=33
 )
 (func $assembly/internal/test/Collector/__set_recordStdDev (; 179 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store8 offset=34
 )
 (func $assembly/internal/test/Collector/__set_recordMax (; 180 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store8 offset=35
 )
 (func $assembly/internal/test/Collector/__set_recordMin (; 181 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store8 offset=36
 )
 (func $assembly/internal/test/Collector/__set_recordVar (; 182 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $assembly/internal/test/Collector/collector
  local.get $0
  i32.store8 offset=37
 )
 (func $assembly/internal/call/__call (; 183 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 184 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toHaveLength.spec
  call $start:assembly/index
 )
 (func $~lib/array/Array<i32>#__visit_impl (; 185 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func "$~lib/array/Array<() => void>#__visit_impl" (; 186 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/pure/__visit (; 187 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__visit_impl (; 188 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  local.get $0
  i32.load offset=8
  i32.add
  local.set $3
  block $break|0
   loop $continue|0
    local.get $2
    local.get $3
    i32.lt_u
    if
     local.get $2
     i32.load
     local.set $4
     local.get $4
     if
      local.get $4
      local.get $1
      call $~lib/rt/pure/__visit
     end
     local.get $2
     i32.const 4
     i32.add
     local.set $2
     br $continue|0
    end
   end
  end
 )
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__visit_impl (; 189 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  local.get $0
  i32.load offset=8
  i32.add
  local.set $3
  block $break|0
   loop $continue|0
    local.get $2
    local.get $3
    i32.lt_u
    if
     local.get $2
     i32.load
     local.set $4
     local.get $4
     if
      local.get $4
      local.get $1
      call $~lib/rt/pure/__visit
     end
     local.get $2
     i32.const 4
     i32.add
     local.set $2
     br $continue|0
    end
   end
  end
 )
 (func $~lib/rt/__visit_members (; 190 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block
   end
   block $switch$1$leave
    block $switch$1$default
     block $switch$1$case$37
      block $switch$1$case$36
       block $switch$1$case$34
        block $switch$1$case$33
         block $switch$1$case$32
          block $switch$1$case$27
           block $switch$1$case$6
            block $switch$1$case$4
             block $switch$1$case$2
              local.get $0
              i32.const 8
              i32.sub
              i32.load
              br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$27 $switch$1$case$6 $switch$1$case$2 $switch$1$case$6 $switch$1$case$2 $switch$1$case$32 $switch$1$case$33 $switch$1$case$34 $switch$1$case$2 $switch$1$case$36 $switch$1$case$37 $switch$1$default
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
           block
            local.get $0
            i32.load
            local.tee $2
            if
             local.get $2
             local.get $1
             call $~lib/rt/pure/__visit
            end
            local.get $0
            i32.load offset=4
            local.tee $2
            if
             local.get $2
             local.get $1
             call $~lib/rt/pure/__visit
            end
            local.get $0
            i32.load offset=8
            local.tee $2
            if
             local.get $2
             local.get $1
             call $~lib/rt/pure/__visit
            end
            local.get $0
            i32.load offset=12
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
          block
           local.get $0
           i32.load
           local.tee $2
           if
            local.get $2
            local.get $1
            call $~lib/rt/pure/__visit
           end
           local.get $0
           i32.load offset=4
           local.tee $2
           if
            local.get $2
            local.get $1
            call $~lib/rt/pure/__visit
           end
           local.get $0
           i32.load offset=8
           local.tee $2
           if
            local.get $2
            local.get $1
            call $~lib/rt/pure/__visit
           end
           local.get $0
           i32.load offset=12
           local.tee $2
           if
            local.get $2
            local.get $1
            call $~lib/rt/pure/__visit
           end
           local.get $0
           i32.load offset=16
           local.tee $2
           if
            local.get $2
            local.get $1
            call $~lib/rt/pure/__visit
           end
           local.get $0
           i32.load offset=20
           local.tee $2
           if
            local.get $2
            local.get $1
            call $~lib/rt/pure/__visit
           end
           local.get $0
           i32.load offset=24
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
         call "$~lib/array/Array<() => void>#__visit_impl"
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
        local.get $0
        local.get $1
        call $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__visit_impl
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
       local.get $0
       local.get $1
       call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__visit_impl
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
 (func $null (; 191 ;) (type $FUNCSIG$v)
 )
)
