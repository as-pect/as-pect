(module
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (type $FUNCSIG$iiiii (func (param i32 i32 i32 i32) (result i32)))
 (type $FUNCSIG$iiiiii (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $FUNCSIG$vdi (func (param f64 i32)))
 (type $FUNCSIG$vdii (func (param f64 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "rtrace" "onalloc" (func $~lib/rt/rtrace/onalloc (param i32)))
 (import "rtrace" "onincrement" (func $~lib/rt/rtrace/onincrement (param i32)))
 (import "rtrace" "ondecrement" (func $~lib/rt/rtrace/ondecrement (param i32)))
 (import "rtrace" "onfree" (func $~lib/rt/rtrace/onfree (param i32)))
 (import "__aspect" "reportInvalidExpectCall" (func $assembly/internal/report/reportExpected/reportInvalidExpectCall))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (import "__aspect" "reportActualArray" (func $assembly/internal/report/reportActual/reportActualArray (param i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/report/reportActual/reportActualFloat (param f64 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/report/reportActual/reportActualInteger (param i32 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/report/reportActual/reportActualNull))
 (import "__aspect" "reportActualReference" (func $assembly/internal/report/reportActual/reportActualReferenceExternal (param i32 i32)))
 (import "__aspect" "reportActualString" (func $assembly/internal/report/reportActual/reportActualString (param i32)))
 (import "__aspect" "reportActualLong" (func $assembly/internal/report/reportActual/reportActualLong (param i32 i32)))
 (import "__aspect" "reportExpectedArray" (func $assembly/internal/report/reportExpected/reportExpectedArray (param i32 i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/report/reportExpected/reportExpectedFloat (param f64 i32 i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/report/reportExpected/reportExpectedInteger (param i32 i32 i32)))
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
 (data (i32.const 256) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 304) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 360) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00")
 (data (i32.const 408) "\80\00\00\00\01\00\00\00\01\00\00\00\80\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00")
 (data (i32.const 552) "L\00\00\00\01\00\00\00\01\00\00\00L\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00a\00s\00s\00e\00r\00t\00.\00t\00s\00")
 (data (i32.const 648) "\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00")
 (data (i32.const 664) "X\00\00\00\01\00\00\00\01\00\00\00X\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 768) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 912) "b\00\00\00\01\00\00\00\01\00\00\00b\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00t\00h\00a\00t\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 1032) "`\00\00\00\01\00\00\00\01\00\00\00`\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 1144) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1288) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1432) "\96\00\00\00\01\00\00\00\01\00\00\00\96\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 1600) "~\00\00\00\01\00\00\00\01\00\00\00~\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1744) "\82\00\00\00\01\00\00\00\01\00\00\00\82\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1896) "\a0\00\00\00\01\00\00\00\01\00\00\00\a0\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 2072) "\80\00\00\00\01\00\00\00\01\00\00\00\80\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 2216) "\88\00\00\00\01\00\00\00\01\00\00\00\88\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00n\00u\00l\00l\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00 \00v\00a\00l\00u\00e\00s\00")
 (data (i32.const 2368) "v\00\00\00\01\00\00\00\01\00\00\00v\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00s\00t\00r\00i\00t\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 2504) "|\00\00\00\01\00\00\00\01\00\00\00|\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 2648) "\90\00\00\00\01\00\00\00\01\00\00\00\90\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2808) "\90\00\00\00\01\00\00\00\01\00\00\00\90\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2968) "H\00\00\00\01\00\00\00\01\00\00\00H\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 3056) "\a4\00\00\00\01\00\00\00\01\00\00\00\a4\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00q\00u\00a\00l\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00o\00t\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 3240) "\be\00\00\00\01\00\00\00\01\00\00\00\be\00\00\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (data (i32.const 3448) "P\00\00\00\01\00\00\00\01\00\00\00P\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 3544) "N\00\00\00\01\00\00\00\01\00\00\00N\00\00\00b\00u\00f\00f\001\00 \00a\00n\00d\00 \00b\00u\00f\00f\00 \003\00 \00a\00r\00e\00 \00n\00o\00t\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 3640) "\a4\00\00\00\01\00\00\00\01\00\00\00\a4\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 3824) "\be\00\00\00\01\00\00\00\01\00\00\00\be\00\00\00N\00o\00n\00-\00s\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (data (i32.const 4032) "\a6\00\00\00\01\00\00\00\01\00\00\00\a6\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00t\00w\00o\00 \00a\00r\00r\00a\00y\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00p\00o\00i\00n\00t\00 \00t\00o\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00p\00l\00a\00c\00e\00")
 (data (i32.const 4216) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 4248) " \00\00\00\01\00\00\00\01\00\00\00 \00\00\00a\00 \00s\00h\00o\00u\00l\00d\00 \00m\00a\00t\00c\00h\00 \00a\00")
 (data (i32.const 4296) "\9c\00\00\00\01\00\00\00\01\00\00\00\9c\00\00\00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00a\00r\00e\00 \00t\00h\00e\00 \00s\00a\00m\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00b\00u\00t\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 4472) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 4504) "b\00\00\00\01\00\00\00\01\00\00\00b\00\00\00a\00 \00i\00s\00 \00e\00q\00u\00a\00l\00 \00t\00o\00 \00a\00,\00 \00a\00n\00d\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 4624) "\92\00\00\00\01\00\00\00\01\00\00\00\92\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00t\00h\00a\00t\00 \00a\00r\00r\00a\00y\00 \00v\00a\00l\00u\00e\00s\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00m\00a\00t\00c\00h\00")
 (data (i32.const 4792) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 4824) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 4856) "0\00\00\00\01\00\00\00\01\00\00\000\00\00\00[\001\00,\00 \002\00,\00 \003\00]\00 \00s\00h\00o\00u\00l\00d\00 \00m\00a\00t\00c\00h\00 \00a\00")
 (data (i32.const 4920) "\92\00\00\00\01\00\00\00\01\00\00\00\92\00\00\00w\00h\00e\00n\00 \00t\00w\00o\00 \00a\00r\00r\00a\00y\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00 \00b\00u\00t\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 5088) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 5120) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 5152) "|\00\00\00\01\00\00\00\01\00\00\00|\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00t\00h\00a\00t\00 \00a\00r\00r\00a\00y\00s\00 \00t\00h\00a\00t\00 \00d\00o\00n\00\'\00t\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 5296) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 5328) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00")
 (data (i32.const 5360) "r\00\00\00\01\00\00\00\01\00\00\00r\00\00\00w\00h\00e\00n\00 \00t\00w\00o\00 \00a\00r\00r\00a\00y\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00d\00o\00n\00\'\00t\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 5496) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 5528) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00")
 (data (i32.const 5560) "\88\00\00\00\01\00\00\00\01\00\00\00\88\00\00\00c\00o\00m\00p\00i\00l\00e\00s\00 \00w\00h\00e\00n\00 \00<\00u\008\00>\00 \00i\00s\00 \00u\00s\00e\00d\00 \00a\00s\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00t\00y\00p\00e\00 \00f\00o\00r\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00")
 (data (i32.const 5712) ",\00\00\00\01\00\00\00\01\00\00\00,\00\00\00T\00h\00i\00s\00 \00t\00o\00t\00a\00l\00l\00y\00 \00c\00o\00m\00p\00i\00l\00e\00s\00.\00")
 (data (i32.const 5776) "\90\00\00\00\01\00\00\00\01\00\00\00\90\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00t\00w\00o\00 \00a\00r\00r\00a\00y\00s\00 \00o\00f\00 \00s\00i\00m\00i\00l\00a\00r\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 5936) "p\00\00\00\01\00\00\00\01\00\00\00p\00\00\00T\00h\00e\00 \00t\00w\00o\00 \00a\00r\00r\00a\00y\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 6064) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00A\00r\00r\00a\00y\00 \00o\00f\00 \00R\00e\00f\00e\00r\00e\00n\00c\00e\00s\00")
 (data (i32.const 6120) "\aa\00\00\00\01\00\00\00\01\00\00\00\aa\00\00\00w\00h\00e\00n\00 \00t\00w\00o\00 \00a\00r\00r\00a\00y\00s\00 \00o\00f\00 \00s\00i\00m\00i\00l\00a\00r\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00a\00n\00d\00 \00t\00h\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 6312) "\9c\00\00\00\01\00\00\00\01\00\00\00\9c\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00t\00w\00o\00 \00a\00r\00r\00a\00y\00s\00 \00o\00f\00 \00d\00i\00s\00i\00m\00i\00l\00a\00r\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 6488) "x\00\00\00\01\00\00\00\01\00\00\00x\00\00\00T\00h\00e\00 \00t\00w\00o\00 \00a\00r\00r\00a\00y\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00o\00t\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 6624) "|\00\00\00\01\00\00\00\01\00\00\00|\00\00\00w\00h\00e\00n\00 \00t\00w\00o\00 \00a\00r\00r\00a\00y\00s\00 \00o\00f\00 \00d\00i\00s\00i\00m\00i\00l\00a\00r\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 6768) "\0e\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\10\00\00\00\00\00\00\00")
 (table $0 32 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|18 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|19 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|20 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|21 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|22 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|23 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|24 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|25 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|26 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|27 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|28 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/vec2 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/vec3 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buffsize (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buff1 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buff2 (mut i32) (i32.const 0))
 (global $assembly/__tests__/toStrictEqual.spec/buff3 (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.type (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.signed (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.float (mut f64) (f64.const 0))
 (global $assembly/internal/report/reportActual/Actual.integer (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.reference (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportActual/Actual.offset (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.ready (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.type (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.signed (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.float (mut f64) (f64.const 0))
 (global $assembly/internal/report/reportExpected/Expected.integer (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.reference (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.offset (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.expectation (mut i32) (i32.const 0))
 (global $assembly/internal/report/reportExpected/Expected.negated (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 31))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $assembly/internal/log/ignoreLogs (mut i32) (i32.const 0))
 (global $assembly/internal/RTrace/RTrace.enabled (mut i32) (i32.const 1))
 (global $~lib/started (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 6768))
 (global $~lib/heap/__heap_base i32 (i32.const 6884))
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
 (export "__sendActual" (func $assembly/internal/report/reportActual/__sendActual))
 (export "__sendExpected" (func $assembly/internal/report/reportExpected/__sendExpected))
 (export "__ignoreLogs" (func $assembly/internal/log/__ignoreLogs))
 (export "__disableRTrace" (func $assembly/internal/RTrace/__disableRTrace))
 (func $~lib/rt/tlsf/removeBlock (; 27 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/insertBlock (; 28 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/addMemory (; 29 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/initializeRoot (; 30 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/tlsf/prepareSize (; 31 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/searchBlock (; 32 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/growMemory (; 33 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/prepareBlock (; 34 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/allocateBlock (; 35 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  call $~lib/rt/rtrace/onalloc
  local.get $3
 )
 (func $~lib/rt/tlsf/__alloc (; 36 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/pure/increment (; 37 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__retain (; 38 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/freeBlock (; 39 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
  local.get $1
  call $~lib/rt/rtrace/onfree
 )
 (func $~lib/rt/__typeinfo (; 40 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/memory/memcpy (; 41 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/memory/memory.copy (; 42 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/__free (; 43 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/growRoots (; 44 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/pure/appendRoot (; 45 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/decrement (; 46 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__release (; 47 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/markGray (; 48 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scanBlack (; 49 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scan (; 50 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/collectWhite (; 51 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__collect (; 52 ;) (type $FUNCSIG$v)
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
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 53 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
   i32.const 3
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
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
 (func $~lib/memory/memory.fill (; 54 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 55 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.const 1073741808
  i32.gt_u
  if
   i32.const 272
   i32.const 320
   i32.const 56
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
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 56 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.get $1
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<i32> (; 57 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/report/Box/Box<i32>#constructor (; 58 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/report/reportActual/Actual.clear (; 59 ;) (type $FUNCSIG$v)
  i32.const 0
  global.set $assembly/internal/report/reportActual/Actual.type
  global.get $assembly/internal/report/reportActual/Actual.reference
  i32.const 0
  i32.gt_u
  if
   global.get $assembly/internal/report/reportActual/Actual.reference
   call $~lib/rt/pure/__release
   i32.const 0
   global.set $assembly/internal/report/reportActual/Actual.reference
  end
 )
 (func $assembly/internal/report/reportExpected/Expected.clear (; 60 ;) (type $FUNCSIG$v)
  i32.const 0
  global.set $assembly/internal/report/reportExpected/Expected.type
  global.get $assembly/internal/report/reportExpected/Expected.reference
  i32.const 0
  i32.gt_u
  if
   global.get $assembly/internal/report/reportExpected/Expected.reference
   call $~lib/rt/pure/__release
   i32.const 0
   global.set $assembly/internal/report/reportExpected/Expected.reference
  end
 )
 (func $assembly/internal/Expectation/Expectation<i32>#toStrictEqual (; 61 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/comparison/exactComparison/exactComparison<i32>|inlined.0
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
   block $assembly/internal/report/reportActual/reportActual<i32>|inlined.0
    local.get $6
    local.set $7
    block (result i32)
     local.get $7
     drop
     i32.const 0
    end
    if (result i32)
     i32.const 1
    else     
     local.get $7
     drop
     i32.const 0
    end
    if
     i32.const 10
     global.set $assembly/internal/report/reportActual/Actual.type
     block (result i32)
      local.get $7
      drop
      i32.const 0
     end
     global.set $assembly/internal/report/reportActual/Actual.signed
     i32.const 0
     local.get $7
     call $assembly/internal/report/Box/Box<i32>#constructor
     local.set $8
     local.get $8
     local.set $9
     local.get $9
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportActual/Actual.reference
     call $~lib/rt/pure/__release
     local.get $9
     global.set $assembly/internal/report/reportActual/Actual.reference
     local.get $8
     call $~lib/rt/pure/__release
    else     
     i32.const 3
     global.set $assembly/internal/report/reportActual/Actual.type
     block (result i32)
      local.get $7
      drop
      i32.const 1
     end
     global.set $assembly/internal/report/reportActual/Actual.signed
     local.get $7
     global.set $assembly/internal/report/reportActual/Actual.integer
    end
   end
   block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.0
    local.get $5
    local.set $9
    local.get $4
    local.set $8
    global.get $assembly/internal/report/reportExpected/Expected.ready
    i32.eqz
    if
     call $assembly/internal/report/reportExpected/reportInvalidExpectCall
     br $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.0
    end
    local.get $8
    global.set $assembly/internal/report/reportExpected/Expected.negated
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
     i32.const 10
     global.set $assembly/internal/report/reportExpected/Expected.type
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     global.set $assembly/internal/report/reportExpected/Expected.signed
     i32.const 0
     local.get $9
     call $assembly/internal/report/Box/Box<i32>#constructor
     local.set $7
     local.get $7
     local.set $10
     local.get $10
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportExpected/Expected.reference
     call $~lib/rt/pure/__release
     local.get $10
     global.set $assembly/internal/report/reportExpected/Expected.reference
     local.get $7
     call $~lib/rt/pure/__release
    else     
     i32.const 3
     global.set $assembly/internal/report/reportExpected/Expected.type
     block (result i32)
      local.get $9
      drop
      i32.const 1
     end
     global.set $assembly/internal/report/reportExpected/Expected.signed
     local.get $9
     global.set $assembly/internal/report/reportExpected/Expected.integer
    end
   end
   block $assembly/internal/comparison/assert/assert|inlined.0
    local.get $4
    local.get $5
    local.get $6
    i32.eq
    i32.xor
    local.set $10
    local.get $3
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $10
    i32.eqz
    if
     local.get $7
     call $~lib/rt/pure/__release
     block
      local.get $7
      i32.const 568
      i32.const 11
      i32.const 18
      call $~lib/builtins/abort
      unreachable
      unreachable
     end
     unreachable
    end
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $3
   call $~lib/rt/pure/__release
  end
  call $assembly/internal/report/reportActual/Actual.clear
  call $assembly/internal/report/reportExpected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
  return
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 (; 62 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 3
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  i32.const 3
  i32.const 664
  call $assembly/internal/Expectation/Expectation<i32>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/it (; 63 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 64 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 (; 65 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 3
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.tee $1
  i32.const 3
  i32.const 664
  call $assembly/internal/Expectation/Expectation<i32>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/throws (; 66 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 (; 67 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 3
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.tee $1
  i32.const 1
  i32.const 664
  call $assembly/internal/Expectation/Expectation<i32>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 (; 68 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 3
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  i32.const 1
  i32.const 664
  call $assembly/internal/Expectation/Expectation<i32>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 69 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 70 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#__equals (; 71 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  f64.load
  local.get $1
  f64.load
  f64.eq
  if (result i32)
   local.get $0
   f64.load offset=8
   local.get $1
   f64.load offset=8
   f64.eq
  else   
   i32.const 0
  end
  if (result i32)
   local.get $0
   f64.load offset=16
   local.get $1
   f64.load offset=16
   f64.eq
  else   
   i32.const 0
  end
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 72 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual (; 73 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $1
   drop
   i32.const 0
  end
  if (result i32)
   i32.const 1
  else   
   local.get $1
   drop
   i32.const 0
  end
  if
   block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
    local.get $0
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $6
    local.get $1
    call $~lib/rt/pure/__retain
    local.set $5
    local.get $0
    i32.load
    local.set $4
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $3
    local.get $6
    local.get $5
    i32.eq
    if
     block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
      local.get $6
      call $~lib/rt/pure/__retain
      local.set $10
      local.get $5
      call $~lib/rt/pure/__retain
      local.set $9
      local.get $4
      local.set $8
      local.get $3
      call $~lib/rt/pure/__retain
      local.set $7
      block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
       local.get $10
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $11
       local.set $12
       local.get $11
       i32.const 0
       call $assembly/__tests__/setup/Vec3/Vec3#__equals
       if
        i32.const 1
        global.set $assembly/internal/report/reportActual/Actual.type
       else        
        local.get $12
        call $~lib/rt/pure/__retain
        drop
        global.get $assembly/internal/report/reportActual/Actual.reference
        call $~lib/rt/pure/__release
        local.get $12
        global.set $assembly/internal/report/reportActual/Actual.reference
        block (result i32)
         local.get $11
         drop
         i32.const 0
        end
        if
         i32.const 5
         global.set $assembly/internal/report/reportActual/Actual.type
        else         
         block (result i32)
          local.get $11
          drop
          i32.const 0
         end
         if
          i32.const 4
          global.set $assembly/internal/report/reportActual/Actual.type
          local.get $12
          call $~lib/rt/pure/__retain
          local.set $13
          local.get $13
          call $~lib/arraybuffer/ArrayBuffer#get:byteLength
          global.set $assembly/internal/report/reportActual/Actual.offset
          local.get $13
          call $~lib/rt/pure/__release
         else          
          i32.const 4
          global.set $assembly/internal/report/reportActual/Actual.type
          i32.const 24
          global.set $assembly/internal/report/reportActual/Actual.offset
         end
        end
       end
       local.get $11
       call $~lib/rt/pure/__release
      end
      block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
       local.get $9
       call $~lib/rt/pure/__retain
       local.set $12
       local.get $8
       local.set $13
       global.get $assembly/internal/report/reportExpected/Expected.ready
       i32.eqz
       if
        call $assembly/internal/report/reportExpected/reportInvalidExpectCall
        local.get $12
        call $~lib/rt/pure/__release
        br $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
       end
       local.get $13
       global.set $assembly/internal/report/reportExpected/Expected.negated
       local.get $12
       i32.const 0
       call $assembly/__tests__/setup/Vec3/Vec3#__equals
       if
        i32.const 1
        global.set $assembly/internal/report/reportExpected/Expected.type
       else        
        local.get $12
        local.set $11
        local.get $11
        call $~lib/rt/pure/__retain
        drop
        global.get $assembly/internal/report/reportExpected/Expected.reference
        call $~lib/rt/pure/__release
        local.get $11
        global.set $assembly/internal/report/reportExpected/Expected.reference
        block (result i32)
         local.get $12
         drop
         i32.const 0
        end
        if
         i32.const 5
         global.set $assembly/internal/report/reportExpected/Expected.type
        else         
         block (result i32)
          local.get $12
          drop
          i32.const 0
         end
         if
          local.get $12
          call $~lib/rt/pure/__retain
          local.set $14
          i32.const 4
          global.set $assembly/internal/report/reportExpected/Expected.type
          local.get $14
          call $~lib/arraybuffer/ArrayBuffer#get:byteLength
          global.set $assembly/internal/report/reportExpected/Expected.offset
          local.get $14
          call $~lib/rt/pure/__release
         else          
          i32.const 4
          global.set $assembly/internal/report/reportExpected/Expected.type
          i32.const 24
          global.set $assembly/internal/report/reportExpected/Expected.offset
         end
        end
       end
       local.get $12
       call $~lib/rt/pure/__release
      end
      block $assembly/internal/comparison/assert/assert|inlined.1
       local.get $8
       local.get $9
       local.get $10
       call $assembly/__tests__/setup/Vec3/Vec3#__equals
       i32.xor
       local.set $11
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $14
       local.get $11
       i32.eqz
       if
        local.get $14
        call $~lib/rt/pure/__release
        block
         local.get $14
         i32.const 568
         i32.const 11
         i32.const 18
         call $~lib/builtins/abort
         unreachable
         unreachable
        end
        unreachable
       end
       local.get $14
       call $~lib/rt/pure/__release
      end
      local.get $7
      call $~lib/rt/pure/__release
      local.get $9
      call $~lib/rt/pure/__release
      local.get $10
      call $~lib/rt/pure/__release
     end
     local.get $3
     call $~lib/rt/pure/__release
     local.get $5
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
    end
    local.get $5
    local.set $10
    local.get $6
    local.set $9
    local.get $10
    i32.const 4
    i32.sub
    i32.load
    local.set $8
    local.get $9
    i32.const 4
    i32.sub
    i32.load
    local.set $7
    local.get $5
    i32.const 0
    call $assembly/__tests__/setup/Vec3/Vec3#__equals
    if
     i32.const 1
     global.set $assembly/internal/report/reportExpected/Expected.type
    else     
     local.get $10
     local.set $14
     local.get $8
     local.set $12
     local.get $4
     local.set $13
     i32.const 4
     global.set $assembly/internal/report/reportExpected/Expected.type
     local.get $14
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportExpected/Expected.reference
     call $~lib/rt/pure/__release
     local.get $14
     global.set $assembly/internal/report/reportExpected/Expected.reference
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.offset
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
    end
    local.get $6
    i32.const 0
    call $assembly/__tests__/setup/Vec3/Vec3#__equals
    if
     i32.const 1
     global.set $assembly/internal/report/reportActual/Actual.type
    else     
     local.get $7
     local.set $13
     local.get $7
     local.set $11
     i32.const 4
     global.set $assembly/internal/report/reportActual/Actual.type
     local.get $13
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportActual/Actual.reference
     call $~lib/rt/pure/__release
     local.get $13
     global.set $assembly/internal/report/reportActual/Actual.reference
     local.get $11
     global.set $assembly/internal/report/reportActual/Actual.offset
    end
    local.get $6
    i32.const 0
    call $assembly/__tests__/setup/Vec3/Vec3#__equals
    local.set $13
    local.get $5
    i32.const 0
    call $assembly/__tests__/setup/Vec3/Vec3#__equals
    local.set $11
    local.get $13
    local.get $11
    i32.xor
    if
     local.get $4
     local.set $14
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $14
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 568
       i32.const 11
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
     local.get $7
     local.get $8
     i32.eq
     local.set $14
     local.get $14
     i32.eqz
     if
      local.get $4
      local.set $15
      local.get $3
      call $~lib/rt/pure/__retain
      local.set $12
      local.get $15
      i32.eqz
      if
       local.get $12
       call $~lib/rt/pure/__release
       block
        local.get $12
        i32.const 568
        i32.const 11
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
      block $~lib/memory/memory.compare|inlined.0 (result i32)
       local.get $9
       local.set $16
       local.get $10
       local.set $15
       local.get $7
       local.set $12
       block $~lib/util/memory/memcmp|inlined.0 (result i32)
        local.get $16
        local.set $19
        local.get $15
        local.set $18
        local.get $12
        local.set $17
        local.get $19
        local.get $18
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.0
        end
        block $break|0
         loop $continue|0
          local.get $17
          i32.const 0
          i32.ne
          if (result i32)
           local.get $19
           i32.load8_u
           local.get $18
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           local.get $17
           i32.const 1
           i32.sub
           local.set $17
           local.get $19
           i32.const 1
           i32.add
           local.set $19
           local.get $18
           i32.const 1
           i32.add
           local.set $18
           br $continue|0
          end
         end
        end
        local.get $17
        if (result i32)
         local.get $19
         i32.load8_u
         local.get $18
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $16
      block $assembly/internal/comparison/assert/assert|inlined.4
       local.get $4
       local.get $16
       i32.xor
       local.set $18
       local.get $3
       call $~lib/rt/pure/__retain
       local.set $17
       local.get $18
       i32.eqz
       if
        local.get $17
        call $~lib/rt/pure/__release
        block
         local.get $17
         i32.const 568
         i32.const 11
         i32.const 18
         call $~lib/builtins/abort
         unreachable
         unreachable
        end
        unreachable
       end
       local.get $17
       call $~lib/rt/pure/__release
      end
     end
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   call $assembly/internal/report/reportActual/Actual.clear
   call $assembly/internal/report/reportExpected/Expected.clear
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
   return
  end
  block $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
   local.get $0
   i32.load offset=4
   call $~lib/rt/pure/__retain
   local.set $17
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $15
   local.get $0
   i32.load
   local.set $12
   local.get $2
   call $~lib/rt/pure/__retain
   local.set $19
   block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
    local.get $17
    call $~lib/rt/pure/__retain
    local.set $18
    local.get $18
    local.set $11
    local.get $18
    i32.const 0
    call $assembly/__tests__/setup/Vec3/Vec3#__equals
    if
     i32.const 1
     global.set $assembly/internal/report/reportActual/Actual.type
    else     
     local.get $11
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportActual/Actual.reference
     call $~lib/rt/pure/__release
     local.get $11
     global.set $assembly/internal/report/reportActual/Actual.reference
     block (result i32)
      local.get $18
      drop
      i32.const 0
     end
     if
      i32.const 5
      global.set $assembly/internal/report/reportActual/Actual.type
     else      
      block (result i32)
       local.get $18
       drop
       i32.const 0
      end
      if
       i32.const 4
       global.set $assembly/internal/report/reportActual/Actual.type
       local.get $11
       call $~lib/rt/pure/__retain
       local.set $13
       local.get $13
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       global.set $assembly/internal/report/reportActual/Actual.offset
       local.get $13
       call $~lib/rt/pure/__release
      else       
       i32.const 4
       global.set $assembly/internal/report/reportActual/Actual.type
       i32.const 24
       global.set $assembly/internal/report/reportActual/Actual.offset
      end
     end
    end
    local.get $18
    call $~lib/rt/pure/__release
   end
   block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
    local.get $15
    call $~lib/rt/pure/__retain
    local.set $14
    local.get $12
    local.set $16
    global.get $assembly/internal/report/reportExpected/Expected.ready
    i32.eqz
    if
     call $assembly/internal/report/reportExpected/reportInvalidExpectCall
     local.get $14
     call $~lib/rt/pure/__release
     br $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
    end
    local.get $16
    global.set $assembly/internal/report/reportExpected/Expected.negated
    local.get $14
    i32.const 0
    call $assembly/__tests__/setup/Vec3/Vec3#__equals
    if
     i32.const 1
     global.set $assembly/internal/report/reportExpected/Expected.type
    else     
     local.get $14
     local.set $18
     local.get $18
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportExpected/Expected.reference
     call $~lib/rt/pure/__release
     local.get $18
     global.set $assembly/internal/report/reportExpected/Expected.reference
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if
      i32.const 5
      global.set $assembly/internal/report/reportExpected/Expected.type
     else      
      block (result i32)
       local.get $14
       drop
       i32.const 0
      end
      if
       local.get $14
       call $~lib/rt/pure/__retain
       local.set $11
       i32.const 4
       global.set $assembly/internal/report/reportExpected/Expected.type
       local.get $11
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       global.set $assembly/internal/report/reportExpected/Expected.offset
       local.get $11
       call $~lib/rt/pure/__release
      else       
       i32.const 4
       global.set $assembly/internal/report/reportExpected/Expected.type
       i32.const 24
       global.set $assembly/internal/report/reportExpected/Expected.offset
      end
     end
    end
    local.get $14
    call $~lib/rt/pure/__release
   end
   local.get $15
   local.get $17
   call $assembly/__tests__/setup/Vec3/Vec3#__equals
   if
    block $assembly/internal/comparison/assert/assert|inlined.5
     local.get $12
     i32.eqz
     local.set $4
     local.get $19
     call $~lib/rt/pure/__retain
     local.set $3
     local.get $4
     i32.eqz
     if
      local.get $3
      call $~lib/rt/pure/__release
      block
       local.get $3
       i32.const 568
       i32.const 11
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $3
     call $~lib/rt/pure/__release
    end
    local.get $19
    call $~lib/rt/pure/__release
    local.get $15
    call $~lib/rt/pure/__release
    local.get $17
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
   end
   local.get $15
   i32.const 0
   call $assembly/__tests__/setup/Vec3/Vec3#__equals
   if (result i32)
    i32.const 1
   else    
    local.get $17
    i32.const 0
    call $assembly/__tests__/setup/Vec3/Vec3#__equals
   end
   if
    block $assembly/internal/comparison/assert/assert|inlined.6
     local.get $12
     local.set $6
     local.get $19
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $6
     i32.eqz
     if
      local.get $5
      call $~lib/rt/pure/__release
      block
       local.get $5
       i32.const 568
       i32.const 11
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $19
    call $~lib/rt/pure/__release
    local.get $15
    call $~lib/rt/pure/__release
    local.get $17
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
   end
   block $~lib/memory/memory.compare|inlined.1 (result i32)
    local.get $15
    local.set $8
    local.get $17
    local.set $9
    i32.const 24
    local.set $10
    block $~lib/util/memory/memcmp|inlined.1 (result i32)
     local.get $8
     local.set $11
     local.get $9
     local.set $13
     local.get $10
     local.set $7
     local.get $11
     local.get $13
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.1
     end
     block $break|1
      loop $continue|1
       local.get $7
       i32.const 0
       i32.ne
       if (result i32)
        local.get $11
        i32.load8_u
        local.get $13
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        local.get $7
        i32.const 1
        i32.sub
        local.set $7
        local.get $11
        i32.const 1
        i32.add
        local.set $11
        local.get $13
        i32.const 1
        i32.add
        local.set $13
        br $continue|1
       end
      end
     end
     local.get $7
     if (result i32)
      local.get $11
      i32.load8_u
      local.get $13
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $8
   block $assembly/internal/comparison/assert/assert|inlined.7
    local.get $12
    local.get $8
    i32.const 0
    i32.eq
    i32.xor
    local.set $16
    local.get $19
    call $~lib/rt/pure/__retain
    local.set $18
    local.get $16
    i32.eqz
    if
     local.get $18
     call $~lib/rt/pure/__release
     block
      local.get $18
      i32.const 568
      i32.const 11
      i32.const 18
      call $~lib/builtins/abort
      unreachable
      unreachable
     end
     unreachable
    end
    local.get $18
    call $~lib/rt/pure/__release
   end
   local.get $19
   call $~lib/rt/pure/__release
   local.get $15
   call $~lib/rt/pure/__release
   local.get $17
   call $~lib/rt/pure/__release
  end
  call $assembly/internal/report/reportActual/Actual.clear
  call $assembly/internal/report/reportExpected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 (; 74 ;) (type $FUNCSIG$v)
  (local $0 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  global.get $assembly/__tests__/toStrictEqual.spec/vec3
  i32.const 1448
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 75 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 (; 76 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.tee $1
  global.get $assembly/__tests__/toStrictEqual.spec/vec3
  i32.const 664
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 (; 77 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.tee $1
  global.get $assembly/__tests__/toStrictEqual.spec/vec2
  i32.const 664
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 (; 78 ;) (type $FUNCSIG$v)
  (local $0 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  global.get $assembly/__tests__/toStrictEqual.spec/vec2
  i32.const 664
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 (; 79 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  i32.const 0
  i32.const 664
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 (; 80 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.tee $1
  i32.const 0
  i32.const 664
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 (; 81 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.tee $1
  i32.const 0
  i32.const 664
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 (; 82 ;) (type $FUNCSIG$v)
  (local $0 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  i32.const 0
  i32.const 664
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 (; 83 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.tee $1
  global.get $assembly/__tests__/toStrictEqual.spec/vec1
  i32.const 664
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 (; 84 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.tee $0
  global.get $assembly/__tests__/toStrictEqual.spec/vec1
  i32.const 664
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor (; 85 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer> (; 86 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual (; 87 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $1
   drop
   i32.const 1
  end
  if (result i32)
   i32.const 1
  else   
   local.get $1
   drop
   i32.const 0
  end
  if
   block $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
    local.get $0
    i32.load offset=4
    call $~lib/rt/pure/__retain
    local.set $6
    local.get $1
    call $~lib/rt/pure/__retain
    local.set $5
    local.get $0
    i32.load
    local.set $4
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $3
    local.get $6
    local.get $5
    i32.eq
    if
     block $assembly/internal/comparison/exactComparison/exactComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
      local.get $6
      call $~lib/rt/pure/__retain
      local.set $10
      local.get $5
      call $~lib/rt/pure/__retain
      local.set $9
      local.get $4
      local.set $8
      local.get $3
      call $~lib/rt/pure/__retain
      local.set $7
      block $assembly/internal/report/reportActual/reportActual<~lib/arraybuffer/ArrayBuffer>|inlined.0
       local.get $10
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $11
       local.set $12
       local.get $11
       i32.const 0
       i32.eq
       if
        i32.const 1
        global.set $assembly/internal/report/reportActual/Actual.type
       else        
        local.get $12
        call $~lib/rt/pure/__retain
        drop
        global.get $assembly/internal/report/reportActual/Actual.reference
        call $~lib/rt/pure/__release
        local.get $12
        global.set $assembly/internal/report/reportActual/Actual.reference
        block (result i32)
         local.get $11
         drop
         i32.const 0
        end
        if
         i32.const 5
         global.set $assembly/internal/report/reportActual/Actual.type
        else         
         block (result i32)
          local.get $11
          drop
          i32.const 1
         end
         if
          i32.const 4
          global.set $assembly/internal/report/reportActual/Actual.type
          local.get $12
          call $~lib/rt/pure/__retain
          local.set $13
          local.get $13
          call $~lib/arraybuffer/ArrayBuffer#get:byteLength
          global.set $assembly/internal/report/reportActual/Actual.offset
          local.get $13
          call $~lib/rt/pure/__release
         else          
          i32.const 4
          global.set $assembly/internal/report/reportActual/Actual.type
          i32.const 0
          global.set $assembly/internal/report/reportActual/Actual.offset
         end
        end
       end
       local.get $11
       call $~lib/rt/pure/__release
      end
      block $assembly/internal/report/reportExpected/reportExpected<~lib/arraybuffer/ArrayBuffer>|inlined.0
       local.get $9
       call $~lib/rt/pure/__retain
       local.set $12
       local.get $8
       local.set $13
       global.get $assembly/internal/report/reportExpected/Expected.ready
       i32.eqz
       if
        call $assembly/internal/report/reportExpected/reportInvalidExpectCall
        local.get $12
        call $~lib/rt/pure/__release
        br $assembly/internal/report/reportExpected/reportExpected<~lib/arraybuffer/ArrayBuffer>|inlined.0
       end
       local.get $13
       global.set $assembly/internal/report/reportExpected/Expected.negated
       local.get $12
       i32.const 0
       i32.eq
       if
        i32.const 1
        global.set $assembly/internal/report/reportExpected/Expected.type
       else        
        local.get $12
        local.set $11
        local.get $11
        call $~lib/rt/pure/__retain
        drop
        global.get $assembly/internal/report/reportExpected/Expected.reference
        call $~lib/rt/pure/__release
        local.get $11
        global.set $assembly/internal/report/reportExpected/Expected.reference
        block (result i32)
         local.get $12
         drop
         i32.const 0
        end
        if
         i32.const 5
         global.set $assembly/internal/report/reportExpected/Expected.type
        else         
         block (result i32)
          local.get $12
          drop
          i32.const 1
         end
         if
          local.get $12
          call $~lib/rt/pure/__retain
          local.set $14
          i32.const 4
          global.set $assembly/internal/report/reportExpected/Expected.type
          local.get $14
          call $~lib/arraybuffer/ArrayBuffer#get:byteLength
          global.set $assembly/internal/report/reportExpected/Expected.offset
          local.get $14
          call $~lib/rt/pure/__release
         else          
          i32.const 4
          global.set $assembly/internal/report/reportExpected/Expected.type
          i32.const 0
          global.set $assembly/internal/report/reportExpected/Expected.offset
         end
        end
       end
       local.get $12
       call $~lib/rt/pure/__release
      end
      block $assembly/internal/comparison/assert/assert|inlined.8
       local.get $8
       local.get $9
       local.get $10
       i32.eq
       i32.xor
       local.set $11
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $14
       local.get $11
       i32.eqz
       if
        local.get $14
        call $~lib/rt/pure/__release
        block
         local.get $14
         i32.const 568
         i32.const 11
         i32.const 18
         call $~lib/builtins/abort
         unreachable
         unreachable
        end
        unreachable
       end
       local.get $14
       call $~lib/rt/pure/__release
      end
      local.get $7
      call $~lib/rt/pure/__release
      local.get $9
      call $~lib/rt/pure/__release
      local.get $10
      call $~lib/rt/pure/__release
     end
     local.get $3
     call $~lib/rt/pure/__release
     local.get $5
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     br $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
    end
    local.get $5
    local.set $10
    local.get $6
    local.set $9
    local.get $10
    i32.const 4
    i32.sub
    i32.load
    local.set $8
    local.get $9
    i32.const 4
    i32.sub
    i32.load
    local.set $7
    local.get $5
    i32.const 0
    i32.eq
    if
     i32.const 1
     global.set $assembly/internal/report/reportExpected/Expected.type
    else     
     local.get $10
     local.set $14
     local.get $8
     local.set $12
     local.get $4
     local.set $13
     i32.const 4
     global.set $assembly/internal/report/reportExpected/Expected.type
     local.get $14
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportExpected/Expected.reference
     call $~lib/rt/pure/__release
     local.get $14
     global.set $assembly/internal/report/reportExpected/Expected.reference
     local.get $12
     global.set $assembly/internal/report/reportExpected/Expected.offset
     local.get $13
     global.set $assembly/internal/report/reportExpected/Expected.negated
    end
    local.get $6
    i32.const 0
    i32.eq
    if
     i32.const 1
     global.set $assembly/internal/report/reportActual/Actual.type
    else     
     local.get $7
     local.set $13
     local.get $7
     local.set $11
     i32.const 4
     global.set $assembly/internal/report/reportActual/Actual.type
     local.get $13
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportActual/Actual.reference
     call $~lib/rt/pure/__release
     local.get $13
     global.set $assembly/internal/report/reportActual/Actual.reference
     local.get $11
     global.set $assembly/internal/report/reportActual/Actual.offset
    end
    local.get $6
    i32.const 0
    i32.eq
    local.set $13
    local.get $5
    i32.const 0
    i32.eq
    local.set $11
    local.get $13
    local.get $11
    i32.xor
    if
     local.get $4
     local.set $14
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $12
     local.get $14
     i32.eqz
     if
      local.get $12
      call $~lib/rt/pure/__release
      block
       local.get $12
       i32.const 568
       i32.const 11
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
     local.get $7
     local.get $8
     i32.eq
     local.set $14
     local.get $14
     i32.eqz
     if
      local.get $4
      local.set $15
      local.get $3
      call $~lib/rt/pure/__retain
      local.set $12
      local.get $15
      i32.eqz
      if
       local.get $12
       call $~lib/rt/pure/__release
       block
        local.get $12
        i32.const 568
        i32.const 11
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
      block $~lib/memory/memory.compare|inlined.2 (result i32)
       local.get $9
       local.set $16
       local.get $10
       local.set $15
       local.get $7
       local.set $12
       block $~lib/util/memory/memcmp|inlined.2 (result i32)
        local.get $16
        local.set $19
        local.get $15
        local.set $18
        local.get $12
        local.set $17
        local.get $19
        local.get $18
        i32.eq
        if
         i32.const 0
         br $~lib/util/memory/memcmp|inlined.2
        end
        block $break|0
         loop $continue|0
          local.get $17
          i32.const 0
          i32.ne
          if (result i32)
           local.get $19
           i32.load8_u
           local.get $18
           i32.load8_u
           i32.eq
          else           
           i32.const 0
          end
          if
           local.get $17
           i32.const 1
           i32.sub
           local.set $17
           local.get $19
           i32.const 1
           i32.add
           local.set $19
           local.get $18
           i32.const 1
           i32.add
           local.set $18
           br $continue|0
          end
         end
        end
        local.get $17
        if (result i32)
         local.get $19
         i32.load8_u
         local.get $18
         i32.load8_u
         i32.sub
        else         
         i32.const 0
        end
       end
      end
      i32.const 0
      i32.eq
      local.set $16
      block $assembly/internal/comparison/assert/assert|inlined.11
       local.get $4
       local.get $16
       i32.xor
       local.set $18
       local.get $3
       call $~lib/rt/pure/__retain
       local.set $17
       local.get $18
       i32.eqz
       if
        local.get $17
        call $~lib/rt/pure/__release
        block
         local.get $17
         i32.const 568
         i32.const 11
         i32.const 18
         call $~lib/builtins/abort
         unreachable
         unreachable
        end
        unreachable
       end
       local.get $17
       call $~lib/rt/pure/__release
      end
     end
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
   end
   call $assembly/internal/report/reportActual/Actual.clear
   call $assembly/internal/report/reportExpected/Expected.clear
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
   return
  end
  block $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
   local.get $0
   i32.load offset=4
   call $~lib/rt/pure/__retain
   local.set $17
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $15
   local.get $0
   i32.load
   local.set $12
   local.get $2
   call $~lib/rt/pure/__retain
   local.set $19
   block $assembly/internal/report/reportActual/reportActual<~lib/arraybuffer/ArrayBuffer>|inlined.1
    local.get $17
    call $~lib/rt/pure/__retain
    local.set $18
    local.get $18
    local.set $11
    local.get $18
    i32.const 0
    i32.eq
    if
     i32.const 1
     global.set $assembly/internal/report/reportActual/Actual.type
    else     
     local.get $11
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportActual/Actual.reference
     call $~lib/rt/pure/__release
     local.get $11
     global.set $assembly/internal/report/reportActual/Actual.reference
     block (result i32)
      local.get $18
      drop
      i32.const 0
     end
     if
      i32.const 5
      global.set $assembly/internal/report/reportActual/Actual.type
     else      
      block (result i32)
       local.get $18
       drop
       i32.const 1
      end
      if
       i32.const 4
       global.set $assembly/internal/report/reportActual/Actual.type
       local.get $11
       call $~lib/rt/pure/__retain
       local.set $13
       local.get $13
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       global.set $assembly/internal/report/reportActual/Actual.offset
       local.get $13
       call $~lib/rt/pure/__release
      else       
       i32.const 4
       global.set $assembly/internal/report/reportActual/Actual.type
       i32.const 0
       global.set $assembly/internal/report/reportActual/Actual.offset
      end
     end
    end
    local.get $18
    call $~lib/rt/pure/__release
   end
   block $assembly/internal/report/reportExpected/reportExpected<~lib/arraybuffer/ArrayBuffer>|inlined.1
    local.get $15
    call $~lib/rt/pure/__retain
    local.set $14
    local.get $12
    local.set $16
    global.get $assembly/internal/report/reportExpected/Expected.ready
    i32.eqz
    if
     call $assembly/internal/report/reportExpected/reportInvalidExpectCall
     local.get $14
     call $~lib/rt/pure/__release
     br $assembly/internal/report/reportExpected/reportExpected<~lib/arraybuffer/ArrayBuffer>|inlined.1
    end
    local.get $16
    global.set $assembly/internal/report/reportExpected/Expected.negated
    local.get $14
    i32.const 0
    i32.eq
    if
     i32.const 1
     global.set $assembly/internal/report/reportExpected/Expected.type
    else     
     local.get $14
     local.set $18
     local.get $18
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportExpected/Expected.reference
     call $~lib/rt/pure/__release
     local.get $18
     global.set $assembly/internal/report/reportExpected/Expected.reference
     block (result i32)
      local.get $14
      drop
      i32.const 0
     end
     if
      i32.const 5
      global.set $assembly/internal/report/reportExpected/Expected.type
     else      
      block (result i32)
       local.get $14
       drop
       i32.const 1
      end
      if
       local.get $14
       call $~lib/rt/pure/__retain
       local.set $11
       i32.const 4
       global.set $assembly/internal/report/reportExpected/Expected.type
       local.get $11
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       global.set $assembly/internal/report/reportExpected/Expected.offset
       local.get $11
       call $~lib/rt/pure/__release
      else       
       i32.const 4
       global.set $assembly/internal/report/reportExpected/Expected.type
       i32.const 0
       global.set $assembly/internal/report/reportExpected/Expected.offset
      end
     end
    end
    local.get $14
    call $~lib/rt/pure/__release
   end
   local.get $15
   local.get $17
   i32.eq
   if
    block $assembly/internal/comparison/assert/assert|inlined.12
     local.get $12
     i32.eqz
     local.set $4
     local.get $19
     call $~lib/rt/pure/__retain
     local.set $3
     local.get $4
     i32.eqz
     if
      local.get $3
      call $~lib/rt/pure/__release
      block
       local.get $3
       i32.const 568
       i32.const 11
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $3
     call $~lib/rt/pure/__release
    end
    local.get $19
    call $~lib/rt/pure/__release
    local.get $15
    call $~lib/rt/pure/__release
    local.get $17
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
   end
   local.get $15
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $17
    i32.const 0
    i32.eq
   end
   if
    block $assembly/internal/comparison/assert/assert|inlined.13
     local.get $12
     local.set $6
     local.get $19
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $6
     i32.eqz
     if
      local.get $5
      call $~lib/rt/pure/__release
      block
       local.get $5
       i32.const 568
       i32.const 11
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $19
    call $~lib/rt/pure/__release
    local.get $15
    call $~lib/rt/pure/__release
    local.get $17
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
   end
   block $~lib/memory/memory.compare|inlined.3 (result i32)
    local.get $15
    local.set $8
    local.get $17
    local.set $9
    i32.const 0
    local.set $10
    block $~lib/util/memory/memcmp|inlined.3 (result i32)
     local.get $8
     local.set $11
     local.get $9
     local.set $13
     local.get $10
     local.set $7
     local.get $11
     local.get $13
     i32.eq
     if
      i32.const 0
      br $~lib/util/memory/memcmp|inlined.3
     end
     block $break|1
      loop $continue|1
       local.get $7
       i32.const 0
       i32.ne
       if (result i32)
        local.get $11
        i32.load8_u
        local.get $13
        i32.load8_u
        i32.eq
       else        
        i32.const 0
       end
       if
        local.get $7
        i32.const 1
        i32.sub
        local.set $7
        local.get $11
        i32.const 1
        i32.add
        local.set $11
        local.get $13
        i32.const 1
        i32.add
        local.set $13
        br $continue|1
       end
      end
     end
     local.get $7
     if (result i32)
      local.get $11
      i32.load8_u
      local.get $13
      i32.load8_u
      i32.sub
     else      
      i32.const 0
     end
    end
   end
   local.set $8
   block $assembly/internal/comparison/assert/assert|inlined.14
    local.get $12
    local.get $8
    i32.const 0
    i32.eq
    i32.xor
    local.set $16
    local.get $19
    call $~lib/rt/pure/__retain
    local.set $18
    local.get $16
    i32.eqz
    if
     local.get $18
     call $~lib/rt/pure/__release
     block
      local.get $18
      i32.const 568
      i32.const 11
      i32.const 18
      call $~lib/builtins/abort
      unreachable
      unreachable
     end
     unreachable
    end
    local.get $18
    call $~lib/rt/pure/__release
   end
   local.get $19
   call $~lib/rt/pure/__release
   local.get $15
   call $~lib/rt/pure/__release
   local.get $17
   call $~lib/rt/pure/__release
  end
  call $assembly/internal/report/reportActual/Actual.clear
  call $assembly/internal/report/reportExpected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 (; 88 ;) (type $FUNCSIG$v)
  (local $0 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/buff1
  call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
  local.tee $0
  global.get $assembly/__tests__/toStrictEqual.spec/buff2
  i32.const 664
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not (; 89 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 (; 90 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/buff1
  call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
  local.tee $1
  global.get $assembly/__tests__/toStrictEqual.spec/buff2
  i32.const 664
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 (; 91 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/buff1
  call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
  local.tee $1
  global.get $assembly/__tests__/toStrictEqual.spec/buff3
  i32.const 3560
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 (; 92 ;) (type $FUNCSIG$v)
  (local $0 i32)
  global.get $assembly/__tests__/toStrictEqual.spec/buff1
  call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
  local.tee $0
  global.get $assembly/__tests__/toStrictEqual.spec/buff3
  i32.const 664
  call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/rt/__allocArray (; 93 ;) (type $FUNCSIG$iiiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  i32.const 16
  local.get $2
  call $~lib/rt/tlsf/__alloc
  local.set $4
  local.get $0
  local.get $1
  i32.shl
  local.set $5
  local.get $5
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $6
  local.get $4
  local.get $6
  call $~lib/rt/pure/__retain
  i32.store
  local.get $4
  local.get $6
  i32.store offset=4
  local.get $4
  local.get $5
  i32.store offset=8
  local.get $4
  local.get $0
  i32.store offset=12
  local.get $3
  if
   local.get $6
   local.get $3
   local.get $5
   call $~lib/memory/memory.copy
  end
  local.get $4
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 94 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/array/Array<i32>> (; 95 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/array/Array<i32>#__unchecked_get (; 96 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $~lib/array/Array<i32>#get:length (; 97 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toStrictEqual (; 98 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/comparison/arrayComparison/arrayComparison<~lib/array/Array<i32>>|inlined.0
   local.get $0
   i32.load offset=4
   call $~lib/rt/pure/__retain
   local.set $6
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $0
   i32.load
   local.set $4
   local.get $2
   call $~lib/rt/pure/__retain
   local.set $3
   block $assembly/internal/report/reportActual/reportActual<~lib/array/Array<i32>>|inlined.0
    local.get $6
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $7
    local.set $8
    local.get $7
    i32.const 0
    i32.eq
    if
     i32.const 1
     global.set $assembly/internal/report/reportActual/Actual.type
    else     
     local.get $8
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportActual/Actual.reference
     call $~lib/rt/pure/__release
     local.get $8
     global.set $assembly/internal/report/reportActual/Actual.reference
     i32.const 6
     global.set $assembly/internal/report/reportActual/Actual.type
    end
    local.get $7
    call $~lib/rt/pure/__release
   end
   block $assembly/internal/report/reportExpected/reportExpected<~lib/array/Array<i32>>|inlined.0
    local.get $5
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $4
    local.set $8
    global.get $assembly/internal/report/reportExpected/Expected.ready
    i32.eqz
    if
     call $assembly/internal/report/reportExpected/reportInvalidExpectCall
     local.get $7
     call $~lib/rt/pure/__release
     br $assembly/internal/report/reportExpected/reportExpected<~lib/array/Array<i32>>|inlined.0
    end
    local.get $8
    global.set $assembly/internal/report/reportExpected/Expected.negated
    local.get $7
    i32.const 0
    i32.eq
    if
     i32.const 1
     global.set $assembly/internal/report/reportExpected/Expected.type
    else     
     local.get $7
     local.set $9
     local.get $9
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportExpected/Expected.reference
     call $~lib/rt/pure/__release
     local.get $9
     global.set $assembly/internal/report/reportExpected/Expected.reference
     i32.const 6
     global.set $assembly/internal/report/reportExpected/Expected.type
    end
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $6
   local.get $5
   i32.eq
   if
    block $assembly/internal/comparison/assert/assert|inlined.15
     local.get $4
     i32.eqz
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $9
     local.get $8
     i32.eqz
     if
      local.get $9
      call $~lib/rt/pure/__release
      block
       local.get $9
       i32.const 568
       i32.const 11
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
    local.get $3
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/arrayComparison/arrayComparison<~lib/array/Array<i32>>|inlined.0
   end
   local.get $6
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $5
    i32.const 0
    i32.eq
   end
   if
    block $assembly/internal/comparison/assert/assert|inlined.16
     local.get $4
     local.set $9
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $9
     i32.eqz
     if
      local.get $7
      call $~lib/rt/pure/__release
      block
       local.get $7
       i32.const 568
       i32.const 11
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $7
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/arrayComparison/arrayComparison<~lib/array/Array<i32>>|inlined.0
   end
   local.get $6
   call $~lib/array/Array<i32>#get:length
   local.get $5
   call $~lib/array/Array<i32>#get:length
   i32.ne
   if
    block $assembly/internal/comparison/assert/assert|inlined.17
     local.get $4
     local.set $7
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $7
     i32.eqz
     if
      local.get $8
      call $~lib/rt/pure/__release
      block
       local.get $8
       i32.const 568
       i32.const 11
       i32.const 18
       call $~lib/builtins/abort
       unreachable
       unreachable
      end
      unreachable
     end
     local.get $8
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/arrayComparison/arrayComparison<~lib/array/Array<i32>>|inlined.0
   end
   i32.const 1
   local.set $7
   local.get $6
   call $~lib/array/Array<i32>#get:length
   local.set $8
   block $break|0
    i32.const 0
    local.set $9
    loop $repeat|0
     block $continue|0
      local.get $9
      local.get $8
      i32.lt_s
      i32.eqz
      br_if $break|0
      local.get $6
      local.get $9
      call $~lib/array/Array<i32>#__unchecked_get
      local.get $5
      local.get $9
      call $~lib/array/Array<i32>#__unchecked_get
      i32.eq
      if
       br $continue|0
      end
      i32.const 0
      local.set $7
      br $break|0
     end
     local.get $9
     i32.const 1
     i32.add
     local.set $9
     br $repeat|0
     unreachable
    end
    unreachable
   end
   block $assembly/internal/comparison/assert/assert|inlined.18
    local.get $7
    local.get $4
    i32.xor
    local.set $10
    local.get $3
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $10
    i32.eqz
    if
     local.get $9
     call $~lib/rt/pure/__release
     block
      local.get $9
      i32.const 568
      i32.const 11
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
   local.get $3
   call $~lib/rt/pure/__release
   local.get $5
   call $~lib/rt/pure/__release
   local.get $6
   call $~lib/rt/pure/__release
  end
  call $assembly/internal/report/reportActual/Actual.clear
  call $assembly/internal/report/reportExpected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  return
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|18 (; 99 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 4232
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $2
  local.get $0
  i32.const 4264
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toStrictEqual
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 100 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|19 (; 101 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 4488
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $2
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.tee $3
  local.get $0
  i32.const 664
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toStrictEqual
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|20 (; 102 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 4808
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $2
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 4840
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $4
  i32.const 4872
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toStrictEqual
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $4
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|21 (; 103 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 5104
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $2
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.tee $3
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 5136
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $5
  i32.const 4872
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toStrictEqual
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $5
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|22 (; 104 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 5312
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $2
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.tee $3
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 5344
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $5
  i32.const 664
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toStrictEqual
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $5
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|23 (; 105 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 5512
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $1
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $2
  i32.const 3
  i32.const 2
  i32.const 8
  i32.const 5544
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.tee $4
  i32.const 664
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toStrictEqual
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $4
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<u8>#constructor (; 106 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 5
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
   i32.store8 offset=4
   local.get $0
  end
  local.get $1
  i32.store8 offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<u8> (; 107 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<u8>#constructor
 )
 (func $assembly/internal/report/Box/Box<u8>#constructor (; 108 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 1
   i32.const 11
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store8
  local.get $0
 )
 (func $assembly/internal/Expectation/Expectation<u8>#toBe (; 109 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/comparison/exactComparison/exactComparison<u8>|inlined.0
   local.get $0
   i32.load8_u offset=4
   local.set $6
   local.get $1
   local.set $5
   local.get $0
   i32.load
   local.set $4
   local.get $2
   call $~lib/rt/pure/__retain
   local.set $3
   block $assembly/internal/report/reportActual/reportActual<u8>|inlined.0
    local.get $6
    local.set $7
    block (result i32)
     local.get $7
     drop
     i32.const 0
    end
    if (result i32)
     i32.const 1
    else     
     local.get $7
     drop
     i32.const 0
    end
    if
     i32.const 10
     global.set $assembly/internal/report/reportActual/Actual.type
     block (result i32)
      local.get $7
      drop
      i32.const 0
     end
     global.set $assembly/internal/report/reportActual/Actual.signed
     i32.const 0
     local.get $7
     call $assembly/internal/report/Box/Box<u8>#constructor
     local.set $8
     local.get $8
     local.set $9
     local.get $9
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportActual/Actual.reference
     call $~lib/rt/pure/__release
     local.get $9
     global.set $assembly/internal/report/reportActual/Actual.reference
     local.get $8
     call $~lib/rt/pure/__release
    else     
     i32.const 3
     global.set $assembly/internal/report/reportActual/Actual.type
     block (result i32)
      local.get $7
      drop
      i32.const 0
     end
     global.set $assembly/internal/report/reportActual/Actual.signed
     local.get $7
     global.set $assembly/internal/report/reportActual/Actual.integer
    end
   end
   block $assembly/internal/report/reportExpected/reportExpected<u8>|inlined.0
    local.get $5
    local.set $9
    local.get $4
    local.set $8
    global.get $assembly/internal/report/reportExpected/Expected.ready
    i32.eqz
    if
     call $assembly/internal/report/reportExpected/reportInvalidExpectCall
     br $assembly/internal/report/reportExpected/reportExpected<u8>|inlined.0
    end
    local.get $8
    global.set $assembly/internal/report/reportExpected/Expected.negated
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
     i32.const 10
     global.set $assembly/internal/report/reportExpected/Expected.type
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     global.set $assembly/internal/report/reportExpected/Expected.signed
     i32.const 0
     local.get $9
     call $assembly/internal/report/Box/Box<u8>#constructor
     local.set $7
     local.get $7
     local.set $10
     local.get $10
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportExpected/Expected.reference
     call $~lib/rt/pure/__release
     local.get $10
     global.set $assembly/internal/report/reportExpected/Expected.reference
     local.get $7
     call $~lib/rt/pure/__release
    else     
     i32.const 3
     global.set $assembly/internal/report/reportExpected/Expected.type
     block (result i32)
      local.get $9
      drop
      i32.const 0
     end
     global.set $assembly/internal/report/reportExpected/Expected.signed
     local.get $9
     i32.const 255
     i32.and
     global.set $assembly/internal/report/reportExpected/Expected.integer
    end
   end
   block $assembly/internal/comparison/assert/assert|inlined.19
    local.get $4
    local.get $5
    i32.const 255
    i32.and
    local.get $6
    i32.eq
    i32.xor
    local.set $10
    local.get $3
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $10
    i32.eqz
    if
     local.get $7
     call $~lib/rt/pure/__release
     block
      local.get $7
      i32.const 568
      i32.const 11
      i32.const 18
      call $~lib/builtins/abort
      unreachable
      unreachable
     end
     unreachable
    end
    local.get $7
    call $~lib/rt/pure/__release
   end
   local.get $3
   call $~lib/rt/pure/__release
  end
  call $assembly/internal/report/reportActual/Actual.clear
  call $assembly/internal/report/reportExpected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|24 (; 110 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 42
  call $assembly/internal/Expectation/expect<u8>
  local.tee $0
  i32.const 42
  i32.const 5728
  call $assembly/internal/Expectation/Expectation<u8>#toBe
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#constructor (; 111 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>> (; 112 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_get (; 113 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/string/String#get:length (; 114 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/util/string/compareImpl (; 115 ;) (type $FUNCSIG$iiiiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
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
    if
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
   end
  end
  local.get $5
  local.set $8
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $8
 )
 (func $~lib/string/String.__eq (; 116 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#get:length (; 117 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toStrictEqual (; 118 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/comparison/arrayComparison/arrayComparison<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>|inlined.0
   local.get $0
   i32.load offset=4
   call $~lib/rt/pure/__retain
   local.set $6
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $0
   i32.load
   local.set $4
   local.get $2
   call $~lib/rt/pure/__retain
   local.set $3
   block $assembly/internal/report/reportActual/reportActual<~lib/string/String>|inlined.0
    i32.const 6080
    call $~lib/rt/pure/__retain
    local.set $8
    local.get $8
    local.set $9
    local.get $8
    i32.const 0
    call $~lib/string/String.__eq
    if
     i32.const 1
     global.set $assembly/internal/report/reportActual/Actual.type
    else     
     local.get $9
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportActual/Actual.reference
     call $~lib/rt/pure/__release
     local.get $9
     global.set $assembly/internal/report/reportActual/Actual.reference
     block (result i32)
      local.get $8
      drop
      i32.const 1
     end
     if
      i32.const 5
      global.set $assembly/internal/report/reportActual/Actual.type
     else      
      block (result i32)
       local.get $8
       drop
       i32.const 0
      end
      if
       i32.const 4
       global.set $assembly/internal/report/reportActual/Actual.type
       local.get $9
       call $~lib/rt/pure/__retain
       local.set $10
       local.get $10
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       global.set $assembly/internal/report/reportActual/Actual.offset
       local.get $10
       call $~lib/rt/pure/__release
      else       
       i32.const 4
       global.set $assembly/internal/report/reportActual/Actual.type
       i32.const 0
       global.set $assembly/internal/report/reportActual/Actual.offset
      end
     end
    end
    local.get $8
    call $~lib/rt/pure/__release
   end
   block $assembly/internal/report/reportExpected/reportExpected<~lib/string/String>|inlined.0
    i32.const 6080
    call $~lib/rt/pure/__retain
    local.set $9
    i32.const 0
    local.set $10
    global.get $assembly/internal/report/reportExpected/Expected.ready
    i32.eqz
    if
     call $assembly/internal/report/reportExpected/reportInvalidExpectCall
     local.get $9
     call $~lib/rt/pure/__release
     br $assembly/internal/report/reportExpected/reportExpected<~lib/string/String>|inlined.0
    end
    local.get $10
    global.set $assembly/internal/report/reportExpected/Expected.negated
    local.get $9
    i32.const 0
    call $~lib/string/String.__eq
    if
     i32.const 1
     global.set $assembly/internal/report/reportExpected/Expected.type
    else     
     local.get $9
     local.set $8
     local.get $8
     call $~lib/rt/pure/__retain
     drop
     global.get $assembly/internal/report/reportExpected/Expected.reference
     call $~lib/rt/pure/__release
     local.get $8
     global.set $assembly/internal/report/reportExpected/Expected.reference
     block (result i32)
      local.get $9
      drop
      i32.const 1
     end
     if
      i32.const 5
      global.set $assembly/internal/report/reportExpected/Expected.type
     else      
      block (result i32)
       local.get $9
       drop
       i32.const 0
      end
      if
       local.get $9
       call $~lib/rt/pure/__retain
       local.set $11
       i32.const 4
       global.set $assembly/internal/report/reportExpected/Expected.type
       local.get $11
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       global.set $assembly/internal/report/reportExpected/Expected.offset
       local.get $11
       call $~lib/rt/pure/__release
      else       
       i32.const 4
       global.set $assembly/internal/report/reportExpected/Expected.type
       i32.const 0
       global.set $assembly/internal/report/reportExpected/Expected.offset
      end
     end
    end
    local.get $9
    call $~lib/rt/pure/__release
   end
   local.get $6
   local.get $5
   i32.eq
   if
    block $assembly/internal/comparison/assert/assert|inlined.20
     local.get $4
     i32.eqz
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $8
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 568
       i32.const 11
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
    local.get $3
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/arrayComparison/arrayComparison<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>|inlined.0
   end
   local.get $6
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $5
    i32.const 0
    i32.eq
   end
   if
    block $assembly/internal/comparison/assert/assert|inlined.21
     local.get $4
     local.set $9
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $10
     local.get $9
     i32.eqz
     if
      local.get $10
      call $~lib/rt/pure/__release
      block
       local.get $10
       i32.const 568
       i32.const 11
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
    local.get $3
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/arrayComparison/arrayComparison<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>|inlined.0
   end
   local.get $6
   call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#get:length
   local.get $5
   call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#get:length
   i32.ne
   if
    block $assembly/internal/comparison/assert/assert|inlined.22
     local.get $4
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $11
     local.get $8
     i32.eqz
     if
      local.get $11
      call $~lib/rt/pure/__release
      block
       local.get $11
       i32.const 568
       i32.const 11
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
    local.get $3
    call $~lib/rt/pure/__release
    local.get $5
    call $~lib/rt/pure/__release
    local.get $6
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
    br $assembly/internal/comparison/arrayComparison/arrayComparison<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>|inlined.0
   end
   i32.const 1
   local.set $8
   local.get $6
   call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#get:length
   local.set $11
   block $break|0
    i32.const 0
    local.set $9
    loop $repeat|0
     block $continue|0
      local.get $9
      local.get $11
      i32.lt_s
      i32.eqz
      br_if $break|0
      local.get $6
      local.get $9
      call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_get
      local.tee $10
      local.get $5
      local.get $9
      call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_get
      local.tee $12
      call $assembly/__tests__/setup/Vec3/Vec3#__equals
      if
       local.get $10
       call $~lib/rt/pure/__release
       local.get $12
       call $~lib/rt/pure/__release
       br $continue|0
      end
      i32.const 0
      local.set $8
      local.get $10
      call $~lib/rt/pure/__release
      local.get $12
      call $~lib/rt/pure/__release
      br $break|0
     end
     local.get $9
     i32.const 1
     i32.add
     local.set $9
     br $repeat|0
     unreachable
    end
    unreachable
   end
   block $assembly/internal/comparison/assert/assert|inlined.23
    local.get $8
    local.get $4
    i32.xor
    local.set $10
    local.get $3
    call $~lib/rt/pure/__retain
    local.set $9
    local.get $10
    i32.eqz
    if
     local.get $9
     call $~lib/rt/pure/__release
     block
      local.get $9
      i32.const 568
      i32.const 11
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
   local.get $3
   call $~lib/rt/pure/__release
   local.get $5
   call $~lib/rt/pure/__release
   local.get $6
   call $~lib/rt/pure/__release
   local.get $7
   call $~lib/rt/pure/__release
  end
  call $assembly/internal/report/reportActual/Actual.clear
  call $assembly/internal/report/reportExpected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  return
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|25 (; 119 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block (result i32)
   i32.const 3
   i32.const 2
   i32.const 12
   i32.const 0
   call $~lib/rt/__allocArray
   local.set $0
   local.get $0
   i32.load offset=4
   local.set $1
   local.get $1
   i32.const 0
   f64.const 1
   f64.const 2
   f64.const 3
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $2
   call $~lib/rt/pure/__retain
   i32.store
   local.get $1
   i32.const 0
   f64.const 4
   f64.const 5
   f64.const 6
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $3
   call $~lib/rt/pure/__retain
   i32.store offset=4
   local.get $1
   i32.const 0
   f64.const 7
   f64.const 8
   f64.const 9
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $4
   call $~lib/rt/pure/__retain
   i32.store offset=8
   local.get $0
  end
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $1
  block (result i32)
   i32.const 3
   i32.const 2
   i32.const 12
   i32.const 0
   call $~lib/rt/__allocArray
   local.set $0
   local.get $0
   i32.load offset=4
   local.set $5
   local.get $5
   i32.const 0
   f64.const 1
   f64.const 2
   f64.const 3
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $6
   call $~lib/rt/pure/__retain
   i32.store
   local.get $5
   i32.const 0
   f64.const 4
   f64.const 5
   f64.const 6
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $7
   call $~lib/rt/pure/__retain
   i32.store offset=4
   local.get $5
   i32.const 0
   f64.const 7
   f64.const 8
   f64.const 9
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $8
   call $~lib/rt/pure/__retain
   i32.store offset=8
   local.get $0
  end
  i32.const 5952
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toStrictEqual
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $4
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  local.get $7
  call $~lib/rt/pure/__release
  local.get $8
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#get:not (; 120 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|26 (; 121 ;) (type $FUNCSIG$v)
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
  block (result i32)
   i32.const 3
   i32.const 2
   i32.const 12
   i32.const 0
   call $~lib/rt/__allocArray
   local.set $0
   local.get $0
   i32.load offset=4
   local.set $1
   local.get $1
   i32.const 0
   f64.const 1
   f64.const 2
   f64.const 3
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $2
   call $~lib/rt/pure/__retain
   i32.store
   local.get $1
   i32.const 0
   f64.const 4
   f64.const 5
   f64.const 6
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $3
   call $~lib/rt/pure/__retain
   i32.store offset=4
   local.get $1
   i32.const 0
   f64.const 7
   f64.const 8
   f64.const 9
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $4
   call $~lib/rt/pure/__retain
   i32.store offset=8
   local.get $0
  end
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#get:not
  local.tee $0
  block (result i32)
   i32.const 3
   i32.const 2
   i32.const 12
   i32.const 0
   call $~lib/rt/__allocArray
   local.set $5
   local.get $5
   i32.load offset=4
   local.set $6
   local.get $6
   i32.const 0
   f64.const 1
   f64.const 2
   f64.const 3
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $7
   call $~lib/rt/pure/__retain
   i32.store
   local.get $6
   i32.const 0
   f64.const 4
   f64.const 5
   f64.const 6
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $8
   call $~lib/rt/pure/__retain
   i32.store offset=4
   local.get $6
   i32.const 0
   f64.const 7
   f64.const 8
   f64.const 9
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $9
   call $~lib/rt/pure/__retain
   i32.store offset=8
   local.get $5
  end
  i32.const 664
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toStrictEqual
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $4
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $7
  call $~lib/rt/pure/__release
  local.get $8
  call $~lib/rt/pure/__release
  local.get $9
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|27 (; 122 ;) (type $FUNCSIG$v)
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
  block (result i32)
   i32.const 3
   i32.const 2
   i32.const 12
   i32.const 0
   call $~lib/rt/__allocArray
   local.set $0
   local.get $0
   i32.load offset=4
   local.set $1
   local.get $1
   i32.const 0
   f64.const 1
   f64.const 2
   f64.const 3
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $2
   call $~lib/rt/pure/__retain
   i32.store
   local.get $1
   i32.const 0
   f64.const 4
   f64.const 5
   f64.const 6
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $3
   call $~lib/rt/pure/__retain
   i32.store offset=4
   local.get $1
   i32.const 0
   f64.const 7
   f64.const 8
   f64.const 9
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $4
   call $~lib/rt/pure/__retain
   i32.store offset=8
   local.get $0
  end
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $1
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#get:not
  local.tee $0
  block (result i32)
   i32.const 3
   i32.const 2
   i32.const 12
   i32.const 0
   call $~lib/rt/__allocArray
   local.set $5
   local.get $5
   i32.load offset=4
   local.set $6
   local.get $6
   i32.const 0
   f64.const 9
   f64.const 8
   f64.const 7
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $7
   call $~lib/rt/pure/__retain
   i32.store
   local.get $6
   i32.const 0
   f64.const 4
   f64.const 5
   f64.const 6
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $8
   call $~lib/rt/pure/__retain
   i32.store offset=4
   local.get $6
   i32.const 0
   f64.const 7
   f64.const 8
   f64.const 9
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $9
   call $~lib/rt/pure/__retain
   i32.store offset=8
   local.get $5
  end
  i32.const 6504
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toStrictEqual
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $4
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $7
  call $~lib/rt/pure/__release
  local.get $8
  call $~lib/rt/pure/__release
  local.get $9
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|28 (; 123 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  block (result i32)
   i32.const 3
   i32.const 2
   i32.const 12
   i32.const 0
   call $~lib/rt/__allocArray
   local.set $0
   local.get $0
   i32.load offset=4
   local.set $1
   local.get $1
   i32.const 0
   f64.const 1
   f64.const 2
   f64.const 3
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $2
   call $~lib/rt/pure/__retain
   i32.store
   local.get $1
   i32.const 0
   f64.const 4
   f64.const 5
   f64.const 6
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $3
   call $~lib/rt/pure/__retain
   i32.store offset=4
   local.get $1
   i32.const 0
   f64.const 7
   f64.const 8
   f64.const 9
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $4
   call $~lib/rt/pure/__retain
   i32.store offset=8
   local.get $0
  end
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $1
  block (result i32)
   i32.const 3
   i32.const 2
   i32.const 12
   i32.const 0
   call $~lib/rt/__allocArray
   local.set $0
   local.get $0
   i32.load offset=4
   local.set $5
   local.get $5
   i32.const 0
   f64.const 9
   f64.const 8
   f64.const 7
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $6
   call $~lib/rt/pure/__retain
   i32.store
   local.get $5
   i32.const 0
   f64.const 4
   f64.const 5
   f64.const 6
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $7
   call $~lib/rt/pure/__retain
   i32.store offset=4
   local.get $5
   i32.const 0
   f64.const 7
   f64.const 8
   f64.const 9
   call $assembly/__tests__/setup/Vec3/Vec3#constructor
   local.tee $8
   call $~lib/rt/pure/__retain
   i32.store offset=8
   local.get $0
  end
  i32.const 664
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toStrictEqual
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $4
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $6
  call $~lib/rt/pure/__release
  local.get $7
  call $~lib/rt/pure/__release
  local.get $8
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0 (; 124 ;) (type $FUNCSIG$v)
  i32.const 424
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 680
  i32.const 2
  i32.const 784
  call $assembly/internal/Test/throws
  i32.const 928
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 1048
  i32.const 4
  i32.const 1160
  call $assembly/internal/Test/throws
  i32.const 1304
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1616
  i32.const 6
  i32.const 1448
  call $assembly/internal/Test/throws
  i32.const 1760
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1616
  i32.const 8
  i32.const 1912
  call $assembly/internal/Test/throws
  i32.const 2088
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 2232
  i32.const 10
  i32.const 664
  call $assembly/internal/Test/throws
  i32.const 2384
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 2520
  i32.const 12
  i32.const 2664
  call $assembly/internal/Test/throws
  i32.const 2384
  i32.const 13
  call $assembly/internal/Test/it
  i32.const 2520
  i32.const 14
  i32.const 2824
  call $assembly/internal/Test/throws
  i32.const 2984
  i32.const 15
  call $assembly/internal/Test/it
  i32.const 3072
  i32.const 16
  i32.const 3256
  call $assembly/internal/Test/throws
  i32.const 3464
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 3656
  i32.const 18
  i32.const 3840
  call $assembly/internal/Test/throws
  i32.const 4048
  i32.const 19
  call $assembly/internal/Test/it
  i32.const 4312
  i32.const 20
  i32.const 4520
  call $assembly/internal/Test/throws
  i32.const 4640
  i32.const 21
  call $assembly/internal/Test/it
  i32.const 4936
  i32.const 22
  i32.const 664
  call $assembly/internal/Test/throws
  i32.const 5168
  i32.const 23
  call $assembly/internal/Test/it
  i32.const 5376
  i32.const 24
  i32.const 664
  call $assembly/internal/Test/throws
  i32.const 5576
  i32.const 25
  call $assembly/internal/Test/it
  i32.const 5792
  i32.const 26
  call $assembly/internal/Test/it
  i32.const 6136
  i32.const 27
  i32.const 5952
  call $assembly/internal/Test/throws
  i32.const 6328
  i32.const 28
  call $assembly/internal/Test/it
  i32.const 6640
  i32.const 29
  i32.const 6504
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 125 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 126 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $start:assembly/__tests__/toStrictEqual.spec (; 127 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/buff1
  i32.const 0
  global.get $assembly/__tests__/toStrictEqual.spec/buffsize
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/buff2
  i32.const 0
  global.get $assembly/__tests__/toStrictEqual.spec/buffsize
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $assembly/__tests__/toStrictEqual.spec/buff3
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 0
   local.set $1
   f64.const 1
   local.set $0
   i32.const 0
   local.set $3
   local.get $2
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $0
   f64.store
   local.get $2
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 0
   local.set $1
   f64.const 1
   local.set $0
   i32.const 0
   local.set $3
   local.get $2
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $0
   f64.store
   local.get $2
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 0
   local.set $1
   f64.const 4
   local.set $0
   i32.const 0
   local.set $3
   local.get $2
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $0
   f64.store
   local.get $2
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 1
   local.set $1
   f64.const 2
   local.set $0
   i32.const 0
   local.set $3
   local.get $2
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $0
   f64.store
   local.get $2
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.4
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 1
   local.set $1
   f64.const 2
   local.set $0
   i32.const 0
   local.set $3
   local.get $2
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $0
   f64.store
   local.get $2
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.5
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 1
   local.set $1
   f64.const 5
   local.set $0
   i32.const 0
   local.set $3
   local.get $2
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $0
   f64.store
   local.get $2
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.6
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 2
   local.set $1
   f64.const 3
   local.set $0
   i32.const 0
   local.set $3
   local.get $2
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $0
   f64.store
   local.get $2
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.7
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 2
   local.set $1
   f64.const 3
   local.set $0
   i32.const 0
   local.set $3
   local.get $2
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $0
   f64.store
   local.get $2
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.8
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 2
   local.set $1
   f64.const 6
   local.set $0
   i32.const 0
   local.set $3
   local.get $2
   local.get $1
   i32.const 3
   i32.shl
   i32.add
   local.get $3
   i32.add
   local.get $0
   f64.store
   local.get $2
   call $~lib/rt/pure/__release
  end
  i32.const 376
  i32.const 30
  call $assembly/internal/Describe/describe
 )
 (func $assembly/index/__ready (; 128 ;) (type $FUNCSIG$v)
  i32.const 1
  global.set $assembly/internal/report/reportExpected/Expected.ready
 )
 (func $assembly/internal/call/__call (; 129 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $assembly/internal/report/reportActual/__sendActual (; 130 ;) (type $FUNCSIG$v)
  (local $0 i32)
  block $break|0
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
          i32.const 10
          i32.eq
          br_if $case6|0
          br $break|0
         end
         global.get $assembly/internal/report/reportActual/Actual.reference
         call $assembly/internal/report/reportActual/reportActualArray
         br $break|0
        end
        global.get $assembly/internal/report/reportActual/Actual.float
        i32.const 1
        call $assembly/internal/report/reportActual/reportActualFloat
        br $break|0
       end
       global.get $assembly/internal/report/reportActual/Actual.integer
       global.get $assembly/internal/report/reportActual/Actual.signed
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
   global.get $assembly/internal/report/reportActual/Actual.reference
   global.get $assembly/internal/report/reportActual/Actual.signed
   call $assembly/internal/report/reportActual/reportActualLong
   br $break|0
  end
 )
 (func $assembly/internal/report/reportExpected/__sendExpected (; 131 ;) (type $FUNCSIG$v)
  (local $0 i32)
  block $break|0
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
             br $break|0
            end
            global.get $assembly/internal/report/reportExpected/Expected.reference
            global.get $assembly/internal/report/reportExpected/Expected.negated
            call $assembly/internal/report/reportExpected/reportExpectedArray
            br $break|0
           end
           global.get $assembly/internal/report/reportExpected/Expected.float
           i32.const 1
           global.get $assembly/internal/report/reportExpected/Expected.negated
           call $assembly/internal/report/reportExpected/reportExpectedFloat
           br $break|0
          end
          global.get $assembly/internal/report/reportExpected/Expected.integer
          global.get $assembly/internal/report/reportExpected/Expected.signed
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
   global.get $assembly/internal/report/reportExpected/Expected.reference
   global.get $assembly/internal/report/reportExpected/Expected.signed
   global.get $assembly/internal/report/reportExpected/Expected.negated
   call $assembly/internal/report/reportExpected/reportExpectedLong
   br $break|0
  end
 )
 (func $assembly/internal/log/__ignoreLogs (; 132 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/log/ignoreLogs
 )
 (func $assembly/internal/RTrace/__disableRTrace (; 133 ;) (type $FUNCSIG$v)
  i32.const 0
  global.set $assembly/internal/RTrace/RTrace.enabled
 )
 (func $start (; 134 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  if
   return
  else   
   i32.const 1
   global.set $~lib/started
  end
  call $start:assembly/__tests__/toStrictEqual.spec
 )
 (func $~lib/array/Array<i32>#__visit_impl (; 135 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/pure/__visit (; 136 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__visit_impl (; 137 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
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
 (func $~lib/rt/__visit_members (; 138 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block
   end
   block $switch$1$leave
    block $switch$1$default
     block $switch$1$case$14
      block $switch$1$case$10
       block $switch$1$case$8
        block $switch$1$case$4
         block $switch$1$case$2
          local.get $0
          i32.const 8
          i32.sub
          i32.load
          br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$2 $switch$1$case$2 $switch$1$case$2 $switch$1$case$8 $switch$1$case$8 $switch$1$case$10 $switch$1$case$8 $switch$1$case$2 $switch$1$case$2 $switch$1$case$14 $switch$1$case$8 $switch$1$default
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
       local.get $0
       local.get $1
       call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__visit_impl
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
 (func $null (; 139 ;) (type $FUNCSIG$v)
 )
)
