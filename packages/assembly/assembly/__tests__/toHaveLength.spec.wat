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
 (type $FUNCSIG$iiiiii (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $FUNCSIG$vdii (func (param f64 i32 i32)))
 (type $FUNCSIG$vdiii (func (param f64 i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "rtrace" "onalloc" (func $~lib/rt/rtrace/onalloc (param i32)))
 (import "rtrace" "onincrement" (func $~lib/rt/rtrace/onincrement (param i32)))
 (import "rtrace" "ondecrement" (func $~lib/rt/rtrace/ondecrement (param i32)))
 (import "rtrace" "onfree" (func $~lib/rt/rtrace/onfree (param i32)))
 (import "__aspect" "getStackTrace" (func $assembly/internal/report/Actual/getStackTrace (result i32)))
 (import "__aspect" "reportInvalidExpectCall" (func $assembly/internal/report/Expected/reportInvalidExpectCall))
 (import "__aspect" "getStackTrace" (func $assembly/internal/report/Expected/getStackTrace (result i32)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (import "__aspect" "reportActualArray" (func $assembly/internal/report/Actual/reportActualArray (param i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/report/Actual/reportActualFloat (param f64 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/report/Actual/reportActualInteger (param i32 i32 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/report/Actual/reportActualNull (param i32)))
 (import "__aspect" "reportActualReference" (func $assembly/internal/report/Actual/reportActualReferenceExternal (param i32 i32 i32)))
 (import "__aspect" "reportActualString" (func $assembly/internal/report/Actual/reportActualString (param i32 i32)))
 (import "__aspect" "reportActualLong" (func $assembly/internal/report/Actual/reportActualLong (param i32 i32 i32)))
 (import "__aspect" "reportActualBool" (func $assembly/internal/report/Actual/reportActualBool (param i32 i32)))
 (import "__aspect" "reportExpectedArray" (func $assembly/internal/report/Expected/reportExpectedArray (param i32 i32 i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/report/Expected/reportExpectedFloat (param f64 i32 i32 i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/report/Expected/reportExpectedInteger (param i32 i32 i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/report/Expected/reportExpectedNull (param i32 i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/report/Expected/reportExpectedReferenceExternal (param i32 i32 i32 i32)))
 (import "__aspect" "reportExpectedString" (func $assembly/internal/report/Expected/reportExpectedString (param i32 i32 i32)))
 (import "__aspect" "reportExpectedFalsy" (func $assembly/internal/report/Expected/reportExpectedFalsy (param i32 i32)))
 (import "__aspect" "reportExpectedFinite" (func $assembly/internal/report/Expected/reportExpectedFinite (param i32 i32)))
 (import "__aspect" "reportExpectedTruthy" (func $assembly/internal/report/Expected/reportExpectedTruthy (param i32 i32)))
 (import "__aspect" "reportExpectedLong" (func $assembly/internal/report/Expected/reportExpectedLong (param i32 i32 i32 i32)))
 (import "__aspect" "reportExpectedBool" (func $assembly/internal/report/Expected/reportExpectedBool (param i32 i32 i32)))
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
 (data (i32.const 872) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 992) "l\00\00\00\01\00\00\00\01\00\00\00l\00\00\00W\00h\00e\00n\00 \00l\00e\00n\00g\00t\00h\00 \00i\00s\00 \00e\00q\00u\00a\00l\00,\00 \00n\00e\00g\00a\00t\00e\00d\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1120) "Z\00\00\00\01\00\00\00\01\00\00\00Z\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00e\00r\00i\00f\00y\00 \00t\00h\00e\00 \00l\00e\00n\00g\00t\00h\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00o\00t\00h\00e\00r\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1232) "F\00\00\00\01\00\00\00\01\00\00\00F\00\00\00T\00h\00e\00 \00l\00e\00n\00g\00t\00h\00 \00o\00f\00 \00c\00r\00e\00a\00t\00e\00d\00 \00i\00s\00 \003\00,\00 \00n\00o\00t\00 \001\000\00.\00")
 (data (i32.const 1320) "R\00\00\00\01\00\00\00\01\00\00\00R\00\00\00w\00h\00e\00n\00 \00t\00h\00e\00 \00l\00e\00n\00g\00t\00h\00 \00i\00s\00 \00a\00n\00o\00t\00h\00e\00r\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 1424) "L\00\00\00\01\00\00\00\01\00\00\00L\00\00\00T\00h\00e\00 \00l\00e\00n\00g\00t\00h\00 \00o\00f\00 \00c\00r\00e\00a\00t\00e\00d\00 \00i\00s\00 \003\00,\00 \00a\00n\00d\00 \00n\00o\00t\00 \001\000\00")
 (data (i32.const 1520) "\"\00\00\00\01\00\00\00\01\00\00\00\"\00\00\00U\00i\00n\00t\008\00C\00l\00a\00m\00p\00e\00d\00A\00r\00r\00a\00y\00")
 (data (i32.const 1576) "\12\00\00\00\01\00\00\00\01\00\00\00\12\00\00\00I\00n\00t\008\00A\00r\00r\00a\00y\00")
 (data (i32.const 1616) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1656) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\001\006\00A\00r\00r\00a\00y\00")
 (data (i32.const 1696) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1736) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1776) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00U\00i\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1816) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00I\00n\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1856) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00F\00l\00o\00a\00t\003\002\00A\00r\00r\00a\00y\00")
 (data (i32.const 1896) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00F\00l\00o\00a\00t\006\004\00A\00r\00r\00a\00y\00")
 (data (i32.const 1936) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 1968) "\10\00\00\00\01\00\00\00\19\00\00\00\10\00\00\00\a0\07\00\00\a0\07\00\00\0c\00\00\00\03\00\00\00")
 (data (i32.const 2000) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00A\00r\00r\00a\00y\00s\00")
 (data (i32.const 2056) "\82\00\00\00\01\00\00\00\01\00\00\00\82\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00l\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 2208) "L\00\00\00\01\00\00\00\01\00\00\00L\00\00\00T\00h\00e\00 \00l\00e\00n\00g\00t\00h\00 \00o\00f\00 \00v\00a\00l\00u\00e\00A\00r\00r\00a\00y\00 \00i\00s\00 \003\00,\00 \00n\00o\00t\00 \001\000\00.\00")
 (data (i32.const 2304) "R\00\00\00\01\00\00\00\01\00\00\00R\00\00\00T\00h\00e\00 \00l\00e\00n\00g\00t\00h\00 \00o\00f\00 \00v\00a\00l\00u\00e\00A\00r\00r\00a\00y\00 \00i\00s\00 \003\00,\00 \00a\00n\00d\00 \00n\00o\00t\00 \001\000\00")
 (data (i32.const 2408) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00c\00u\00s\00t\00o\00m\00 \00c\00l\00a\00s\00s\00e\00s\00")
 (data (i32.const 2480) "R\00\00\00\01\00\00\00\01\00\00\00R\00\00\00T\00h\00e\00 \00l\00e\00n\00g\00t\00h\00 \00o\00f\00 \00c\00u\00s\00t\00o\00m\00E\00x\00a\00m\00p\00l\00e\00 \00i\00s\00 \003\00,\00 \00n\00o\00t\00 \001\000\00.\00")
 (data (i32.const 2584) "X\00\00\00\01\00\00\00\01\00\00\00X\00\00\00T\00h\00e\00 \00l\00e\00n\00g\00t\00h\00 \00o\00f\00 \00c\00u\00s\00t\00o\00m\00E\00x\00a\00m\00p\00l\00e\00 \00i\00s\00 \003\00,\00 \00a\00n\00d\00 \00n\00o\00t\00 \001\000\00")
 (data (i32.const 2688) "D\00\00\00\01\00\00\00\01\00\00\00D\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00")
 (data (i32.const 2776) "|\00\00\00\01\00\00\00\01\00\00\00|\00\00\00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00u\00s\00e\00d\00")
 (data (i32.const 2920) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00R\00e\00f\00e\00r\00e\00n\00c\00e\00 \00T\00y\00p\00e\00")
 (data (i32.const 2968) "\d8\00\00\00\01\00\00\00\01\00\00\00\d8\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00T\00y\00p\00e\00d\00A\00r\00r\00a\00y\00s\00,\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00,\00 \00A\00r\00r\00a\00y\00s\00,\00 \00a\00n\00d\00 \00c\00l\00a\00s\00s\00e\00s\00 \00t\00h\00a\00t\00 \00h\00a\00v\00e\00 \00a\00 \00l\00e\00n\00g\00t\00h\00 \00p\00r\00o\00p\00e\00r\00t\00y\00.\00")
 (data (i32.const 3200) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00t\00o\00H\00a\00v\00e\00L\00e\00n\00g\00t\00h\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 3320) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00")
 (data (i32.const 3360) "D\00\00\00\01\00\00\00\01\00\00\00D\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00m\00p\00a\00r\00e\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00 \00l\00e\00n\00g\00t\00h\00s\00")
 (data (i32.const 3448) "n\00\00\00\01\00\00\00\01\00\00\00n\00\00\00A\00n\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00 \00w\00i\00t\00h\00 \00l\00e\00n\00g\00t\00h\00 \001\000\000\00 \00s\00h\00o\00u\00l\00d\00 \00h\00a\00v\00e\00 \00l\00e\00n\00g\00t\00h\00 \001\000\000\00.\00")
 (data (i32.const 3576) " \00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\001\00\00\00\02\00\00\00\10\00\00\00\00\00\00\001\00\00\00\02\00\00\00\10\00\00\00\00\00\00\001\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00Q\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00Q\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\01\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\05\00\00\02\00\00\00\10\00\00\00\00\00\00\00\91\0c\00\00\02\00\00\00\10\00\00\00\00\00\00\00\11\0d\00\00\02\00\00\00\10\00\00\00\00\00\00\00\93\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93\00\00\00\02\00\00\00")
 (table $0 71 funcref)
 (elem (i32.const 0) $null $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|2 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|3 $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toHaveLength.spec~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/toHaveLength.spec~anonymous|1 $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|2 $start:assembly/__tests__/toHaveLength.spec~anonymous|3~anonymous|0 $start:assembly/__tests__/toHaveLength.spec~anonymous|3)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.type (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.signed (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.float (mut f64) (f64.const 0))
 (global $assembly/internal/report/Actual/Actual.integer (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.reference (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.offset (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.stackTrace (mut i32) (i32.const -1))
 (global $assembly/internal/report/Expected/Expected.ready (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.type (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.signed (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.float (mut f64) (f64.const 0))
 (global $assembly/internal/report/Expected/Expected.integer (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.reference (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.offset (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.negated (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.stackTrace (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 6))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/toHaveLength.spec/valueArray (mut i32) (i32.const 1984))
 (global $assembly/__tests__/toHaveLength.spec/customExample (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $assembly/internal/log/ignoreLogs (mut i32) (i32.const 0))
 (global $assembly/internal/RTrace/RTrace.enabled (mut i32) (i32.const 1))
 (global $~lib/started (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 3576))
 (global $~lib/heap/__heap_base i32 (i32.const 3836))
 (export "__start" (func $start))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__ready" (func $assembly/index/__ready))
 (export "__call" (func $assembly/internal/call/__call))
 (export "__sendActual" (func $assembly/internal/report/Actual/__sendActual))
 (export "__sendExpected" (func $assembly/internal/report/Expected/__sendExpected))
 (export "__ignoreLogs" (func $assembly/internal/log/__ignoreLogs))
 (export "__disableRTrace" (func $assembly/internal/RTrace/__disableRTrace))
 (export "__getUsizeArrayId" (func $assembly/internal/RTrace/__getUsizeArrayId))
 (export "__cleanup" (func $assembly/internal/Expectation/__cleanup))
 (func $~lib/rt/tlsf/removeBlock (; 31 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
   i32.const 277
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
   i32.const 279
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
   i32.const 292
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
  i32.eq
  if
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
   local.get $7
   i32.eqz
   if
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
    local.set $9
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
 (func $~lib/rt/tlsf/insertBlock (; 32 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
   i32.const 205
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
   i32.const 207
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
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
   local.get $1
   local.set $6
   local.get $6
   i32.const 4
   i32.sub
   i32.load
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
    i32.const 228
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
   i32.const 243
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
   i32.const 244
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
   i32.const 260
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
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
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $9
  i32.shl
  i32.or
  i32.store
  local.get $0
  local.set $13
  local.get $9
  local.set $12
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
 )
 (func $~lib/rt/tlsf/addMemory (; 33 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
   i32.const 386
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.set $3
  local.get $3
  i32.load offset=1568
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
    i32.const 396
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
    i32.const 408
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
  i32.const 16
  i32.const 1
  i32.shl
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
  local.get $0
  local.set $9
  local.get $4
  local.set $3
  local.get $9
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $8
  call $~lib/rt/tlsf/insertBlock
  i32.const 1
 )
 (func $~lib/rt/tlsf/initializeRoot (; 34 ;) (type $FUNCSIG$v)
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
  local.get $3
  local.set $5
  i32.const 0
  local.set $4
  local.get $5
  local.get $4
  i32.store offset=1568
  block $break|0
   i32.const 0
   local.set $5
   loop $loop|0
    local.get $5
    i32.const 23
    i32.lt_u
    i32.eqz
    br_if $break|0
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
    block $break|1
     i32.const 0
     local.set $7
     loop $loop|1
      local.get $7
      i32.const 16
      i32.lt_u
      i32.eqz
      br_if $break|1
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
      local.get $7
      i32.const 1
      i32.add
      local.set $7
      br $loop|1
     end
     unreachable
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $loop|0
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
 (func $~lib/rt/tlsf/prepareSize (; 35 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741808
  i32.ge_u
  if
   i32.const 72
   i32.const 24
   i32.const 457
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
 (func $~lib/rt/tlsf/searchBlock (; 36 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
   i32.const 338
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
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
    local.set $6
    local.get $6
    i32.eqz
    if
     i32.const 0
     i32.const 24
     i32.const 351
     i32.const 17
     call $~lib/builtins/abort
     unreachable
    end
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
    local.set $7
   end
  else   
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
   local.set $7
  end
  local.get $7
 )
 (func $~lib/rt/tlsf/growMemory (; 37 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $1
  i32.const 536870904
  i32.lt_u
  if
   local.get $1
   i32.const 1
   i32.const 27
   local.get $1
   i32.clz
   i32.sub
   i32.shl
   i32.const 1
   i32.sub
   i32.add
   local.set $1
  end
  memory.size
  local.set $2
  local.get $1
  i32.const 16
  local.get $2
  i32.const 16
  i32.shl
  i32.const 16
  i32.sub
  local.get $0
  local.set $3
  local.get $3
  i32.load offset=1568
  i32.ne
  i32.shl
  i32.add
  local.set $1
  local.get $1
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $4
  local.get $2
  local.tee $3
  local.get $4
  local.tee $5
  local.get $3
  local.get $5
  i32.gt_s
  select
  local.set $6
  local.get $6
  memory.grow
  i32.const 0
  i32.lt_s
  if
   local.get $4
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
 (func $~lib/rt/tlsf/prepareBlock (; 38 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
   i32.const 365
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
   i32.load
   i32.const 2
   i32.const -1
   i32.xor
   i32.and
   i32.store
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (; 39 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 487
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $3
  i32.load
  i32.const -4
  i32.and
  local.get $2
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 489
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
  call $~lib/rt/rtrace/onalloc
  local.get $3
 )
 (func $~lib/rt/tlsf/__alloc (; 40 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/pure/increment (; 41 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const -268435456
  i32.and
  local.get $1
  i32.const 1
  i32.add
  i32.const -268435456
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
  call $~lib/rt/rtrace/onincrement
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
 (func $~lib/rt/pure/__retain (; 42 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/freeBlock (; 43 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
   i32.const 546
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
  local.get $1
  call $~lib/rt/rtrace/onfree
 )
 (func $~lib/rt/__typeinfo (; 44 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/memory/memcpy (; 45 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
    i32.eqz
    br_if $break|0
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
    i32.load8_u
    i32.store8
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    br $continue|0
   end
   unreachable
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
     i32.eqz
     br_if $break|1
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
    unreachable
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
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
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
      local.get $1
      i32.load
      local.set $3
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
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
        i32.eqz
        br_if $break|3
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
       unreachable
      end
      br $break|2
     end
     local.get $1
     i32.load
     local.set $3
     local.get $0
     local.tee $5
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     local.get $1
     local.tee $5
     i32.const 1
     i32.add
     local.set $1
     local.get $5
     i32.load8_u
     i32.store8
     local.get $0
     local.tee $5
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     local.get $1
     local.tee $5
     i32.const 1
     i32.add
     local.set $1
     local.get $5
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
       i32.eqz
       br_if $break|4
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
      unreachable
     end
     br $break|2
    end
    local.get $1
    i32.load
    local.set $3
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
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
      i32.eqz
      br_if $break|5
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
     unreachable
    end
    br $break|2
   end
  end
  local.get $2
  i32.const 16
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 8
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 4
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 2
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
 )
 (func $~lib/memory/memory.copy (; 46 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
       i32.eqz
       br_if $break|0
       local.get $3
       i32.eqz
       if
        br $~lib/util/memory/memmove|inlined.0
       end
       local.get $3
       i32.const 1
       i32.sub
       local.set $3
       local.get $5
       local.tee $6
       i32.const 1
       i32.add
       local.set $5
       local.get $6
       local.get $4
       local.tee $6
       i32.const 1
       i32.add
       local.set $4
       local.get $6
       i32.load8_u
       i32.store8
       br $continue|0
      end
      unreachable
     end
     block $break|1
      loop $continue|1
       local.get $3
       i32.const 8
       i32.ge_u
       i32.eqz
       br_if $break|1
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
      unreachable
     end
    end
    block $break|2
     loop $continue|2
      local.get $3
      i32.eqz
      br_if $break|2
      local.get $5
      local.tee $6
      i32.const 1
      i32.add
      local.set $5
      local.get $6
      local.get $4
      local.tee $6
      i32.const 1
      i32.add
      local.set $4
      local.get $6
      i32.load8_u
      i32.store8
      local.get $3
      i32.const 1
      i32.sub
      local.set $3
      br $continue|2
     end
     unreachable
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
       i32.eqz
       br_if $break|3
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
      unreachable
     end
     block $break|4
      loop $continue|4
       local.get $3
       i32.const 8
       i32.ge_u
       i32.eqz
       br_if $break|4
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
      unreachable
     end
    end
    block $break|5
     loop $continue|5
      local.get $3
      i32.eqz
      br_if $break|5
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
     unreachable
    end
   end
  end
 )
 (func $~lib/rt/tlsf/__free (; 47 ;) (type $FUNCSIG$vi) (param $0 i32)
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 576
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
   i32.const 577
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
 (func $~lib/rt/pure/growRoots (; 48 ;) (type $FUNCSIG$v)
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
  i32.const 16
  i32.sub
  call $~lib/rt/rtrace/onfree
  local.get $5
  local.get $0
  local.get $1
  call $~lib/memory/memory.copy
  local.get $0
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/rtrace/onalloc
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
 (func $~lib/rt/pure/appendRoot (; 49 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/decrement (; 50 ;) (type $FUNCSIG$vi) (param $0 i32)
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
  call $~lib/rt/rtrace/ondecrement
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
 (func $~lib/rt/pure/__release (; 51 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/markGray (; 52 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scanBlack (; 53 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scan (; 54 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/collectWhite (; 55 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__collect (; 56 ;) (type $FUNCSIG$v)
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
   local.get $1
   local.set $2
   global.get $~lib/rt/pure/CUR
   local.set $3
   loop $loop|0
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
    br $loop|0
   end
   unreachable
  end
  local.get $1
  global.set $~lib/rt/pure/CUR
  block $break|1
   local.get $0
   local.set $5
   loop $loop|1
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
    br $loop|1
   end
   unreachable
  end
  block $break|2
   local.get $0
   local.set $5
   loop $loop|2
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
    br $loop|2
   end
   unreachable
  end
  local.get $0
  global.set $~lib/rt/pure/CUR
 )
 (func $~lib/string/String#get:length (; 57 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/string/String#concat (; 58 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/string/String.__concat (; 59 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/memory/memory.fill (; 60 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
     i32.eqz
     br_if $break|0
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
    unreachable
   end
  end
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 61 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
  local.get $3
  i32.const 0
  local.get $1
  call $~lib/memory/memory.fill
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
  local.tee $4
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
  i32.store
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#constructor (; 62 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#__set (; 63 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 131
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#constructor (; 64 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array> (; 65 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint8Array> (; 66 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint8Array> (; 67 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (; 68 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/typedarray/Uint8Array#get:length (; 69 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/internal/report/Actual/Actual.report<i32> (; 70 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  i32.const 3
  global.set $assembly/internal/report/Actual/Actual.type
  local.get $0
  drop
  i32.const 1
  if (result i32)
   i32.const 1
  else   
   local.get $0
   drop
   i32.const 0
  end
  if (result i32)
   i32.const 1
  else   
   local.get $0
   drop
   i32.const 0
  end
  global.set $assembly/internal/report/Actual/Actual.signed
  local.get $0
  global.set $assembly/internal/report/Actual/Actual.integer
 )
 (func $assembly/internal/report/Expected/Expected.report<i32> (; 71 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  i32.const 3
  global.set $assembly/internal/report/Expected/Expected.type
  local.get $0
  drop
  i32.const 1
  if (result i32)
   i32.const 1
  else   
   local.get $0
   drop
   i32.const 0
  end
  if (result i32)
   i32.const 1
  else   
   local.get $0
   drop
   i32.const 0
  end
  global.set $assembly/internal/report/Expected/Expected.signed
  local.get $0
  global.set $assembly/internal/report/Expected/Expected.integer
 )
 (func $assembly/internal/report/Actual/Actual.clear (; 72 ;) (type $FUNCSIG$v)
  i32.const 0
  global.set $assembly/internal/report/Actual/Actual.type
  global.get $assembly/internal/report/Actual/Actual.reference
  i32.const 0
  i32.gt_u
  if
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   i32.const 0
   global.set $assembly/internal/report/Actual/Actual.reference
  end
  i32.const -1
  global.set $assembly/internal/report/Actual/Actual.stackTrace
 )
 (func $assembly/internal/report/Expected/Expected.clear (; 73 ;) (type $FUNCSIG$v)
  i32.const 0
  global.set $assembly/internal/report/Expected/Expected.type
  global.get $assembly/internal/report/Expected/Expected.reference
  i32.const 0
  i32.gt_u
  if
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   i32.const 0
   global.set $assembly/internal/report/Expected/Expected.reference
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength (; 74 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint8Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint8Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Uint8Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|0 (; 75 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/it (; 76 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not (; 77 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|1 (; 78 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/throws (; 79 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|2 (; 80 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0~anonymous|3 (; 81 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>~anonymous|0 (; 82 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 2
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 4
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 83 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 84 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8> (; 85 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 5
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint8ClampedArray#constructor (; 86 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint8ClampedArray#__set (; 87 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 229
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#constructor (; 88 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray> (; 89 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint8ClampedArray> (; 90 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint8ClampedArray> (; 91 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint8ClampedArray#get:length (; 92 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength (; 93 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint8ClampedArray>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint8ClampedArray>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Uint8ClampedArray#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|0 (; 94 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not (; 95 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|1 (; 96 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|2 (; 97 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0~anonymous|3 (; 98 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint8ClampedArray>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint8ClampedArray>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>~anonymous|0 (; 99 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 8
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 10
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8> (; 100 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 11
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int8Array#constructor (; 101 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int8Array#__set (; 102 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#constructor (; 103 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array> (; 104 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Int8Array> (; 105 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Int8Array> (; 106 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int8Array#get:length (; 107 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength (; 108 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Int8Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Int8Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Int8Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|0 (; 109 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not (; 110 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|1 (; 111 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|2 (; 112 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0~anonymous|3 (; 113 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int8Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int8Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>~anonymous|0 (; 114 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 12
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 13
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 14
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 15
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8> (; 115 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Uint16Array#constructor (; 116 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint16Array#__set (; 117 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 425
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#constructor (; 118 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array> (; 119 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint16Array> (; 120 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint16Array> (; 121 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint16Array#get:length (; 122 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength (; 123 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint16Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint16Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Uint16Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|0 (; 124 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not (; 125 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|1 (; 126 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|2 (; 127 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0~anonymous|3 (; 128 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint16Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint16Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>~anonymous|0 (; 129 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 18
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 19
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 20
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16> (; 130 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 21
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int16Array#constructor (; 131 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int16Array#__set (; 132 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 327
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#constructor (; 133 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array> (; 134 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Int16Array> (; 135 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Int16Array> (; 136 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int16Array#get:length (; 137 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 1
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength (; 138 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Int16Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Int16Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Int16Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|0 (; 139 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not (; 140 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|1 (; 141 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|2 (; 142 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0~anonymous|3 (; 143 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int16Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int16Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>~anonymous|0 (; 144 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 22
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 23
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 24
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 25
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16> (; 145 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 26
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint32Array#constructor (; 146 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint32Array#__set (; 147 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 621
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#constructor (; 148 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array> (; 149 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint32Array> (; 150 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint32Array> (; 151 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint32Array#get:length (; 152 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength (; 153 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint32Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint32Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Uint32Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|0 (; 154 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not (; 155 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|1 (; 156 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|2 (; 157 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0~anonymous|3 (; 158 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint32Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>~anonymous|0 (; 159 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 27
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 28
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 29
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 30
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32> (; 160 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/typedarray/Int32Array#constructor (; 161 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int32Array#__set (; 162 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 523
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#constructor (; 163 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array> (; 164 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Int32Array> (; 165 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Int32Array> (; 166 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int32Array#get:length (; 167 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength (; 168 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Int32Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Int32Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Int32Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|0 (; 169 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not (; 170 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|1 (; 171 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|2 (; 172 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0~anonymous|3 (; 173 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int32Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>~anonymous|0 (; 174 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 32
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 33
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 34
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 35
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32> (; 175 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 36
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint64Array#constructor (; 176 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint64Array#__set (; 177 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 817
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#constructor (; 178 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array> (; 179 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint64Array> (; 180 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint64Array> (; 181 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Uint64Array#get:length (; 182 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength (; 183 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Uint64Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Uint64Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Uint64Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|0 (; 184 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not (; 185 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|1 (; 186 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|2 (; 187 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0~anonymous|3 (; 188 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Uint64Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Uint64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>~anonymous|0 (; 189 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 37
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 38
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 39
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 40
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64> (; 190 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 41
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int64Array#constructor (; 191 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Int64Array#__set (; 192 ;) (type $FUNCSIG$viij) (param $0 i32) (param $1 i32) (param $2 i64)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 719
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#constructor (; 193 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array> (; 194 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Int64Array> (; 195 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Int64Array> (; 196 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Int64Array#get:length (; 197 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength (; 198 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Int64Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Int64Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Int64Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|0 (; 199 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not (; 200 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|1 (; 201 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|2 (; 202 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0~anonymous|3 (; 203 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Int64Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Int64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>~anonymous|0 (; 204 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 42
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 43
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 44
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 45
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64> (; 205 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 46
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float32Array#constructor (; 206 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Float32Array#__set (; 207 ;) (type $FUNCSIG$viif) (param $0 i32) (param $1 i32) (param $2 f32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 915
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#constructor (; 208 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array> (; 209 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Float32Array> (; 210 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Float32Array> (; 211 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float32Array#get:length (; 212 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 2
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength (; 213 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Float32Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Float32Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Float32Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|0 (; 214 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not (; 215 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|1 (; 216 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|2 (; 217 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0~anonymous|3 (; 218 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Float32Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float32Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>~anonymous|0 (; 219 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 47
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 48
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 49
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 50
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32> (; 220 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 51
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float64Array#constructor (; 221 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Float64Array#__set (; 222 ;) (type $FUNCSIG$viid) (param $0 i32) (param $1 i32) (param $2 f64)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.shr_u
  i32.ge_u
  if
   i32.const 176
   i32.const 616
   i32.const 1013
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
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#constructor (; 223 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array> (; 224 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Float64Array> (; 225 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Float64Array> (; 226 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/typedarray/Float64Array#get:length (; 227 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  i32.const 3
  i32.shr_u
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength (; 228 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/typedarray/Float64Array>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/typedarray/Float64Array>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/typedarray/Float64Array#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|0 (; 229 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not (; 230 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|1 (; 231 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|2 (; 232 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#get:not
  local.tee $0
  i32.const 10
  i32.const 1248
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0~anonymous|3 (; 233 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  local.set $3
  local.get $3
  call $assembly/internal/Expectation/expect<~lib/typedarray/Float64Array>
  local.tee $1
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/typedarray/Float64Array>#toHaveLength
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>~anonymous|0 (; 234 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 52
  call $assembly/internal/Test/it
  i32.const 888
  i32.const 53
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 54
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 55
  i32.const 1440
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64> (; 235 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 312
  local.get $0
  call $~lib/string/String.__concat
  local.tee $1
  i32.const 56
  call $assembly/internal/Describe/describe
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 236 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/array/Array<i32>> (; 237 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<~lib/array/Array<i32>> (; 238 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 6
   global.set $assembly/internal/report/Actual/Actual.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/array/Array<i32>> (; 239 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 6
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<i32>#get:length (; 240 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength (; 241 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/array/Array<i32>>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/array/Array<i32>>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/array/Array<i32>#get:length
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|0 (; 242 ;) (type $FUNCSIG$v)
  (local $0 i32)
  global.get $assembly/__tests__/toHaveLength.spec/valueArray
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 243 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|1 (; 244 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toHaveLength.spec/valueArray
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|2 (; 245 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toHaveLength.spec/valueArray
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.tee $1
  i32.const 10
  i32.const 2224
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0~anonymous|3 (; 246 ;) (type $FUNCSIG$v)
  (local $0 i32)
  global.get $assembly/__tests__/toHaveLength.spec/valueArray
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|0 (; 247 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 57
  call $assembly/internal/Test/it
  i32.const 2072
  i32.const 58
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 59
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 60
  i32.const 2320
  call $assembly/internal/Test/throws
 )
 (func $assembly/__tests__/toHaveLength.spec/Example#constructor (; 248 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#constructor (; 249 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example> (; 250 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/report/Actual/Actual.report<assembly/__tests__/toHaveLength.spec/Example> (; 251 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 4
   global.set $assembly/internal/report/Actual/Actual.type
   i32.const 4
   global.set $assembly/internal/report/Actual/Actual.offset
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<assembly/__tests__/toHaveLength.spec/Example> (; 252 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 4
   global.set $assembly/internal/report/Expected/Expected.type
   i32.const 4
   global.set $assembly/internal/report/Expected/Expected.offset
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength (; 253 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<assembly/__tests__/toHaveLength.spec/Example>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<assembly/__tests__/toHaveLength.spec/Example>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   i32.load
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|0 (; 254 ;) (type $FUNCSIG$v)
  (local $0 i32)
  global.get $assembly/__tests__/toHaveLength.spec/customExample
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not (; 255 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|1 (; 256 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toHaveLength.spec/customExample
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
  local.tee $1
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|2 (; 257 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toHaveLength.spec/customExample
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#get:not
  local.tee $1
  i32.const 10
  i32.const 2496
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1~anonymous|3 (; 258 ;) (type $FUNCSIG$v)
  (local $0 i32)
  global.get $assembly/__tests__/toHaveLength.spec/customExample
  call $assembly/internal/Expectation/expect<assembly/__tests__/toHaveLength.spec/Example>
  local.tee $0
  i32.const 10
  i32.const 416
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/toHaveLength.spec/Example>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|1 (; 259 ;) (type $FUNCSIG$v)
  i32.const 432
  i32.const 62
  call $assembly/internal/Test/it
  i32.const 2072
  i32.const 63
  i32.const 1008
  call $assembly/internal/Test/throws
  i32.const 1136
  i32.const 64
  call $assembly/internal/Test/it
  i32.const 1336
  i32.const 65
  i32.const 2600
  call $assembly/internal/Test/throws
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 260 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.get $1
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<i32> (; 261 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $~lib/util/string/compareImpl (; 262 ;) (type $FUNCSIG$iiiiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
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
    i32.eqz
    br_if $break|0
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
    br $continue|0
   end
   unreachable
  end
  local.get $5
  local.set $8
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $8
 )
 (func $~lib/string/String.__eq (; 263 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  local.get $1
  i32.eq
  if
   i32.const 1
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
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
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $0
  call $~lib/string/String#get:length
  local.set $3
  local.get $3
  local.get $1
  call $~lib/string/String#get:length
  i32.ne
  if
   i32.const 0
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $0
  i32.const 0
  local.get $1
  i32.const 0
  local.get $3
  call $~lib/util/string/compareImpl
  i32.eqz
  local.set $2
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/string/String> (; 264 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 5
   global.set $assembly/internal/report/Expected/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<i32>#toHaveLength (; 265 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  call $assembly/internal/report/Actual/Actual.report<i32>
  i32.const 2936
  i32.const 0
  call $assembly/internal/report/Expected/Expected.report<~lib/string/String>
  i32.const 0
  local.set $9
  i32.const 2984
  call $~lib/rt/pure/__retain
  local.set $8
  local.get $9
  i32.eqz
  if
   local.get $8
   call $~lib/rt/pure/__release
   local.get $8
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $8
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2~anonymous|0 (; 266 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 3
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  i32.const 3
  i32.const 416
  call $assembly/internal/Expectation/Expectation<i32>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|2 (; 267 ;) (type $FUNCSIG$v)
  i32.const 2792
  i32.const 67
  i32.const 3216
  call $assembly/internal/Test/throws
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 268 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.const 1073741808
  i32.gt_u
  if
   i32.const 512
   i32.const 560
   i32.const 57
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $2
  local.get $2
  i32.const 0
  local.get $1
  call $~lib/memory/memory.fill
  local.get $2
  call $~lib/rt/pure/__retain
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor (; 269 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
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
  local.tee $2
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
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer> (; 270 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 271 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $assembly/internal/report/Actual/Actual.report<~lib/arraybuffer/ArrayBuffer> (; 272 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Actual/Actual.type
  else   
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
   local.get $1
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 4
   global.set $assembly/internal/report/Actual/Actual.type
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $2
   local.get $2
   call $~lib/arraybuffer/ArrayBuffer#get:byteLength
   global.set $assembly/internal/report/Actual/Actual.offset
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/arraybuffer/ArrayBuffer> (; 273 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/report/Expected/reportInvalidExpectCall
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  call $assembly/internal/report/Expected/getStackTrace
  global.set $assembly/internal/report/Expected/Expected.stackTrace
  local.get $1
  global.set $assembly/internal/report/Expected/Expected.negated
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   global.set $assembly/internal/report/Expected/Expected.type
  else   
   local.get $0
   local.set $2
   local.get $2
   call $~lib/rt/pure/__retain
   drop
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
   local.get $2
   global.set $assembly/internal/report/Expected/Expected.reference
   local.get $0
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 4
   global.set $assembly/internal/report/Expected/Expected.type
   local.get $3
   call $~lib/arraybuffer/ArrayBuffer#get:byteLength
   global.set $assembly/internal/report/Expected/Expected.offset
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toHaveLength (; 274 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $6
  local.get $1
  local.set $5
  local.get $0
  i32.load
  local.set $4
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  local.set $7
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $6
   call $~lib/rt/pure/__retain
   local.set $10
   i32.const 1
   local.set $9
   i32.const 672
   call $~lib/rt/pure/__retain
   local.set $8
   local.get $10
   call $assembly/internal/report/Actual/Actual.report<~lib/arraybuffer/ArrayBuffer>
   i32.const 0
   local.get $9
   call $assembly/internal/report/Expected/Expected.report<~lib/arraybuffer/ArrayBuffer>
   local.get $9
   local.get $10
   i32.const 0
   i32.eq
   i32.xor
   local.set $12
   local.get $8
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $12
   i32.eqz
   if
    local.get $11
    call $~lib/rt/pure/__release
    local.get $11
    i32.const 792
    i32.const 11
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $11
   call $~lib/rt/pure/__release
   local.get $8
   call $~lib/rt/pure/__release
   local.get $10
   call $~lib/rt/pure/__release
  else   
   local.get $6
   call $~lib/arraybuffer/ArrayBuffer#get:byteLength
   local.set $7
  end
  local.get $7
  call $assembly/internal/report/Actual/Actual.report<i32>
  local.get $5
  local.get $4
  call $assembly/internal/report/Expected/Expected.report<i32>
  local.get $4
  local.get $7
  local.get $5
  i32.eq
  i32.xor
  local.set $12
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $11
  local.get $12
  i32.eqz
  if
   local.get $11
   call $~lib/rt/pure/__release
   local.get $11
   i32.const 792
   i32.const 11
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $11
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|3~anonymous|0 (; 275 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  i32.const 100
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
  local.tee $1
  i32.const 100
  i32.const 3464
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toHaveLength
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toHaveLength.spec~anonymous|3 (; 276 ;) (type $FUNCSIG$v)
  i32.const 3376
  i32.const 69
  call $assembly/internal/Test/it
 )
 (func $start:assembly/__tests__/toHaveLength.spec (; 277 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 272
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8Array,u8>
  i32.const 1536
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint8ClampedArray,u8>
  i32.const 1592
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int8Array,i8>
  i32.const 1632
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint16Array,u16>
  i32.const 1672
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int16Array,i16>
  i32.const 1712
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint32Array,u32>
  i32.const 1752
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int32Array,i32>
  i32.const 1792
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Uint64Array,u64>
  i32.const 1832
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Int64Array,i64>
  i32.const 1872
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float32Array,f32>
  i32.const 1912
  call $assembly/__tests__/toHaveLength.spec/runTypedArrayTest<~lib/typedarray/Float64Array,f64>
  i32.const 2016
  i32.const 61
  call $assembly/internal/Describe/describe
  i32.const 0
  call $assembly/__tests__/toHaveLength.spec/Example#constructor
  global.set $assembly/__tests__/toHaveLength.spec/customExample
  i32.const 2424
  i32.const 66
  call $assembly/internal/Describe/describe
  i32.const 2704
  i32.const 68
  call $assembly/internal/Describe/describe
  i32.const 3336
  i32.const 70
  call $assembly/internal/Describe/describe
 )
 (func $assembly/index/__ready (; 278 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/internal/report/Expected/Expected.ready
 )
 (func $assembly/internal/call/__call (; 279 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $assembly/internal/report/Actual/__sendActual (; 280 ;) (type $FUNCSIG$v)
  (local $0 i32)
  block $break|0
   block $case8|0
    block $case7|0
     block $case6|0
      block $case5|0
       block $case4|0
        block $case3|0
         block $case2|0
          block $case1|0
           block $case0|0
            global.get $assembly/internal/report/Actual/Actual.type
            local.set $0
            local.get $0
            i32.const 0
            i32.eq
            br_if $case0|0
            local.get $0
            i32.const 6
            i32.eq
            br_if $case1|0
            local.get $0
            i32.const 2
            i32.eq
            br_if $case2|0
            local.get $0
            i32.const 3
            i32.eq
            br_if $case3|0
            local.get $0
            i32.const 1
            i32.eq
            br_if $case4|0
            local.get $0
            i32.const 4
            i32.eq
            br_if $case5|0
            local.get $0
            i32.const 5
            i32.eq
            br_if $case6|0
            local.get $0
            i32.const 10
            i32.eq
            br_if $case7|0
            local.get $0
            i32.const 11
            i32.eq
            br_if $case8|0
            br $break|0
           end
           return
          end
          global.get $assembly/internal/report/Actual/Actual.reference
          global.get $assembly/internal/report/Actual/Actual.stackTrace
          call $assembly/internal/report/Actual/reportActualArray
          br $break|0
         end
         global.get $assembly/internal/report/Actual/Actual.float
         i32.const 1
         global.get $assembly/internal/report/Actual/Actual.stackTrace
         call $assembly/internal/report/Actual/reportActualFloat
         br $break|0
        end
        global.get $assembly/internal/report/Actual/Actual.integer
        global.get $assembly/internal/report/Actual/Actual.signed
        global.get $assembly/internal/report/Actual/Actual.stackTrace
        call $assembly/internal/report/Actual/reportActualInteger
        br $break|0
       end
       global.get $assembly/internal/report/Actual/Actual.stackTrace
       call $assembly/internal/report/Actual/reportActualNull
       br $break|0
      end
      global.get $assembly/internal/report/Actual/Actual.reference
      global.get $assembly/internal/report/Actual/Actual.offset
      global.get $assembly/internal/report/Actual/Actual.stackTrace
      call $assembly/internal/report/Actual/reportActualReferenceExternal
      br $break|0
     end
     global.get $assembly/internal/report/Actual/Actual.reference
     global.get $assembly/internal/report/Actual/Actual.stackTrace
     call $assembly/internal/report/Actual/reportActualString
     br $break|0
    end
    global.get $assembly/internal/report/Actual/Actual.reference
    global.get $assembly/internal/report/Actual/Actual.signed
    global.get $assembly/internal/report/Actual/Actual.stackTrace
    call $assembly/internal/report/Actual/reportActualLong
    br $break|0
   end
   global.get $assembly/internal/report/Actual/Actual.integer
   global.get $assembly/internal/report/Actual/Actual.stackTrace
   call $assembly/internal/report/Actual/reportActualBool
   br $break|0
  end
 )
 (func $assembly/internal/report/Expected/__sendExpected (; 281 ;) (type $FUNCSIG$v)
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
              global.get $assembly/internal/report/Expected/Expected.type
              local.set $0
              local.get $0
              i32.const 6
              i32.eq
              br_if $case0|0
              local.get $0
              i32.const 2
              i32.eq
              br_if $case1|0
              local.get $0
              i32.const 3
              i32.eq
              br_if $case2|0
              local.get $0
              i32.const 1
              i32.eq
              br_if $case3|0
              local.get $0
              i32.const 4
              i32.eq
              br_if $case4|0
              local.get $0
              i32.const 5
              i32.eq
              br_if $case5|0
              local.get $0
              i32.const 7
              i32.eq
              br_if $case6|0
              local.get $0
              i32.const 9
              i32.eq
              br_if $case7|0
              local.get $0
              i32.const 8
              i32.eq
              br_if $case8|0
              local.get $0
              i32.const 10
              i32.eq
              br_if $case9|0
              local.get $0
              i32.const 11
              i32.eq
              br_if $case10|0
              br $break|0
             end
             global.get $assembly/internal/report/Expected/Expected.reference
             global.get $assembly/internal/report/Expected/Expected.negated
             global.get $assembly/internal/report/Expected/Expected.stackTrace
             call $assembly/internal/report/Expected/reportExpectedArray
             br $break|0
            end
            global.get $assembly/internal/report/Expected/Expected.float
            i32.const 1
            global.get $assembly/internal/report/Expected/Expected.negated
            global.get $assembly/internal/report/Expected/Expected.stackTrace
            call $assembly/internal/report/Expected/reportExpectedFloat
            br $break|0
           end
           global.get $assembly/internal/report/Expected/Expected.integer
           global.get $assembly/internal/report/Expected/Expected.signed
           global.get $assembly/internal/report/Expected/Expected.negated
           global.get $assembly/internal/report/Expected/Expected.stackTrace
           call $assembly/internal/report/Expected/reportExpectedInteger
           br $break|0
          end
          global.get $assembly/internal/report/Expected/Expected.negated
          global.get $assembly/internal/report/Expected/Expected.stackTrace
          call $assembly/internal/report/Expected/reportExpectedNull
          br $break|0
         end
         global.get $assembly/internal/report/Expected/Expected.reference
         global.get $assembly/internal/report/Expected/Expected.offset
         global.get $assembly/internal/report/Expected/Expected.negated
         global.get $assembly/internal/report/Expected/Expected.stackTrace
         call $assembly/internal/report/Expected/reportExpectedReferenceExternal
         br $break|0
        end
        global.get $assembly/internal/report/Expected/Expected.reference
        global.get $assembly/internal/report/Expected/Expected.negated
        global.get $assembly/internal/report/Expected/Expected.stackTrace
        call $assembly/internal/report/Expected/reportExpectedString
        br $break|0
       end
       global.get $assembly/internal/report/Expected/Expected.negated
       global.get $assembly/internal/report/Expected/Expected.stackTrace
       call $assembly/internal/report/Expected/reportExpectedFalsy
       br $break|0
      end
      global.get $assembly/internal/report/Expected/Expected.negated
      global.get $assembly/internal/report/Expected/Expected.stackTrace
      call $assembly/internal/report/Expected/reportExpectedFinite
      br $break|0
     end
     global.get $assembly/internal/report/Expected/Expected.negated
     global.get $assembly/internal/report/Expected/Expected.stackTrace
     call $assembly/internal/report/Expected/reportExpectedTruthy
     br $break|0
    end
    global.get $assembly/internal/report/Expected/Expected.reference
    global.get $assembly/internal/report/Expected/Expected.signed
    global.get $assembly/internal/report/Expected/Expected.negated
    global.get $assembly/internal/report/Expected/Expected.stackTrace
    call $assembly/internal/report/Expected/reportExpectedLong
    br $break|0
   end
   global.get $assembly/internal/report/Expected/Expected.integer
   global.get $assembly/internal/report/Expected/Expected.negated
   global.get $assembly/internal/report/Expected/Expected.stackTrace
   call $assembly/internal/report/Expected/reportExpectedBool
   br $break|0
  end
 )
 (func $assembly/internal/log/__ignoreLogs (; 282 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/log/ignoreLogs
 )
 (func $assembly/internal/RTrace/__disableRTrace (; 283 ;) (type $FUNCSIG$v)
  i32.const 0
  global.set $assembly/internal/RTrace/RTrace.enabled
 )
 (func $assembly/internal/RTrace/__getUsizeArrayId (; 284 ;) (type $FUNCSIG$i) (result i32)
  i32.const 31
 )
 (func $assembly/internal/Expectation/__cleanup (; 285 ;) (type $FUNCSIG$v)
  call $assembly/internal/report/Expected/Expected.clear
  call $assembly/internal/report/Actual/Actual.clear
 )
 (func $start (; 286 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  if
   return
  else   
   i32.const 1
   global.set $~lib/started
  end
  call $start:assembly/__tests__/toHaveLength.spec
 )
 (func $~lib/array/Array<i32>#__visit_impl (; 287 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<usize>#__visit_impl (; 288 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/pure/__visit (; 289 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
        local.get $2
        call $~lib/rt/pure/decrement
        br $break|0
       end
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
      end
      local.get $2
      call $~lib/rt/pure/scan
      br $break|0
     end
     local.get $2
     i32.load offset=4
     local.set $3
     local.get $3
     i32.const -268435456
     i32.and
     local.get $3
     i32.const 1
     i32.add
     i32.const -268435456
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
    end
    local.get $2
    call $~lib/rt/pure/collectWhite
    br $break|0
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
 (func $~lib/rt/__visit_members (; 290 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block $switch$1$default
    block $switch$1$case$33
     block $switch$1$case$27
      block $switch$1$case$6
       block $switch$1$case$4
        block $switch$1$case$2
         local.get $0
         i32.const 8
         i32.sub
         i32.load
         br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$4 $switch$1$case$6 $switch$1$case$27 $switch$1$case$6 $switch$1$case$2 $switch$1$case$6 $switch$1$case$2 $switch$1$case$6 $switch$1$case$33 $switch$1$default
        end
        return
       end
       br $block$4$break
      end
      local.get $0
      i32.load offset=4
      local.tee $2
      if
       local.get $2
       local.get $1
       call $~lib/rt/pure/__visit
      end
      return
     end
     local.get $0
     local.get $1
     call $~lib/array/Array<i32>#__visit_impl
     br $block$4$break
    end
    local.get $0
    local.get $1
    call $~lib/array/Array<usize>#__visit_impl
    br $block$4$break
   end
   unreachable
  end
  local.get $0
  i32.load
  local.tee $2
  if
   local.get $2
   local.get $1
   call $~lib/rt/pure/__visit
  end
  return
 )
 (func $null (; 291 ;) (type $FUNCSIG$v)
 )
)
