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
 (type $FUNCSIG$vd (func (param f64)))
 (type $FUNCSIG$vdi (func (param f64 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportInvalidExpectCall" (func $assembly/internal/report/reportExpected/reportInvalidExpectCall))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (import "__aspect" "reportActualArray" (func $assembly/internal/report/reportActual/reportActualArray (param i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/report/reportActual/reportActualFloat (param f64)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/report/reportActual/reportActualInteger (param i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/report/reportActual/reportActualNull))
 (import "__aspect" "reportActualReference" (func $assembly/internal/report/reportActual/reportActualReferenceExternal (param i32 i32)))
 (import "__aspect" "reportActualString" (func $assembly/internal/report/reportActual/reportActualString (param i32)))
 (import "__aspect" "reportActualLong" (func $assembly/internal/report/reportActual/reportActualLong (param i32 i32)))
 (import "__aspect" "reportExpectedArray" (func $assembly/internal/report/reportExpected/reportExpectedArray (param i32 i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/report/reportExpected/reportExpectedFloat (param f64 i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/report/reportExpected/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/report/reportExpected/reportExpectedNull (param i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/report/reportExpected/reportExpectedReferenceExternal (param i32 i32 i32)))
 (import "__aspect" "reportExpectedString" (func $assembly/internal/report/reportExpected/reportExpectedString (param i32 i32)))
 (import "__aspect" "reportExpectedFalsy" (func $assembly/internal/report/reportExpected/reportExpectedFalsy (param i32)))
 (import "__aspect" "reportExpectedFinite" (func $assembly/internal/report/reportExpected/reportExpectedFinite (param i32)))
 (import "__aspect" "reportExpectedTruthy" (func $assembly/internal/report/reportExpected/reportExpectedTruthy (param i32)))
 (import "__aspect" "reportExpectedLong" (func $assembly/internal/report/reportExpected/reportExpectedLong (param i32 i32 i32)))
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
 (data (i32.const 776) "L\00\00\00\01\00\00\00\01\00\00\00L\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00a\00s\00s\00e\00r\00t\00.\00t\00s\00")
 (data (i32.const 872) "\82\00\00\00\01\00\00\00\01\00\00\00\82\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1024) "l\00\00\00\01\00\00\00\01\00\00\00l\00\00\00W\00h\00e\00n\00 \00l\00e\00n\00g\00t\00h\00 \00i\00s\00 \00e\00q\00u\00a\00l\00,\00 \00n\00e\00g\00a\00t\00e\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1152) "\"\00\00\00\01\00\00\00\01\00\00\00\"\00\00\00U\00i\00n\00t\008\00C\00l\00a\00m\00p\00e\00d\00A\00r\00r\00a\00y\00")
 (data (i32.const 1208) "\12\00\00\00\01\00\00\00\01\00\00\00\12\00\00\00I\00n\00t\008\00A\00r\00r\00a\00y\00")
 (data (i32.const 1248) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1288) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1328) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1368) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1408) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1448) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1488) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00F\00l\00o\00a\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1528) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00F\00l\00o\00a\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1568) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 1600) "\10\00\00\00\01\00\00\00\1a\00\00\00\10\00\00\000\06\00\000\06\00\00\0c\00\00\00\03\00\00\00")
 (data (i32.const 1632) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00A\00r\00r\00a\00y\00s\00")
 (data (i32.const 1688) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00c\00u\00s\00t\00o\00m\00 \00c\00l\00a\00s\00s\00e\00s\00")
 (data (i32.const 1760) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1880) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 1952) "t\00\00\00\01\00\00\00\01\00\00\00t\00\00\00W\00h\00e\00n\00 \00t\00h\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00,\00 \00i\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00a\00n\00 \00e\00r\00r\00o\00r\00.\00")
 (data (i32.const 2088) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 2208) "D\00\00\00\01\00\00\00\01\00\00\00D\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00")
 (data (i32.const 2296) "|\00\00\00\01\00\00\00\01\00\00\00|\00\00\00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00u\00s\00e\00d\00")
 (data (i32.const 2440) "\d8\00\00\00\01\00\00\00\01\00\00\00\d8\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00T\00y\00p\00e\00d\00A\00r\00r\00a\00y\00s\00,\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00,\00 \00A\00r\00r\00a\00y\00s\00,\00 \00a\00n\00d\00 \00c\00l\00a\00s\00s\00e\00s\00 \00t\00h\00a\00t\00 \00h\00a\00v\00e\00 \00a\00 \00l\00e\00n\00g\00t\00h\00 \00p\00r\00o\00p\00e\00r\00t\00y\00.\00")
 (data (i32.const 2672) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 2792) "\1f\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\001\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\001\00\00\00\02\00\00\00\10\00\00\00\00\00\00\001\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00Q\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00Q\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\01\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\05\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\0c\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\0d\00\00\02\00\00\00\10\00\00\00\00\00\00\00\93\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00")
 (table $0 45 funcref)
 (elem (i32.const 0) $null $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/toHaveLength.spec~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|2)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.type (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.float (mut f64) (f64.const 0))
 (global $assembly/internal/report/reportActual/Actual.integer (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.reference (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.offset (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.expectation (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.ready (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.type (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.float (mut f64) (f64.const 0))
 (global $assembly/internal/report/reportExpected/Expected.integer (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.reference (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.offset (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.expectation (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.negated (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 4))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/toHaveLength.spec/valueArray (mut i32) (i32.const 1616))
 (global $assembly/__tests__/toHaveLength.spec/customExample (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/started (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 2792))
 (global $~lib/heap/__heap_base i32 (i32.const 3044))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__main" (func $assembly/index/__main))
 (export "__ready" (func $assembly/index/__ready))
 (export "__call" (func $assembly/internal/call/__call))
 (export "__sendActual" (func $assembly/internal/report/reportActual/__sendActual))
 (export "__sendExpected" (func $assembly/internal/report/reportExpected/__sendExpected))
 (func $~lib/rt/tlsf/removeBlock (; 23 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
    local.set $9
    block $~lib/rt/tlsf/SETSL|inlined.1
     local.get $0
     local.set $8
     local.get $4
     local.set $11
     local.get $9
     i32.const 1
     local.get $5
     i32.shl
     i32.const -1
     i32.xor
     i32.and
     local.tee $9
     local.set $10
     local.get $8
     local.get $11
     i32.const 2
     i32.shl
     i32.add
     local.get $10
     i32.store offset=4
    end
    local.get $9
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
 (func $~lib/rt/tlsf/insertBlock (; 24 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
    local.set $6
    local.get $6
    i32.const 4
    i32.sub
    i32.load
   end
   local.set $6
   local.get $6
   i32.load
   local.set $3
   local.get $3
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
   local.get $3
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
    local.get $6
    call $~lib/rt/tlsf/removeBlock
    local.get $6
    local.get $3
    i32.const 3
    i32.and
    local.get $7
    i32.or
    local.tee $2
    i32.store
    local.get $6
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
   local.set $7
   local.get $9
   local.set $3
   local.get $10
   local.set $6
   local.get $7
   local.get $3
   i32.const 4
   i32.shl
   local.get $6
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
   local.set $7
   local.get $10
   local.set $3
   local.get $1
   local.set $6
   local.get $12
   local.get $7
   i32.const 4
   i32.shl
   local.get $3
   i32.add
   i32.const 2
   i32.shl
   i32.add
   local.get $6
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
   local.set $13
   local.get $9
   local.set $12
   block $~lib/rt/tlsf/GETSL|inlined.1 (result i32)
    local.get $0
    local.set $3
    local.get $9
    local.set $6
    local.get $3
    local.get $6
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
   local.get $13
   local.get $12
   i32.const 2
   i32.shl
   i32.add
   local.get $7
   i32.store offset=4
  end
 )
 (func $~lib/rt/tlsf/addMemory (; 25 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/initializeRoot (; 26 ;) (type $FUNCSIG$v)
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
  global.get $~lib/heap/__heap_base
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
   local.set $5
   loop $repeat|0
    local.get $5
    i32.const 23
    i32.lt_u
    i32.eqz
    br_if $break|0
    block $~lib/rt/tlsf/SETSL|inlined.0
     local.get $3
     local.set $7
     local.get $5
     local.set $6
     i32.const 0
     local.set $4
     local.get $7
     local.get $6
     i32.const 2
     i32.shl
     i32.add
     local.get $4
     i32.store offset=4
    end
    block $break|1
     i32.const 0
     local.set $7
     loop $repeat|1
      local.get $7
      i32.const 16
      i32.lt_u
      i32.eqz
      br_if $break|1
      block $~lib/rt/tlsf/SETHEAD|inlined.0
       local.get $3
       local.set $9
       local.get $5
       local.set $8
       local.get $7
       local.set $6
       i32.const 0
       local.set $4
       local.get $9
       local.get $8
       i32.const 4
       i32.shl
       local.get $6
       i32.add
       i32.const 2
       i32.shl
       i32.add
       local.get $4
       i32.store offset=96
      end
      local.get $7
      i32.const 1
      i32.add
      local.set $7
      br $repeat|1
      unreachable
     end
     unreachable
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
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
 (func $~lib/rt/tlsf/prepareSize (; 27 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/searchBlock (; 28 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
   local.set $5
   local.get $5
   i32.eqz
   if
    i32.const 0
    local.set $7
   else    
    local.get $5
    i32.ctz
    local.set $2
    block $~lib/rt/tlsf/GETSL|inlined.3 (result i32)
     local.get $0
     local.set $8
     local.get $2
     local.set $4
     local.get $8
     local.get $4
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
     local.set $4
     local.get $9
     local.get $8
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
  else   
   block $~lib/rt/tlsf/GETHEAD|inlined.3 (result i32)
    local.get $0
    local.set $9
    local.get $2
    local.set $8
    local.get $6
    i32.ctz
    local.set $4
    local.get $9
    local.get $8
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
 (func $~lib/rt/tlsf/growMemory (; 29 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/prepareBlock (; 30 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/allocateBlock (; 31 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/__alloc (; 32 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/pure/increment (; 33 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__retain (; 34 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/heap/__heap_base
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/increment
  end
  local.get $0
 )
 (func $~lib/rt/tlsf/freeBlock (; 35 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/__typeinfo (; 36 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/rt/__rtti_base
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
 (func $~lib/util/memory/memcpy (; 37 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/memory/memory.copy (; 38 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/__free (; 39 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/growRoots (; 40 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/pure/appendRoot (; 41 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/decrement (; 42 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__release (; 43 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.get $~lib/heap/__heap_base
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/decrement
  end
 )
 (func $~lib/rt/pure/markGray (; 44 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scanBlack (; 45 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scan (; 46 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/collectWhite (; 47 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__collect (; 48 ;) (type $FUNCSIG$v)
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
 (func $~lib/string/String#get:length (; 49 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/string/String#concat (; 50 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/string/String.__concat (; 51 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 52 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/typedarray/Uint8Array#constructor (; 53 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Uint8Array#__set (; 54 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor (; 55 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array> (; 56 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 57 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (; 58 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/typedarray/Uint8Array#get:length (; 59 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/internal/report/Box/Box<i32>#constructor (; 60 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 5
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 (; 61 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint8Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.0
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.0
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.0
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.1
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/it (; 62 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not (; 63 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 (; 64 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint8Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.1
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.1
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.1
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.3
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/internal/Test/throws (; 65 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 (; 66 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 2
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 67 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 68 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8> (; 69 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Uint8ClampedArray#constructor (; 70 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 6
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
 (func $~lib/typedarray/Uint8ClampedArray#__set (; 71 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor (; 72 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 7
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray> (; 73 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Uint8ClampedArray#get:length (; 74 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 (; 75 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint8ClampedArray>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.2
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.2
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.2
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.5
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not (; 76 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 (; 77 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint8ClampedArray>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.3
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.3
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.3
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.7
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 (; 78 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 6
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8> (; 79 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Int8Array#constructor (; 80 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 8
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
 (func $~lib/typedarray/Int8Array#__set (; 81 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor (; 82 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 9
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array> (; 83 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Int8Array#get:length (; 84 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 (; 85 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int8Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.4
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.4
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.4
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.9
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not (; 86 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 (; 87 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int8Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.5
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.5
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.5
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.11
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 (; 88 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 8
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 9
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8> (; 89 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Uint16Array#constructor (; 90 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 10
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
 (func $~lib/typedarray/Uint16Array#__set (; 91 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor (; 92 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 11
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array> (; 93 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Uint16Array#get:length (; 94 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 (; 95 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint16Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.6
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.6
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.6
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.13
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not (; 96 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 (; 97 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint16Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.7
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.7
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.7
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.15
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 (; 98 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 12
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16> (; 99 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Int16Array#constructor (; 100 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 12
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
 (func $~lib/typedarray/Int16Array#__set (; 101 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor (; 102 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 13
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array> (; 103 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Int16Array#get:length (; 104 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 (; 105 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int16Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.8
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.8
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.8
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.17
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not (; 106 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 (; 107 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int16Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.9
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.9
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.9
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.19
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 (; 108 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 14
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 15
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16> (; 109 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Uint32Array#constructor (; 110 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 14
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
 (func $~lib/typedarray/Uint32Array#__set (; 111 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor (; 112 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 15
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array> (; 113 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Uint32Array#get:length (; 114 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 (; 115 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint32Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.10
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.10
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.10
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.21
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not (; 116 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 (; 117 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint32Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.11
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.11
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.11
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.23
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 (; 118 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 18
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32> (; 119 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Int32Array#constructor (; 120 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 16
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
 (func $~lib/typedarray/Int32Array#__set (; 121 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor (; 122 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 17
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array> (; 123 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Int32Array#get:length (; 124 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 (; 125 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int32Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.12
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.12
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.12
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.25
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not (; 126 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 (; 127 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int32Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.13
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.13
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.13
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.27
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 (; 128 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 20
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 21
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32> (; 129 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Uint64Array#constructor (; 130 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 18
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
 (func $~lib/typedarray/Uint64Array#__set (; 131 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor (; 132 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 19
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array> (; 133 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Uint64Array#get:length (; 134 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 (; 135 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint64Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.14
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.14
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.14
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.29
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not (; 136 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 (; 137 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Uint64Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.15
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.15
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.15
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.31
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 (; 138 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 23
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 24
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64> (; 139 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Int64Array#constructor (; 140 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 20
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
 (func $~lib/typedarray/Int64Array#__set (; 141 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor (; 142 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 21
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array> (; 143 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Int64Array#get:length (; 144 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 (; 145 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int64Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.16
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.16
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.16
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.33
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not (; 146 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 (; 147 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Int64Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.17
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.17
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.17
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.35
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 (; 148 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 26
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 27
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64> (; 149 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Float32Array#constructor (; 150 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 22
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
 (func $~lib/typedarray/Float32Array#__set (; 151 ;) (type $FUNCSIG$viif) (param $0 i32) (param $1 i32) (param $2 f32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor (; 152 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 23
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array> (; 153 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Float32Array#get:length (; 154 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 (; 155 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Float32Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.18
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.18
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.18
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.37
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not (; 156 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 (; 157 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Float32Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.19
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.19
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.19
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.39
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 (; 158 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 29
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 30
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32> (; 159 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Float64Array#constructor (; 160 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 24
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
 (func $~lib/typedarray/Float64Array#__set (; 161 ;) (type $FUNCSIG$viid) (param $0 i32) (param $1 i32) (param $2 f64)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor (; 162 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 25
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
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array> (; 163 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Float64Array#get:length (; 164 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 (; 165 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
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
   local.set $4
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $5
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Float64Array>|inlined.0
    local.get $4
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $2
    local.set $8
    local.get $4
    i32.load
    local.set $7
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $6
    i32.const 0
    local.set $10
    local.get $9
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $12
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $12
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.20
     local.get $10
     local.set $11
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.20
     local.get $8
     local.set $13
     local.get $7
     local.set $12
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.20
     end
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $13
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $13
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $13
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $13
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.41
     local.get $7
     local.get $10
     local.get $8
     i32.eq
     i32.xor
     local.set $14
     local.get $6
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $14
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $11
     call $~lib/rt/pure/__release
    end
    local.get $6
    call $~lib/rt/pure/__release
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not (; 166 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 (; 167 ;) (type $FUNCSIG$v)
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
  (local $14 i32)
  (local $15 i32)
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
   local.set $5
   i32.const 3
   local.set $4
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $6
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/typedarray/Float64Array>|inlined.1
    local.get $5
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $10
    local.get $4
    local.set $9
    local.get $5
    i32.load
    local.set $8
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    i32.const 0
    local.set $11
    local.get $10
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $13
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $13
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.21
     local.get $11
     local.set $12
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $13
      local.get $13
      local.set $14
      local.get $14
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $14
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $13
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.21
     local.get $9
     local.set $14
     local.get $8
     local.set $13
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.21
     end
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $14
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $14
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $12
      local.get $12
      local.set $15
      local.get $15
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $15
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $12
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $14
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.43
     local.get $8
     local.get $11
     local.get $9
     i32.eq
     i32.xor
     local.set $15
     local.get $7
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $15
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $12
     call $~lib/rt/pure/__release
    end
    local.get $7
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
   end
   local.get $6
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 (; 168 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 32
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 33
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64> (; 169 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 170 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 27
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
 (func $assembly/internal/Expectation/expect<~lib/array/Array<i32>> (; 171 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/array/Array<i32>#get:length (; 172 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 (; 173 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength|inlined.0
   global.get $assembly/__tests__/toHaveLength.spec/valueArray
   call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
   local.tee $0
   local.set $2
   i32.const 3
   local.set $1
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $3
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/array/Array<i32>>|inlined.0
    local.get $2
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $1
    local.set $6
    local.get $2
    i32.load
    local.set $5
    local.get $3
    call $~lib/rt/pure/__retain
    local.set $4
    i32.const 0
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $10
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $9
     local.get $10
     i32.eqz
     if
      local.get $9
      call $~lib/rt/pure/__release
      block
       local.get $9
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $9
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.22
     local.get $8
     local.set $9
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $9
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $9
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $9
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $10
      local.get $10
      local.set $11
      local.get $11
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $10
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $9
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.22
     local.get $6
     local.set $11
     local.get $5
     local.set $10
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.22
     end
     local.get $10
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $9
      local.get $9
      local.set $12
      local.get $12
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $12
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $9
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $11
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.45
     local.get $5
     local.get $8
     local.get $6
     i32.eq
     i32.xor
     local.set $12
     local.get $4
     call $~lib/rt/pure/__retain
     local.set $9
     local.get $12
     i32.eqz
     if
      local.get $9
      call $~lib/rt/pure/__release
      block
       local.get $9
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $9
     call $~lib/rt/pure/__release
    end
    local.get $4
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 174 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 (; 175 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength|inlined.1
   global.get $assembly/__tests__/toHaveLength.spec/valueArray
   call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
   local.tee $1
   local.set $3
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<~lib/array/Array<i32>>|inlined.1
    local.get $3
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $8
    local.get $2
    local.set $7
    local.get $3
    i32.load
    local.set $6
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $5
    i32.const 0
    local.set $9
    local.get $8
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $11
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $10
     local.get $11
     i32.eqz
     if
      local.get $10
      call $~lib/rt/pure/__release
      block
       local.get $10
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $10
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.23
     local.get $9
     local.set $10
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $10
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $10
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $10
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $12
      local.get $12
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $10
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.23
     local.get $7
     local.set $12
     local.get $6
     local.set $11
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.23
     end
     local.get $11
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $10
      local.get $10
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $10
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $12
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.47
     local.get $6
     local.get $9
     local.get $7
     i32.eq
     i32.xor
     local.set $13
     local.get $5
     call $~lib/rt/pure/__retain
     local.set $10
     local.get $13
     i32.eqz
     if
      local.get $10
      call $~lib/rt/pure/__release
      block
       local.get $10
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $10
     call $~lib/rt/pure/__release
    end
    local.get $5
    call $~lib/rt/pure/__release
    local.get $8
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0 (; 176 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 35
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 36
  i32.const 1040
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/Example#constructor (; 177 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 28
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 3
  i32.store
  local.get $0
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor (; 178 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example> (; 179 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 (; 180 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.0
   global.get $assembly/__tests__/toHaveLength.spec/customExample
   call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   local.set $2
   i32.const 3
   local.set $1
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $3
   block $assembly/internal/comparison/lengthComparison/lengthComparison<assembly/__tests__/toHaveLength.spec/Example>|inlined.0
    local.get $2
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $1
    local.set $6
    local.get $2
    i32.load
    local.set $5
    local.get $3
    call $~lib/rt/pure/__retain
    local.set $4
    i32.const 0
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $10
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $9
     local.get $10
     i32.eqz
     if
      local.get $9
      call $~lib/rt/pure/__release
      block
       local.get $9
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $9
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.24
     local.get $8
     local.set $9
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $9
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $9
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $9
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $10
      local.get $10
      local.set $11
      local.get $11
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $10
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $9
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.24
     local.get $6
     local.set $11
     local.get $5
     local.set $10
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.24
     end
     local.get $10
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $9
      local.get $9
      local.set $12
      local.get $12
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $12
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $9
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $11
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.49
     local.get $5
     local.get $8
     local.get $6
     i32.eq
     i32.xor
     local.set $12
     local.get $4
     call $~lib/rt/pure/__retain
     local.set $9
     local.get $12
     i32.eqz
     if
      local.get $9
      call $~lib/rt/pure/__release
      block
       local.get $9
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $9
     call $~lib/rt/pure/__release
    end
    local.get $4
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not (; 181 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 (; 182 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.1
   global.get $assembly/__tests__/toHaveLength.spec/customExample
   call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
   local.tee $1
   local.set $3
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<assembly/__tests__/toHaveLength.spec/Example>|inlined.1
    local.get $3
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $8
    local.get $2
    local.set $7
    local.get $3
    i32.load
    local.set $6
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $5
    i32.const 0
    local.set $9
    local.get $8
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $11
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $10
     local.get $11
     i32.eqz
     if
      local.get $10
      call $~lib/rt/pure/__release
      block
       local.get $10
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $10
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.25
     local.get $9
     local.set $10
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $10
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $10
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $10
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $12
      local.get $12
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $10
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.25
     local.get $7
     local.set $12
     local.get $6
     local.set $11
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.25
     end
     local.get $11
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $10
      local.get $10
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $10
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $12
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.51
     local.get $6
     local.get $9
     local.get $7
     i32.eq
     i32.xor
     local.set $13
     local.get $5
     call $~lib/rt/pure/__retain
     local.set $10
     local.get $13
     i32.eqz
     if
      local.get $10
      call $~lib/rt/pure/__release
      block
       local.get $10
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $10
     call $~lib/rt/pure/__release
    end
    local.get $5
    call $~lib/rt/pure/__release
    local.get $8
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 (; 183 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.2
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   local.set $2
   i32.const 3
   local.set $1
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $3
   block $assembly/internal/comparison/lengthComparison/lengthComparison<assembly/__tests__/toHaveLength.spec/Example>|inlined.2
    local.get $2
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $1
    local.set $6
    local.get $2
    i32.load
    local.set $5
    local.get $3
    call $~lib/rt/pure/__retain
    local.set $4
    i32.const 0
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $10
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $9
     local.get $10
     i32.eqz
     if
      local.get $9
      call $~lib/rt/pure/__release
      block
       local.get $9
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $9
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.26
     local.get $8
     local.set $9
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $9
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $9
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $9
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $10
      local.get $10
      local.set $11
      local.get $11
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $11
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $10
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $9
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.26
     local.get $6
     local.set $11
     local.get $5
     local.set $10
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.26
     end
     local.get $10
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $11
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $11
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $11
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $11
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $9
      local.get $9
      local.set $12
      local.get $12
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $12
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $9
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $11
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.53
     local.get $5
     local.get $8
     local.get $6
     i32.eq
     i32.xor
     local.set $12
     local.get $4
     call $~lib/rt/pure/__retain
     local.set $9
     local.get $12
     i32.eqz
     if
      local.get $9
      call $~lib/rt/pure/__release
      block
       local.get $9
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $9
     call $~lib/rt/pure/__release
    end
    local.get $4
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 (; 184 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength|inlined.3
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
   local.tee $1
   local.set $3
   i32.const 3
   local.set $2
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/comparison/lengthComparison/lengthComparison<assembly/__tests__/toHaveLength.spec/Example>|inlined.3
    local.get $3
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $8
    local.get $2
    local.set $7
    local.get $3
    i32.load
    local.set $6
    local.get $4
    call $~lib/rt/pure/__retain
    local.set $5
    i32.const 0
    local.set $9
    local.get $8
    i32.const 0
    i32.eq
    if
     i32.const 0
     local.set $11
     i32.const 672
     call $~lib/rt/pure/__retain
     local.set $10
     local.get $11
     i32.eqz
     if
      local.get $10
      call $~lib/rt/pure/__release
      block
       local.get $10
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $10
     call $~lib/rt/pure/__release
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
    block $assembly/internal/report/reportActual/reportActual<i32>|inlined.27
     local.get $9
     local.set $10
     block (result i32)
      local.get $10
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $10
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $10
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportActual/Actual.type
      i32.const 0
      local.get $10
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $11
      local.get $11
      local.set $12
      local.get $12
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportActual/Actual.reference
      call $~lib/rt/pure/__release
      local.get $12
      global.set $assembly/internal/report/reportActual/Actual.reference
      local.get $11
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportActual/Actual.type
      local.get $10
      global.set $assembly/internal/report/reportActual/Actual.integer
     end
    end
    block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.27
     local.get $7
     local.set $12
     local.get $6
     local.set $11
     global.get $assembly/internal/report/reportExpected/Expected.ready
     i32.eqz
     if
      call $assembly/internal/report/reportExpected/reportInvalidExpectCall
      br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.27
     end
     local.get $11
     global.set $assembly/internal/report/reportExpected/Expected.negated
     block (result i32)
      local.get $12
      drop
      i32.const 0
     end
     if (result i32)
      i32.const 1
     else      
      local.get $12
      drop
      i32.const 0
     end
     if
      block (result i32)
       local.get $12
       drop
       i32.const 0
      end
      if (result i32)
       i32.const 9
      else       
       i32.const 10
      end
      global.set $assembly/internal/report/reportExpected/Expected.type
      i32.const 0
      local.get $12
      call $assembly/internal/report/Box/Box<i32>#constructor
      local.set $10
      local.get $10
      local.set $13
      local.get $13
      call $~lib/rt/pure/__retain
      drop
      global.get $assembly/internal/report/reportExpected/Expected.reference
      call $~lib/rt/pure/__release
      local.get $13
      global.set $assembly/internal/report/reportExpected/Expected.reference
      local.get $10
      call $~lib/rt/pure/__release
     else      
      i32.const 2
      global.set $assembly/internal/report/reportExpected/Expected.type
      local.get $12
      global.set $assembly/internal/report/reportExpected/Expected.integer
     end
    end
    block $assembly/internal/comparison/assert/assert|inlined.55
     local.get $6
     local.get $9
     local.get $7
     i32.eq
     i32.xor
     local.set $13
     local.get $5
     call $~lib/rt/pure/__retain
     local.set $10
     local.get $13
     i32.eqz
     if
      local.get $10
      call $~lib/rt/pure/__release
      block
       local.get $10
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $10
     call $~lib/rt/pure/__release
    end
    local.get $5
    call $~lib/rt/pure/__release
    local.get $8
    call $~lib/rt/pure/__release
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1 (; 185 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 38
  call $assembly/internal/Test/it
  i32.const 1776
  i32.const 39
  i32.const 1040
  call $assembly/internal/Test/throws
  i32.const 1896
  i32.const 40
  i32.const 1968
  call $assembly/internal/Test/throws
  i32.const 2104
  i32.const 41
  i32.const 1968
  call $assembly/internal/Test/throws
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 186 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 30
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
 (func $assembly/internal/Expectation/expect<i32> (; 187 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 (; 188 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/Expectation/Expectation<i32>#toHaveLength|inlined.0
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.tee $0
   local.set $2
   i32.const 3
   local.set $1
   i32.const 416
   call $~lib/rt/pure/__retain
   local.set $3
   block $assembly/internal/comparison/lengthComparison/lengthComparison<i32>|inlined.0
    local.get $2
    i32.load offset=4
    local.set $7
    local.get $1
    local.set $6
    local.get $2
    i32.load
    local.set $5
    local.get $3
    call $~lib/rt/pure/__retain
    local.set $4
    i32.const 0
    local.set $8
    block $assembly/internal/comparison/assert/assert|inlined.56
     i32.const 0
     local.set $10
     i32.const 2456
     call $~lib/rt/pure/__retain
     local.set $9
     local.get $10
     i32.eqz
     if
      local.get $9
      call $~lib/rt/pure/__release
      block
       local.get $9
       i32.const 792
       i32.const 4
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $9
     call $~lib/rt/pure/__release
    end
    local.get $4
    call $~lib/rt/pure/__release
   end
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2 (; 189 ;) (type $FUNCSIG$v)
  i32.const 2312
  i32.const 43
  i32.const 2688
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/__tests__/toHaveLength.spec (; 190 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 272
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>
  i32.const 1168
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>
  i32.const 1224
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>
  i32.const 1264
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>
  i32.const 1304
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>
  i32.const 1344
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>
  i32.const 1384
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>
  i32.const 1424
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>
  i32.const 1464
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>
  i32.const 1504
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>
  i32.const 1544
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>
  i32.const 1648
  i32.const 37
  call $assembly/internal/Describe/describe
  i32.const 0
  call $assembly/__tests__/toHaveLength.spec/Example#constructor
  global.set $assembly/__tests__/toHaveLength.spec/customExample
  i32.const 1704
  i32.const 42
  call $assembly/internal/Describe/describe
  i32.const 2224
  i32.const 44
  call $assembly/internal/Describe/describe
 )
 (func $assembly/index/__main (; 191 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  i32.eqz
  if
   call $start
   i32.const 1
   global.set $~lib/started
  end
 )
 (func $assembly/index/__ready (; 192 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/internal/report/reportExpected/Expected.ready
 )
 (func $assembly/internal/call/__call (; 193 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $assembly/internal/report/reportActual/__sendActual (; 194 ;) (type $FUNCSIG$v)
  (local $0 i32)
  block $break|0
   block $case7|0
    block $case6|0
     block $case5|0
      block $case4|0
       block $case3|0
        block $case2|0
         block $case1|0
          block $case0|0
           global.get $assembly/internal/report/reportActual/Actual.type
           local.set $0
           local.get $0
           i32.const 5
           i32.eq
           br_if $case0|0
           local.get $0
           i32.const 1
           i32.eq
           br_if $case1|0
           local.get $0
           i32.const 2
           i32.eq
           br_if $case2|0
           local.get $0
           i32.const 0
           i32.eq
           br_if $case3|0
           local.get $0
           i32.const 3
           i32.eq
           br_if $case4|0
           local.get $0
           i32.const 4
           i32.eq
           br_if $case5|0
           local.get $0
           i32.const 10
           i32.eq
           br_if $case6|0
           local.get $0
           i32.const 9
           i32.eq
           br_if $case7|0
           br $break|0
          end
          global.get $assembly/internal/report/reportActual/Actual.reference
          call $assembly/internal/report/reportActual/reportActualArray
          br $break|0
         end
         global.get $assembly/internal/report/reportActual/Actual.float
         call $assembly/internal/report/reportActual/reportActualFloat
         br $break|0
        end
        global.get $assembly/internal/report/reportActual/Actual.integer
        call $assembly/internal/report/reportActual/reportActualInteger
        br $break|0
       end
       call $assembly/internal/report/reportActual/reportActualNull
       br $break|0
      end
      global.get $assembly/internal/report/reportActual/Actual.reference
      global.get $assembly/internal/report/reportActual/Actual.offset
      call $assembly/internal/report/reportActual/reportActualReferenceExternal
      br $break|0
     end
     global.get $assembly/internal/report/reportActual/Actual.reference
     call $assembly/internal/report/reportActual/reportActualString
     br $break|0
    end
   end
   global.get $assembly/internal/report/reportActual/Actual.reference
   global.get $assembly/internal/report/reportActual/Actual.type
   i32.const 9
   i32.eq
   call $assembly/internal/report/reportActual/reportActualLong
   br $break|0
  end
 )
 (func $assembly/internal/report/reportExpected/__sendExpected (; 195 ;) (type $FUNCSIG$v)
  (local $0 i32)
  block $break|0
   block $case10|0
    block $case9|0
     block $case8|0
      block $case7|0
       block $case6|0
        block $case5|0
         block $case4|0
          block $case3|0
           block $case2|0
            block $case1|0
             block $case0|0
              global.get $assembly/internal/report/reportExpected/Expected.type
              local.set $0
              local.get $0
              i32.const 5
              i32.eq
              br_if $case0|0
              local.get $0
              i32.const 1
              i32.eq
              br_if $case1|0
              local.get $0
              i32.const 2
              i32.eq
              br_if $case2|0
              local.get $0
              i32.const 0
              i32.eq
              br_if $case3|0
              local.get $0
              i32.const 3
              i32.eq
              br_if $case4|0
              local.get $0
              i32.const 4
              i32.eq
              br_if $case5|0
              local.get $0
              i32.const 6
              i32.eq
              br_if $case6|0
              local.get $0
              i32.const 8
              i32.eq
              br_if $case7|0
              local.get $0
              i32.const 7
              i32.eq
              br_if $case8|0
              local.get $0
              i32.const 10
              i32.eq
              br_if $case9|0
              local.get $0
              i32.const 9
              i32.eq
              br_if $case10|0
              br $break|0
             end
             global.get $assembly/internal/report/reportExpected/Expected.reference
             global.get $assembly/internal/report/reportExpected/Expected.negated
             call $assembly/internal/report/reportExpected/reportExpectedArray
             br $break|0
            end
            global.get $assembly/internal/report/reportExpected/Expected.float
            global.get $assembly/internal/report/reportExpected/Expected.negated
            call $assembly/internal/report/reportExpected/reportExpectedFloat
            br $break|0
           end
           global.get $assembly/internal/report/reportExpected/Expected.integer
           global.get $assembly/internal/report/reportExpected/Expected.negated
           call $assembly/internal/report/reportExpected/reportExpectedInteger
           br $break|0
          end
          global.get $assembly/internal/report/reportExpected/Expected.negated
          call $assembly/internal/report/reportExpected/reportExpectedNull
          br $break|0
         end
         global.get $assembly/internal/report/reportExpected/Expected.reference
         global.get $assembly/internal/report/reportExpected/Expected.offset
         global.get $assembly/internal/report/reportExpected/Expected.negated
         call $assembly/internal/report/reportExpected/reportExpectedReferenceExternal
         br $break|0
        end
        global.get $assembly/internal/report/reportExpected/Expected.reference
        global.get $assembly/internal/report/reportExpected/Expected.negated
        call $assembly/internal/report/reportExpected/reportExpectedString
        br $break|0
       end
       global.get $assembly/internal/report/reportExpected/Expected.negated
       call $assembly/internal/report/reportExpected/reportExpectedFalsy
       br $break|0
      end
      global.get $assembly/internal/report/reportExpected/Expected.negated
      call $assembly/internal/report/reportExpected/reportExpectedFinite
      br $break|0
     end
     global.get $assembly/internal/report/reportExpected/Expected.negated
     call $assembly/internal/report/reportExpected/reportExpectedTruthy
     br $break|0
    end
   end
   global.get $assembly/internal/report/reportExpected/Expected.reference
   global.get $assembly/internal/report/reportExpected/Expected.type
   i32.const 9
   i32.eq
   global.get $assembly/internal/report/reportExpected/Expected.negated
   call $assembly/internal/report/reportExpected/reportExpectedLong
   br $break|0
  end
 )
 (func $start (; 196 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toHaveLength.spec
 )
 (func $~lib/array/Array<i32>#__visit_impl (; 197 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/pure/__visit (; 198 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  global.get $~lib/heap/__heap_base
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
 (func $~lib/rt/__visit_members (; 199 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block
   end
   block $switch$1$leave
    block $switch$1$default
     block $switch$1$case$28
      block $switch$1$case$6
       block $switch$1$case$4
        block $switch$1$case$2
         local.get $0
         i32.const 8
         i32.sub
         i32.load
         br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$4 $switch$1$case$6 $switch$1$case$2 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$28 $switch$1$case$6 $switch$1$case$2 $switch$1$case$6 $switch$1$case$2 $switch$1$default
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
 (func $null (; 200 ;) (type $FUNCSIG$v)
 )
)
