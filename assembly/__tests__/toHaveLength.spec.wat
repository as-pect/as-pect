(module
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$viij (func (param i32 i32 i64)))
 (type $FUNCSIG$viif (func (param i32 i32 f32)))
 (type $FUNCSIG$viid (func (param i32 i32 f64)))
 (type $FUNCSIG$d (func (result f64)))
 (type $FUNCSIG$vidiiiidiiii (func (param i32 f64 i32 i32 i32 i32 f64 i32 i32 i32 i32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$viiiiiiiiii (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportActualInteger/getLogStackTrace (result i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportExpectedInteger/getLogStackTrace (result i32)))
 (import "__aspect" "testCanRun" (func $assembly/internal/test/Test/testCanRun (param i32) (result i32)))
 (import "__aspect" "groupCanRun" (func $assembly/internal/test/Collector/groupCanRun (param i32) (result i32)))
 (import "__aspect" "groupStart" (func $assembly/internal/test/TestGroup/groupStart (param i32)))
 (import "__aspect" "reportTodo" (func $assembly/internal/test/TestGroup/reportTodo (param i32)))
 (import "__aspect" "tryCall" (func $assembly/internal/test/TestGroup/tryCall (param i32) (result i32)))
 (import "__aspect" "groupEnd" (func $assembly/internal/test/TestGroup/groupEnd (param i32)))
 (import "__aspect" "testStart" (func $assembly/internal/test/TestResult/testStart (param i32)))
 (import "__aspect" "now" (func $assembly/internal/test/TestResult/now (result f64)))
 (import "__aspect" "testFail" (func $assembly/internal/test/TestResult/testFail (param i32 f64 i32 i32 i32 i32 f64 i32 i32 i32 i32)))
 (import "__aspect" "tryCall" (func $assembly/internal/test/TestResult/tryCall (param i32) (result i32)))
 (import "__aspect" "testPass" (func $assembly/internal/test/TestResult/testPass (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
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
 (data (i32.const 888) "^\00\00\00\01\00\00\00\01\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00")
 (data (i32.const 1000) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 1048) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00 \00")
 (data (i32.const 1072) "Z\00\00\00\01\00\00\00\01\00\00\00Z\00\00\00I\00n\00t\00e\00r\00n\00a\00l\00 \00a\00s\00-\00p\00e\00c\00t\00 \00E\00r\00r\00o\00r\00:\00 \00G\00r\00o\00u\00p\00 \00s\00t\00a\00c\00k\00 \00i\00s\00 \00e\00m\00p\00t\00y\00.\00")
 (data (i32.const 1184) "F\00\00\00\01\00\00\00\01\00\00\00F\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00t\00e\00s\00t\00/\00C\00o\00l\00l\00e\00c\00t\00o\00r\00.\00t\00s\00")
 (data (i32.const 1272) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00g\00r\00o\00u\00p\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 1320) "<\00\00\00\01\00\00\00\01\00\00\00<\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00t\00e\00s\00t\00/\00T\00e\00s\00t\00.\00t\00s\00")
 (data (i32.const 1400) "\82\00\00\00\01\00\00\00\01\00\00\00\82\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1552) "l\00\00\00\01\00\00\00\01\00\00\00l\00\00\00W\00h\00e\00n\00 \00l\00e\00n\00g\00t\00h\00 \00i\00s\00 \00e\00q\00u\00a\00l\00,\00 \00n\00e\00g\00a\00t\00e\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1680) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00g\00r\00o\00u\00p\00S\00t\00a\00c\00k\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 1736) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00A\00r\00r\00a\00y\00 \00i\00s\00 \00e\00m\00p\00t\00y\00")
 (data (i32.const 1784) "\"\00\00\00\01\00\00\00\01\00\00\00\"\00\00\00U\00i\00n\00t\008\00C\00l\00a\00m\00p\00e\00d\00A\00r\00r\00a\00y\00")
 (data (i32.const 1840) "\12\00\00\00\01\00\00\00\01\00\00\00\12\00\00\00I\00n\00t\008\00A\00r\00r\00a\00y\00")
 (data (i32.const 1880) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1920) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1960) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 2000) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 2040) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 2080) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 2120) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00F\00l\00o\00a\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 2160) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00F\00l\00o\00a\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 2200) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 2232) "\10\00\00\00\01\00\00\00 \00\00\00\10\00\00\00\a8\08\00\00\a8\08\00\00\0c\00\00\00\03\00\00\00")
 (data (i32.const 2264) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00A\00r\00r\00a\00y\00s\00")
 (data (i32.const 2320) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00c\00u\00s\00t\00o\00m\00 \00c\00l\00a\00s\00s\00e\00s\00")
 (data (i32.const 2392) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 2512) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 2584) "t\00\00\00\01\00\00\00\01\00\00\00t\00\00\00W\00h\00e\00n\00 \00t\00h\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00,\00 \00i\00t\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00a\00n\00 \00e\00r\00r\00o\00r\00.\00")
 (data (i32.const 2720) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 2840) "D\00\00\00\01\00\00\00\01\00\00\00D\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00")
 (data (i32.const 2928) "|\00\00\00\01\00\00\00\01\00\00\00|\00\00\00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00u\00s\00e\00d\00")
 (data (i32.const 3072) "\d8\00\00\00\01\00\00\00\01\00\00\00\d8\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00T\00y\00p\00e\00d\00A\00r\00r\00a\00y\00s\00,\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00,\00 \00A\00r\00r\00a\00y\00s\00,\00 \00a\00n\00d\00 \00c\00l\00a\00s\00s\00e\00s\00 \00t\00h\00a\00t\00 \00h\00a\00v\00e\00 \00a\00 \00l\00e\00n\00g\00t\00h\00 \00p\00r\00o\00p\00e\00r\00t\00y\00.\00")
 (data (i32.const 3304) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 3424) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00t\00e\00s\00t\00s\00 \00a\00r\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 3472) "F\00\00\00\01\00\00\00\01\00\00\00F\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00t\00e\00s\00t\00/\00T\00e\00s\00t\00G\00r\00o\00u\00p\00.\00t\00s\00")
 (data (i32.const 3560) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00t\00e\00s\00t\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 3600) "%\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\001\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\93\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\13\0d\00\00\02\00\00\00\93 \00\00\02\00\00\00\93 \00\00\02\00\00\00\93 \00\00\02\00\00\001\00\00\00\02\00\00\00\10\00\00\00\00\00\00\001\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00Q\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00Q\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\01\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\05\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\0c\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\0d\00\00\02\00\00\00\10\00\00\00\00\00\00\00\93\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00")
 (table $0 45 funcref)
 (elem (i32.const 0) $null $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/toHaveLength.spec~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|2)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $assembly/internal/value/index/Actual.type (mut i32) (i32.const 0))
 (global $assembly/internal/value/index/Actual.reference (mut i32) (i32.const 0))
 (global $assembly/internal/value/index/Actual.value (mut f64) (f64.const 0))
 (global $assembly/internal/value/index/Actual.offset (mut i32) (i32.const 0))
 (global $assembly/internal/value/index/Actual.stack (mut i32) (i32.const 0))
 (global $assembly/internal/value/index/Expected.type (mut i32) (i32.const 0))
 (global $assembly/internal/value/index/Expected.reference (mut i32) (i32.const 0))
 (global $assembly/internal/value/index/Expected.value (mut f64) (f64.const 0))
 (global $assembly/internal/value/index/Expected.offset (mut i32) (i32.const 0))
 (global $assembly/internal/value/index/Expected.stack (mut i32) (i32.const 0))
 (global $assembly/internal/value/index/Expected.negated (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 2))
 (global $assembly/internal/test/Collector/Collector.groups (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.groupStack (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.currentTest (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.performanceEnabledConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.maxSamplesConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.maxTestRunTimeConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.roundDecimalPlacesConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordAverageConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordMedianConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordStdDevConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordMaxConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordMinConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordVarianceConfigurationValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.performanceEnabledValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.maxSamplesValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.maxTestRunTimeValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.roundDecimalPlacesValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordAverageValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordMedianValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordStdDevValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordMaxValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordMinValue (mut i32) (i32.const 0))
 (global $assembly/internal/test/Collector/Collector.recordVarianceValue (mut i32) (i32.const 0))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/toHaveLength.spec/valueArray (mut i32) (i32.const 2248))
 (global $assembly/__tests__/toHaveLength.spec/customExample (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/started (mut i32) (i32.const 0))
 (global $~lib/rt/RTTI_BASE i32 (i32.const 3600))
 (global $~lib/heap/HEAP_BASE i32 (i32.const 3900))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti" (global $~lib/rt/RTTI_BASE))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__init" (func $assembly/index/__init))
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
 (func $~lib/rt/tlsf/removeBlock (; 14 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/insertBlock (; 15 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/addMemory (; 16 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/initializeRoot (; 17 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/tlsf/prepareSize (; 18 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/searchBlock (; 19 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/growMemory (; 20 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/prepareBlock (; 21 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/allocateBlock (; 22 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/__alloc (; 23 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/pure/increment (; 24 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__retain (; 25 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/freeBlock (; 26 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/__typeinfo (; 27 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/memory/memcpy (; 28 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/memory/memory.copy (; 29 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/__free (; 30 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/growRoots (; 31 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/pure/appendRoot (; 32 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/decrement (; 33 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__release (; 34 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/markGray (; 35 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scanBlack (; 36 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scan (; 37 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/collectWhite (; 38 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__collect (; 39 ;) (type $FUNCSIG$v)
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
 (func $~lib/string/String#get:length (; 40 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/string/String#concat (; 41 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/string/String.__concat (; 42 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 43 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/typedarray/Uint8Array#constructor (; 44 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Uint8Array#__set (; 45 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor (; 46 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint8Array> (; 47 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 48 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (; 49 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/typedarray/Uint8Array#get:length (; 50 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 (; 51 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.0
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $start:assembly/internal/noOp~anonymous|0 (; 52 ;) (type $FUNCSIG$v)
  nop
 )
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#constructor (; 53 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 16
   i32.const 11
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
    i32.const 904
    i32.const 1016
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
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#get:length (; 54 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func "$~lib/array/Array<() => void>#constructor" (; 55 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 16
   i32.const 6
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
    i32.const 904
    i32.const 1016
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
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#constructor (; 56 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 16
   i32.const 9
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
    i32.const 904
    i32.const 1016
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
 (func $~lib/array/Array<~lib/string/String>#constructor (; 57 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 16
   i32.const 10
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
    i32.const 904
    i32.const 1016
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
 (func $assembly/internal/test/TestGroup/TestGroup#constructor (; 58 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 32
    i32.const 5
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
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
   i32.const 0
   i32.store offset=24
   local.get $0
   i32.const 0
   i32.store offset=28
   local.get $0
  end
  local.tee $3
  block (result i32)
   i32.const 0
   i32.const 0
   call "$~lib/array/Array<() => void>#constructor"
   local.set $4
   local.get $3
   i32.load offset=4
   call $~lib/rt/pure/__release
   local.get $4
  end
  i32.store offset=4
  local.get $0
  local.tee $4
  block (result i32)
   i32.const 0
   i32.const 0
   call "$~lib/array/Array<() => void>#constructor"
   local.set $3
   local.get $4
   i32.load offset=8
   call $~lib/rt/pure/__release
   local.get $3
  end
  i32.store offset=8
  local.get $0
  local.tee $3
  block (result i32)
   i32.const 0
   i32.const 0
   call "$~lib/array/Array<() => void>#constructor"
   local.set $4
   local.get $3
   i32.load offset=12
   call $~lib/rt/pure/__release
   local.get $4
  end
  i32.store offset=12
  local.get $0
  local.tee $4
  block (result i32)
   i32.const 0
   i32.const 0
   call "$~lib/array/Array<() => void>#constructor"
   local.set $3
   local.get $4
   i32.load offset=16
   call $~lib/rt/pure/__release
   local.get $3
  end
  i32.store offset=16
  local.get $0
  local.tee $3
  block (result i32)
   i32.const 0
   i32.const 0
   call $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#constructor
   local.set $4
   local.get $3
   i32.load offset=20
   call $~lib/rt/pure/__release
   local.get $4
  end
  i32.store offset=20
  local.get $0
  local.tee $4
  block (result i32)
   i32.const 0
   i32.const 0
   call $~lib/array/Array<~lib/string/String>#constructor
   local.set $3
   local.get $4
   i32.load offset=24
   call $~lib/rt/pure/__release
   local.get $3
  end
  i32.store offset=24
  local.get $2
  if
   local.get $0
   local.tee $5
   block (result i32)
    local.get $2
    i32.load
    i32.const 1064
    call $~lib/string/String.__concat
    local.tee $3
    local.get $1
    call $~lib/string/String.__concat
    local.tee $4
    local.tee $6
    local.get $5
    i32.load
    local.tee $5
    i32.ne
    if
     local.get $6
     call $~lib/rt/pure/__retain
     drop
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $6
   end
   i32.store
   local.get $0
   local.tee $6
   block (result i32)
    local.get $2
    local.tee $5
    local.get $6
    i32.load offset=28
    local.tee $6
    i32.ne
    if
     local.get $5
     call $~lib/rt/pure/__retain
     drop
     local.get $6
     call $~lib/rt/pure/__release
    end
    local.get $5
   end
   i32.store offset=28
   local.get $3
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
  else   
   local.get $0
   local.tee $4
   block (result i32)
    local.get $1
    local.tee $6
    local.get $4
    i32.load
    local.tee $4
    i32.ne
    if
     local.get $6
     call $~lib/rt/pure/__retain
     drop
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $6
   end
   i32.store
  end
  local.get $0
 )
 (func $~lib/rt/tlsf/reallocateBlock (; 59 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/__realloc (; 60 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/memory/memory.fill (; 61 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  block $~lib/util/memory/memset|inlined.0
   local.get $0
   local.set $5
   local.get $1
   local.set $4
   local.get $2
   local.set $3
   local.get $3
   i32.eqz
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $4
   i32.store8
   local.get $5
   local.get $3
   i32.add
   i32.const 1
   i32.sub
   local.get $4
   i32.store8
   local.get $3
   i32.const 2
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   i32.const 1
   i32.add
   local.get $4
   i32.store8
   local.get $5
   i32.const 2
   i32.add
   local.get $4
   i32.store8
   local.get $5
   local.get $3
   i32.add
   i32.const 2
   i32.sub
   local.get $4
   i32.store8
   local.get $5
   local.get $3
   i32.add
   i32.const 3
   i32.sub
   local.get $4
   i32.store8
   local.get $3
   i32.const 6
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   i32.const 3
   i32.add
   local.get $4
   i32.store8
   local.get $5
   local.get $3
   i32.add
   i32.const 4
   i32.sub
   local.get $4
   i32.store8
   local.get $3
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   i32.const 0
   local.get $5
   i32.sub
   i32.const 3
   i32.and
   local.set $6
   local.get $5
   local.get $6
   i32.add
   local.set $5
   local.get $3
   local.get $6
   i32.sub
   local.set $3
   local.get $3
   i32.const -4
   i32.and
   local.set $3
   i32.const -1
   i32.const 255
   i32.div_u
   local.get $4
   i32.const 255
   i32.and
   i32.mul
   local.set $7
   local.get $5
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 4
   i32.sub
   local.get $7
   i32.store
   local.get $3
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   i32.const 4
   i32.add
   local.get $7
   i32.store
   local.get $5
   i32.const 8
   i32.add
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 12
   i32.sub
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 8
   i32.sub
   local.get $7
   i32.store
   local.get $3
   i32.const 24
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   i32.const 12
   i32.add
   local.get $7
   i32.store
   local.get $5
   i32.const 16
   i32.add
   local.get $7
   i32.store
   local.get $5
   i32.const 20
   i32.add
   local.get $7
   i32.store
   local.get $5
   i32.const 24
   i32.add
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 28
   i32.sub
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 24
   i32.sub
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 20
   i32.sub
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 16
   i32.sub
   local.get $7
   i32.store
   i32.const 24
   local.get $5
   i32.const 4
   i32.and
   i32.add
   local.set $6
   local.get $5
   local.get $6
   i32.add
   local.set $5
   local.get $3
   local.get $6
   i32.sub
   local.set $3
   local.get $7
   i64.extend_i32_u
   local.get $7
   i64.extend_i32_u
   i64.const 32
   i64.shl
   i64.or
   local.set $8
   block $break|0
    loop $continue|0
     local.get $3
     i32.const 32
     i32.ge_u
     if
      local.get $5
      local.get $8
      i64.store
      local.get $5
      i32.const 8
      i32.add
      local.get $8
      i64.store
      local.get $5
      i32.const 16
      i32.add
      local.get $8
      i64.store
      local.get $5
      i32.const 24
      i32.add
      local.get $8
      i64.store
      local.get $3
      i32.const 32
      i32.sub
      local.set $3
      local.get $5
      i32.const 32
      i32.add
      local.set $5
      br $continue|0
     end
    end
   end
  end
 )
 (func $~lib/array/ensureSize (; 62 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load offset=8
  local.set $3
  local.get $1
  local.get $3
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 1073741808
   local.get $2
   i32.shr_u
   i32.gt_u
   if
    i32.const 512
    i32.const 1016
    i32.const 14
    i32.const 47
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   i32.load
   local.set $4
   local.get $1
   local.get $2
   i32.shl
   local.set $5
   local.get $4
   local.get $5
   call $~lib/rt/tlsf/__realloc
   local.set $6
   local.get $6
   local.get $3
   i32.add
   i32.const 0
   local.get $5
   local.get $3
   i32.sub
   call $~lib/memory/memory.fill
   local.get $6
   local.get $4
   i32.ne
   if
    local.get $0
    local.get $6
    call $~lib/rt/pure/__retain
    i32.store
    local.get $0
    local.get $6
    i32.store offset=4
   end
   local.get $0
   local.get $5
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#push (; 63 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=12
  local.set $2
  local.get $2
  i32.const 1
  i32.add
  local.set $3
  local.get $0
  local.get $3
  i32.const 2
  call $~lib/array/ensureSize
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.set $4
  local.get $4
  i32.load
  local.set $5
  local.get $1
  local.get $5
  i32.ne
  if
   local.get $4
   local.get $1
   call $~lib/rt/pure/__retain
   i32.store
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $0
  local.get $3
  i32.store offset=12
  local.get $3
  local.set $5
  local.get $1
  call $~lib/rt/pure/__release
  local.get $5
 )
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__unchecked_get (; 64 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<f64>#constructor (; 65 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 16
   i32.const 8
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 3
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  local.get $1
  i32.store offset=12
  local.get $0
 )
 (func $assembly/internal/test/TestResult/TestResult#constructor (; 66 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.eqz
  if
   i32.const 56
   i32.const 7
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  global.get $assembly/internal/noOp/noOp
  i32.store
  local.get $0
  i32.const 0
  i32.store8 offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 416
  i32.store offset=12
  local.get $0
  i32.const 416
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.const 0
  call $~lib/array/Array<f64>#constructor
  local.tee $1
  i32.store offset=20
  local.get $0
  i32.const 0
  i32.store8 offset=24
  local.get $0
  i32.const 0
  i32.store offset=28
  local.get $0
  i32.const 0
  i32.store offset=32
  local.get $0
  i32.const 0
  i32.store offset=36
  local.get $0
  i32.const 0
  i32.store8 offset=40
  local.get $0
  i32.const 0
  i32.store8 offset=41
  local.get $0
  i32.const 0
  i32.store8 offset=42
  local.get $0
  i32.const 0
  i32.store8 offset=43
  local.get $0
  i32.const 0
  i32.store8 offset=44
  local.get $0
  i32.const 0
  i32.store8 offset=45
  local.get $0
  f64.const 0
  f64.store offset=48
  local.get $0
 )
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#push (; 67 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=12
  local.set $2
  local.get $2
  i32.const 1
  i32.add
  local.set $3
  local.get $0
  local.get $3
  i32.const 2
  call $~lib/array/ensureSize
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.set $4
  local.get $4
  i32.load
  local.set $5
  local.get $1
  local.get $5
  i32.ne
  if
   local.get $4
   local.get $1
   call $~lib/rt/pure/__retain
   i32.store
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $0
  local.get $3
  i32.store offset=12
  local.get $3
  local.set $5
  local.get $1
  call $~lib/rt/pure/__release
  local.get $5
 )
 (func $assembly/internal/test/Test/it (; 68 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/test/Collector/Collector.currentGroup|inlined.0 (result i32)
   global.get $assembly/internal/test/Collector/Collector.groupStack
   i32.eqz
   if
    block (result i32)
     i32.const 0
     i32.const 0
     call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#constructor
     local.set $2
     global.get $assembly/internal/test/Collector/Collector.groupStack
     call $~lib/rt/pure/__release
     local.get $2
    end
    global.set $assembly/internal/test/Collector/Collector.groupStack
   end
   global.get $assembly/internal/test/Collector/Collector.groupStack
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#get:length
   i32.const 0
   i32.eq
   if
    global.get $assembly/internal/test/Collector/Collector.groupStack
    i32.const 0
    i32.const 416
    i32.const 0
    call $assembly/internal/test/TestGroup/TestGroup#constructor
    local.tee $2
    call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#push
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   global.get $assembly/internal/test/Collector/Collector.groupStack
   call $~lib/rt/pure/__retain
   local.set $2
   local.get $2
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#get:length
   local.set $3
   local.get $3
   i32.const 0
   i32.ne
   i32.eqz
   if
    i32.const 1088
    i32.const 1200
    i32.const 44
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   local.get $3
   i32.const 1
   i32.sub
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__unchecked_get
   local.tee $4
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
   local.get $5
  end
  local.tee $4
  call $~lib/rt/pure/__retain
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 1288
   i32.const 1336
   i32.const 35
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/test/Test/testCanRun
  local.set $2
  local.get $2
  i32.const 0
  i32.ne
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
   return
  end
  i32.const 0
  call $assembly/internal/test/TestResult/TestResult#constructor
  local.set $5
  local.get $5
  local.tee $6
  block (result i32)
   local.get $0
   local.tee $7
   local.get $6
   i32.load offset=12
   local.tee $6
   i32.ne
   if
    local.get $7
    call $~lib/rt/pure/__retain
    drop
    local.get $6
    call $~lib/rt/pure/__release
   end
   local.get $7
  end
  i32.store offset=12
  local.get $5
  local.get $1
  i32.store
  local.get $5
  i32.const 0
  i32.store offset=8
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.performanceEnabledValue
  i32.store8 offset=24
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.maxSamplesValue
  i32.store offset=28
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.maxTestRunTimeValue
  i32.store offset=32
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.roundDecimalPlacesValue
  i32.store offset=36
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.recordAverageValue
  i32.store8 offset=40
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.recordMedianValue
  i32.store8 offset=41
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.recordStdDevValue
  i32.store8 offset=42
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.recordMaxValue
  i32.store8 offset=43
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.recordMinValue
  i32.store8 offset=44
  local.get $5
  global.get $assembly/internal/test/Collector/Collector.recordVarianceValue
  i32.store8 offset=45
  block $assembly/internal/test/Collector/Collector.resetPerformanceValues|inlined.0
   global.get $assembly/internal/test/Collector/Collector.performanceEnabledConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.performanceEnabledValue
   global.get $assembly/internal/test/Collector/Collector.maxSamplesConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.maxSamplesValue
   global.get $assembly/internal/test/Collector/Collector.maxTestRunTimeConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.maxTestRunTimeValue
   global.get $assembly/internal/test/Collector/Collector.roundDecimalPlacesConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.roundDecimalPlacesValue
   global.get $assembly/internal/test/Collector/Collector.recordAverageConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordAverageValue
   global.get $assembly/internal/test/Collector/Collector.recordMedianConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordMedianValue
   global.get $assembly/internal/test/Collector/Collector.recordStdDevConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordStdDevValue
   global.get $assembly/internal/test/Collector/Collector.recordMaxConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordMaxValue
   global.get $assembly/internal/test/Collector/Collector.recordMinConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordMinValue
   global.get $assembly/internal/test/Collector/Collector.recordVarianceConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordVarianceValue
  end
  local.get $3
  i32.load offset=20
  local.get $5
  call $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#push
  drop
  local.get $4
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $5
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not (; 69 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 (; 70 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.1
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Test/throws (; 71 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/test/Collector/Collector.currentGroup|inlined.1 (result i32)
   global.get $assembly/internal/test/Collector/Collector.groupStack
   i32.eqz
   if
    block (result i32)
     i32.const 0
     i32.const 0
     call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#constructor
     local.set $3
     global.get $assembly/internal/test/Collector/Collector.groupStack
     call $~lib/rt/pure/__release
     local.get $3
    end
    global.set $assembly/internal/test/Collector/Collector.groupStack
   end
   global.get $assembly/internal/test/Collector/Collector.groupStack
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#get:length
   i32.const 0
   i32.eq
   if
    global.get $assembly/internal/test/Collector/Collector.groupStack
    i32.const 0
    i32.const 416
    i32.const 0
    call $assembly/internal/test/TestGroup/TestGroup#constructor
    local.tee $3
    call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#push
    drop
    local.get $3
    call $~lib/rt/pure/__release
   end
   global.get $assembly/internal/test/Collector/Collector.groupStack
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $3
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#get:length
   local.set $4
   local.get $4
   i32.const 0
   i32.ne
   i32.eqz
   if
    i32.const 1088
    i32.const 1200
    i32.const 44
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
   local.get $3
   local.get $4
   i32.const 1
   i32.sub
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__unchecked_get
   local.tee $5
   call $~lib/rt/pure/__retain
   local.set $6
   local.get $3
   call $~lib/rt/pure/__release
   local.get $5
   call $~lib/rt/pure/__release
   local.get $6
  end
  local.tee $5
  call $~lib/rt/pure/__retain
  local.set $4
  local.get $0
  call $assembly/internal/test/Test/testCanRun
  local.set $3
  local.get $3
  i32.const 0
  i32.ne
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
   local.get $5
   call $~lib/rt/pure/__release
   return
  end
  i32.const 0
  call $assembly/internal/test/TestResult/TestResult#constructor
  local.set $6
  local.get $6
  local.tee $7
  block (result i32)
   local.get $0
   local.tee $8
   local.get $7
   i32.load offset=12
   local.tee $7
   i32.ne
   if
    local.get $8
    call $~lib/rt/pure/__retain
    drop
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $8
  end
  i32.store offset=12
  local.get $6
  local.get $1
  i32.store
  local.get $6
  i32.const 1
  i32.store offset=8
  local.get $6
  local.tee $8
  block (result i32)
   local.get $2
   local.tee $7
   local.get $8
   i32.load offset=16
   local.tee $8
   i32.ne
   if
    local.get $7
    call $~lib/rt/pure/__retain
    drop
    local.get $8
    call $~lib/rt/pure/__release
   end
   local.get $7
  end
  i32.store offset=16
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.performanceEnabledValue
  i32.store8 offset=24
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.maxSamplesValue
  i32.store offset=28
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.maxTestRunTimeValue
  i32.store offset=32
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.roundDecimalPlacesValue
  i32.store offset=36
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.recordAverageValue
  i32.store8 offset=40
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.recordMedianValue
  i32.store8 offset=41
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.recordStdDevValue
  i32.store8 offset=42
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.recordMaxValue
  i32.store8 offset=43
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.recordMinValue
  i32.store8 offset=44
  local.get $6
  global.get $assembly/internal/test/Collector/Collector.recordVarianceValue
  i32.store8 offset=45
  block $assembly/internal/test/Collector/Collector.resetPerformanceValues|inlined.1
   global.get $assembly/internal/test/Collector/Collector.performanceEnabledConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.performanceEnabledValue
   global.get $assembly/internal/test/Collector/Collector.maxSamplesConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.maxSamplesValue
   global.get $assembly/internal/test/Collector/Collector.maxTestRunTimeConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.maxTestRunTimeValue
   global.get $assembly/internal/test/Collector/Collector.roundDecimalPlacesConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.roundDecimalPlacesValue
   global.get $assembly/internal/test/Collector/Collector.recordAverageConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordAverageValue
   global.get $assembly/internal/test/Collector/Collector.recordMedianConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordMedianValue
   global.get $assembly/internal/test/Collector/Collector.recordStdDevConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordStdDevValue
   global.get $assembly/internal/test/Collector/Collector.recordMaxConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordMaxValue
   global.get $assembly/internal/test/Collector/Collector.recordMinConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordMinValue
   global.get $assembly/internal/test/Collector/Collector.recordVarianceConfigurationValue
   global.set $assembly/internal/test/Collector/Collector.recordVarianceValue
  end
  local.get $4
  i32.load offset=20
  local.get $6
  call $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#push
  drop
  local.get $5
  call $~lib/rt/pure/__release
  local.get $4
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 (; 72 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 1
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 3
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#pop (; 73 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=12
  local.set $1
  local.get $1
  i32.const 1
  i32.lt_s
  if
   i32.const 1752
   i32.const 1016
   i32.const 258
   i32.const 20
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 1
  i32.sub
  local.tee $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  local.get $1
  i32.store offset=12
  local.get $2
 )
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#get:length (; 74 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $assembly/internal/test/Describe/describe (; 75 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/test/Collector/Collector.currentGroup|inlined.2 (result i32)
   global.get $assembly/internal/test/Collector/Collector.groupStack
   i32.eqz
   if
    block (result i32)
     i32.const 0
     i32.const 0
     call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#constructor
     local.set $2
     global.get $assembly/internal/test/Collector/Collector.groupStack
     call $~lib/rt/pure/__release
     local.get $2
    end
    global.set $assembly/internal/test/Collector/Collector.groupStack
   end
   global.get $assembly/internal/test/Collector/Collector.groupStack
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#get:length
   i32.const 0
   i32.eq
   if
    global.get $assembly/internal/test/Collector/Collector.groupStack
    i32.const 0
    i32.const 416
    i32.const 0
    call $assembly/internal/test/TestGroup/TestGroup#constructor
    local.tee $2
    call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#push
    drop
    local.get $2
    call $~lib/rt/pure/__release
   end
   global.get $assembly/internal/test/Collector/Collector.groupStack
   call $~lib/rt/pure/__retain
   local.set $2
   local.get $2
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#get:length
   local.set $3
   local.get $3
   i32.const 0
   i32.ne
   i32.eqz
   if
    i32.const 1088
    i32.const 1200
    i32.const 44
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   local.get $3
   i32.const 1
   i32.sub
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__unchecked_get
   local.tee $4
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
   local.get $5
  end
  local.tee $4
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.get $0
  local.get $3
  call $assembly/internal/test/TestGroup/TestGroup#constructor
  local.set $2
  block $assembly/internal/test/Collector/Collector.push|inlined.0
   local.get $2
   call $~lib/rt/pure/__retain
   local.set $5
   global.get $assembly/internal/test/Collector/Collector.groupStack
   i32.eqz
   if
    i32.const 1696
    i32.const 1200
    i32.const 55
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
   global.get $assembly/internal/test/Collector/Collector.groupStack
   local.get $5
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#push
   drop
   local.get $5
   call $~lib/rt/pure/__release
  end
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  block $assembly/internal/test/Collector/Collector.pop|inlined.0
   global.get $assembly/internal/test/Collector/Collector.groups
   i32.eqz
   if
    block (result i32)
     i32.const 0
     i32.const 0
     call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#constructor
     local.set $5
     global.get $assembly/internal/test/Collector/Collector.groups
     call $~lib/rt/pure/__release
     local.get $5
    end
    global.set $assembly/internal/test/Collector/Collector.groups
   end
   global.get $assembly/internal/test/Collector/Collector.groupStack
   call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#pop
   local.set $5
   local.get $5
   i32.load
   call $assembly/internal/test/Collector/groupCanRun
   local.set $6
   local.get $6
   if (result i32)
    local.get $5
    i32.load offset=20
    call $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#get:length
    i32.const 0
    i32.gt_s
   else    
    i32.const 0
   end
   if
    global.get $assembly/internal/test/Collector/Collector.groups
    local.get $5
    call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#push
    drop
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $4
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8> (; 76 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 4
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint8ClampedArray#constructor (; 77 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint8ClampedArray#__set (; 78 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor (; 79 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint8ClampedArray> (; 80 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Uint8ClampedArray#get:length (; 81 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 (; 82 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.2
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not (; 83 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 (; 84 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.3
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 (; 85 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 5
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 6
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8> (; 86 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 7
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int8Array#constructor (; 87 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int8Array#__set (; 88 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor (; 89 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Int8Array> (; 90 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Int8Array#get:length (; 91 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 (; 92 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.4
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not (; 93 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 (; 94 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.5
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 (; 95 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 8
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 9
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8> (; 96 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 10
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint16Array#constructor (; 97 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  i32.const 1
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint16Array#__set (; 98 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor (; 99 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint16Array> (; 100 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Uint16Array#get:length (; 101 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 (; 102 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.6
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not (; 103 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 (; 104 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.7
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 (; 105 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 11
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 12
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16> (; 106 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 13
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int16Array#constructor (; 107 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  i32.const 1
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int16Array#__set (; 108 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor (; 109 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Int16Array> (; 110 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Int16Array#get:length (; 111 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 (; 112 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.8
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not (; 113 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 (; 114 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.9
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 (; 115 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 14
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 15
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16> (; 116 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 16
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint32Array#constructor (; 117 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint32Array#__set (; 118 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor (; 119 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint32Array> (; 120 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Uint32Array#get:length (; 121 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 (; 122 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.10
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not (; 123 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 (; 124 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.11
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 (; 125 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 17
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 18
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32> (; 126 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 19
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int32Array#constructor (; 127 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Int32Array#__set (; 128 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor (; 129 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Int32Array> (; 130 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Int32Array#get:length (; 131 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 (; 132 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.12
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not (; 133 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 (; 134 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.13
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 (; 135 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 20
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 21
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32> (; 136 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 22
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint64Array#constructor (; 137 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/typedarray/Uint64Array#__set (; 138 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor (; 139 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Uint64Array> (; 140 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Uint64Array#get:length (; 141 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 (; 142 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.14
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not (; 143 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 (; 144 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.15
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 (; 145 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 23
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 24
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64> (; 146 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 25
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int64Array#constructor (; 147 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 26
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
 (func $~lib/typedarray/Int64Array#__set (; 148 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor (; 149 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Int64Array> (; 150 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Int64Array#get:length (; 151 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 (; 152 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.16
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not (; 153 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 (; 154 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.17
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 (; 155 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 26
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 27
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64> (; 156 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 28
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float32Array#constructor (; 157 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 28
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
 (func $~lib/typedarray/Float32Array#__set (; 158 ;) (type $FUNCSIG$viif) (param $0 i32) (param $1 i32) (param $2 f32)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor (; 159 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Float32Array> (; 160 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Float32Array#get:length (; 161 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 (; 162 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.18
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not (; 163 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 (; 164 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.19
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 (; 165 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 29
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 30
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32> (; 166 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 31
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float64Array#constructor (; 167 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else   
   i32.const 12
   i32.const 30
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
 (func $~lib/typedarray/Float64Array#__set (; 168 ;) (type $FUNCSIG$viid) (param $0 i32) (param $1 i32) (param $2 f64)
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor (; 169 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 31
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
 (func $assembly/internal/test/Expectation/expect<~lib/typedarray/Float64Array> (; 170 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/typedarray/Float64Array#get:length (; 171 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 (; 172 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.20
     local.get $8
     local.set $12
     local.get $7
     local.set $11
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $11
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not (; 173 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 (; 174 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $12
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.21
     local.get $9
     local.set $13
     local.get $8
     local.set $12
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $13
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $12
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 (; 175 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 32
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 33
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64> (; 176 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 34
  call $assembly/internal/test/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 177 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 33
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
 (func $assembly/internal/test/Expectation/expect<~lib/array/Array<i32>> (; 178 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/array/Array<i32>#get:length (; 179 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 (; 180 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $9
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.22
     local.get $6
     local.set $10
     local.get $5
     local.set $9
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $10
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $9
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 181 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 (; 182 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $10
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.23
     local.get $7
     local.set $11
     local.get $6
     local.set $10
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $10
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0 (; 183 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 35
  call $assembly/internal/test/Test/it
  i32.const 1416
  i32.const 36
  i32.const 1568
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/Example#constructor (; 184 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 34
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 3
  i32.store
  local.get $0
 )
 (func $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor (; 185 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 35
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
 (func $assembly/internal/test/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example> (; 186 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 (; 187 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $9
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.24
     local.get $6
     local.set $10
     local.get $5
     local.set $9
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $10
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $9
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $assembly/internal/test/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not (; 188 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 (; 189 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $10
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.25
     local.get $7
     local.set $11
     local.get $6
     local.set $10
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $10
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 (; 190 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $9
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.26
     local.get $6
     local.set $10
     local.get $5
     local.set $9
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $10
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $9
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 (; 191 ;) (type $FUNCSIG$v)
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
     i32.const 1
     global.set $assembly/internal/value/index/Actual.type
     local.get $10
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Actual.value
     call $assembly/internal/report/reportActualInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
    end
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.27
     local.get $7
     local.set $11
     local.get $6
     local.set $10
     i32.const 1
     global.set $assembly/internal/value/index/Expected.type
     local.get $11
     f64.convert_i32_s
     global.set $assembly/internal/value/index/Expected.value
     local.get $10
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
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
     i32.const 0
     global.set $assembly/internal/value/index/Actual.type
     i32.const 0
     global.set $assembly/internal/value/index/Expected.type
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1 (; 192 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 38
  call $assembly/internal/test/Test/it
  i32.const 2408
  i32.const 39
  i32.const 1568
  call $assembly/internal/test/Test/throws
  i32.const 2528
  i32.const 40
  i32.const 2600
  call $assembly/internal/test/Test/throws
  i32.const 2736
  i32.const 41
  i32.const 2600
  call $assembly/internal/test/Test/throws
 )
 (func $assembly/internal/test/Expectation/Expectation<i32>#constructor (; 193 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    i32.const 36
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
 (func $assembly/internal/test/Expectation/expect<i32> (; 194 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<i32>#constructor
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 (; 195 ;) (type $FUNCSIG$v)
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
     i32.const 3088
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
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2 (; 196 ;) (type $FUNCSIG$v)
  i32.const 2944
  i32.const 43
  i32.const 3320
  call $assembly/internal/test/Test/throws
 )
 (func $start:assembly/__tests__/toHaveLength.spec (; 197 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 272
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>
  i32.const 1800
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>
  i32.const 1856
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>
  i32.const 1896
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>
  i32.const 1936
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>
  i32.const 1976
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>
  i32.const 2016
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>
  i32.const 2056
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>
  i32.const 2096
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>
  i32.const 2136
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>
  i32.const 2176
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>
  i32.const 2280
  i32.const 37
  call $assembly/internal/test/Describe/describe
  i32.const 0
  call $assembly/__tests__/toHaveLength.spec/Example#constructor
  global.set $assembly/__tests__/toHaveLength.spec/customExample
  i32.const 2336
  i32.const 42
  call $assembly/internal/test/Describe/describe
  i32.const 2856
  i32.const 44
  call $assembly/internal/test/Describe/describe
 )
 (func $assembly/index/__init (; 198 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  i32.eqz
  if
   call $start
   i32.const 1
   global.set $~lib/started
  end
 )
 (func $~lib/array/Array<~lib/string/String>#get:length (; 199 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/string/String>#__unchecked_get (; 200 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<~lib/string/String>#__get (; 201 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 904
   i32.const 1016
   i32.const 97
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 1016
   i32.const 100
   i32.const 61
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__unchecked_get
 )
 (func "$~lib/array/Array<() => void>#get:length" (; 202 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func "$~lib/array/Array<() => void>#__unchecked_get" (; 203 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $assembly/internal/test/TestGroup/TestGroup#runBeforeAll (; 204 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=28
  if
   local.get $0
   i32.load offset=28
   call $assembly/internal/test/TestGroup/TestGroup#runBeforeAll
   i32.const 0
   i32.ne
   i32.eqz
   if
    i32.const 0
    return
   end
  end
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $2
  call "$~lib/array/Array<() => void>#get:length"
  local.set $3
  block $break|0
   i32.const 0
   local.set $4
   loop $repeat|0
    local.get $4
    local.get $3
    i32.lt_s
    i32.eqz
    br_if $break|0
    local.get $2
    local.get $4
    call "$~lib/array/Array<() => void>#__unchecked_get"
    local.set $1
    local.get $1
    call $assembly/internal/test/TestGroup/tryCall
    i32.const 0
    i32.ne
    i32.eqz
    if
     i32.const 0
     local.set $5
     local.get $2
     call $~lib/rt/pure/__release
     local.get $5
     return
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
  i32.const 1
  local.set $4
  local.get $2
  call $~lib/rt/pure/__release
  local.get $4
 )
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__unchecked_get (; 205 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__get (; 206 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 904
   i32.const 1016
   i32.const 97
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 1016
   i32.const 100
   i32.const 61
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  call $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__unchecked_get
 )
 (func $assembly/internal/test/TestGroup/TestGroup#runBeforeEach (; 207 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=28
  if
   local.get $0
   i32.load offset=28
   call $assembly/internal/test/TestGroup/TestGroup#runBeforeEach
   i32.const 0
   i32.ne
   i32.eqz
   if
    i32.const 0
    return
   end
  end
  local.get $0
  i32.load offset=12
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $2
  call "$~lib/array/Array<() => void>#get:length"
  local.set $3
  block $break|0
   i32.const 0
   local.set $4
   loop $repeat|0
    local.get $4
    local.get $3
    i32.lt_s
    i32.eqz
    br_if $break|0
    local.get $2
    local.get $4
    call "$~lib/array/Array<() => void>#__unchecked_get"
    local.set $1
    local.get $1
    call $assembly/internal/test/TestGroup/tryCall
    i32.const 0
    i32.ne
    i32.eqz
    if
     i32.const 0
     local.set $5
     local.get $2
     call $~lib/rt/pure/__release
     local.get $5
     return
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
  i32.const 1
  local.set $4
  local.get $2
  call $~lib/rt/pure/__release
  local.get $4
 )
 (func $~lib/array/Array<f64>#push (; 208 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load offset=12
  local.set $2
  local.get $2
  i32.const 1
  i32.add
  local.set $3
  local.get $0
  local.get $3
  i32.const 3
  call $~lib/array/ensureSize
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 3
  i32.shl
  i32.add
  local.get $1
  f64.store
  local.get $0
  local.get $3
  i32.store offset=12
  local.get $3
 )
 (func $assembly/internal/test/TestGroup/TestGroup#runAfterEach (; 209 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=28
  if
   local.get $0
   i32.load offset=28
   call $assembly/internal/test/TestGroup/TestGroup#runAfterEach
   i32.const 0
   i32.ne
   i32.eqz
   if
    i32.const 0
    return
   end
  end
  local.get $0
  i32.load offset=16
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $2
  call "$~lib/array/Array<() => void>#get:length"
  local.set $3
  block $break|0
   i32.const 0
   local.set $4
   loop $repeat|0
    local.get $4
    local.get $3
    i32.lt_s
    i32.eqz
    br_if $break|0
    local.get $2
    local.get $4
    call "$~lib/array/Array<() => void>#__unchecked_get"
    local.set $1
    local.get $1
    call $assembly/internal/test/TestGroup/tryCall
    i32.const 0
    i32.ne
    i32.eqz
    if
     i32.const 0
     local.set $5
     local.get $2
     call $~lib/rt/pure/__release
     local.get $5
     return
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
  i32.const 1
  local.set $4
  local.get $2
  call $~lib/rt/pure/__release
  local.get $4
 )
 (func $assembly/internal/test/TestResult/TestResult#run (; 210 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 f64)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=12
  call $assembly/internal/test/TestResult/testStart
  local.get $0
  call $assembly/internal/test/TestResult/now
  f64.store offset=48
  local.get $0
  i32.load8_u offset=24
  if
   i32.const 0
   local.set $2
   block $break|0
    loop $continue|0
     local.get $2
     local.get $0
     i32.load offset=28
     i32.lt_s
     if
      block $assembly/internal/test/TestResult/TestResult#runInstance|inlined.0 (result i32)
       local.get $0
       local.set $4
       local.get $1
       call $~lib/rt/pure/__retain
       local.set $3
       local.get $3
       call $assembly/internal/test/TestGroup/TestGroup#runBeforeEach
       i32.eqz
       if
        local.get $4
        i32.const 0
        i32.store8 offset=4
        block $assembly/internal/test/TestResult/TestResult#failTest|inlined.0
         local.get $4
         local.set $5
         global.get $assembly/internal/value/index/Actual.type
         global.get $assembly/internal/value/index/Actual.value
         global.get $assembly/internal/value/index/Actual.reference
         global.get $assembly/internal/value/index/Actual.offset
         global.get $assembly/internal/value/index/Actual.stack
         global.get $assembly/internal/value/index/Expected.type
         global.get $assembly/internal/value/index/Expected.value
         global.get $assembly/internal/value/index/Expected.reference
         global.get $assembly/internal/value/index/Expected.offset
         global.get $assembly/internal/value/index/Expected.stack
         local.get $5
         i32.load offset=8
         call $assembly/internal/test/TestResult/testFail
        end
        i32.const 0
        local.set $5
        local.get $3
        call $~lib/rt/pure/__release
        local.get $5
        br $assembly/internal/test/TestResult/TestResult#runInstance|inlined.0
       end
       call $assembly/internal/test/TestResult/now
       local.set $6
       local.get $4
       local.get $4
       i32.load offset=8
       local.get $4
       i32.load
       call $assembly/internal/test/TestResult/tryCall
       i32.const 0
       i32.ne
       i32.xor
       i32.store8 offset=4
       local.get $4
       i32.load offset=20
       call $assembly/internal/test/TestResult/now
       local.get $6
       f64.sub
       call $~lib/array/Array<f64>#push
       drop
       local.get $3
       call $assembly/internal/test/TestGroup/TestGroup#runAfterEach
       i32.eqz
       if
        local.get $4
        i32.const 0
        i32.store8 offset=4
        block $assembly/internal/test/TestResult/TestResult#failTest|inlined.1
         local.get $4
         local.set $5
         global.get $assembly/internal/value/index/Actual.type
         global.get $assembly/internal/value/index/Actual.value
         global.get $assembly/internal/value/index/Actual.reference
         global.get $assembly/internal/value/index/Actual.offset
         global.get $assembly/internal/value/index/Actual.stack
         global.get $assembly/internal/value/index/Expected.type
         global.get $assembly/internal/value/index/Expected.value
         global.get $assembly/internal/value/index/Expected.reference
         global.get $assembly/internal/value/index/Expected.offset
         global.get $assembly/internal/value/index/Expected.stack
         local.get $5
         i32.load offset=8
         call $assembly/internal/test/TestResult/testFail
        end
        i32.const 0
        local.set $5
        local.get $3
        call $~lib/rt/pure/__release
        local.get $5
        br $assembly/internal/test/TestResult/TestResult#runInstance|inlined.0
       end
       i32.const 1
       local.set $5
       local.get $3
       call $~lib/rt/pure/__release
       local.get $5
      end
      i32.const 0
      i32.ne
      i32.eqz
      if
       i32.const 0
       local.set $3
       local.get $1
       call $~lib/rt/pure/__release
       local.get $3
       return
      end
      local.get $0
      i32.load8_u offset=4
      i32.const 0
      i32.ne
      i32.eqz
      if
       br $break|0
      end
      local.get $0
      i32.load offset=32
      f64.convert_i32_s
      call $assembly/internal/test/TestResult/now
      local.get $0
      f64.load offset=48
      f64.sub
      f64.le
      if
       br $break|0
      end
      br $continue|0
     end
    end
   end
  else   
   block $assembly/internal/test/TestResult/TestResult#runInstance|inlined.1 (result i32)
    local.get $0
    local.set $3
    local.get $1
    call $~lib/rt/pure/__retain
    local.set $2
    local.get $2
    call $assembly/internal/test/TestGroup/TestGroup#runBeforeEach
    i32.eqz
    if
     local.get $3
     i32.const 0
     i32.store8 offset=4
     block $assembly/internal/test/TestResult/TestResult#failTest|inlined.2
      local.get $3
      local.set $4
      global.get $assembly/internal/value/index/Actual.type
      global.get $assembly/internal/value/index/Actual.value
      global.get $assembly/internal/value/index/Actual.reference
      global.get $assembly/internal/value/index/Actual.offset
      global.get $assembly/internal/value/index/Actual.stack
      global.get $assembly/internal/value/index/Expected.type
      global.get $assembly/internal/value/index/Expected.value
      global.get $assembly/internal/value/index/Expected.reference
      global.get $assembly/internal/value/index/Expected.offset
      global.get $assembly/internal/value/index/Expected.stack
      local.get $4
      i32.load offset=8
      call $assembly/internal/test/TestResult/testFail
     end
     i32.const 0
     local.set $4
     local.get $2
     call $~lib/rt/pure/__release
     local.get $4
     br $assembly/internal/test/TestResult/TestResult#runInstance|inlined.1
    end
    call $assembly/internal/test/TestResult/now
    local.set $6
    local.get $3
    local.get $3
    i32.load offset=8
    local.get $3
    i32.load
    call $assembly/internal/test/TestResult/tryCall
    i32.const 0
    i32.ne
    i32.xor
    i32.store8 offset=4
    local.get $3
    i32.load offset=20
    call $assembly/internal/test/TestResult/now
    local.get $6
    f64.sub
    call $~lib/array/Array<f64>#push
    drop
    local.get $2
    call $assembly/internal/test/TestGroup/TestGroup#runAfterEach
    i32.eqz
    if
     local.get $3
     i32.const 0
     i32.store8 offset=4
     block $assembly/internal/test/TestResult/TestResult#failTest|inlined.3
      local.get $3
      local.set $4
      global.get $assembly/internal/value/index/Actual.type
      global.get $assembly/internal/value/index/Actual.value
      global.get $assembly/internal/value/index/Actual.reference
      global.get $assembly/internal/value/index/Actual.offset
      global.get $assembly/internal/value/index/Actual.stack
      global.get $assembly/internal/value/index/Expected.type
      global.get $assembly/internal/value/index/Expected.value
      global.get $assembly/internal/value/index/Expected.reference
      global.get $assembly/internal/value/index/Expected.offset
      global.get $assembly/internal/value/index/Expected.stack
      local.get $4
      i32.load offset=8
      call $assembly/internal/test/TestResult/testFail
     end
     i32.const 0
     local.set $4
     local.get $2
     call $~lib/rt/pure/__release
     local.get $4
     br $assembly/internal/test/TestResult/TestResult#runInstance|inlined.1
    end
    i32.const 1
    local.set $4
    local.get $2
    call $~lib/rt/pure/__release
    local.get $4
   end
   i32.const 0
   i32.ne
   i32.eqz
   if
    i32.const 0
    local.set $2
    local.get $1
    call $~lib/rt/pure/__release
    local.get $2
    return
   end
  end
  local.get $0
  i32.load8_u offset=4
  if
   local.get $0
   local.set $2
   local.get $2
   i32.load offset=20
   local.get $2
   i32.load8_u offset=24
   local.get $2
   i32.load offset=36
   local.get $2
   i32.load8_u offset=40
   local.get $2
   i32.load8_u offset=41
   local.get $2
   i32.load8_u offset=43
   local.get $2
   i32.load8_u offset=44
   local.get $2
   i32.load8_u offset=42
   local.get $2
   i32.load8_u offset=45
   local.get $2
   i32.load offset=8
   call $assembly/internal/test/TestResult/testPass
  else   
   local.get $0
   local.set $2
   global.get $assembly/internal/value/index/Actual.type
   global.get $assembly/internal/value/index/Actual.value
   global.get $assembly/internal/value/index/Actual.reference
   global.get $assembly/internal/value/index/Actual.offset
   global.get $assembly/internal/value/index/Actual.stack
   global.get $assembly/internal/value/index/Expected.type
   global.get $assembly/internal/value/index/Expected.value
   global.get $assembly/internal/value/index/Expected.reference
   global.get $assembly/internal/value/index/Expected.offset
   global.get $assembly/internal/value/index/Expected.stack
   local.get $2
   i32.load offset=8
   call $assembly/internal/test/TestResult/testFail
  end
  i32.const 1
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $assembly/internal/test/TestGroup/TestGroup#runAfterAll (; 211 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=28
  if
   local.get $0
   i32.load offset=28
   call $assembly/internal/test/TestGroup/TestGroup#runAfterAll
   i32.const 0
   i32.ne
   i32.eqz
   if
    i32.const 0
    return
   end
  end
  local.get $0
  i32.load offset=8
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $2
  call "$~lib/array/Array<() => void>#get:length"
  local.set $3
  block $break|0
   i32.const 0
   local.set $4
   loop $repeat|0
    local.get $4
    local.get $3
    i32.lt_s
    i32.eqz
    br_if $break|0
    local.get $2
    local.get $4
    call "$~lib/array/Array<() => void>#__unchecked_get"
    local.set $1
    local.get $1
    call $assembly/internal/test/TestGroup/tryCall
    i32.const 0
    i32.ne
    i32.eqz
    if
     i32.const 0
     local.set $5
     local.get $2
     call $~lib/rt/pure/__release
     local.get $5
     return
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
  i32.const 1
  local.set $4
  local.get $2
  call $~lib/rt/pure/__release
  local.get $4
 )
 (func $assembly/internal/test/TestGroup/TestGroup#run (; 212 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load
  call $assembly/internal/test/TestGroup/groupStart
  local.get $0
  i32.load offset=24
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $1
  call $~lib/array/Array<~lib/string/String>#get:length
  local.set $2
  block $break|0
   i32.const 0
   local.set $3
   loop $repeat|0
    local.get $3
    local.get $2
    i32.lt_s
    i32.eqz
    br_if $break|0
    local.get $1
    local.get $3
    call $~lib/array/Array<~lib/string/String>#__get
    local.tee $4
    call $assembly/internal/test/TestGroup/reportTodo
    local.get $4
    call $~lib/rt/pure/__release
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $assembly/internal/test/TestGroup/TestGroup#runBeforeAll
  i32.eqz
  if
   i32.const 0
   call $assembly/internal/test/TestGroup/groupEnd
   local.get $1
   call $~lib/rt/pure/__release
   return
  end
  i32.const 0
  local.set $4
  local.get $0
  i32.load offset=20
  call $~lib/rt/pure/__retain
  local.set $3
  local.get $3
  call $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#get:length
  local.set $2
  local.get $3
  i32.eqz
  if
   i32.const 3440
   i32.const 3488
   i32.const 65
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  block $break|1
   i32.const 0
   local.set $5
   loop $repeat|1
    local.get $5
    local.get $2
    i32.lt_s
    i32.eqz
    br_if $break|1
    block (result i32)
     local.get $3
     local.get $5
     call $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__get
     local.set $6
     local.get $4
     call $~lib/rt/pure/__release
     local.get $6
    end
    local.set $4
    local.get $4
    i32.eqz
    if
     i32.const 3576
     i32.const 3488
     i32.const 68
     i32.const 6
     call $~lib/builtins/abort
     unreachable
    end
    local.get $4
    local.get $0
    call $assembly/internal/test/TestResult/TestResult#run
    i32.eqz
    if
     i32.const 0
     call $assembly/internal/test/TestGroup/groupEnd
     local.get $1
     call $~lib/rt/pure/__release
     local.get $3
     call $~lib/rt/pure/__release
     local.get $4
     call $~lib/rt/pure/__release
     return
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
  local.get $0
  call $assembly/internal/test/TestGroup/TestGroup#runAfterAll
  i32.eqz
  call $assembly/internal/test/TestGroup/groupEnd
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/index/__run (; 213 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $assembly/internal/test/Collector/Collector.groups
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#get:length
  local.set $1
  i32.const 0
  local.set $2
  block $break|0
   i32.const 0
   local.set $3
   loop $repeat|0
    local.get $3
    local.get $1
    i32.lt_s
    i32.eqz
    br_if $break|0
    block (result i32)
     local.get $0
     local.get $3
     call $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__unchecked_get
     local.tee $4
     local.tee $5
     local.get $2
     local.tee $6
     i32.ne
     if
      local.get $5
      call $~lib/rt/pure/__retain
      drop
      local.get $6
      call $~lib/rt/pure/__release
     end
     local.get $5
    end
    local.set $2
    local.get $2
    call $assembly/internal/test/TestGroup/TestGroup#run
    local.get $4
    call $~lib/rt/pure/__release
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Collector/__set_performanceEnabled (; 214 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.performanceEnabledConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_maxSamples (; 215 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.set $assembly/internal/test/Collector/Collector.maxSamplesConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_maxTestRunTime (; 216 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.set $assembly/internal/test/Collector/Collector.maxTestRunTimeConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_roundDecimalPlaces (; 217 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.set $assembly/internal/test/Collector/Collector.roundDecimalPlacesConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordAverage (; 218 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordAverageConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordMedian (; 219 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordMedianConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordStdDev (; 220 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordStdDevConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordMax (; 221 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordMaxConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordMin (; 222 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordMinConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordVar (; 223 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordVarianceConfigurationValue
 )
 (func $assembly/internal/call/__call (; 224 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 225 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toHaveLength.spec
 )
 (func "$~lib/array/Array<() => void>#__visit_impl" (; 226 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<f64>#__visit_impl (; 227 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/pure/__visit (; 228 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__visit_impl (; 229 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<~lib/string/String>#__visit_impl (; 230 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__visit_impl (; 231 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<i32>#__visit_impl (; 232 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/__visit_members (; 233 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block
   end
   block $switch$1$leave
    block $switch$1$default
     block $switch$1$case$34
      block $switch$1$case$13
       block $switch$1$case$12
        block $switch$1$case$11
         block $switch$1$case$10
          block $switch$1$case$9
           block $switch$1$case$8
            block $switch$1$case$7
             block $switch$1$case$6
              block $switch$1$case$4
               block $switch$1$case$2
                local.get $0
                i32.const 8
                i32.sub
                i32.load
                br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$4 $switch$1$case$6 $switch$1$case$7 $switch$1$case$8 $switch$1$case$9 $switch$1$case$10 $switch$1$case$11 $switch$1$case$12 $switch$1$case$13 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$34 $switch$1$case$6 $switch$1$case$2 $switch$1$case$6 $switch$1$case$2 $switch$1$default
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
               local.get $0
               i32.load offset=28
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
            block
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
           call $~lib/array/Array<f64>#__visit_impl
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
         call $~lib/array/Array<~lib/string/String>#__visit_impl
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
 (func $null (; 234 ;) (type $FUNCSIG$v)
 )
)
