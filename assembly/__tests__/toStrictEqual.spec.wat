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
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/report/reportActual/reportActualInteger (param i32)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/report/reportExpected/reportExpectedInteger (param i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/comparison/exactComparison/clearExpected))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/comparison/blockComparison/reportExpectedNull (param i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/comparison/blockComparison/reportExpectedReference (param i32 i32 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/comparison/blockComparison/reportActualNull))
 (import "__aspect" "reportActualReference" (func $assembly/internal/comparison/blockComparison/reportActualReference (param i32 i32)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportActualNull" (func $assembly/internal/report/reportActual/reportActualNull))
 (import "__aspect" "reportActualString" (func $assembly/internal/report/reportActual/reportActualString (param i32)))
 (import "__aspect" "reportActualReference" (func $assembly/internal/report/reportActual/reportActualReference (param i32 i32)))
 (import "__aspect" "reportExpectedNull" (func $assembly/internal/report/reportExpected/reportExpectedNull (param i32)))
 (import "__aspect" "reportExpectedString" (func $assembly/internal/report/reportExpected/reportExpectedString (param i32 i32)))
 (import "__aspect" "reportExpectedReference" (func $assembly/internal/report/reportExpected/reportExpectedReference (param i32 i32 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/comparison/referenceComparison/clearExpected))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
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
 (data (i32.const 552) "\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00")
 (data (i32.const 568) "^\00\00\00\01\00\00\00\01\00\00\00^\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00e\00x\00a\00c\00t\00C\00o\00m\00p\00a\00r\00i\00s\00o\00n\00.\00t\00s\00")
 (data (i32.const 680) "^\00\00\00\01\00\00\00\01\00\00\00^\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00b\00l\00o\00c\00k\00C\00o\00m\00p\00a\00r\00i\00s\00o\00n\00.\00t\00s\00")
 (data (i32.const 792) "X\00\00\00\01\00\00\00\01\00\00\00X\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 896) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1040) "b\00\00\00\01\00\00\00\01\00\00\00b\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00t\00h\00a\00t\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 1160) "`\00\00\00\01\00\00\00\01\00\00\00`\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 1272) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1416) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1560) "\96\00\00\00\01\00\00\00\01\00\00\00\96\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 1728) "f\00\00\00\01\00\00\00\01\00\00\00f\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00r\00e\00f\00e\00r\00e\00n\00c\00e\00C\00o\00m\00p\00a\00r\00i\00s\00o\00n\00.\00t\00s\00")
 (data (i32.const 1848) "~\00\00\00\01\00\00\00\01\00\00\00~\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 1992) "\82\00\00\00\01\00\00\00\01\00\00\00\82\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 2144) "\a0\00\00\00\01\00\00\00\01\00\00\00\a0\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 2320) "\80\00\00\00\01\00\00\00\01\00\00\00\80\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 2464) "\88\00\00\00\01\00\00\00\01\00\00\00\88\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00n\00u\00l\00l\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00 \00v\00a\00l\00u\00e\00s\00")
 (data (i32.const 2616) "v\00\00\00\01\00\00\00\01\00\00\00v\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00s\00t\00r\00i\00t\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 2752) "|\00\00\00\01\00\00\00\01\00\00\00|\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 2896) "\90\00\00\00\01\00\00\00\01\00\00\00\90\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 3056) "\90\00\00\00\01\00\00\00\01\00\00\00\90\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 3216) "H\00\00\00\01\00\00\00\01\00\00\00H\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 3304) "\a4\00\00\00\01\00\00\00\01\00\00\00\a4\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00q\00u\00a\00l\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00o\00t\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 3488) "\be\00\00\00\01\00\00\00\01\00\00\00\be\00\00\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (data (i32.const 3696) "P\00\00\00\01\00\00\00\01\00\00\00P\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 3792) "\a4\00\00\00\01\00\00\00\01\00\00\00\a4\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 3976) "\be\00\00\00\01\00\00\00\01\00\00\00\be\00\00\00N\00o\00n\00-\00s\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (data (i32.const 4184) "\07\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00")
 (table $0 21 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
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
 (global $assembly/internal/noOp/noOp i32 (i32.const 20))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/started (mut i32) (i32.const 0))
 (global $~lib/rt/RTTI_BASE i32 (i32.const 4184))
 (global $~lib/heap/HEAP_BASE i32 (i32.const 4244))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti" (global $~lib/rt/RTTI_BASE))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__main" (func $assembly/index/__main))
 (export "__call" (func $assembly/internal/call/__call))
 (func $~lib/rt/tlsf/removeBlock (; 19 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/insertBlock (; 20 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/addMemory (; 21 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/initializeRoot (; 22 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/tlsf/prepareSize (; 23 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/searchBlock (; 24 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/growMemory (; 25 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/prepareBlock (; 26 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/allocateBlock (; 27 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/__alloc (; 28 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/pure/increment (; 29 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__retain (; 30 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/freeBlock (; 31 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/__typeinfo (; 32 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/memory/memcpy (; 33 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/memory/memory.copy (; 34 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/pure/growRoots (; 35 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/pure/appendRoot (; 36 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/decrement (; 37 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__release (; 38 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/markGray (; 39 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scanBlack (; 40 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scan (; 41 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/collectWhite (; 42 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__collect (; 43 ;) (type $FUNCSIG$v)
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
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 44 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  block (result i32)
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
 (func $~lib/memory/memory.fill (; 45 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 46 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 47 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 48 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/comparison/referenceComparison/referenceComparison<i32> (; 49 ;) (type $FUNCSIG$viiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $3
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/comparison/exactComparison/exactComparison<i32>|inlined.1
   local.get $0
   local.set $7
   local.get $1
   local.set $6
   local.get $2
   local.set $5
   local.get $3
   call $~lib/rt/pure/__retain
   local.set $4
   block $assembly/internal/report/reportActual/reportActual<i32>|inlined.1
    local.get $7
    local.set $8
    local.get $8
    call $assembly/internal/report/reportActual/reportActualInteger
   end
   block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.1
    local.get $6
    local.set $9
    local.get $5
    local.set $8
    local.get $9
    local.get $8
    call $assembly/internal/report/reportExpected/reportExpectedInteger
   end
   local.get $5
   local.get $6
   local.get $7
   i32.eq
   i32.xor
   i32.eqz
   if
    local.get $4
    i32.const 584
    i32.const 17
    i32.const 2
    call $~lib/builtins/abort
    unreachable
   end
   call $assembly/internal/comparison/exactComparison/clearExpected
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $3
  call $~lib/rt/pure/__release
  return
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 (; 50 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.0
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.tee $0
   local.set $3
   i32.const 3
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $1
   block (result i32)
    local.get $2
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $2
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.0
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
     local.get $7
     local.get $6
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<i32>|inlined.0
       local.get $7
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       local.set $9
       local.get $4
       call $~lib/rt/pure/__retain
       local.set $8
       block $assembly/internal/report/reportActual/reportActual<i32>|inlined.0
        local.get $11
        local.set $12
        local.get $12
        call $assembly/internal/report/reportActual/reportActualInteger
       end
       block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.0
        local.get $10
        local.set $13
        local.get $9
        local.set $12
        local.get $13
        local.get $12
        call $assembly/internal/report/reportExpected/reportExpectedInteger
       end
       local.get $9
       local.get $10
       local.get $11
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $8
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.0
     end
     local.get $6
     local.set $8
     local.get $7
     local.set $9
     local.get $8
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $8
      local.get $10
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $11
      local.get $11
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $12
     local.get $6
     i32.const 0
     i32.eq
     local.set $13
     local.get $12
     local.get $13
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $11
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.0 (result i32)
        local.get $9
        local.set $17
        local.get $8
        local.set $16
        local.get $11
        local.set $15
        block $~lib/util/memory/memcmp|inlined.0 (result i32)
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $15
         local.set $18
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.0
         end
         block $break|0
          loop $continue|0
           local.get $18
           i32.const 0
           i32.ne
           if (result i32)
            local.get $20
            i32.load8_u
            local.get $19
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $18
            i32.const 1
            i32.sub
            local.set $18
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            local.get $19
            i32.const 1
            i32.add
            local.set $19
            br $continue|0
           end
          end
         end
         local.get $18
         if (result i32)
          local.get $20
          i32.load8_u
          local.get $19
          i32.load8_u
          i32.sub
         else          
          i32.const 0
         end
        end
       end
       i32.const 0
       i32.eq
       local.set $15
       local.get $5
       local.get $15
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $1
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.0
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<i32>
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/it (; 51 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (; 52 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 (; 53 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.1
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<i32>#get:not
   local.tee $1
   local.set $4
   i32.const 3
   local.set $3
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $2
   block (result i32)
    local.get $3
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $3
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.1
     local.get $4
     i32.load offset=4
     local.set $8
     local.get $3
     local.set $7
     local.get $4
     i32.load
     local.set $6
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $8
     local.get $7
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<i32>|inlined.2
       local.get $8
       local.set $12
       local.get $7
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       call $~lib/rt/pure/__retain
       local.set $9
       block $assembly/internal/report/reportActual/reportActual<i32>|inlined.2
        local.get $12
        local.set $13
        local.get $13
        call $assembly/internal/report/reportActual/reportActualInteger
       end
       block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.2
        local.get $11
        local.set $14
        local.get $10
        local.set $13
        local.get $14
        local.get $13
        call $assembly/internal/report/reportExpected/reportExpectedInteger
       end
       local.get $10
       local.get $11
       local.get $12
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $9
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.1
     end
     local.get $7
     local.set $9
     local.get $8
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $12
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $9
      local.get $11
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $12
      local.get $12
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $13
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $13
     local.get $14
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $12
      local.get $11
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.1 (result i32)
        local.get $10
        local.set $18
        local.get $9
        local.set $17
        local.get $12
        local.set $16
        block $~lib/util/memory/memcmp|inlined.1 (result i32)
         local.get $18
         local.set $21
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.1
         end
         block $break|0
          loop $continue|0
           local.get $19
           i32.const 0
           i32.ne
           if (result i32)
            local.get $21
            i32.load8_u
            local.get $20
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $19
            i32.const 1
            i32.sub
            local.set $19
            local.get $21
            i32.const 1
            i32.add
            local.set $21
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            br $continue|0
           end
          end
         end
         local.get $19
         if (result i32)
          local.get $21
          i32.load8_u
          local.get $20
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
       local.get $6
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.1
   end
   local.get $4
   i32.load offset=4
   local.get $3
   local.get $4
   i32.load
   local.get $2
   call $assembly/internal/comparison/referenceComparison/referenceComparison<i32>
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/throws (; 54 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 (; 55 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.2
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<i32>#get:not
   local.tee $1
   local.set $4
   i32.const 1
   local.set $3
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $2
   block (result i32)
    local.get $3
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $3
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.2
     local.get $4
     i32.load offset=4
     local.set $8
     local.get $3
     local.set $7
     local.get $4
     i32.load
     local.set $6
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $8
     local.get $7
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<i32>|inlined.3
       local.get $8
       local.set $12
       local.get $7
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       call $~lib/rt/pure/__retain
       local.set $9
       block $assembly/internal/report/reportActual/reportActual<i32>|inlined.3
        local.get $12
        local.set $13
        local.get $13
        call $assembly/internal/report/reportActual/reportActualInteger
       end
       block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.3
        local.get $11
        local.set $14
        local.get $10
        local.set $13
        local.get $14
        local.get $13
        call $assembly/internal/report/reportExpected/reportExpectedInteger
       end
       local.get $10
       local.get $11
       local.get $12
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $9
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.2
     end
     local.get $7
     local.set $9
     local.get $8
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $12
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $9
      local.get $11
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $12
      local.get $12
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $13
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $13
     local.get $14
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $12
      local.get $11
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.2 (result i32)
        local.get $10
        local.set $18
        local.get $9
        local.set $17
        local.get $12
        local.set $16
        block $~lib/util/memory/memcmp|inlined.2 (result i32)
         local.get $18
         local.set $21
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.2
         end
         block $break|0
          loop $continue|0
           local.get $19
           i32.const 0
           i32.ne
           if (result i32)
            local.get $21
            i32.load8_u
            local.get $20
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $19
            i32.const 1
            i32.sub
            local.set $19
            local.get $21
            i32.const 1
            i32.add
            local.set $21
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            br $continue|0
           end
          end
         end
         local.get $19
         if (result i32)
          local.get $21
          i32.load8_u
          local.get $20
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
       local.get $6
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.2
   end
   local.get $4
   i32.load offset=4
   local.get $3
   local.get $4
   i32.load
   local.get $2
   call $assembly/internal/comparison/referenceComparison/referenceComparison<i32>
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 (; 56 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  block $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.3
   i32.const 3
   call $assembly/internal/Expectation/expect<i32>
   local.tee $0
   local.set $3
   i32.const 1
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $1
   block (result i32)
    local.get $2
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $2
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.3
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
     local.get $7
     local.get $6
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<i32>|inlined.4
       local.get $7
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       local.set $9
       local.get $4
       call $~lib/rt/pure/__retain
       local.set $8
       block $assembly/internal/report/reportActual/reportActual<i32>|inlined.4
        local.get $11
        local.set $12
        local.get $12
        call $assembly/internal/report/reportActual/reportActualInteger
       end
       block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.4
        local.get $10
        local.set $13
        local.get $9
        local.set $12
        local.get $13
        local.get $12
        call $assembly/internal/report/reportExpected/reportExpectedInteger
       end
       local.get $9
       local.get $10
       local.get $11
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $8
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.3
     end
     local.get $6
     local.set $8
     local.get $7
     local.set $9
     local.get $8
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $8
      local.get $10
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $11
      local.get $11
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $12
     local.get $6
     i32.const 0
     i32.eq
     local.set $13
     local.get $12
     local.get $13
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $11
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.3 (result i32)
        local.get $9
        local.set $17
        local.get $8
        local.set $16
        local.get $11
        local.set $15
        block $~lib/util/memory/memcmp|inlined.3 (result i32)
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $15
         local.set $18
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.3
         end
         block $break|0
          loop $continue|0
           local.get $18
           i32.const 0
           i32.ne
           if (result i32)
            local.get $20
            i32.load8_u
            local.get $19
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $18
            i32.const 1
            i32.sub
            local.set $18
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            local.get $19
            i32.const 1
            i32.add
            local.set $19
            br $continue|0
           end
          end
         end
         local.get $18
         if (result i32)
          local.get $20
          i32.load8_u
          local.get $19
          i32.load8_u
          i32.sub
         else          
          i32.const 0
         end
        end
       end
       i32.const 0
       i32.eq
       local.set $15
       local.get $5
       local.get $15
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $1
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<i32>#toStrictEqual|inlined.3
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<i32>
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/rt/pure/__retainRelease (; 57 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 58 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
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
  end
  local.tee $2
  local.get $2
  i32.load offset=4
  local.get $1
  call $~lib/rt/pure/__retainRelease
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 59 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 60 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3> (; 61 ;) (type $FUNCSIG$viiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $3
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
   local.get $0
   call $~lib/rt/pure/__retain
   local.set $4
   local.get $4
   i32.const 0
   i32.eq
   if
    call $assembly/internal/report/reportActual/reportActualNull
   else    
    block (result i32)
     local.get $4
     drop
     i32.const 0
    end
    if
     local.get $4
     call $assembly/internal/report/reportActual/reportActualString
    else     
     block (result i32)
      local.get $4
      drop
      i32.const 0
     end
     if
      local.get $4
      call $~lib/rt/pure/__retain
      local.set $5
      local.get $5
      local.get $5
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/report/reportActual/reportActualReference
      local.get $5
      call $~lib/rt/pure/__release
     else      
      local.get $4
      i32.const 24
      call $assembly/internal/report/reportActual/reportActualReference
     end
    end
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $2
   local.set $4
   local.get $5
   i32.const 0
   i32.eq
   if
    local.get $4
    call $assembly/internal/report/reportExpected/reportExpectedNull
   else    
    block (result i32)
     local.get $5
     drop
     i32.const 0
    end
    if
     local.get $5
     local.get $4
     call $assembly/internal/report/reportExpected/reportExpectedString
    else     
     block (result i32)
      local.get $5
      drop
      i32.const 0
     end
     if
      local.get $5
      call $~lib/rt/pure/__retain
      local.set $6
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $4
      call $assembly/internal/report/reportExpected/reportExpectedReference
      local.get $6
      call $~lib/rt/pure/__release
     else      
      local.get $5
      i32.const 24
      local.get $4
      call $assembly/internal/report/reportExpected/reportExpectedReference
     end
    end
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  local.get $0
  i32.eq
  if
   local.get $2
   i32.eqz
   i32.eqz
   if
    local.get $3
    i32.const 1744
    i32.const 21
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
   call $assembly/internal/comparison/referenceComparison/clearExpected
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
   return
  end
  local.get $1
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else   
   local.get $0
   i32.const 0
   i32.eq
  end
  if
   local.get $2
   i32.eqz
   if
    local.get $3
    i32.const 1744
    i32.const 28
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
   call $assembly/internal/comparison/referenceComparison/clearExpected
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
   return
  end
  block $~lib/memory/memory.compare|inlined.5 (result i32)
   local.get $1
   local.set $6
   local.get $0
   local.set $5
   i32.const 24
   local.set $4
   block $~lib/util/memory/memcmp|inlined.5 (result i32)
    local.get $6
    local.set $9
    local.get $5
    local.set $8
    local.get $4
    local.set $7
    local.get $9
    local.get $8
    i32.eq
    if
     i32.const 0
     br $~lib/util/memory/memcmp|inlined.5
    end
    block $break|0
     loop $continue|0
      local.get $7
      i32.const 0
      i32.ne
      if (result i32)
       local.get $9
       i32.load8_u
       local.get $8
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
       local.get $9
       i32.const 1
       i32.add
       local.set $9
       local.get $8
       i32.const 1
       i32.add
       local.set $8
       br $continue|0
      end
     end
    end
    local.get $7
    if (result i32)
     local.get $9
     i32.load8_u
     local.get $8
     i32.load8_u
     i32.sub
    else     
     i32.const 0
    end
   end
  end
  local.set $4
  local.get $2
  local.get $4
  i32.const 0
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $3
   i32.const 1744
   i32.const 38
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  call $assembly/internal/comparison/referenceComparison/clearExpected
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 (; 62 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/vec3
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 1576
   call $~lib/rt/pure/__retain
   local.set $1
   block (result i32)
    local.get $2
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $2
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $3
     i32.load
     local.set $5
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $4
     local.get $7
     local.get $6
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       call $~lib/rt/pure/__retain
       local.set $10
       local.get $5
       local.set $9
       local.get $4
       call $~lib/rt/pure/__retain
       local.set $8
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $12
        local.get $12
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $12
          drop
          i32.const 0
         end
         if
          local.get $12
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $12
           drop
           i32.const 0
          end
          if
           local.get $12
           call $~lib/rt/pure/__retain
           local.set $13
           local.get $13
           local.get $13
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $12
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
        local.get $10
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $9
        local.set $12
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $12
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          local.get $12
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       local.get $9
       local.get $10
       local.get $11
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $8
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $11
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $7
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
     end
     local.get $6
     local.set $8
     local.get $7
     local.set $9
     local.get $8
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $8
      local.get $10
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $11
      local.get $11
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $12
     local.get $6
     i32.const 0
     i32.eq
     local.set $13
     local.get $12
     local.get $13
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $11
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.4 (result i32)
        local.get $9
        local.set $17
        local.get $8
        local.set $16
        local.get $11
        local.set $15
        block $~lib/util/memory/memcmp|inlined.4 (result i32)
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $15
         local.set $18
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.4
         end
         block $break|0
          loop $continue|0
           local.get $18
           i32.const 0
           i32.ne
           if (result i32)
            local.get $20
            i32.load8_u
            local.get $19
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $18
            i32.const 1
            i32.sub
            local.set $18
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            local.get $19
            i32.const 1
            i32.add
            local.set $19
            br $continue|0
           end
          end
         end
         local.get $18
         if (result i32)
          local.get $20
          i32.load8_u
          local.get $19
          i32.load8_u
          i32.sub
         else          
          i32.const 0
         end
        end
       end
       i32.const 0
       i32.eq
       local.set $15
       local.get $5
       local.get $15
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $7
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $1
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 63 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 (; 64 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $4
   global.get $assembly/__tests__/toStrictEqual.spec/vec3
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $2
   block (result i32)
    local.get $3
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $3
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
     local.get $4
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $4
     i32.load
     local.set $6
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $8
     local.get $7
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
       local.get $8
       call $~lib/rt/pure/__retain
       local.set $12
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       call $~lib/rt/pure/__retain
       local.set $9
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.2
        local.get $12
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $13
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.2
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $14
        local.get $10
        local.set $13
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $13
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          local.get $13
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $15
           local.get $15
           local.get $15
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $15
           call $~lib/rt/pure/__release
          else           
           local.get $14
           i32.const 24
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $14
        call $~lib/rt/pure/__release
       end
       local.get $10
       local.get $11
       local.get $12
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $9
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $12
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $8
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
     end
     local.get $7
     local.set $9
     local.get $8
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $12
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $9
      local.get $11
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $12
      local.get $12
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $13
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $13
     local.get $14
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $12
      local.get $11
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.6 (result i32)
        local.get $10
        local.set $18
        local.get $9
        local.set $17
        local.get $12
        local.set $16
        block $~lib/util/memory/memcmp|inlined.6 (result i32)
         local.get $18
         local.set $21
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.6
         end
         block $break|0
          loop $continue|0
           local.get $19
           i32.const 0
           i32.ne
           if (result i32)
            local.get $21
            i32.load8_u
            local.get $20
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $19
            i32.const 1
            i32.sub
            local.set $19
            local.get $21
            i32.const 1
            i32.add
            local.set $21
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            br $continue|0
           end
          end
         end
         local.get $19
         if (result i32)
          local.get $21
          i32.load8_u
          local.get $20
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
       local.get $6
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $8
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   end
   local.get $4
   i32.load offset=4
   local.get $3
   local.get $4
   i32.load
   local.get $2
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $3
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 (; 65 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $4
   global.get $assembly/__tests__/toStrictEqual.spec/vec2
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $2
   block (result i32)
    local.get $3
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $3
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.2
     local.get $4
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $4
     i32.load
     local.set $6
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $8
     local.get $7
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.2
       local.get $8
       call $~lib/rt/pure/__retain
       local.set $12
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       call $~lib/rt/pure/__retain
       local.set $9
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.3
        local.get $12
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $13
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.3
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $14
        local.get $10
        local.set $13
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $13
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          local.get $13
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $15
           local.get $15
           local.get $15
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $15
           call $~lib/rt/pure/__release
          else           
           local.get $14
           i32.const 24
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $14
        call $~lib/rt/pure/__release
       end
       local.get $10
       local.get $11
       local.get $12
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $9
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $12
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $8
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.2
     end
     local.get $7
     local.set $9
     local.get $8
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $12
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $9
      local.get $11
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $12
      local.get $12
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $13
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $13
     local.get $14
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $12
      local.get $11
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.7 (result i32)
        local.get $10
        local.set $18
        local.get $9
        local.set $17
        local.get $12
        local.set $16
        block $~lib/util/memory/memcmp|inlined.7 (result i32)
         local.get $18
         local.set $21
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.7
         end
         block $break|0
          loop $continue|0
           local.get $19
           i32.const 0
           i32.ne
           if (result i32)
            local.get $21
            i32.load8_u
            local.get $20
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $19
            i32.const 1
            i32.sub
            local.set $19
            local.get $21
            i32.const 1
            i32.add
            local.set $21
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            br $continue|0
           end
          end
         end
         local.get $19
         if (result i32)
          local.get $21
          i32.load8_u
          local.get $20
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
       local.get $6
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $8
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   end
   local.get $4
   i32.load offset=4
   local.get $3
   local.get $4
   i32.load
   local.get $2
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $3
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 (; 66 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/vec2
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $1
   block (result i32)
    local.get $2
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $2
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.3
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $3
     i32.load
     local.set $5
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $4
     local.get $7
     local.get $6
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.3
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       call $~lib/rt/pure/__retain
       local.set $10
       local.get $5
       local.set $9
       local.get $4
       call $~lib/rt/pure/__retain
       local.set $8
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.4
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $12
        local.get $12
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $12
          drop
          i32.const 0
         end
         if
          local.get $12
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $12
           drop
           i32.const 0
          end
          if
           local.get $12
           call $~lib/rt/pure/__retain
           local.set $13
           local.get $13
           local.get $13
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $12
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.4
        local.get $10
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $9
        local.set $12
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $12
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          local.get $12
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       local.get $9
       local.get $10
       local.get $11
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $8
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $11
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $7
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.3
     end
     local.get $6
     local.set $8
     local.get $7
     local.set $9
     local.get $8
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $8
      local.get $10
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $11
      local.get $11
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $12
     local.get $6
     i32.const 0
     i32.eq
     local.set $13
     local.get $12
     local.get $13
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $11
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.8 (result i32)
        local.get $9
        local.set $17
        local.get $8
        local.set $16
        local.get $11
        local.set $15
        block $~lib/util/memory/memcmp|inlined.8 (result i32)
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $15
         local.set $18
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.8
         end
         block $break|0
          loop $continue|0
           local.get $18
           i32.const 0
           i32.ne
           if (result i32)
            local.get $20
            i32.load8_u
            local.get $19
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $18
            i32.const 1
            i32.sub
            local.set $18
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            local.get $19
            i32.const 1
            i32.add
            local.set $19
            br $continue|0
           end
          end
         end
         local.get $18
         if (result i32)
          local.get $20
          i32.load8_u
          local.get $19
          i32.load8_u
          i32.sub
         else          
          i32.const 0
         end
        end
       end
       i32.const 0
       i32.eq
       local.set $15
       local.get $5
       local.get $15
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $7
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $1
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 (; 67 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $3
   i32.const 0
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $1
   block (result i32)
    local.get $2
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $2
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.4
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $3
     i32.load
     local.set $5
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $4
     local.get $7
     local.get $6
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.4
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       call $~lib/rt/pure/__retain
       local.set $10
       local.get $5
       local.set $9
       local.get $4
       call $~lib/rt/pure/__retain
       local.set $8
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.5
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $12
        local.get $12
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $12
          drop
          i32.const 0
         end
         if
          local.get $12
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $12
           drop
           i32.const 0
          end
          if
           local.get $12
           call $~lib/rt/pure/__retain
           local.set $13
           local.get $13
           local.get $13
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $12
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.5
        local.get $10
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $9
        local.set $12
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $12
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          local.get $12
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       local.get $9
       local.get $10
       local.get $11
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $8
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $11
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $7
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.4
     end
     local.get $6
     local.set $8
     local.get $7
     local.set $9
     local.get $8
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $8
      local.get $10
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $11
      local.get $11
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $12
     local.get $6
     i32.const 0
     i32.eq
     local.set $13
     local.get $12
     local.get $13
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $11
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.9 (result i32)
        local.get $9
        local.set $17
        local.get $8
        local.set $16
        local.get $11
        local.set $15
        block $~lib/util/memory/memcmp|inlined.9 (result i32)
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $15
         local.set $18
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.9
         end
         block $break|0
          loop $continue|0
           local.get $18
           i32.const 0
           i32.ne
           if (result i32)
            local.get $20
            i32.load8_u
            local.get $19
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $18
            i32.const 1
            i32.sub
            local.set $18
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            local.get $19
            i32.const 1
            i32.add
            local.set $19
            br $continue|0
           end
          end
         end
         local.get $18
         if (result i32)
          local.get $20
          i32.load8_u
          local.get $19
          i32.load8_u
          i32.sub
         else          
          i32.const 0
         end
        end
       end
       i32.const 0
       i32.eq
       local.set $15
       local.get $5
       local.get $15
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $7
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $1
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 (; 68 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $4
   i32.const 0
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $2
   block (result i32)
    local.get $3
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $3
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.5
     local.get $4
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $4
     i32.load
     local.set $6
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $8
     local.get $7
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.5
       local.get $8
       call $~lib/rt/pure/__retain
       local.set $12
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       call $~lib/rt/pure/__retain
       local.set $9
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.6
        local.get $12
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $13
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.6
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $14
        local.get $10
        local.set $13
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $13
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          local.get $13
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $15
           local.get $15
           local.get $15
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $15
           call $~lib/rt/pure/__release
          else           
           local.get $14
           i32.const 24
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $14
        call $~lib/rt/pure/__release
       end
       local.get $10
       local.get $11
       local.get $12
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $9
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $12
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $8
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.5
     end
     local.get $7
     local.set $9
     local.get $8
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $12
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $9
      local.get $11
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $12
      local.get $12
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $13
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $13
     local.get $14
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $12
      local.get $11
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.10 (result i32)
        local.get $10
        local.set $18
        local.get $9
        local.set $17
        local.get $12
        local.set $16
        block $~lib/util/memory/memcmp|inlined.10 (result i32)
         local.get $18
         local.set $21
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.10
         end
         block $break|0
          loop $continue|0
           local.get $19
           i32.const 0
           i32.ne
           if (result i32)
            local.get $21
            i32.load8_u
            local.get $20
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $19
            i32.const 1
            i32.sub
            local.set $19
            local.get $21
            i32.const 1
            i32.add
            local.set $21
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            br $continue|0
           end
          end
         end
         local.get $19
         if (result i32)
          local.get $21
          i32.load8_u
          local.get $20
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
       local.get $6
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $8
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   end
   local.get $4
   i32.load offset=4
   local.get $3
   local.get $4
   i32.load
   local.get $2
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $3
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 (; 69 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $4
   i32.const 0
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $2
   block (result i32)
    local.get $3
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $3
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.6
     local.get $4
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $4
     i32.load
     local.set $6
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $8
     local.get $7
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.6
       local.get $8
       call $~lib/rt/pure/__retain
       local.set $12
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       call $~lib/rt/pure/__retain
       local.set $9
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.7
        local.get $12
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $13
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.7
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $14
        local.get $10
        local.set $13
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $13
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          local.get $13
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $15
           local.get $15
           local.get $15
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $15
           call $~lib/rt/pure/__release
          else           
           local.get $14
           i32.const 24
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $14
        call $~lib/rt/pure/__release
       end
       local.get $10
       local.get $11
       local.get $12
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $9
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $12
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $8
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.6
     end
     local.get $7
     local.set $9
     local.get $8
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $12
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $9
      local.get $11
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $12
      local.get $12
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $13
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $13
     local.get $14
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $12
      local.get $11
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.11 (result i32)
        local.get $10
        local.set $18
        local.get $9
        local.set $17
        local.get $12
        local.set $16
        block $~lib/util/memory/memcmp|inlined.11 (result i32)
         local.get $18
         local.set $21
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.11
         end
         block $break|0
          loop $continue|0
           local.get $19
           i32.const 0
           i32.ne
           if (result i32)
            local.get $21
            i32.load8_u
            local.get $20
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $19
            i32.const 1
            i32.sub
            local.set $19
            local.get $21
            i32.const 1
            i32.add
            local.set $21
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            br $continue|0
           end
          end
         end
         local.get $19
         if (result i32)
          local.get $21
          i32.load8_u
          local.get $20
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
       local.get $6
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $8
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   end
   local.get $4
   i32.load offset=4
   local.get $3
   local.get $4
   i32.load
   local.get $2
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $3
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 (; 70 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $3
   i32.const 0
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $1
   block (result i32)
    local.get $2
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $2
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.7
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $3
     i32.load
     local.set $5
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $4
     local.get $7
     local.get $6
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.7
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       call $~lib/rt/pure/__retain
       local.set $10
       local.get $5
       local.set $9
       local.get $4
       call $~lib/rt/pure/__retain
       local.set $8
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.8
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $12
        local.get $12
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $12
          drop
          i32.const 0
         end
         if
          local.get $12
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $12
           drop
           i32.const 0
          end
          if
           local.get $12
           call $~lib/rt/pure/__retain
           local.set $13
           local.get $13
           local.get $13
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $12
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.8
        local.get $10
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $9
        local.set $12
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $12
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          local.get $12
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       local.get $9
       local.get $10
       local.get $11
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $8
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $11
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $7
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.7
     end
     local.get $6
     local.set $8
     local.get $7
     local.set $9
     local.get $8
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $8
      local.get $10
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $11
      local.get $11
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $12
     local.get $6
     i32.const 0
     i32.eq
     local.set $13
     local.get $12
     local.get $13
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $11
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.12 (result i32)
        local.get $9
        local.set $17
        local.get $8
        local.set $16
        local.get $11
        local.set $15
        block $~lib/util/memory/memcmp|inlined.12 (result i32)
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $15
         local.set $18
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.12
         end
         block $break|0
          loop $continue|0
           local.get $18
           i32.const 0
           i32.ne
           if (result i32)
            local.get $20
            i32.load8_u
            local.get $19
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $18
            i32.const 1
            i32.sub
            local.set $18
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            local.get $19
            i32.const 1
            i32.add
            local.set $19
            br $continue|0
           end
          end
         end
         local.get $18
         if (result i32)
          local.get $20
          i32.load8_u
          local.get $19
          i32.load8_u
          i32.sub
         else          
          i32.const 0
         end
        end
       end
       i32.const 0
       i32.eq
       local.set $15
       local.get $5
       local.get $15
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $7
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $1
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 (; 71 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $4
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $2
   block (result i32)
    local.get $3
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $3
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.8
     local.get $4
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $4
     i32.load
     local.set $6
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $8
     local.get $7
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.8
       local.get $8
       call $~lib/rt/pure/__retain
       local.set $12
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       call $~lib/rt/pure/__retain
       local.set $9
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.9
        local.get $12
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $13
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.9
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $14
        local.get $10
        local.set $13
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $13
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          local.get $13
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $15
           local.get $15
           local.get $15
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $15
           call $~lib/rt/pure/__release
          else           
           local.get $14
           i32.const 24
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $14
        call $~lib/rt/pure/__release
       end
       local.get $10
       local.get $11
       local.get $12
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $9
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $12
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $8
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.8
     end
     local.get $7
     local.set $9
     local.get $8
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $12
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $9
      local.get $11
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $12
      local.get $12
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $13
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $13
     local.get $14
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $12
      local.get $11
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.13 (result i32)
        local.get $10
        local.set $18
        local.get $9
        local.set $17
        local.get $12
        local.set $16
        block $~lib/util/memory/memcmp|inlined.13 (result i32)
         local.get $18
         local.set $21
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.13
         end
         block $break|0
          loop $continue|0
           local.get $19
           i32.const 0
           i32.ne
           if (result i32)
            local.get $21
            i32.load8_u
            local.get $20
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $19
            i32.const 1
            i32.sub
            local.set $19
            local.get $21
            i32.const 1
            i32.add
            local.set $21
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            br $continue|0
           end
          end
         end
         local.get $19
         if (result i32)
          local.get $21
          i32.load8_u
          local.get $20
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
       local.get $6
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $8
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   end
   local.get $4
   i32.load offset=4
   local.get $3
   local.get $4
   i32.load
   local.get $2
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $3
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 (; 72 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  block $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   i32.const 0
   call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $1
   block (result i32)
    local.get $2
    drop
    i32.const 0
   end
   if (result i32)
    i32.const 1
   else    
    local.get $2
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.9
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $3
     i32.load
     local.set $5
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $4
     local.get $7
     local.get $6
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.9
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       call $~lib/rt/pure/__retain
       local.set $10
       local.get $5
       local.set $9
       local.get $4
       call $~lib/rt/pure/__retain
       local.set $8
       block $assembly/internal/report/reportActual/reportActual<assembly/__tests__/setup/Vec3/Vec3>|inlined.10
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $12
        local.get $12
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $12
          drop
          i32.const 0
         end
         if
          local.get $12
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $12
           drop
           i32.const 0
          end
          if
           local.get $12
           call $~lib/rt/pure/__retain
           local.set $13
           local.get $13
           local.get $13
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           i32.const 24
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $12
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<assembly/__tests__/setup/Vec3/Vec3>|inlined.10
        local.get $10
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $9
        local.set $12
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $12
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          local.get $12
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 24
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       local.get $9
       local.get $10
       local.get $11
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $8
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $11
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $7
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.9
     end
     local.get $6
     local.set $8
     local.get $7
     local.set $9
     local.get $8
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $8
      local.get $10
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $11
      local.get $11
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $12
     local.get $6
     i32.const 0
     i32.eq
     local.set $13
     local.get $12
     local.get $13
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $11
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.14 (result i32)
        local.get $9
        local.set $17
        local.get $8
        local.set $16
        local.get $11
        local.set $15
        block $~lib/util/memory/memcmp|inlined.14 (result i32)
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $15
         local.set $18
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.14
         end
         block $break|0
          loop $continue|0
           local.get $18
           i32.const 0
           i32.ne
           if (result i32)
            local.get $20
            i32.load8_u
            local.get $19
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $18
            i32.const 1
            i32.sub
            local.set $18
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            local.get $19
            i32.const 1
            i32.add
            local.set $19
            br $continue|0
           end
          end
         end
         local.get $18
         if (result i32)
          local.get $20
          i32.load8_u
          local.get $19
          i32.load8_u
          i32.sub
         else          
          i32.const 0
         end
        end
       end
       i32.const 0
       i32.eq
       local.set $15
       local.get $5
       local.get $15
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $7
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $1
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor (; 73 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer> (; 74 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer> (; 75 ;) (type $FUNCSIG$viiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $3
  call $~lib/rt/pure/__retain
  drop
  block $assembly/internal/report/reportActual/reportActual<~lib/arraybuffer/ArrayBuffer>|inlined.1
   local.get $0
   call $~lib/rt/pure/__retain
   local.set $4
   local.get $4
   i32.const 0
   i32.eq
   if
    call $assembly/internal/report/reportActual/reportActualNull
   else    
    block (result i32)
     local.get $4
     drop
     i32.const 0
    end
    if
     local.get $4
     call $assembly/internal/report/reportActual/reportActualString
    else     
     block (result i32)
      local.get $4
      drop
      i32.const 1
     end
     if
      local.get $4
      call $~lib/rt/pure/__retain
      local.set $5
      local.get $5
      local.get $5
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      call $assembly/internal/report/reportActual/reportActualReference
      local.get $5
      call $~lib/rt/pure/__release
     else      
      local.get $4
      i32.const 0
      call $assembly/internal/report/reportActual/reportActualReference
     end
    end
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  block $assembly/internal/report/reportExpected/reportExpected<~lib/arraybuffer/ArrayBuffer>|inlined.1
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $2
   local.set $4
   local.get $5
   i32.const 0
   i32.eq
   if
    local.get $4
    call $assembly/internal/report/reportExpected/reportExpectedNull
   else    
    block (result i32)
     local.get $5
     drop
     i32.const 0
    end
    if
     local.get $5
     local.get $4
     call $assembly/internal/report/reportExpected/reportExpectedString
    else     
     block (result i32)
      local.get $5
      drop
      i32.const 1
     end
     if
      local.get $5
      call $~lib/rt/pure/__retain
      local.set $6
      local.get $6
      local.get $6
      call $~lib/arraybuffer/ArrayBuffer#get:byteLength
      local.get $4
      call $assembly/internal/report/reportExpected/reportExpectedReference
      local.get $6
      call $~lib/rt/pure/__release
     else      
      local.get $5
      i32.const 0
      local.get $4
      call $assembly/internal/report/reportExpected/reportExpectedReference
     end
    end
   end
   local.get $5
   call $~lib/rt/pure/__release
  end
  local.get $1
  local.get $0
  i32.eq
  if
   local.get $2
   i32.eqz
   i32.eqz
   if
    local.get $3
    i32.const 1744
    i32.const 21
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
   call $assembly/internal/comparison/referenceComparison/clearExpected
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
   return
  end
  local.get $1
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else   
   local.get $0
   i32.const 0
   i32.eq
  end
  if
   local.get $2
   i32.eqz
   if
    local.get $3
    i32.const 1744
    i32.const 28
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
   call $assembly/internal/comparison/referenceComparison/clearExpected
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
   return
  end
  block $~lib/memory/memory.compare|inlined.16 (result i32)
   local.get $1
   local.set $6
   local.get $0
   local.set $5
   i32.const 0
   local.set $4
   block $~lib/util/memory/memcmp|inlined.16 (result i32)
    local.get $6
    local.set $9
    local.get $5
    local.set $8
    local.get $4
    local.set $7
    local.get $9
    local.get $8
    i32.eq
    if
     i32.const 0
     br $~lib/util/memory/memcmp|inlined.16
    end
    block $break|0
     loop $continue|0
      local.get $7
      i32.const 0
      i32.ne
      if (result i32)
       local.get $9
       i32.load8_u
       local.get $8
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
       local.get $9
       i32.const 1
       i32.add
       local.set $9
       local.get $8
       i32.const 1
       i32.add
       local.set $8
       br $continue|0
      end
     end
    end
    local.get $7
    if (result i32)
     local.get $9
     i32.load8_u
     local.get $8
     i32.load8_u
     i32.sub
    else     
     i32.const 0
    end
   end
  end
  local.set $4
  local.get $2
  local.get $4
  i32.const 0
  i32.eq
  i32.xor
  i32.eqz
  if
   local.get $3
   i32.const 1744
   i32.const 38
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  call $assembly/internal/comparison/referenceComparison/clearExpected
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 (; 76 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.tee $0
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $1
   block (result i32)
    local.get $2
    drop
    i32.const 1
   end
   if (result i32)
    i32.const 1
   else    
    local.get $2
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $3
     i32.load
     local.set $5
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $4
     local.get $7
     local.get $6
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       call $~lib/rt/pure/__retain
       local.set $10
       local.get $5
       local.set $9
       local.get $4
       call $~lib/rt/pure/__retain
       local.set $8
       block $assembly/internal/report/reportActual/reportActual<~lib/arraybuffer/ArrayBuffer>|inlined.0
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $12
        local.get $12
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $12
          drop
          i32.const 0
         end
         if
          local.get $12
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $12
           drop
           i32.const 1
          end
          if
           local.get $12
           call $~lib/rt/pure/__retain
           local.set $13
           local.get $13
           local.get $13
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           i32.const 0
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $12
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<~lib/arraybuffer/ArrayBuffer>|inlined.0
        local.get $10
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $9
        local.set $12
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $12
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          local.get $12
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 1
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 0
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       local.get $9
       local.get $10
       local.get $11
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $8
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $11
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $7
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
     end
     local.get $6
     local.set $8
     local.get $7
     local.set $9
     local.get $8
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $8
      local.get $10
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $11
      local.get $11
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $12
     local.get $6
     i32.const 0
     i32.eq
     local.set $13
     local.get $12
     local.get $13
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $11
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.15 (result i32)
        local.get $9
        local.set $17
        local.get $8
        local.set $16
        local.get $11
        local.set $15
        block $~lib/util/memory/memcmp|inlined.15 (result i32)
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $15
         local.set $18
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.15
         end
         block $break|0
          loop $continue|0
           local.get $18
           i32.const 0
           i32.ne
           if (result i32)
            local.get $20
            i32.load8_u
            local.get $19
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $18
            i32.const 1
            i32.sub
            local.set $18
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            local.get $19
            i32.const 1
            i32.add
            local.set $19
            br $continue|0
           end
          end
         end
         local.get $18
         if (result i32)
          local.get $20
          i32.load8_u
          local.get $19
          i32.load8_u
          i32.sub
         else          
          i32.const 0
         end
        end
       end
       i32.const 0
       i32.eq
       local.set $15
       local.get $5
       local.get $15
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $7
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $1
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not (; 77 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 (; 78 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
   local.tee $1
   local.set $4
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $2
   block (result i32)
    local.get $3
    drop
    i32.const 1
   end
   if (result i32)
    i32.const 1
   else    
    local.get $3
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.1
     local.get $4
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $4
     i32.load
     local.set $6
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $8
     local.get $7
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<~lib/arraybuffer/ArrayBuffer>|inlined.1
       local.get $8
       call $~lib/rt/pure/__retain
       local.set $12
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       call $~lib/rt/pure/__retain
       local.set $9
       block $assembly/internal/report/reportActual/reportActual<~lib/arraybuffer/ArrayBuffer>|inlined.2
        local.get $12
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $13
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 1
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 0
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<~lib/arraybuffer/ArrayBuffer>|inlined.2
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $14
        local.get $10
        local.set $13
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $13
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          local.get $13
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 1
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $15
           local.get $15
           local.get $15
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $15
           call $~lib/rt/pure/__release
          else           
           local.get $14
           i32.const 0
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $14
        call $~lib/rt/pure/__release
       end
       local.get $10
       local.get $11
       local.get $12
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $9
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $12
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $8
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.1
     end
     local.get $7
     local.set $9
     local.get $8
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $12
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $9
      local.get $11
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $12
      local.get $12
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $13
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $13
     local.get $14
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $12
      local.get $11
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.17 (result i32)
        local.get $10
        local.set $18
        local.get $9
        local.set $17
        local.get $12
        local.set $16
        block $~lib/util/memory/memcmp|inlined.17 (result i32)
         local.get $18
         local.set $21
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.17
         end
         block $break|0
          loop $continue|0
           local.get $19
           i32.const 0
           i32.ne
           if (result i32)
            local.get $21
            i32.load8_u
            local.get $20
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $19
            i32.const 1
            i32.sub
            local.set $19
            local.get $21
            i32.const 1
            i32.add
            local.set $21
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            br $continue|0
           end
          end
         end
         local.get $19
         if (result i32)
          local.get $21
          i32.load8_u
          local.get $20
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
       local.get $6
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $8
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
   end
   local.get $4
   i32.load offset=4
   local.get $3
   local.get $4
   i32.load
   local.get $2
   call $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>
   local.get $3
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 (; 79 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.tee $0
   call $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
   local.tee $1
   local.set $4
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $2
   block (result i32)
    local.get $3
    drop
    i32.const 1
   end
   if (result i32)
    i32.const 1
   else    
    local.get $3
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.2
     local.get $4
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $3
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $4
     i32.load
     local.set $6
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $5
     local.get $8
     local.get $7
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<~lib/arraybuffer/ArrayBuffer>|inlined.2
       local.get $8
       call $~lib/rt/pure/__retain
       local.set $12
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       local.set $10
       local.get $5
       call $~lib/rt/pure/__retain
       local.set $9
       block $assembly/internal/report/reportActual/reportActual<~lib/arraybuffer/ArrayBuffer>|inlined.3
        local.get $12
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $13
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 1
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 0
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<~lib/arraybuffer/ArrayBuffer>|inlined.3
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $14
        local.get $10
        local.set $13
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $13
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          local.get $13
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 1
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $15
           local.get $15
           local.get $15
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $15
           call $~lib/rt/pure/__release
          else           
           local.get $14
           i32.const 0
           local.get $13
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $14
        call $~lib/rt/pure/__release
       end
       local.get $10
       local.get $11
       local.get $12
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $9
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $12
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $8
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.2
     end
     local.get $7
     local.set $9
     local.get $8
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $12
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $9
      local.get $11
      local.get $6
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $12
      local.get $12
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $13
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $13
     local.get $14
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $12
      local.get $11
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.18 (result i32)
        local.get $10
        local.set $18
        local.get $9
        local.set $17
        local.get $12
        local.set $16
        block $~lib/util/memory/memcmp|inlined.18 (result i32)
         local.get $18
         local.set $21
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.18
         end
         block $break|0
          loop $continue|0
           local.get $19
           i32.const 0
           i32.ne
           if (result i32)
            local.get $21
            i32.load8_u
            local.get $20
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $19
            i32.const 1
            i32.sub
            local.set $19
            local.get $21
            i32.const 1
            i32.add
            local.set $21
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            br $continue|0
           end
          end
         end
         local.get $19
         if (result i32)
          local.get $21
          i32.load8_u
          local.get $20
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
       local.get $6
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $8
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
   end
   local.get $4
   i32.load offset=4
   local.get $3
   local.get $4
   i32.load
   local.get $2
   call $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>
   local.get $3
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 (; 80 ;) (type $FUNCSIG$v)
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
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  block $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.tee $0
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $1
   block (result i32)
    local.get $2
    drop
    i32.const 1
   end
   if (result i32)
    i32.const 1
   else    
    local.get $2
    drop
    i32.const 0
   end
   if
    block $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.3
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $3
     i32.load
     local.set $5
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $4
     local.get $7
     local.get $6
     i32.eq
     if
      block $assembly/internal/comparison/exactComparison/exactComparison<~lib/arraybuffer/ArrayBuffer>|inlined.3
       local.get $7
       call $~lib/rt/pure/__retain
       local.set $11
       local.get $6
       call $~lib/rt/pure/__retain
       local.set $10
       local.get $5
       local.set $9
       local.get $4
       call $~lib/rt/pure/__retain
       local.set $8
       block $assembly/internal/report/reportActual/reportActual<~lib/arraybuffer/ArrayBuffer>|inlined.4
        local.get $11
        call $~lib/rt/pure/__retain
        local.set $12
        local.get $12
        i32.const 0
        i32.eq
        if
         call $assembly/internal/report/reportActual/reportActualNull
        else         
         block (result i32)
          local.get $12
          drop
          i32.const 0
         end
         if
          local.get $12
          call $assembly/internal/report/reportActual/reportActualString
         else          
          block (result i32)
           local.get $12
           drop
           i32.const 1
          end
          if
           local.get $12
           call $~lib/rt/pure/__retain
           local.set $13
           local.get $13
           local.get $13
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           call $assembly/internal/report/reportActual/reportActualReference
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           i32.const 0
           call $assembly/internal/report/reportActual/reportActualReference
          end
         end
        end
        local.get $12
        call $~lib/rt/pure/__release
       end
       block $assembly/internal/report/reportExpected/reportExpected<~lib/arraybuffer/ArrayBuffer>|inlined.4
        local.get $10
        call $~lib/rt/pure/__retain
        local.set $13
        local.get $9
        local.set $12
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $12
         call $assembly/internal/report/reportExpected/reportExpectedNull
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          local.get $12
          call $assembly/internal/report/reportExpected/reportExpectedString
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 1
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $14
           local.get $14
           local.get $14
           call $~lib/arraybuffer/ArrayBuffer#get:byteLength
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           i32.const 0
           local.get $12
           call $assembly/internal/report/reportExpected/reportExpectedReference
          end
         end
        end
        local.get $13
        call $~lib/rt/pure/__release
       end
       local.get $9
       local.get $10
       local.get $11
       i32.eq
       i32.xor
       i32.eqz
       if
        local.get $8
        i32.const 584
        i32.const 17
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       call $assembly/internal/comparison/exactComparison/clearExpected
       local.get $11
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $7
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.3
     end
     local.get $6
     local.set $8
     local.get $7
     local.set $9
     local.get $8
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $9
     i32.const 4
     i32.sub
     i32.load
     local.set $11
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedNull
     else      
      local.get $8
      local.get $10
      local.get $5
      call $assembly/internal/comparison/blockComparison/reportExpectedReference
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      call $assembly/internal/comparison/blockComparison/reportActualNull
     else      
      local.get $11
      local.get $11
      call $assembly/internal/comparison/blockComparison/reportActualReference
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $12
     local.get $6
     i32.const 0
     i32.eq
     local.set $13
     local.get $12
     local.get $13
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 62
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $11
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 68
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.19 (result i32)
        local.get $9
        local.set $17
        local.get $8
        local.set $16
        local.get $11
        local.set $15
        block $~lib/util/memory/memcmp|inlined.19 (result i32)
         local.get $17
         local.set $20
         local.get $16
         local.set $19
         local.get $15
         local.set $18
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.19
         end
         block $break|0
          loop $continue|0
           local.get $18
           i32.const 0
           i32.ne
           if (result i32)
            local.get $20
            i32.load8_u
            local.get $19
            i32.load8_u
            i32.eq
           else            
            i32.const 0
           end
           if
            local.get $18
            i32.const 1
            i32.sub
            local.set $18
            local.get $20
            i32.const 1
            i32.add
            local.set $20
            local.get $19
            i32.const 1
            i32.add
            local.set $19
            br $continue|0
           end
          end
         end
         local.get $18
         if (result i32)
          local.get $20
          i32.load8_u
          local.get $19
          i32.load8_u
          i32.sub
         else          
          i32.const 0
         end
        end
       end
       i32.const 0
       i32.eq
       local.set $15
       local.get $5
       local.get $15
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 72
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $7
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $1
    call $~lib/rt/pure/__release
    br $assembly/internal/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0 (; 81 ;) (type $FUNCSIG$v)
  i32.const 424
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 808
  i32.const 2
  i32.const 912
  call $assembly/internal/Test/throws
  i32.const 1056
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 1176
  i32.const 4
  i32.const 1288
  call $assembly/internal/Test/throws
  i32.const 1432
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1864
  i32.const 6
  i32.const 1576
  call $assembly/internal/Test/throws
  i32.const 2008
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1864
  i32.const 8
  i32.const 2160
  call $assembly/internal/Test/throws
  i32.const 2336
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 2480
  i32.const 10
  i32.const 568
  call $assembly/internal/Test/throws
  i32.const 2632
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 2768
  i32.const 12
  i32.const 2912
  call $assembly/internal/Test/throws
  i32.const 2632
  i32.const 13
  call $assembly/internal/Test/it
  i32.const 2768
  i32.const 14
  i32.const 3072
  call $assembly/internal/Test/throws
  i32.const 3232
  i32.const 15
  call $assembly/internal/Test/it
  i32.const 3320
  i32.const 16
  i32.const 3504
  call $assembly/internal/Test/throws
  i32.const 3712
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 3808
  i32.const 18
  i32.const 3992
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 82 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 83 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $start:assembly/__tests__/toStrictEqual.spec (; 84 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
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
   f64.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
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
   f64.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 0
   local.set $1
   f64.const 4
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
   f64.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $~lib/rt/pure/__retain
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
   f64.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.4
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
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
   f64.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.5
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
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
   f64.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.6
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $~lib/rt/pure/__retain
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
   f64.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.7
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
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
   f64.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  block $assembly/__tests__/toStrictEqual.spec/STORE<f64>|inlined.8
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
   local.set $3
   i32.const 2
   local.set $1
   f64.const 6
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
   f64.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  i32.const 376
  i32.const 19
  call $assembly/internal/Describe/describe
 )
 (func $assembly/index/__main (; 85 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  i32.eqz
  if
   call $start
   i32.const 1
   global.set $~lib/started
  end
 )
 (func $assembly/internal/call/__call (; 86 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 87 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toStrictEqual.spec
 )
 (func $~lib/rt/pure/__visit (; 88 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/__visit_members (; 89 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block
  end
  block $switch$1$leave
   block $switch$1$default
    block $switch$1$case$7
     block $switch$1$case$4
      block $switch$1$case$2
       local.get $0
       i32.const 8
       i32.sub
       i32.load
       br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$2 $switch$1$case$2 $switch$1$case$7 $switch$1$case$7 $switch$1$default
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
     unreachable
     unreachable
    end
    unreachable
    unreachable
   end
   unreachable
  end
 )
 (func $null (; 90 ;) (type $FUNCSIG$v)
 )
)
