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
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$d (func (result f64)))
 (type $FUNCSIG$vidiiiidiiii (func (param i32 f64 i32 i32 i32 i32 f64 i32 i32 i32 i32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$viiiiiiiiii (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportActualInteger/getLogStackTrace (result i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportExpectedInteger/getLogStackTrace (result i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportExpectedNull/getLogStackTrace (result i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportExpectedReference/getLogStackTrace (result i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportActualNull/getLogStackTrace (result i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportActualReference/getLogStackTrace (result i32)))
 (import "__aspect" "testCanRun" (func $assembly/internal/test/Test/testCanRun (param i32) (result i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportActualString/getLogStackTrace (result i32)))
 (import "__aspect" "getLogStackTrace" (func $assembly/internal/report/reportExpectedString/getLogStackTrace (result i32)))
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
 (data (i32.const 256) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 304) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 360) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00")
 (data (i32.const 408) "\80\00\00\00\01\00\00\00\01\00\00\00\80\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00")
 (data (i32.const 552) "\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00")
 (data (i32.const 568) "^\00\00\00\01\00\00\00\01\00\00\00^\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00e\00x\00a\00c\00t\00C\00o\00m\00p\00a\00r\00i\00s\00o\00n\00.\00t\00s\00")
 (data (i32.const 680) "^\00\00\00\01\00\00\00\01\00\00\00^\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00b\00l\00o\00c\00k\00C\00o\00m\00p\00a\00r\00i\00s\00o\00n\00.\00t\00s\00")
 (data (i32.const 792) "^\00\00\00\01\00\00\00\01\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00")
 (data (i32.const 904) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 952) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00 \00")
 (data (i32.const 976) "\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00n\00u\00l\00l\00")
 (data (i32.const 1000) "Z\00\00\00\01\00\00\00\01\00\00\00Z\00\00\00I\00n\00t\00e\00r\00n\00a\00l\00 \00a\00s\00-\00p\00e\00c\00t\00 \00E\00r\00r\00o\00r\00:\00 \00G\00r\00o\00u\00p\00 \00s\00t\00a\00c\00k\00 \00i\00s\00 \00e\00m\00p\00t\00y\00.\00")
 (data (i32.const 1112) "F\00\00\00\01\00\00\00\01\00\00\00F\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00t\00e\00s\00t\00/\00C\00o\00l\00l\00e\00c\00t\00o\00r\00.\00t\00s\00")
 (data (i32.const 1200) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00g\00r\00o\00u\00p\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 1248) "<\00\00\00\01\00\00\00\01\00\00\00<\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00t\00e\00s\00t\00/\00T\00e\00s\00t\00.\00t\00s\00")
 (data (i32.const 1328) "X\00\00\00\01\00\00\00\01\00\00\00X\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 1432) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1576) "b\00\00\00\01\00\00\00\01\00\00\00b\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00t\00h\00a\00t\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 1696) "`\00\00\00\01\00\00\00\01\00\00\00`\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00v\00a\00l\00u\00e\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 1808) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1952) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 2096) "\96\00\00\00\01\00\00\00\01\00\00\00\96\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00s\00a\00m\00e\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 2264) "f\00\00\00\01\00\00\00\01\00\00\00f\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00r\00e\00f\00e\00r\00e\00n\00c\00e\00C\00o\00m\00p\00a\00r\00i\00s\00o\00n\00.\00t\00s\00")
 (data (i32.const 2384) "~\00\00\00\01\00\00\00\01\00\00\00~\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00t\00h\00r\00o\00w\00 \00o\00n\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 2528) "\82\00\00\00\01\00\00\00\01\00\00\00\82\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00n\00o\00t\00.\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00")
 (data (i32.const 2680) "\a0\00\00\00\01\00\00\00\01\00\00\00\a0\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00 \00o\00n\00 \00r\00e\00f\00 \00t\00y\00p\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00c\00o\00m\00p\00a\00r\00e\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00v\00a\00l\00u\00e\00s\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00.\00")
 (data (i32.const 2856) "\80\00\00\00\01\00\00\00\01\00\00\00\80\00\00\00s\00h\00o\00u\00l\00d\00 \00c\00o\00r\00r\00e\00c\00t\00l\00y\00 \00a\00s\00s\00e\00r\00t\00 \00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00f\00o\00r\00 \00r\00e\00f\00t\00y\00p\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 3000) "\88\00\00\00\01\00\00\00\01\00\00\00\88\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00n\00u\00l\00l\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00 \00v\00a\00l\00u\00e\00s\00")
 (data (i32.const 3152) "v\00\00\00\01\00\00\00\01\00\00\00v\00\00\00s\00h\00o\00u\00l\00d\00 \00v\00a\00l\00i\00d\00a\00t\00e\00 \00t\00h\00a\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00d\00o\00 \00n\00o\00t\00 \00s\00t\00r\00i\00t\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 3288) "|\00\00\00\01\00\00\00\01\00\00\00|\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00i\00s\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00n\00u\00l\00l\00")
 (data (i32.const 3432) "\90\00\00\00\01\00\00\00\01\00\00\00\90\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 3592) "\90\00\00\00\01\00\00\00\01\00\00\00\90\00\00\00t\00o\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00a\00c\00t\00u\00a\00l\00 \00i\00s\00 \00n\00u\00l\00l\00 \00a\00n\00d\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00i\00s\00 \00n\00o\00t\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 3752) "H\00\00\00\01\00\00\00\01\00\00\00H\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 3840) "\a4\00\00\00\01\00\00\00\01\00\00\00\a4\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00e\00q\00u\00a\00l\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00o\00t\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 4024) "\be\00\00\00\01\00\00\00\01\00\00\00\be\00\00\00S\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (data (i32.const 4232) "P\00\00\00\01\00\00\00\01\00\00\00P\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00e\00q\00u\00a\00l\00")
 (data (i32.const 4328) "\a4\00\00\00\01\00\00\00\01\00\00\00\a4\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00d\00i\00f\00f\00e\00r\00e\00n\00t\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00s\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00")
 (data (i32.const 4512) "\be\00\00\00\01\00\00\00\01\00\00\00\be\00\00\00N\00o\00n\00-\00s\00t\00r\00i\00c\00t\00E\00q\00u\00a\00l\00 \00a\00r\00r\00a\00y\00 \00b\00u\00f\00f\00e\00r\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00t\00h\00e\00y\00 \00a\00r\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00t\00o\00 \00s\00t\00r\00i\00c\00t\00l\00y\00 \00e\00q\00u\00a\00l\00 \00e\00a\00c\00h\00 \00o\00t\00h\00e\00r\00.\00")
 (data (i32.const 4720) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00g\00r\00o\00u\00p\00S\00t\00a\00c\00k\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 4776) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00A\00r\00r\00a\00y\00 \00i\00s\00 \00e\00m\00p\00t\00y\00")
 (data (i32.const 4824) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00t\00e\00s\00t\00s\00 \00a\00r\00e\00 \00n\00u\00l\00l\00")
 (data (i32.const 4872) "F\00\00\00\01\00\00\00\01\00\00\00F\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00t\00e\00s\00t\00/\00T\00e\00s\00t\00G\00r\00o\00u\00p\00.\00t\00s\00")
 (data (i32.const 4960) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00t\00e\00s\00t\00 \00i\00s\00 \00n\00u\00l\00l\00")
 (data (i32.const 5000) "\0e\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\93\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\13\0d\00\00\02\00\00\00\93 \00\00\02\00\00\00\93 \00\00\02\00\00\00\93 \00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00")
 (table $0 21 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 $start:assembly/__tests__/toStrictEqual.spec~anonymous|0)
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
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/started (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 5000))
 (global $~lib/heap/__heap_base i32 (i32.const 5116))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
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
 (func $~lib/rt/tlsf/removeBlock (; 20 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/insertBlock (; 21 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/addMemory (; 22 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/initializeRoot (; 23 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/tlsf/prepareSize (; 24 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/searchBlock (; 25 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/growMemory (; 26 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/prepareBlock (; 27 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/allocateBlock (; 28 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/__alloc (; 29 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/pure/increment (; 30 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__retain (; 31 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/freeBlock (; 32 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/__typeinfo (; 33 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/util/memory/memcpy (; 34 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/memory/memory.copy (; 35 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/__free (; 36 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/growRoots (; 37 ;) (type $FUNCSIG$v)
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
 (func $~lib/rt/pure/appendRoot (; 38 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/decrement (; 39 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__release (; 40 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/markGray (; 41 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scanBlack (; 42 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/scan (; 43 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/collectWhite (; 44 ;) (type $FUNCSIG$vi) (param $0 i32)
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
 (func $~lib/rt/pure/__collect (; 45 ;) (type $FUNCSIG$v)
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
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 46 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
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
 (func $~lib/memory/memory.fill (; 47 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 48 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/Expectation<i32>#constructor (; 49 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<i32> (; 50 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/comparison/referenceComparison/referenceComparison<i32> (; 51 ;) (type $FUNCSIG$viiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
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
    block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.1
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
   end
   block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.1
    local.get $6
    local.set $8
    local.get $5
    local.set $9
    block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.1
     local.get $8
     local.set $11
     local.get $9
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
    i32.const 14
    i32.const 2
    call $~lib/builtins/abort
    unreachable
   end
   block $assembly/internal/report/clearExpected/clearExpected|inlined.1
    i32.const 0
    global.set $assembly/internal/value/index/Actual.type
    i32.const 0
    global.set $assembly/internal/value/index/Expected.type
   end
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $3
  call $~lib/rt/pure/__release
  return
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|0 (; 52 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<i32>#toStrictEqual|inlined.0
   i32.const 3
   call $assembly/internal/test/Expectation/expect<i32>
   local.tee $0
   local.set $2
   i32.const 3
   local.set $1
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $3
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
    block $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.0
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
        block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.0
         local.get $12
         local.set $13
         i32.const 1
         global.set $assembly/internal/value/index/Actual.type
         local.get $13
         f64.convert_i32_s
         global.set $assembly/internal/value/index/Actual.value
         call $assembly/internal/report/reportActualInteger/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
        end
       end
       block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.0
        local.get $10
        local.set $12
        local.get $9
        local.set $13
        block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.0
         local.get $12
         local.set $15
         local.get $13
         local.set $14
         i32.const 1
         global.set $assembly/internal/value/index/Expected.type
         local.get $15
         f64.convert_i32_s
         global.set $assembly/internal/value/index/Expected.value
         local.get $14
         global.set $assembly/internal/value/index/Expected.negated
         call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        end
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.0
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.0
     end
     local.get $6
     local.set $11
     local.get $7
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $8
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      local.set $14
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $11
      local.set $12
      local.get $9
      local.set $13
      local.get $5
      local.set $15
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $12
       local.tee $14
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $16
       i32.ne
       if
        local.get $14
        call $~lib/rt/pure/__retain
        drop
        local.get $16
        call $~lib/rt/pure/__release
       end
       local.get $14
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $13
      global.set $assembly/internal/value/index/Expected.offset
      local.get $15
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $8
      local.set $14
      local.get $8
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $14
       local.tee $15
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $12
       i32.ne
       if
        local.get $15
        call $~lib/rt/pure/__retain
        drop
        local.get $12
        call $~lib/rt/pure/__release
       end
       local.get $15
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $16
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $6
     i32.const 0
     i32.eq
     local.set $16
     local.get $14
     local.get $16
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $8
      local.get $9
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.0 (result i32)
        local.get $10
        local.set $17
        local.get $11
        local.set $12
        local.get $8
        local.set $13
        block $~lib/util/memory/memcmp|inlined.0 (result i32)
         local.get $17
         local.set $20
         local.get $12
         local.set $19
         local.get $13
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
       local.set $17
       local.get $5
       local.get $17
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<i32>#toStrictEqual|inlined.0
   end
   local.get $2
   i32.load offset=4
   local.get $1
   local.get $2
   i32.load
   local.get $3
   call $assembly/internal/comparison/referenceComparison/referenceComparison<i32>
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 53 ;) (type $FUNCSIG$v)
  nop
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 54 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.const 1073741808
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 272
   i32.const 320
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
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#constructor (; 55 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 808
    i32.const 920
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
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#get:length (; 56 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func "$~lib/array/Array<() => void>#constructor" (; 57 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 808
    i32.const 920
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
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#constructor (; 58 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 808
    i32.const 920
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
 (func $~lib/array/Array<~lib/string/String>#constructor (; 59 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 808
    i32.const 920
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
 (func $~lib/string/String#get:length (; 60 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/string/String#concat (; 61 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
    i32.const 992
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
   i32.const 568
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
 (func $~lib/string/String.__concat (; 62 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  local.get $0
  i32.const 992
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
 (func $assembly/internal/test/TestGroup/TestGroup#constructor (; 63 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
    i32.const 968
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
 (func $~lib/rt/tlsf/reallocateBlock (; 64 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/__realloc (; 65 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/array/ensureSize (; 66 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
    i32.const 272
    i32.const 920
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
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#push (; 67 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__unchecked_get (; 68 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<f64>#constructor (; 69 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/TestResult/TestResult#constructor (; 70 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
  i32.const 568
  i32.store offset=12
  local.get $0
  i32.const 568
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
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#push (; 71 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Test/it (; 72 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
    i32.const 568
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
    i32.const 1016
    i32.const 1128
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
   i32.const 1216
   i32.const 1264
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
 (func $assembly/internal/test/Expectation/Expectation<i32>#get:not (; 73 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|1 (; 74 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<i32>#toStrictEqual|inlined.1
   i32.const 3
   call $assembly/internal/test/Expectation/expect<i32>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<i32>#get:not
   local.tee $1
   local.set $3
   i32.const 3
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $4
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
    block $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.1
     local.get $3
     i32.load offset=4
     local.set $8
     local.get $2
     local.set $7
     local.get $3
     i32.load
     local.set $6
     local.get $4
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
        block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.2
         local.get $13
         local.set $14
         i32.const 1
         global.set $assembly/internal/value/index/Actual.type
         local.get $14
         f64.convert_i32_s
         global.set $assembly/internal/value/index/Actual.value
         call $assembly/internal/report/reportActualInteger/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
        end
       end
       block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.2
        local.get $11
        local.set $13
        local.get $10
        local.set $14
        block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.2
         local.get $13
         local.set $16
         local.get $14
         local.set $15
         i32.const 1
         global.set $assembly/internal/value/index/Expected.type
         local.get $16
         f64.convert_i32_s
         global.set $assembly/internal/value/index/Expected.value
         local.get $15
         global.set $assembly/internal/value/index/Expected.negated
         call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        end
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
        i32.const 14
        i32.const 2
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
      end
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.1
     end
     local.get $7
     local.set $12
     local.get $8
     local.set $11
     local.get $12
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      local.set $15
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $12
      local.set $13
      local.get $10
      local.set $14
      local.get $6
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $13
       local.tee $15
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $17
       i32.ne
       if
        local.get $15
        call $~lib/rt/pure/__retain
        drop
        local.get $17
        call $~lib/rt/pure/__release
       end
       local.get $15
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $14
      global.set $assembly/internal/value/index/Expected.offset
      local.get $16
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $9
      local.set $15
      local.get $9
      local.set $17
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $15
       local.tee $16
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $13
       i32.ne
       if
        local.get $16
        call $~lib/rt/pure/__retain
        drop
        local.get $13
        call $~lib/rt/pure/__release
       end
       local.get $16
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $17
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $15
     local.get $7
     i32.const 0
     i32.eq
     local.set $17
     local.get $15
     local.get $17
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $9
      local.get $10
      i32.eq
      local.set $16
      local.get $16
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.1 (result i32)
        local.get $11
        local.set $18
        local.get $12
        local.set $13
        local.get $9
        local.set $14
        block $~lib/util/memory/memcmp|inlined.1 (result i32)
         local.get $18
         local.set $21
         local.get $13
         local.set $20
         local.get $14
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
       local.set $18
       local.get $6
       local.get $18
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $4
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<i32>#toStrictEqual|inlined.1
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $4
   call $assembly/internal/comparison/referenceComparison/referenceComparison<i32>
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Test/throws (; 75 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
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
    i32.const 568
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
    i32.const 1016
    i32.const 1128
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
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|2 (; 76 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<i32>#toStrictEqual|inlined.2
   i32.const 3
   call $assembly/internal/test/Expectation/expect<i32>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<i32>#get:not
   local.tee $1
   local.set $3
   i32.const 1
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $4
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
    block $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.2
     local.get $3
     i32.load offset=4
     local.set $8
     local.get $2
     local.set $7
     local.get $3
     i32.load
     local.set $6
     local.get $4
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
        block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.3
         local.get $13
         local.set $14
         i32.const 1
         global.set $assembly/internal/value/index/Actual.type
         local.get $14
         f64.convert_i32_s
         global.set $assembly/internal/value/index/Actual.value
         call $assembly/internal/report/reportActualInteger/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
        end
       end
       block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.3
        local.get $11
        local.set $13
        local.get $10
        local.set $14
        block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.3
         local.get $13
         local.set $16
         local.get $14
         local.set $15
         i32.const 1
         global.set $assembly/internal/value/index/Expected.type
         local.get $16
         f64.convert_i32_s
         global.set $assembly/internal/value/index/Expected.value
         local.get $15
         global.set $assembly/internal/value/index/Expected.negated
         call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        end
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.3
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $9
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.2
     end
     local.get $7
     local.set $12
     local.get $8
     local.set $11
     local.get $12
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      local.set $15
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $12
      local.set $13
      local.get $10
      local.set $14
      local.get $6
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $13
       local.tee $15
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $17
       i32.ne
       if
        local.get $15
        call $~lib/rt/pure/__retain
        drop
        local.get $17
        call $~lib/rt/pure/__release
       end
       local.get $15
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $14
      global.set $assembly/internal/value/index/Expected.offset
      local.get $16
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $9
      local.set $15
      local.get $9
      local.set $17
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $15
       local.tee $16
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $13
       i32.ne
       if
        local.get $16
        call $~lib/rt/pure/__retain
        drop
        local.get $13
        call $~lib/rt/pure/__release
       end
       local.get $16
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $17
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $15
     local.get $7
     i32.const 0
     i32.eq
     local.set $17
     local.get $15
     local.get $17
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $9
      local.get $10
      i32.eq
      local.set $16
      local.get $16
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.2 (result i32)
        local.get $11
        local.set $18
        local.get $12
        local.set $13
        local.get $9
        local.set $14
        block $~lib/util/memory/memcmp|inlined.2 (result i32)
         local.get $18
         local.set $21
         local.get $13
         local.set $20
         local.get $14
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
       local.set $18
       local.get $6
       local.get $18
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
    end
    local.get $4
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<i32>#toStrictEqual|inlined.2
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $4
   call $assembly/internal/comparison/referenceComparison/referenceComparison<i32>
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|3 (; 77 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<i32>#toStrictEqual|inlined.3
   i32.const 3
   call $assembly/internal/test/Expectation/expect<i32>
   local.tee $0
   local.set $2
   i32.const 1
   local.set $1
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $3
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
    block $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.3
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
        block $assembly/internal/report/reportActualInteger/reportActualInteger|inlined.4
         local.get $12
         local.set $13
         i32.const 1
         global.set $assembly/internal/value/index/Actual.type
         local.get $13
         f64.convert_i32_s
         global.set $assembly/internal/value/index/Actual.value
         call $assembly/internal/report/reportActualInteger/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
        end
       end
       block $assembly/internal/report/reportExpected/reportExpected<i32>|inlined.4
        local.get $10
        local.set $12
        local.get $9
        local.set $13
        block $assembly/internal/report/reportExpectedInteger/reportExpectedInteger|inlined.4
         local.get $12
         local.set $15
         local.get $13
         local.set $14
         i32.const 1
         global.set $assembly/internal/value/index/Expected.type
         local.get $15
         f64.convert_i32_s
         global.set $assembly/internal/value/index/Expected.value
         local.get $14
         global.set $assembly/internal/value/index/Expected.negated
         call $assembly/internal/report/reportExpectedInteger/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        end
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.4
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $8
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<i32>|inlined.3
     end
     local.get $6
     local.set $11
     local.get $7
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $8
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      local.set $14
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $11
      local.set $12
      local.get $9
      local.set $13
      local.get $5
      local.set $15
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $12
       local.tee $14
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $16
       i32.ne
       if
        local.get $14
        call $~lib/rt/pure/__retain
        drop
        local.get $16
        call $~lib/rt/pure/__release
       end
       local.get $14
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $13
      global.set $assembly/internal/value/index/Expected.offset
      local.get $15
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $8
      local.set $14
      local.get $8
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $14
       local.tee $15
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $12
       i32.ne
       if
        local.get $15
        call $~lib/rt/pure/__retain
        drop
        local.get $12
        call $~lib/rt/pure/__release
       end
       local.get $15
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $16
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $6
     i32.const 0
     i32.eq
     local.set $16
     local.get $14
     local.get $16
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $8
      local.get $9
      i32.eq
      local.set $15
      local.get $15
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.3 (result i32)
        local.get $10
        local.set $17
        local.get $11
        local.set $12
        local.get $8
        local.set $13
        block $~lib/util/memory/memcmp|inlined.3 (result i32)
         local.get $17
         local.set $20
         local.get $12
         local.set $19
         local.get $13
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
       local.set $17
       local.get $5
       local.get $17
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
    end
    local.get $3
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<i32>#toStrictEqual|inlined.3
   end
   local.get $2
   i32.load offset=4
   local.get $1
   local.get $2
   i32.load
   local.get $3
   call $assembly/internal/comparison/referenceComparison/referenceComparison<i32>
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 78 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 79 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (; 80 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3> (; 81 ;) (type $FUNCSIG$viiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
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
    i32.const 5
    global.set $assembly/internal/value/index/Actual.type
    call $assembly/internal/report/reportActualNull/getLogStackTrace
    global.set $assembly/internal/value/index/Actual.stack
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
     i32.const 3
     global.set $assembly/internal/value/index/Actual.type
     block (result i32)
      local.get $5
      local.tee $6
      global.get $assembly/internal/value/index/Actual.reference
      local.tee $7
      i32.ne
      if
       local.get $6
       call $~lib/rt/pure/__retain
       drop
       local.get $7
       call $~lib/rt/pure/__release
      end
      local.get $6
     end
     global.set $assembly/internal/value/index/Actual.reference
     call $assembly/internal/report/reportActualString/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
     local.get $5
     call $~lib/rt/pure/__release
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
      block $assembly/internal/report/reportActualReference/reportActualReference|inlined.7
       local.get $5
       local.set $6
       local.get $5
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $7
       i32.const 2
       global.set $assembly/internal/value/index/Actual.type
       block (result i32)
        local.get $6
        local.tee $8
        global.get $assembly/internal/value/index/Actual.reference
        local.tee $9
        i32.ne
        if
         local.get $8
         call $~lib/rt/pure/__retain
         drop
         local.get $9
         call $~lib/rt/pure/__release
        end
        local.get $8
       end
       global.set $assembly/internal/value/index/Actual.reference
       local.get $7
       global.set $assembly/internal/value/index/Actual.offset
       call $assembly/internal/report/reportActualReference/getLogStackTrace
       global.set $assembly/internal/value/index/Actual.stack
      end
      local.get $5
      call $~lib/rt/pure/__release
     else      
      local.get $4
      local.set $8
      i32.const 24
      local.set $9
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $8
       local.tee $7
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $5
       i32.ne
       if
        local.get $7
        call $~lib/rt/pure/__retain
        drop
        local.get $5
        call $~lib/rt/pure/__release
       end
       local.get $7
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $9
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
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
   local.set $6
   local.get $5
   i32.const 0
   i32.eq
   if
    local.get $6
    local.set $7
    i32.const 5
    global.set $assembly/internal/value/index/Expected.type
    call $assembly/internal/report/reportExpectedNull/getLogStackTrace
    global.set $assembly/internal/value/index/Expected.stack
   else    
    block (result i32)
     local.get $5
     drop
     i32.const 0
    end
    if
     local.get $5
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $6
     local.set $9
     i32.const 3
     global.set $assembly/internal/value/index/Expected.type
     block (result i32)
      local.get $8
      local.tee $4
      global.get $assembly/internal/value/index/Expected.reference
      local.tee $7
      i32.ne
      if
       local.get $4
       call $~lib/rt/pure/__retain
       drop
       local.get $7
       call $~lib/rt/pure/__release
      end
      local.get $4
     end
     global.set $assembly/internal/value/index/Expected.reference
     local.get $9
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedString/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
     local.get $8
     call $~lib/rt/pure/__release
    else     
     block (result i32)
      local.get $5
      drop
      i32.const 0
     end
     if
      local.get $5
      call $~lib/rt/pure/__retain
      local.set $8
      block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.7
       local.get $8
       local.set $9
       local.get $8
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $4
       local.get $6
       local.set $7
       i32.const 2
       global.set $assembly/internal/value/index/Expected.type
       block (result i32)
        local.get $9
        local.tee $10
        global.get $assembly/internal/value/index/Expected.reference
        local.tee $11
        i32.ne
        if
         local.get $10
         call $~lib/rt/pure/__retain
         drop
         local.get $11
         call $~lib/rt/pure/__release
        end
        local.get $10
       end
       global.set $assembly/internal/value/index/Expected.reference
       local.get $4
       global.set $assembly/internal/value/index/Expected.offset
       local.get $7
       global.set $assembly/internal/value/index/Expected.negated
       call $assembly/internal/report/reportExpectedReference/getLogStackTrace
       global.set $assembly/internal/value/index/Expected.stack
      end
      local.get $8
      call $~lib/rt/pure/__release
     else      
      local.get $5
      local.set $7
      i32.const 24
      local.set $10
      local.get $6
      local.set $11
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $7
       local.tee $4
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $8
       i32.ne
       if
        local.get $4
        call $~lib/rt/pure/__retain
        drop
        local.get $8
        call $~lib/rt/pure/__release
       end
       local.get $4
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $10
      global.set $assembly/internal/value/index/Expected.offset
      local.get $11
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
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
    i32.const 2280
    i32.const 18
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
    i32.const 2280
    i32.const 25
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
   local.set $4
   local.get $0
   local.set $8
   i32.const 24
   local.set $9
   block $~lib/util/memory/memcmp|inlined.5 (result i32)
    local.get $4
    local.set $7
    local.get $8
    local.set $10
    local.get $9
    local.set $11
    local.get $7
    local.get $10
    i32.eq
    if
     i32.const 0
     br $~lib/util/memory/memcmp|inlined.5
    end
    block $break|0
     loop $continue|0
      local.get $11
      i32.const 0
      i32.ne
      if (result i32)
       local.get $7
       i32.load8_u
       local.get $10
       i32.load8_u
       i32.eq
      else       
       i32.const 0
      end
      if
       local.get $11
       i32.const 1
       i32.sub
       local.set $11
       local.get $7
       i32.const 1
       i32.add
       local.set $7
       local.get $10
       i32.const 1
       i32.add
       local.set $10
       br $continue|0
      end
     end
    end
    local.get $11
    if (result i32)
     local.get $7
     i32.load8_u
     local.get $10
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
   i32.const 2280
   i32.const 35
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  block $assembly/internal/report/clearExpected/clearExpected|inlined.8
   i32.const 0
   global.set $assembly/internal/value/index/Actual.type
   i32.const 0
   global.set $assembly/internal/value/index/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|4 (; 82 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/vec3
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 2112
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $13
           local.tee $14
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $15
           i32.ne
           if
            local.get $14
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $14
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $13
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.4
            local.get $13
            local.set $14
            local.get $13
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $14
             local.tee $16
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $17
             i32.ne
             if
              local.get $16
              call $~lib/rt/pure/__retain
              drop
              local.get $17
              call $~lib/rt/pure/__release
             end
             local.get $16
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $15
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           local.set $16
           i32.const 24
           local.set $17
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $16
            local.tee $15
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $13
            i32.ne
            if
             local.get $15
             call $~lib/rt/pure/__retain
             drop
             local.get $13
             call $~lib/rt/pure/__release
            end
            local.get $15
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $17
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $14
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $14
         local.set $15
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $~lib/rt/pure/__retain
          local.set $16
          local.get $14
          local.set $17
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $16
           local.tee $12
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $15
           i32.ne
           if
            local.get $12
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $12
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $17
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $16
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $16
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.4
            local.get $16
            local.set $17
            local.get $16
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $12
            local.get $14
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $17
             local.tee $18
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $19
             i32.ne
             if
              local.get $18
              call $~lib/rt/pure/__retain
              drop
              local.get $19
              call $~lib/rt/pure/__release
             end
             local.get $18
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $12
            global.set $assembly/internal/value/index/Expected.offset
            local.get $15
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $16
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $15
           i32.const 24
           local.set $18
           local.get $14
           local.set $19
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $15
            local.tee $12
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $16
            i32.ne
            if
             local.get $12
             call $~lib/rt/pure/__retain
             drop
             local.get $16
             call $~lib/rt/pure/__release
            end
            local.get $12
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $18
           global.set $assembly/internal/value/index/Expected.offset
           local.get $19
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.5
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $8
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
     end
     local.get $6
     local.set $11
     local.get $7
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $8
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      local.set $17
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $11
      local.set $19
      local.get $9
      local.set $12
      local.get $5
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $19
       local.tee $18
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $17
       i32.ne
       if
        local.get $18
        call $~lib/rt/pure/__retain
        drop
        local.get $17
        call $~lib/rt/pure/__release
       end
       local.get $18
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $12
      global.set $assembly/internal/value/index/Expected.offset
      local.get $16
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $8
      local.set $14
      local.get $8
      local.set $15
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $14
       local.tee $13
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $19
       i32.ne
       if
        local.get $13
        call $~lib/rt/pure/__retain
        drop
        local.get $19
        call $~lib/rt/pure/__release
       end
       local.get $13
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $15
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $6
     i32.const 0
     i32.eq
     local.set $15
     local.get $14
     local.get $15
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $8
      local.get $9
      i32.eq
      local.set $13
      local.get $13
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.4 (result i32)
        local.get $10
        local.set $16
        local.get $11
        local.set $18
        local.get $8
        local.set $17
        block $~lib/util/memory/memcmp|inlined.4 (result i32)
         local.get $16
         local.set $20
         local.get $18
         local.set $19
         local.get $17
         local.set $12
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.4
         end
         block $break|0
          loop $continue|0
           local.get $12
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
            local.get $12
            i32.const 1
            i32.sub
            local.set $12
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
         local.get $12
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
       local.set $16
       local.get $5
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
    end
    local.get $1
    call $~lib/rt/pure/__release
    local.get $2
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.0
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $1
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 83 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|5 (; 84 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/vec3
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $4
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
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $3
     i32.load
     local.set $6
     local.get $4
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $14
           local.tee $15
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $16
           i32.ne
           if
            local.get $15
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $15
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $14
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.9
            local.get $14
            local.set $15
            local.get $14
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $15
             local.tee $17
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $18
             i32.ne
             if
              local.get $17
              call $~lib/rt/pure/__retain
              drop
              local.get $18
              call $~lib/rt/pure/__release
             end
             local.get $17
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $16
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $17
           i32.const 24
           local.set $18
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $17
            local.tee $16
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $14
            i32.ne
            if
             local.get $16
             call $~lib/rt/pure/__retain
             drop
             local.get $14
             call $~lib/rt/pure/__release
            end
            local.get $16
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $18
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $15
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $15
         local.set $16
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          call $~lib/rt/pure/__retain
          local.set $17
          local.get $15
          local.set $18
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $17
           local.tee $13
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $16
           i32.ne
           if
            local.get $13
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $13
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $18
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $17
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $17
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.9
            local.get $17
            local.set $18
            local.get $17
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $13
            local.get $15
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $18
             local.tee $19
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $20
             i32.ne
             if
              local.get $19
              call $~lib/rt/pure/__retain
              drop
              local.get $20
              call $~lib/rt/pure/__release
             end
             local.get $19
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $13
            global.set $assembly/internal/value/index/Expected.offset
            local.get $16
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $17
           call $~lib/rt/pure/__release
          else           
           local.get $14
           local.set $16
           i32.const 24
           local.set $19
           local.get $15
           local.set $20
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $16
            local.tee $13
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $17
            i32.ne
            if
             local.get $13
             call $~lib/rt/pure/__retain
             drop
             local.get $17
             call $~lib/rt/pure/__release
            end
            local.get $13
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $19
           global.set $assembly/internal/value/index/Expected.offset
           local.get $20
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.9
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $9
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $12
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $8
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
     end
     local.get $7
     local.set $12
     local.get $8
     local.set $11
     local.get $12
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      local.set $18
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $12
      local.set $20
      local.get $10
      local.set $13
      local.get $6
      local.set $17
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $20
       local.tee $19
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $18
       i32.ne
       if
        local.get $19
        call $~lib/rt/pure/__retain
        drop
        local.get $18
        call $~lib/rt/pure/__release
       end
       local.get $19
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $13
      global.set $assembly/internal/value/index/Expected.offset
      local.get $17
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $9
      local.set $15
      local.get $9
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $15
       local.tee $14
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $20
       i32.ne
       if
        local.get $14
        call $~lib/rt/pure/__retain
        drop
        local.get $20
        call $~lib/rt/pure/__release
       end
       local.get $14
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $16
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $15
     local.get $7
     i32.const 0
     i32.eq
     local.set $16
     local.get $15
     local.get $16
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $9
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.6 (result i32)
        local.get $11
        local.set $17
        local.get $12
        local.set $19
        local.get $9
        local.set $18
        block $~lib/util/memory/memcmp|inlined.6 (result i32)
         local.get $17
         local.set $21
         local.get $19
         local.set $20
         local.get $18
         local.set $13
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.6
         end
         block $break|0
          loop $continue|0
           local.get $13
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
            local.get $13
            i32.const 1
            i32.sub
            local.set $13
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
         local.get $13
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
       local.set $17
       local.get $6
       local.get $17
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $8
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.1
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $4
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|6 (; 85 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/vec2
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $4
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
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.2
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $3
     i32.load
     local.set $6
     local.get $4
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $14
           local.tee $15
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $16
           i32.ne
           if
            local.get $15
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $15
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $14
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.12
            local.get $14
            local.set $15
            local.get $14
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $15
             local.tee $17
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $18
             i32.ne
             if
              local.get $17
              call $~lib/rt/pure/__retain
              drop
              local.get $18
              call $~lib/rt/pure/__release
             end
             local.get $17
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $16
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $17
           i32.const 24
           local.set $18
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $17
            local.tee $16
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $14
            i32.ne
            if
             local.get $16
             call $~lib/rt/pure/__retain
             drop
             local.get $14
             call $~lib/rt/pure/__release
            end
            local.get $16
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $18
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $15
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $15
         local.set $16
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          call $~lib/rt/pure/__retain
          local.set $17
          local.get $15
          local.set $18
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $17
           local.tee $13
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $16
           i32.ne
           if
            local.get $13
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $13
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $18
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $17
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $17
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.12
            local.get $17
            local.set $18
            local.get $17
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $13
            local.get $15
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $18
             local.tee $19
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $20
             i32.ne
             if
              local.get $19
              call $~lib/rt/pure/__retain
              drop
              local.get $20
              call $~lib/rt/pure/__release
             end
             local.get $19
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $13
            global.set $assembly/internal/value/index/Expected.offset
            local.get $16
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $17
           call $~lib/rt/pure/__release
          else           
           local.get $14
           local.set $16
           i32.const 24
           local.set $19
           local.get $15
           local.set $20
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $16
            local.tee $13
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $17
            i32.ne
            if
             local.get $13
             call $~lib/rt/pure/__retain
             drop
             local.get $17
             call $~lib/rt/pure/__release
            end
            local.get $13
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $19
           global.set $assembly/internal/value/index/Expected.offset
           local.get $20
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
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
       local.get $11
       call $~lib/rt/pure/__release
       local.get $12
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $8
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.2
     end
     local.get $7
     local.set $12
     local.get $8
     local.set $11
     local.get $12
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      local.set $18
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $12
      local.set $20
      local.get $10
      local.set $13
      local.get $6
      local.set $17
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $20
       local.tee $19
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $18
       i32.ne
       if
        local.get $19
        call $~lib/rt/pure/__retain
        drop
        local.get $18
        call $~lib/rt/pure/__release
       end
       local.get $19
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $13
      global.set $assembly/internal/value/index/Expected.offset
      local.get $17
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $9
      local.set $15
      local.get $9
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $15
       local.tee $14
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $20
       i32.ne
       if
        local.get $14
        call $~lib/rt/pure/__retain
        drop
        local.get $20
        call $~lib/rt/pure/__release
       end
       local.get $14
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $16
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $15
     local.get $7
     i32.const 0
     i32.eq
     local.set $16
     local.get $15
     local.get $16
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $9
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.7 (result i32)
        local.get $11
        local.set $17
        local.get $12
        local.set $19
        local.get $9
        local.set $18
        block $~lib/util/memory/memcmp|inlined.7 (result i32)
         local.get $17
         local.set $21
         local.get $19
         local.set $20
         local.get $18
         local.set $13
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.7
         end
         block $break|0
          loop $continue|0
           local.get $13
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
            local.get $13
            i32.const 1
            i32.sub
            local.set $13
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
         local.get $13
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
       local.set $17
       local.get $6
       local.get $17
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $8
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.2
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $4
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|7 (; 86 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/vec2
   call $~lib/rt/pure/__retain
   local.set $1
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $3
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
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.3
     local.get $2
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $2
     i32.load
     local.set $5
     local.get $3
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $13
           local.tee $14
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $15
           i32.ne
           if
            local.get $14
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $14
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $13
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.15
            local.get $13
            local.set $14
            local.get $13
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $14
             local.tee $16
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $17
             i32.ne
             if
              local.get $16
              call $~lib/rt/pure/__retain
              drop
              local.get $17
              call $~lib/rt/pure/__release
             end
             local.get $16
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $15
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           local.set $16
           i32.const 24
           local.set $17
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $16
            local.tee $15
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $13
            i32.ne
            if
             local.get $15
             call $~lib/rt/pure/__retain
             drop
             local.get $13
             call $~lib/rt/pure/__release
            end
            local.get $15
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $17
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $14
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $14
         local.set $15
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $~lib/rt/pure/__retain
          local.set $16
          local.get $14
          local.set $17
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $16
           local.tee $12
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $15
           i32.ne
           if
            local.get $12
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $12
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $17
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $16
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $16
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.15
            local.get $16
            local.set $17
            local.get $16
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $12
            local.get $14
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $17
             local.tee $18
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $19
             i32.ne
             if
              local.get $18
              call $~lib/rt/pure/__retain
              drop
              local.get $19
              call $~lib/rt/pure/__release
             end
             local.get $18
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $12
            global.set $assembly/internal/value/index/Expected.offset
            local.get $15
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $16
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $15
           i32.const 24
           local.set $18
           local.get $14
           local.set $19
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $15
            local.tee $12
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $16
            i32.ne
            if
             local.get $12
             call $~lib/rt/pure/__retain
             drop
             local.get $16
             call $~lib/rt/pure/__release
            end
            local.get $12
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $18
           global.set $assembly/internal/value/index/Expected.offset
           local.get $19
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.11
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $8
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.3
     end
     local.get $6
     local.set $11
     local.get $7
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $8
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      local.set $17
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $11
      local.set $19
      local.get $9
      local.set $12
      local.get $5
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $19
       local.tee $18
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $17
       i32.ne
       if
        local.get $18
        call $~lib/rt/pure/__retain
        drop
        local.get $17
        call $~lib/rt/pure/__release
       end
       local.get $18
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $12
      global.set $assembly/internal/value/index/Expected.offset
      local.get $16
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $8
      local.set $14
      local.get $8
      local.set $15
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $14
       local.tee $13
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $19
       i32.ne
       if
        local.get $13
        call $~lib/rt/pure/__retain
        drop
        local.get $19
        call $~lib/rt/pure/__release
       end
       local.get $13
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $15
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $6
     i32.const 0
     i32.eq
     local.set $15
     local.get $14
     local.get $15
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $8
      local.get $9
      i32.eq
      local.set $13
      local.get $13
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.8 (result i32)
        local.get $10
        local.set $16
        local.get $11
        local.set $18
        local.get $8
        local.set $17
        block $~lib/util/memory/memcmp|inlined.8 (result i32)
         local.get $16
         local.set $20
         local.get $18
         local.set $19
         local.get $17
         local.set $12
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.8
         end
         block $break|0
          loop $continue|0
           local.get $12
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
            local.get $12
            i32.const 1
            i32.sub
            local.set $12
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
         local.get $12
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
       local.set $16
       local.get $5
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
    end
    local.get $1
    call $~lib/rt/pure/__release
    local.get $3
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.3
   end
   local.get $2
   i32.load offset=4
   local.get $1
   local.get $2
   i32.load
   local.get $3
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|8 (; 87 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   i32.const 0
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $2
   i32.const 0
   call $~lib/rt/pure/__retain
   local.set $1
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $3
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
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.4
     local.get $2
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $2
     i32.load
     local.set $5
     local.get $3
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $13
           local.tee $14
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $15
           i32.ne
           if
            local.get $14
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $14
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $13
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.18
            local.get $13
            local.set $14
            local.get $13
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $14
             local.tee $16
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $17
             i32.ne
             if
              local.get $16
              call $~lib/rt/pure/__retain
              drop
              local.get $17
              call $~lib/rt/pure/__release
             end
             local.get $16
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $15
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           local.set $16
           i32.const 24
           local.set $17
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $16
            local.tee $15
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $13
            i32.ne
            if
             local.get $15
             call $~lib/rt/pure/__retain
             drop
             local.get $13
             call $~lib/rt/pure/__release
            end
            local.get $15
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $17
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $14
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $14
         local.set $15
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $~lib/rt/pure/__retain
          local.set $16
          local.get $14
          local.set $17
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $16
           local.tee $12
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $15
           i32.ne
           if
            local.get $12
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $12
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $17
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $16
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $16
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.18
            local.get $16
            local.set $17
            local.get $16
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $12
            local.get $14
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $17
             local.tee $18
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $19
             i32.ne
             if
              local.get $18
              call $~lib/rt/pure/__retain
              drop
              local.get $19
              call $~lib/rt/pure/__release
             end
             local.get $18
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $12
            global.set $assembly/internal/value/index/Expected.offset
            local.get $15
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $16
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $15
           i32.const 24
           local.set $18
           local.get $14
           local.set $19
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $15
            local.tee $12
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $16
            i32.ne
            if
             local.get $12
             call $~lib/rt/pure/__retain
             drop
             local.get $16
             call $~lib/rt/pure/__release
            end
            local.get $12
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $18
           global.set $assembly/internal/value/index/Expected.offset
           local.get $19
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.12
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $8
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.4
     end
     local.get $6
     local.set $11
     local.get $7
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $8
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      local.set $17
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $11
      local.set $19
      local.get $9
      local.set $12
      local.get $5
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $19
       local.tee $18
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $17
       i32.ne
       if
        local.get $18
        call $~lib/rt/pure/__retain
        drop
        local.get $17
        call $~lib/rt/pure/__release
       end
       local.get $18
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $12
      global.set $assembly/internal/value/index/Expected.offset
      local.get $16
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $8
      local.set $14
      local.get $8
      local.set $15
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $14
       local.tee $13
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $19
       i32.ne
       if
        local.get $13
        call $~lib/rt/pure/__retain
        drop
        local.get $19
        call $~lib/rt/pure/__release
       end
       local.get $13
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $15
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $6
     i32.const 0
     i32.eq
     local.set $15
     local.get $14
     local.get $15
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $8
      local.get $9
      i32.eq
      local.set $13
      local.get $13
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.9 (result i32)
        local.get $10
        local.set $16
        local.get $11
        local.set $18
        local.get $8
        local.set $17
        block $~lib/util/memory/memcmp|inlined.9 (result i32)
         local.get $16
         local.set $20
         local.get $18
         local.set $19
         local.get $17
         local.set $12
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.9
         end
         block $break|0
          loop $continue|0
           local.get $12
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
            local.get $12
            i32.const 1
            i32.sub
            local.set $12
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
         local.get $12
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
       local.set $16
       local.get $5
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
    end
    local.get $1
    call $~lib/rt/pure/__release
    local.get $3
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.4
   end
   local.get $2
   i32.load offset=4
   local.get $1
   local.get $2
   i32.load
   local.get $3
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|9 (; 88 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   i32.const 0
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $3
   i32.const 0
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $4
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
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.5
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $3
     i32.load
     local.set $6
     local.get $4
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $14
           local.tee $15
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $16
           i32.ne
           if
            local.get $15
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $15
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $14
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.21
            local.get $14
            local.set $15
            local.get $14
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $15
             local.tee $17
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $18
             i32.ne
             if
              local.get $17
              call $~lib/rt/pure/__retain
              drop
              local.get $18
              call $~lib/rt/pure/__release
             end
             local.get $17
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $16
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $17
           i32.const 24
           local.set $18
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $17
            local.tee $16
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $14
            i32.ne
            if
             local.get $16
             call $~lib/rt/pure/__retain
             drop
             local.get $14
             call $~lib/rt/pure/__release
            end
            local.get $16
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $18
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $15
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $15
         local.set $16
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          call $~lib/rt/pure/__retain
          local.set $17
          local.get $15
          local.set $18
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $17
           local.tee $13
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $16
           i32.ne
           if
            local.get $13
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $13
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $18
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $17
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $17
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.21
            local.get $17
            local.set $18
            local.get $17
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $13
            local.get $15
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $18
             local.tee $19
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $20
             i32.ne
             if
              local.get $19
              call $~lib/rt/pure/__retain
              drop
              local.get $20
              call $~lib/rt/pure/__release
             end
             local.get $19
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $13
            global.set $assembly/internal/value/index/Expected.offset
            local.get $16
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $17
           call $~lib/rt/pure/__release
          else           
           local.get $14
           local.set $16
           i32.const 24
           local.set $19
           local.get $15
           local.set $20
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $16
            local.tee $13
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $17
            i32.ne
            if
             local.get $13
             call $~lib/rt/pure/__retain
             drop
             local.get $17
             call $~lib/rt/pure/__release
            end
            local.get $13
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $19
           global.set $assembly/internal/value/index/Expected.offset
           local.get $20
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.13
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $9
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $12
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $8
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.5
     end
     local.get $7
     local.set $12
     local.get $8
     local.set $11
     local.get $12
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      local.set $18
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $12
      local.set $20
      local.get $10
      local.set $13
      local.get $6
      local.set $17
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $20
       local.tee $19
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $18
       i32.ne
       if
        local.get $19
        call $~lib/rt/pure/__retain
        drop
        local.get $18
        call $~lib/rt/pure/__release
       end
       local.get $19
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $13
      global.set $assembly/internal/value/index/Expected.offset
      local.get $17
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $9
      local.set $15
      local.get $9
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $15
       local.tee $14
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $20
       i32.ne
       if
        local.get $14
        call $~lib/rt/pure/__retain
        drop
        local.get $20
        call $~lib/rt/pure/__release
       end
       local.get $14
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $16
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $15
     local.get $7
     i32.const 0
     i32.eq
     local.set $16
     local.get $15
     local.get $16
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $9
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.10 (result i32)
        local.get $11
        local.set $17
        local.get $12
        local.set $19
        local.get $9
        local.set $18
        block $~lib/util/memory/memcmp|inlined.10 (result i32)
         local.get $17
         local.set $21
         local.get $19
         local.set $20
         local.get $18
         local.set $13
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.10
         end
         block $break|0
          loop $continue|0
           local.get $13
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
            local.get $13
            i32.const 1
            i32.sub
            local.set $13
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
         local.get $13
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
       local.set $17
       local.get $6
       local.get $17
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $8
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.5
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $4
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|10 (; 89 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $3
   i32.const 0
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $4
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
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.6
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $3
     i32.load
     local.set $6
     local.get $4
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $14
           local.tee $15
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $16
           i32.ne
           if
            local.get $15
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $15
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $14
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.24
            local.get $14
            local.set $15
            local.get $14
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $15
             local.tee $17
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $18
             i32.ne
             if
              local.get $17
              call $~lib/rt/pure/__retain
              drop
              local.get $18
              call $~lib/rt/pure/__release
             end
             local.get $17
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $16
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $17
           i32.const 24
           local.set $18
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $17
            local.tee $16
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $14
            i32.ne
            if
             local.get $16
             call $~lib/rt/pure/__retain
             drop
             local.get $14
             call $~lib/rt/pure/__release
            end
            local.get $16
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $18
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $15
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $15
         local.set $16
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          call $~lib/rt/pure/__retain
          local.set $17
          local.get $15
          local.set $18
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $17
           local.tee $13
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $16
           i32.ne
           if
            local.get $13
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $13
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $18
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $17
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $17
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.24
            local.get $17
            local.set $18
            local.get $17
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $13
            local.get $15
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $18
             local.tee $19
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $20
             i32.ne
             if
              local.get $19
              call $~lib/rt/pure/__retain
              drop
              local.get $20
              call $~lib/rt/pure/__release
             end
             local.get $19
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $13
            global.set $assembly/internal/value/index/Expected.offset
            local.get $16
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $17
           call $~lib/rt/pure/__release
          else           
           local.get $14
           local.set $16
           i32.const 24
           local.set $19
           local.get $15
           local.set $20
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $16
            local.tee $13
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $17
            i32.ne
            if
             local.get $13
             call $~lib/rt/pure/__retain
             drop
             local.get $17
             call $~lib/rt/pure/__release
            end
            local.get $13
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $19
           global.set $assembly/internal/value/index/Expected.offset
           local.get $20
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
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
       local.get $11
       call $~lib/rt/pure/__release
       local.get $12
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $8
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.6
     end
     local.get $7
     local.set $12
     local.get $8
     local.set $11
     local.get $12
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      local.set $18
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $12
      local.set $20
      local.get $10
      local.set $13
      local.get $6
      local.set $17
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $20
       local.tee $19
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $18
       i32.ne
       if
        local.get $19
        call $~lib/rt/pure/__retain
        drop
        local.get $18
        call $~lib/rt/pure/__release
       end
       local.get $19
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $13
      global.set $assembly/internal/value/index/Expected.offset
      local.get $17
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $9
      local.set $15
      local.get $9
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $15
       local.tee $14
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $20
       i32.ne
       if
        local.get $14
        call $~lib/rt/pure/__retain
        drop
        local.get $20
        call $~lib/rt/pure/__release
       end
       local.get $14
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $16
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $15
     local.get $7
     i32.const 0
     i32.eq
     local.set $16
     local.get $15
     local.get $16
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $9
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.11 (result i32)
        local.get $11
        local.set $17
        local.get $12
        local.set $19
        local.get $9
        local.set $18
        block $~lib/util/memory/memcmp|inlined.11 (result i32)
         local.get $17
         local.set $21
         local.get $19
         local.set $20
         local.get $18
         local.set $13
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.11
         end
         block $break|0
          loop $continue|0
           local.get $13
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
            local.get $13
            i32.const 1
            i32.sub
            local.set $13
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
         local.get $13
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
       local.set $17
       local.get $6
       local.get $17
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $8
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.6
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $4
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|11 (; 90 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $2
   i32.const 0
   call $~lib/rt/pure/__retain
   local.set $1
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $3
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
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.7
     local.get $2
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $2
     i32.load
     local.set $5
     local.get $3
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $13
           local.tee $14
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $15
           i32.ne
           if
            local.get $14
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $14
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $13
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.27
            local.get $13
            local.set $14
            local.get $13
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $14
             local.tee $16
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $17
             i32.ne
             if
              local.get $16
              call $~lib/rt/pure/__retain
              drop
              local.get $17
              call $~lib/rt/pure/__release
             end
             local.get $16
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $15
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           local.set $16
           i32.const 24
           local.set $17
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $16
            local.tee $15
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $13
            i32.ne
            if
             local.get $15
             call $~lib/rt/pure/__retain
             drop
             local.get $13
             call $~lib/rt/pure/__release
            end
            local.get $15
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $17
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $14
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $14
         local.set $15
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $~lib/rt/pure/__retain
          local.set $16
          local.get $14
          local.set $17
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $16
           local.tee $12
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $15
           i32.ne
           if
            local.get $12
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $12
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $17
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $16
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $16
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.27
            local.get $16
            local.set $17
            local.get $16
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $12
            local.get $14
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $17
             local.tee $18
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $19
             i32.ne
             if
              local.get $18
              call $~lib/rt/pure/__retain
              drop
              local.get $19
              call $~lib/rt/pure/__release
             end
             local.get $18
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $12
            global.set $assembly/internal/value/index/Expected.offset
            local.get $15
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $16
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $15
           i32.const 24
           local.set $18
           local.get $14
           local.set $19
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $15
            local.tee $12
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $16
            i32.ne
            if
             local.get $12
             call $~lib/rt/pure/__retain
             drop
             local.get $16
             call $~lib/rt/pure/__release
            end
            local.get $12
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $18
           global.set $assembly/internal/value/index/Expected.offset
           local.get $19
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.15
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $8
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.7
     end
     local.get $6
     local.set $11
     local.get $7
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $8
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      local.set $17
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $11
      local.set $19
      local.get $9
      local.set $12
      local.get $5
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $19
       local.tee $18
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $17
       i32.ne
       if
        local.get $18
        call $~lib/rt/pure/__retain
        drop
        local.get $17
        call $~lib/rt/pure/__release
       end
       local.get $18
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $12
      global.set $assembly/internal/value/index/Expected.offset
      local.get $16
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $8
      local.set $14
      local.get $8
      local.set $15
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $14
       local.tee $13
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $19
       i32.ne
       if
        local.get $13
        call $~lib/rt/pure/__retain
        drop
        local.get $19
        call $~lib/rt/pure/__release
       end
       local.get $13
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $15
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $6
     i32.const 0
     i32.eq
     local.set $15
     local.get $14
     local.get $15
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $8
      local.get $9
      i32.eq
      local.set $13
      local.get $13
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.12 (result i32)
        local.get $10
        local.set $16
        local.get $11
        local.set $18
        local.get $8
        local.set $17
        block $~lib/util/memory/memcmp|inlined.12 (result i32)
         local.get $16
         local.set $20
         local.get $18
         local.set $19
         local.get $17
         local.set $12
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.12
         end
         block $break|0
          loop $continue|0
           local.get $12
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
            local.get $12
            i32.const 1
            i32.sub
            local.set $12
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
         local.get $12
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
       local.set $16
       local.get $5
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
    end
    local.get $1
    call $~lib/rt/pure/__release
    local.get $3
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.7
   end
   local.get $2
   i32.load offset=4
   local.get $1
   local.get $2
   i32.load
   local.get $3
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|12 (; 91 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   i32.const 0
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
   local.tee $1
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $4
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
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.8
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $3
     i32.load
     local.set $6
     local.get $4
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $14
           local.tee $15
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $16
           i32.ne
           if
            local.get $15
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $15
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $14
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.30
            local.get $14
            local.set $15
            local.get $14
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $15
             local.tee $17
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $18
             i32.ne
             if
              local.get $17
              call $~lib/rt/pure/__retain
              drop
              local.get $18
              call $~lib/rt/pure/__release
             end
             local.get $17
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $16
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $17
           i32.const 24
           local.set $18
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $17
            local.tee $16
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $14
            i32.ne
            if
             local.get $16
             call $~lib/rt/pure/__retain
             drop
             local.get $14
             call $~lib/rt/pure/__release
            end
            local.get $16
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $18
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $15
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $15
         local.set $16
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          call $~lib/rt/pure/__retain
          local.set $17
          local.get $15
          local.set $18
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $17
           local.tee $13
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $16
           i32.ne
           if
            local.get $13
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $13
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $18
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $17
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 0
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $17
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.30
            local.get $17
            local.set $18
            local.get $17
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $13
            local.get $15
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $18
             local.tee $19
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $20
             i32.ne
             if
              local.get $19
              call $~lib/rt/pure/__retain
              drop
              local.get $20
              call $~lib/rt/pure/__release
             end
             local.get $19
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $13
            global.set $assembly/internal/value/index/Expected.offset
            local.get $16
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $17
           call $~lib/rt/pure/__release
          else           
           local.get $14
           local.set $16
           i32.const 24
           local.set $19
           local.get $15
           local.set $20
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $16
            local.tee $13
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $17
            i32.ne
            if
             local.get $13
             call $~lib/rt/pure/__retain
             drop
             local.get $17
             call $~lib/rt/pure/__release
            end
            local.get $13
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $19
           global.set $assembly/internal/value/index/Expected.offset
           local.get $20
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
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
       local.get $11
       call $~lib/rt/pure/__release
       local.get $12
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $8
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.8
     end
     local.get $7
     local.set $12
     local.get $8
     local.set $11
     local.get $12
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      local.set $18
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $12
      local.set $20
      local.get $10
      local.set $13
      local.get $6
      local.set $17
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $20
       local.tee $19
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $18
       i32.ne
       if
        local.get $19
        call $~lib/rt/pure/__retain
        drop
        local.get $18
        call $~lib/rt/pure/__release
       end
       local.get $19
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $13
      global.set $assembly/internal/value/index/Expected.offset
      local.get $17
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $9
      local.set $15
      local.get $9
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $15
       local.tee $14
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $20
       i32.ne
       if
        local.get $14
        call $~lib/rt/pure/__retain
        drop
        local.get $20
        call $~lib/rt/pure/__release
       end
       local.get $14
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $16
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $15
     local.get $7
     i32.const 0
     i32.eq
     local.set $16
     local.get $15
     local.get $16
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $9
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.13 (result i32)
        local.get $11
        local.set $17
        local.get $12
        local.set $19
        local.get $9
        local.set $18
        block $~lib/util/memory/memcmp|inlined.13 (result i32)
         local.get $17
         local.set $21
         local.get $19
         local.set $20
         local.get $18
         local.set $13
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.13
         end
         block $break|0
          loop $continue|0
           local.get $13
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
            local.get $13
            i32.const 1
            i32.sub
            local.set $13
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
         local.get $13
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
       local.set $17
       local.get $6
       local.get $17
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $8
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.8
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $4
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|13 (; 92 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   i32.const 0
   call $assembly/internal/test/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
   local.tee $0
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/vec1
   call $~lib/rt/pure/__retain
   local.set $1
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $3
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
    block $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.9
     local.get $2
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $2
     i32.load
     local.set $5
     local.get $3
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $13
           local.tee $14
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $15
           i32.ne
           if
            local.get $14
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $14
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $13
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.33
            local.get $13
            local.set $14
            local.get $13
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $14
             local.tee $16
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $17
             i32.ne
             if
              local.get $16
              call $~lib/rt/pure/__retain
              drop
              local.get $17
              call $~lib/rt/pure/__release
             end
             local.get $16
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $15
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           local.set $16
           i32.const 24
           local.set $17
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $16
            local.tee $15
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $13
            i32.ne
            if
             local.get $15
             call $~lib/rt/pure/__retain
             drop
             local.get $13
             call $~lib/rt/pure/__release
            end
            local.get $15
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $17
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $14
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $14
         local.set $15
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $~lib/rt/pure/__retain
          local.set $16
          local.get $14
          local.set $17
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $16
           local.tee $12
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $15
           i32.ne
           if
            local.get $12
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $12
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $17
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $16
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 0
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $16
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.33
            local.get $16
            local.set $17
            local.get $16
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $12
            local.get $14
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $17
             local.tee $18
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $19
             i32.ne
             if
              local.get $18
              call $~lib/rt/pure/__retain
              drop
              local.get $19
              call $~lib/rt/pure/__release
             end
             local.get $18
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $12
            global.set $assembly/internal/value/index/Expected.offset
            local.get $15
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $16
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $15
           i32.const 24
           local.set $18
           local.get $14
           local.set $19
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $15
            local.tee $12
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $16
            i32.ne
            if
             local.get $12
             call $~lib/rt/pure/__retain
             drop
             local.get $16
             call $~lib/rt/pure/__release
            end
            local.get $12
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $18
           global.set $assembly/internal/value/index/Expected.offset
           local.get $19
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.17
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $8
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<assembly/__tests__/setup/Vec3/Vec3>|inlined.9
     end
     local.get $6
     local.set $11
     local.get $7
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $8
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      local.set $17
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $11
      local.set $19
      local.get $9
      local.set $12
      local.get $5
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $19
       local.tee $18
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $17
       i32.ne
       if
        local.get $18
        call $~lib/rt/pure/__retain
        drop
        local.get $17
        call $~lib/rt/pure/__release
       end
       local.get $18
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $12
      global.set $assembly/internal/value/index/Expected.offset
      local.get $16
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $8
      local.set $14
      local.get $8
      local.set $15
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $14
       local.tee $13
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $19
       i32.ne
       if
        local.get $13
        call $~lib/rt/pure/__retain
        drop
        local.get $19
        call $~lib/rt/pure/__release
       end
       local.get $13
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $15
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $6
     i32.const 0
     i32.eq
     local.set $15
     local.get $14
     local.get $15
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $8
      local.get $9
      i32.eq
      local.set $13
      local.get $13
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.14 (result i32)
        local.get $10
        local.set $16
        local.get $11
        local.set $18
        local.get $8
        local.set $17
        block $~lib/util/memory/memcmp|inlined.14 (result i32)
         local.get $16
         local.set $20
         local.get $18
         local.set $19
         local.get $17
         local.set $12
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.14
         end
         block $break|0
          loop $continue|0
           local.get $12
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
            local.get $12
            i32.const 1
            i32.sub
            local.set $12
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
         local.get $12
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
       local.set $16
       local.get $5
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
    end
    local.get $1
    call $~lib/rt/pure/__release
    local.get $3
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#toStrictEqual|inlined.9
   end
   local.get $2
   i32.load offset=4
   local.get $1
   local.get $2
   i32.load
   local.get $3
   call $assembly/internal/comparison/referenceComparison/referenceComparison<assembly/__tests__/setup/Vec3/Vec3>
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor (; 93 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/test/Expectation/expect<~lib/arraybuffer/ArrayBuffer> (; 94 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  drop
  i32.const 0
  local.get $0
  call $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer> (; 95 ;) (type $FUNCSIG$viiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
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
    i32.const 5
    global.set $assembly/internal/value/index/Actual.type
    call $assembly/internal/report/reportActualNull/getLogStackTrace
    global.set $assembly/internal/value/index/Actual.stack
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
     i32.const 3
     global.set $assembly/internal/value/index/Actual.type
     block (result i32)
      local.get $5
      local.tee $6
      global.get $assembly/internal/value/index/Actual.reference
      local.tee $7
      i32.ne
      if
       local.get $6
       call $~lib/rt/pure/__retain
       drop
       local.get $7
       call $~lib/rt/pure/__release
      end
      local.get $6
     end
     global.set $assembly/internal/value/index/Actual.reference
     call $assembly/internal/report/reportActualString/getLogStackTrace
     global.set $assembly/internal/value/index/Actual.stack
     local.get $5
     call $~lib/rt/pure/__release
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
      block $assembly/internal/report/reportActualReference/reportActualReference|inlined.39
       local.get $5
       local.set $6
       local.get $5
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $7
       i32.const 2
       global.set $assembly/internal/value/index/Actual.type
       block (result i32)
        local.get $6
        local.tee $8
        global.get $assembly/internal/value/index/Actual.reference
        local.tee $9
        i32.ne
        if
         local.get $8
         call $~lib/rt/pure/__retain
         drop
         local.get $9
         call $~lib/rt/pure/__release
        end
        local.get $8
       end
       global.set $assembly/internal/value/index/Actual.reference
       local.get $7
       global.set $assembly/internal/value/index/Actual.offset
       call $assembly/internal/report/reportActualReference/getLogStackTrace
       global.set $assembly/internal/value/index/Actual.stack
      end
      local.get $5
      call $~lib/rt/pure/__release
     else      
      local.get $4
      local.set $8
      i32.const 0
      local.set $9
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $8
       local.tee $7
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $5
       i32.ne
       if
        local.get $7
        call $~lib/rt/pure/__retain
        drop
        local.get $5
        call $~lib/rt/pure/__release
       end
       local.get $7
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $9
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
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
   local.set $6
   local.get $5
   i32.const 0
   i32.eq
   if
    local.get $6
    local.set $7
    i32.const 5
    global.set $assembly/internal/value/index/Expected.type
    call $assembly/internal/report/reportExpectedNull/getLogStackTrace
    global.set $assembly/internal/value/index/Expected.stack
   else    
    block (result i32)
     local.get $5
     drop
     i32.const 0
    end
    if
     local.get $5
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $6
     local.set $9
     i32.const 3
     global.set $assembly/internal/value/index/Expected.type
     block (result i32)
      local.get $8
      local.tee $4
      global.get $assembly/internal/value/index/Expected.reference
      local.tee $7
      i32.ne
      if
       local.get $4
       call $~lib/rt/pure/__retain
       drop
       local.get $7
       call $~lib/rt/pure/__release
      end
      local.get $4
     end
     global.set $assembly/internal/value/index/Expected.reference
     local.get $9
     global.set $assembly/internal/value/index/Expected.negated
     call $assembly/internal/report/reportExpectedString/getLogStackTrace
     global.set $assembly/internal/value/index/Expected.stack
     local.get $8
     call $~lib/rt/pure/__release
    else     
     block (result i32)
      local.get $5
      drop
      i32.const 1
     end
     if
      local.get $5
      call $~lib/rt/pure/__retain
      local.set $8
      block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.39
       local.get $8
       local.set $9
       local.get $8
       call $~lib/arraybuffer/ArrayBuffer#get:byteLength
       local.set $4
       local.get $6
       local.set $7
       i32.const 2
       global.set $assembly/internal/value/index/Expected.type
       block (result i32)
        local.get $9
        local.tee $10
        global.get $assembly/internal/value/index/Expected.reference
        local.tee $11
        i32.ne
        if
         local.get $10
         call $~lib/rt/pure/__retain
         drop
         local.get $11
         call $~lib/rt/pure/__release
        end
        local.get $10
       end
       global.set $assembly/internal/value/index/Expected.reference
       local.get $4
       global.set $assembly/internal/value/index/Expected.offset
       local.get $7
       global.set $assembly/internal/value/index/Expected.negated
       call $assembly/internal/report/reportExpectedReference/getLogStackTrace
       global.set $assembly/internal/value/index/Expected.stack
      end
      local.get $8
      call $~lib/rt/pure/__release
     else      
      local.get $5
      local.set $7
      i32.const 0
      local.set $10
      local.get $6
      local.set $11
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $7
       local.tee $4
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $8
       i32.ne
       if
        local.get $4
        call $~lib/rt/pure/__retain
        drop
        local.get $8
        call $~lib/rt/pure/__release
       end
       local.get $4
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $10
      global.set $assembly/internal/value/index/Expected.offset
      local.get $11
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
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
    i32.const 2280
    i32.const 18
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
    i32.const 2280
    i32.const 25
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
   local.set $4
   local.get $0
   local.set $8
   i32.const 0
   local.set $9
   block $~lib/util/memory/memcmp|inlined.16 (result i32)
    local.get $4
    local.set $7
    local.get $8
    local.set $10
    local.get $9
    local.set $11
    local.get $7
    local.get $10
    i32.eq
    if
     i32.const 0
     br $~lib/util/memory/memcmp|inlined.16
    end
    block $break|0
     loop $continue|0
      local.get $11
      i32.const 0
      i32.ne
      if (result i32)
       local.get $7
       i32.load8_u
       local.get $10
       i32.load8_u
       i32.eq
      else       
       i32.const 0
      end
      if
       local.get $11
       i32.const 1
       i32.sub
       local.set $11
       local.get $7
       i32.const 1
       i32.add
       local.set $7
       local.get $10
       i32.const 1
       i32.add
       local.set $10
       br $continue|0
      end
     end
    end
    local.get $11
    if (result i32)
     local.get $7
     i32.load8_u
     local.get $10
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
   i32.const 2280
   i32.const 35
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  block $assembly/internal/report/clearExpected/clearExpected|inlined.21
   i32.const 0
   global.set $assembly/internal/value/index/Actual.type
   i32.const 0
   global.set $assembly/internal/value/index/Expected.type
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|14 (; 96 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/test/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.tee $0
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
   local.set $1
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $3
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
     local.get $2
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $2
     i32.load
     local.set $5
     local.get $3
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $13
           local.tee $14
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $15
           i32.ne
           if
            local.get $14
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $14
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $13
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.36
            local.get $13
            local.set $14
            local.get $13
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $14
             local.tee $16
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $17
             i32.ne
             if
              local.get $16
              call $~lib/rt/pure/__retain
              drop
              local.get $17
              call $~lib/rt/pure/__release
             end
             local.get $16
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $15
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           local.set $16
           i32.const 0
           local.set $17
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $16
            local.tee $15
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $13
            i32.ne
            if
             local.get $15
             call $~lib/rt/pure/__retain
             drop
             local.get $13
             call $~lib/rt/pure/__release
            end
            local.get $15
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $17
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $14
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $14
         local.set $15
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $~lib/rt/pure/__retain
          local.set $16
          local.get $14
          local.set $17
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $16
           local.tee $12
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $15
           i32.ne
           if
            local.get $12
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $12
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $17
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $16
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 1
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $16
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.36
            local.get $16
            local.set $17
            local.get $16
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $12
            local.get $14
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $17
             local.tee $18
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $19
             i32.ne
             if
              local.get $18
              call $~lib/rt/pure/__retain
              drop
              local.get $19
              call $~lib/rt/pure/__release
             end
             local.get $18
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $12
            global.set $assembly/internal/value/index/Expected.offset
            local.get $15
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $16
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $15
           i32.const 0
           local.set $18
           local.get $14
           local.set $19
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $15
            local.tee $12
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $16
            i32.ne
            if
             local.get $12
             call $~lib/rt/pure/__retain
             drop
             local.get $16
             call $~lib/rt/pure/__release
            end
            local.get $12
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $18
           global.set $assembly/internal/value/index/Expected.offset
           local.get $19
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.18
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $8
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.0
     end
     local.get $6
     local.set $11
     local.get $7
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $8
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      local.set $17
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $11
      local.set $19
      local.get $9
      local.set $12
      local.get $5
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $19
       local.tee $18
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $17
       i32.ne
       if
        local.get $18
        call $~lib/rt/pure/__retain
        drop
        local.get $17
        call $~lib/rt/pure/__release
       end
       local.get $18
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $12
      global.set $assembly/internal/value/index/Expected.offset
      local.get $16
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $8
      local.set $14
      local.get $8
      local.set $15
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $14
       local.tee $13
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $19
       i32.ne
       if
        local.get $13
        call $~lib/rt/pure/__retain
        drop
        local.get $19
        call $~lib/rt/pure/__release
       end
       local.get $13
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $15
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $6
     i32.const 0
     i32.eq
     local.set $15
     local.get $14
     local.get $15
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $8
      local.get $9
      i32.eq
      local.set $13
      local.get $13
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.15 (result i32)
        local.get $10
        local.set $16
        local.get $11
        local.set $18
        local.get $8
        local.set $17
        block $~lib/util/memory/memcmp|inlined.15 (result i32)
         local.get $16
         local.set $20
         local.get $18
         local.set $19
         local.get $17
         local.set $12
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.15
         end
         block $break|0
          loop $continue|0
           local.get $12
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
            local.get $12
            i32.const 1
            i32.sub
            local.set $12
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
         local.get $12
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
       local.set $16
       local.get $5
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
    end
    local.get $1
    call $~lib/rt/pure/__release
    local.get $3
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.0
   end
   local.get $2
   i32.load offset=4
   local.get $1
   local.get $2
   i32.load
   local.get $3
   call $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not (; 97 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|15 (; 98 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/test/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
   local.tee $1
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/buff2
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $4
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
    block $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.1
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $3
     i32.load
     local.set $6
     local.get $4
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $14
           local.tee $15
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $16
           i32.ne
           if
            local.get $15
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $15
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $14
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.41
            local.get $14
            local.set $15
            local.get $14
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $15
             local.tee $17
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $18
             i32.ne
             if
              local.get $17
              call $~lib/rt/pure/__retain
              drop
              local.get $18
              call $~lib/rt/pure/__release
             end
             local.get $17
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $16
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $17
           i32.const 0
           local.set $18
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $17
            local.tee $16
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $14
            i32.ne
            if
             local.get $16
             call $~lib/rt/pure/__retain
             drop
             local.get $14
             call $~lib/rt/pure/__release
            end
            local.get $16
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $18
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $15
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $15
         local.set $16
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          call $~lib/rt/pure/__retain
          local.set $17
          local.get $15
          local.set $18
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $17
           local.tee $13
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $16
           i32.ne
           if
            local.get $13
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $13
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $18
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $17
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 1
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $17
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.41
            local.get $17
            local.set $18
            local.get $17
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $13
            local.get $15
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $18
             local.tee $19
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $20
             i32.ne
             if
              local.get $19
              call $~lib/rt/pure/__retain
              drop
              local.get $20
              call $~lib/rt/pure/__release
             end
             local.get $19
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $13
            global.set $assembly/internal/value/index/Expected.offset
            local.get $16
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $17
           call $~lib/rt/pure/__release
          else           
           local.get $14
           local.set $16
           i32.const 0
           local.set $19
           local.get $15
           local.set $20
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $16
            local.tee $13
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $17
            i32.ne
            if
             local.get $13
             call $~lib/rt/pure/__retain
             drop
             local.get $17
             call $~lib/rt/pure/__release
            end
            local.get $13
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $19
           global.set $assembly/internal/value/index/Expected.offset
           local.get $20
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.22
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $9
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $12
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $8
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.1
     end
     local.get $7
     local.set $12
     local.get $8
     local.set $11
     local.get $12
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      local.set $18
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $12
      local.set $20
      local.get $10
      local.set $13
      local.get $6
      local.set $17
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $20
       local.tee $19
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $18
       i32.ne
       if
        local.get $19
        call $~lib/rt/pure/__retain
        drop
        local.get $18
        call $~lib/rt/pure/__release
       end
       local.get $19
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $13
      global.set $assembly/internal/value/index/Expected.offset
      local.get $17
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $9
      local.set $15
      local.get $9
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $15
       local.tee $14
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $20
       i32.ne
       if
        local.get $14
        call $~lib/rt/pure/__retain
        drop
        local.get $20
        call $~lib/rt/pure/__release
       end
       local.get $14
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $16
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $15
     local.get $7
     i32.const 0
     i32.eq
     local.set $16
     local.get $15
     local.get $16
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $9
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.17 (result i32)
        local.get $11
        local.set $17
        local.get $12
        local.set $19
        local.get $9
        local.set $18
        block $~lib/util/memory/memcmp|inlined.17 (result i32)
         local.get $17
         local.set $21
         local.get $19
         local.set $20
         local.get $18
         local.set $13
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.17
         end
         block $break|0
          loop $continue|0
           local.get $13
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
            local.get $13
            i32.const 1
            i32.sub
            local.set $13
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
         local.get $13
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
       local.set $17
       local.get $6
       local.get $17
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $8
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.1
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $4
   call $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|16 (; 99 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/test/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.tee $0
   call $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#get:not
   local.tee $1
   local.set $3
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $4
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
    block $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.2
     local.get $3
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $8
     local.get $2
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $3
     i32.load
     local.set $6
     local.get $4
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $14
           local.tee $15
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $16
           i32.ne
           if
            local.get $15
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $15
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $14
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.44
            local.get $14
            local.set $15
            local.get $14
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $15
             local.tee $17
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $18
             i32.ne
             if
              local.get $17
              call $~lib/rt/pure/__retain
              drop
              local.get $18
              call $~lib/rt/pure/__release
             end
             local.get $17
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $16
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $14
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $17
           i32.const 0
           local.set $18
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $17
            local.tee $16
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $14
            i32.ne
            if
             local.get $16
             call $~lib/rt/pure/__retain
             drop
             local.get $14
             call $~lib/rt/pure/__release
            end
            local.get $16
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $18
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $15
        local.get $14
        i32.const 0
        i32.eq
        if
         local.get $15
         local.set $16
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $14
          drop
          i32.const 0
         end
         if
          local.get $14
          call $~lib/rt/pure/__retain
          local.set $17
          local.get $15
          local.set $18
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $17
           local.tee $13
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $16
           i32.ne
           if
            local.get $13
            call $~lib/rt/pure/__retain
            drop
            local.get $16
            call $~lib/rt/pure/__release
           end
           local.get $13
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $18
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $17
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $14
           drop
           i32.const 1
          end
          if
           local.get $14
           call $~lib/rt/pure/__retain
           local.set $17
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.44
            local.get $17
            local.set $18
            local.get $17
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $13
            local.get $15
            local.set $16
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $18
             local.tee $19
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $20
             i32.ne
             if
              local.get $19
              call $~lib/rt/pure/__retain
              drop
              local.get $20
              call $~lib/rt/pure/__release
             end
             local.get $19
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $13
            global.set $assembly/internal/value/index/Expected.offset
            local.get $16
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $17
           call $~lib/rt/pure/__release
          else           
           local.get $14
           local.set $16
           i32.const 0
           local.set $19
           local.get $15
           local.set $20
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $16
            local.tee $13
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $17
            i32.ne
            if
             local.get $13
             call $~lib/rt/pure/__retain
             drop
             local.get $17
             call $~lib/rt/pure/__release
            end
            local.get $13
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $19
           global.set $assembly/internal/value/index/Expected.offset
           local.get $20
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.23
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $9
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
       local.get $12
       call $~lib/rt/pure/__release
      end
      local.get $5
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      local.get $8
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.2
     end
     local.get $7
     local.set $12
     local.get $8
     local.set $11
     local.get $12
     i32.const 4
     i32.sub
     i32.load
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $7
     i32.const 0
     i32.eq
     if
      local.get $6
      local.set $18
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $12
      local.set $20
      local.get $10
      local.set $13
      local.get $6
      local.set $17
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $20
       local.tee $19
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $18
       i32.ne
       if
        local.get $19
        call $~lib/rt/pure/__retain
        drop
        local.get $18
        call $~lib/rt/pure/__release
       end
       local.get $19
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $13
      global.set $assembly/internal/value/index/Expected.offset
      local.get $17
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $9
      local.set $15
      local.get $9
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $15
       local.tee $14
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $20
       i32.ne
       if
        local.get $14
        call $~lib/rt/pure/__retain
        drop
        local.get $20
        call $~lib/rt/pure/__release
       end
       local.get $14
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $16
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $8
     i32.const 0
     i32.eq
     local.set $15
     local.get $7
     i32.const 0
     i32.eq
     local.set $16
     local.get $15
     local.get $16
     i32.xor
     if
      local.get $6
      i32.eqz
      if
       local.get $5
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $9
      local.get $10
      i32.eq
      local.set $14
      local.get $14
      i32.eqz
      if
       local.get $6
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.18 (result i32)
        local.get $11
        local.set $17
        local.get $12
        local.set $19
        local.get $9
        local.set $18
        block $~lib/util/memory/memcmp|inlined.18 (result i32)
         local.get $17
         local.set $21
         local.get $19
         local.set $20
         local.get $18
         local.set $13
         local.get $21
         local.get $20
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.18
         end
         block $break|0
          loop $continue|0
           local.get $13
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
            local.get $13
            i32.const 1
            i32.sub
            local.set $13
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
         local.get $13
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
       local.set $17
       local.get $6
       local.get $17
       i32.xor
       i32.eqz
       if
        local.get $5
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $5
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
     local.get $8
     call $~lib/rt/pure/__release
    end
    local.get $2
    call $~lib/rt/pure/__release
    local.get $4
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.2
   end
   local.get $3
   i32.load offset=4
   local.get $2
   local.get $3
   i32.load
   local.get $4
   call $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>
   local.get $2
   call $~lib/rt/pure/__release
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0~anonymous|17 (; 100 ;) (type $FUNCSIG$v)
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
  block $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
   global.get $assembly/__tests__/toStrictEqual.spec/buff1
   call $assembly/internal/test/Expectation/expect<~lib/arraybuffer/ArrayBuffer>
   local.tee $0
   local.set $2
   global.get $assembly/__tests__/toStrictEqual.spec/buff3
   call $~lib/rt/pure/__retain
   local.set $1
   i32.const 568
   call $~lib/rt/pure/__retain
   local.set $3
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
    block $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.3
     local.get $2
     i32.load offset=4
     call $~lib/rt/pure/__retain
     local.set $7
     local.get $1
     call $~lib/rt/pure/__retain
     local.set $6
     local.get $2
     i32.load
     local.set $5
     local.get $3
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
         i32.const 5
         global.set $assembly/internal/value/index/Actual.type
         call $assembly/internal/report/reportActualNull/getLogStackTrace
         global.set $assembly/internal/value/index/Actual.stack
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
          i32.const 3
          global.set $assembly/internal/value/index/Actual.type
          block (result i32)
           local.get $13
           local.tee $14
           global.get $assembly/internal/value/index/Actual.reference
           local.tee $15
           i32.ne
           if
            local.get $14
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $14
          end
          global.set $assembly/internal/value/index/Actual.reference
          call $assembly/internal/report/reportActualString/getLogStackTrace
          global.set $assembly/internal/value/index/Actual.stack
          local.get $13
          call $~lib/rt/pure/__release
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
           block $assembly/internal/report/reportActualReference/reportActualReference|inlined.47
            local.get $13
            local.set $14
            local.get $13
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Actual.type
            block (result i32)
             local.get $14
             local.tee $16
             global.get $assembly/internal/value/index/Actual.reference
             local.tee $17
             i32.ne
             if
              local.get $16
              call $~lib/rt/pure/__retain
              drop
              local.get $17
              call $~lib/rt/pure/__release
             end
             local.get $16
            end
            global.set $assembly/internal/value/index/Actual.reference
            local.get $15
            global.set $assembly/internal/value/index/Actual.offset
            call $assembly/internal/report/reportActualReference/getLogStackTrace
            global.set $assembly/internal/value/index/Actual.stack
           end
           local.get $13
           call $~lib/rt/pure/__release
          else           
           local.get $12
           local.set $16
           i32.const 0
           local.set $17
           i32.const 2
           global.set $assembly/internal/value/index/Actual.type
           block (result i32)
            local.get $16
            local.tee $15
            global.get $assembly/internal/value/index/Actual.reference
            local.tee $13
            i32.ne
            if
             local.get $15
             call $~lib/rt/pure/__retain
             drop
             local.get $13
             call $~lib/rt/pure/__release
            end
            local.get $15
           end
           global.set $assembly/internal/value/index/Actual.reference
           local.get $17
           global.set $assembly/internal/value/index/Actual.offset
           call $assembly/internal/report/reportActualReference/getLogStackTrace
           global.set $assembly/internal/value/index/Actual.stack
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
        local.set $14
        local.get $13
        i32.const 0
        i32.eq
        if
         local.get $14
         local.set $15
         i32.const 5
         global.set $assembly/internal/value/index/Expected.type
         call $assembly/internal/report/reportExpectedNull/getLogStackTrace
         global.set $assembly/internal/value/index/Expected.stack
        else         
         block (result i32)
          local.get $13
          drop
          i32.const 0
         end
         if
          local.get $13
          call $~lib/rt/pure/__retain
          local.set $16
          local.get $14
          local.set $17
          i32.const 3
          global.set $assembly/internal/value/index/Expected.type
          block (result i32)
           local.get $16
           local.tee $12
           global.get $assembly/internal/value/index/Expected.reference
           local.tee $15
           i32.ne
           if
            local.get $12
            call $~lib/rt/pure/__retain
            drop
            local.get $15
            call $~lib/rt/pure/__release
           end
           local.get $12
          end
          global.set $assembly/internal/value/index/Expected.reference
          local.get $17
          global.set $assembly/internal/value/index/Expected.negated
          call $assembly/internal/report/reportExpectedString/getLogStackTrace
          global.set $assembly/internal/value/index/Expected.stack
          local.get $16
          call $~lib/rt/pure/__release
         else          
          block (result i32)
           local.get $13
           drop
           i32.const 1
          end
          if
           local.get $13
           call $~lib/rt/pure/__retain
           local.set $16
           block $assembly/internal/report/reportExpectedReference/reportExpectedReference|inlined.47
            local.get $16
            local.set $17
            local.get $16
            call $~lib/arraybuffer/ArrayBuffer#get:byteLength
            local.set $12
            local.get $14
            local.set $15
            i32.const 2
            global.set $assembly/internal/value/index/Expected.type
            block (result i32)
             local.get $17
             local.tee $18
             global.get $assembly/internal/value/index/Expected.reference
             local.tee $19
             i32.ne
             if
              local.get $18
              call $~lib/rt/pure/__retain
              drop
              local.get $19
              call $~lib/rt/pure/__release
             end
             local.get $18
            end
            global.set $assembly/internal/value/index/Expected.reference
            local.get $12
            global.set $assembly/internal/value/index/Expected.offset
            local.get $15
            global.set $assembly/internal/value/index/Expected.negated
            call $assembly/internal/report/reportExpectedReference/getLogStackTrace
            global.set $assembly/internal/value/index/Expected.stack
           end
           local.get $16
           call $~lib/rt/pure/__release
          else           
           local.get $13
           local.set $15
           i32.const 0
           local.set $18
           local.get $14
           local.set $19
           i32.const 2
           global.set $assembly/internal/value/index/Expected.type
           block (result i32)
            local.get $15
            local.tee $12
            global.get $assembly/internal/value/index/Expected.reference
            local.tee $16
            i32.ne
            if
             local.get $12
             call $~lib/rt/pure/__retain
             drop
             local.get $16
             call $~lib/rt/pure/__release
            end
            local.get $12
           end
           global.set $assembly/internal/value/index/Expected.reference
           local.get $18
           global.set $assembly/internal/value/index/Expected.offset
           local.get $19
           global.set $assembly/internal/value/index/Expected.negated
           call $assembly/internal/report/reportExpectedReference/getLogStackTrace
           global.set $assembly/internal/value/index/Expected.stack
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
        i32.const 14
        i32.const 2
        call $~lib/builtins/abort
        unreachable
       end
       block $assembly/internal/report/clearExpected/clearExpected|inlined.24
        i32.const 0
        global.set $assembly/internal/value/index/Actual.type
        i32.const 0
        global.set $assembly/internal/value/index/Expected.type
       end
       local.get $8
       call $~lib/rt/pure/__release
       local.get $10
       call $~lib/rt/pure/__release
       local.get $11
       call $~lib/rt/pure/__release
      end
      local.get $4
      call $~lib/rt/pure/__release
      local.get $6
      call $~lib/rt/pure/__release
      local.get $7
      call $~lib/rt/pure/__release
      br $assembly/internal/comparison/blockComparison/blockComparison<~lib/arraybuffer/ArrayBuffer>|inlined.3
     end
     local.get $6
     local.set $11
     local.get $7
     local.set $10
     local.get $11
     i32.const 4
     i32.sub
     i32.load
     local.set $9
     local.get $10
     i32.const 4
     i32.sub
     i32.load
     local.set $8
     local.get $6
     i32.const 0
     i32.eq
     if
      local.get $5
      local.set $17
      i32.const 5
      global.set $assembly/internal/value/index/Expected.type
      call $assembly/internal/report/reportExpectedNull/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     else      
      local.get $11
      local.set $19
      local.get $9
      local.set $12
      local.get $5
      local.set $16
      i32.const 2
      global.set $assembly/internal/value/index/Expected.type
      block (result i32)
       local.get $19
       local.tee $18
       global.get $assembly/internal/value/index/Expected.reference
       local.tee $17
       i32.ne
       if
        local.get $18
        call $~lib/rt/pure/__retain
        drop
        local.get $17
        call $~lib/rt/pure/__release
       end
       local.get $18
      end
      global.set $assembly/internal/value/index/Expected.reference
      local.get $12
      global.set $assembly/internal/value/index/Expected.offset
      local.get $16
      global.set $assembly/internal/value/index/Expected.negated
      call $assembly/internal/report/reportExpectedReference/getLogStackTrace
      global.set $assembly/internal/value/index/Expected.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     if
      i32.const 5
      global.set $assembly/internal/value/index/Actual.type
      call $assembly/internal/report/reportActualNull/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     else      
      local.get $8
      local.set $14
      local.get $8
      local.set $15
      i32.const 2
      global.set $assembly/internal/value/index/Actual.type
      block (result i32)
       local.get $14
       local.tee $13
       global.get $assembly/internal/value/index/Actual.reference
       local.tee $19
       i32.ne
       if
        local.get $13
        call $~lib/rt/pure/__retain
        drop
        local.get $19
        call $~lib/rt/pure/__release
       end
       local.get $13
      end
      global.set $assembly/internal/value/index/Actual.reference
      local.get $15
      global.set $assembly/internal/value/index/Actual.offset
      call $assembly/internal/report/reportActualReference/getLogStackTrace
      global.set $assembly/internal/value/index/Actual.stack
     end
     local.get $7
     i32.const 0
     i32.eq
     local.set $14
     local.get $6
     i32.const 0
     i32.eq
     local.set $15
     local.get $14
     local.get $15
     i32.xor
     if
      local.get $5
      i32.eqz
      if
       local.get $4
       i32.const 696
       i32.const 50
       i32.const 4
       call $~lib/builtins/abort
       unreachable
      end
     else      
      local.get $8
      local.get $9
      i32.eq
      local.set $13
      local.get $13
      i32.eqz
      if
       local.get $5
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 56
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      else       
       block $~lib/memory/memory.compare|inlined.19 (result i32)
        local.get $10
        local.set $16
        local.get $11
        local.set $18
        local.get $8
        local.set $17
        block $~lib/util/memory/memcmp|inlined.19 (result i32)
         local.get $16
         local.set $20
         local.get $18
         local.set $19
         local.get $17
         local.set $12
         local.get $20
         local.get $19
         i32.eq
         if
          i32.const 0
          br $~lib/util/memory/memcmp|inlined.19
         end
         block $break|0
          loop $continue|0
           local.get $12
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
            local.get $12
            i32.const 1
            i32.sub
            local.set $12
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
         local.get $12
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
       local.set $16
       local.get $5
       local.get $16
       i32.xor
       i32.eqz
       if
        local.get $4
        i32.const 696
        i32.const 60
        i32.const 6
        call $~lib/builtins/abort
        unreachable
       end
      end
     end
     local.get $4
     call $~lib/rt/pure/__release
     local.get $6
     call $~lib/rt/pure/__release
     local.get $7
     call $~lib/rt/pure/__release
    end
    local.get $1
    call $~lib/rt/pure/__release
    local.get $3
    call $~lib/rt/pure/__release
    br $assembly/internal/test/Expectation/Expectation<~lib/arraybuffer/ArrayBuffer>#toStrictEqual|inlined.3
   end
   local.get $2
   i32.load offset=4
   local.get $1
   local.get $2
   i32.load
   local.get $3
   call $assembly/internal/comparison/referenceComparison/referenceComparison<~lib/arraybuffer/ArrayBuffer>
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toStrictEqual.spec~anonymous|0 (; 101 ;) (type $FUNCSIG$v)
  i32.const 424
  i32.const 1
  call $assembly/internal/test/Test/it
  i32.const 1344
  i32.const 3
  i32.const 1448
  call $assembly/internal/test/Test/throws
  i32.const 1592
  i32.const 4
  call $assembly/internal/test/Test/it
  i32.const 1712
  i32.const 5
  i32.const 1824
  call $assembly/internal/test/Test/throws
  i32.const 1968
  i32.const 6
  call $assembly/internal/test/Test/it
  i32.const 2400
  i32.const 7
  i32.const 2112
  call $assembly/internal/test/Test/throws
  i32.const 2544
  i32.const 8
  call $assembly/internal/test/Test/it
  i32.const 2400
  i32.const 9
  i32.const 2696
  call $assembly/internal/test/Test/throws
  i32.const 2872
  i32.const 10
  call $assembly/internal/test/Test/it
  i32.const 3016
  i32.const 11
  i32.const 568
  call $assembly/internal/test/Test/throws
  i32.const 3168
  i32.const 12
  call $assembly/internal/test/Test/it
  i32.const 3304
  i32.const 13
  i32.const 3448
  call $assembly/internal/test/Test/throws
  i32.const 3168
  i32.const 14
  call $assembly/internal/test/Test/it
  i32.const 3304
  i32.const 15
  i32.const 3608
  call $assembly/internal/test/Test/throws
  i32.const 3768
  i32.const 16
  call $assembly/internal/test/Test/it
  i32.const 3856
  i32.const 17
  i32.const 4040
  call $assembly/internal/test/Test/throws
  i32.const 4248
  i32.const 18
  call $assembly/internal/test/Test/it
  i32.const 4344
  i32.const 19
  i32.const 4528
  call $assembly/internal/test/Test/throws
 )
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#pop (; 102 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=12
  local.set $1
  local.get $1
  i32.const 1
  i32.lt_s
  if
   i32.const 4792
   i32.const 920
   i32.const 266
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
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#get:length (; 103 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $assembly/internal/test/Describe/describe (; 104 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
    i32.const 568
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
    i32.const 1016
    i32.const 1128
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
    i32.const 4736
    i32.const 1128
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
 (func $start:assembly/__tests__/toStrictEqual.spec (; 105 ;) (type $FUNCSIG$v)
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
  i32.const 20
  call $assembly/internal/test/Describe/describe
 )
 (func $assembly/index/__init (; 106 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  i32.eqz
  if
   call $start
   i32.const 1
   global.set $~lib/started
  end
 )
 (func $~lib/array/Array<~lib/string/String>#get:length (; 107 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/string/String>#__unchecked_get (; 108 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<~lib/string/String>#__get (; 109 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 808
   i32.const 920
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
   i32.const 920
   i32.const 100
   i32.const 61
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__unchecked_get
 )
 (func "$~lib/array/Array<() => void>#get:length" (; 110 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func "$~lib/array/Array<() => void>#__unchecked_get" (; 111 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $assembly/internal/test/TestGroup/TestGroup#runBeforeAll (; 112 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__unchecked_get (; 113 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__get (; 114 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 808
   i32.const 920
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
   i32.const 920
   i32.const 100
   i32.const 61
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  call $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__unchecked_get
 )
 (func $assembly/internal/test/TestGroup/TestGroup#runBeforeEach (; 115 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $~lib/array/Array<f64>#push (; 116 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
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
 (func $assembly/internal/test/TestGroup/TestGroup#runAfterEach (; 117 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/test/TestResult/TestResult#run (; 118 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
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
       local.set $4
       local.get $1
       call $~lib/rt/pure/__release
       local.get $4
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
    local.set $5
    local.get $5
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
     local.get $5
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
    local.get $5
    call $assembly/internal/test/TestGroup/TestGroup#runAfterEach
    i32.eqz
    if
     local.get $3
     i32.const 0
     i32.store8 offset=4
     block $assembly/internal/test/TestResult/TestResult#failTest|inlined.3
      local.get $3
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
     i32.const 0
     local.set $2
     local.get $5
     call $~lib/rt/pure/__release
     local.get $2
     br $assembly/internal/test/TestResult/TestResult#runInstance|inlined.1
    end
    i32.const 1
    local.set $2
    local.get $5
    call $~lib/rt/pure/__release
    local.get $2
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
  end
  local.get $0
  i32.load8_u offset=4
  if
   local.get $0
   local.set $4
   local.get $4
   i32.load offset=20
   local.get $4
   i32.load8_u offset=24
   local.get $4
   i32.load offset=36
   local.get $4
   i32.load8_u offset=40
   local.get $4
   i32.load8_u offset=41
   local.get $4
   i32.load8_u offset=43
   local.get $4
   i32.load8_u offset=44
   local.get $4
   i32.load8_u offset=42
   local.get $4
   i32.load8_u offset=45
   local.get $4
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
 (func $assembly/internal/test/TestGroup/TestGroup#runAfterAll (; 119 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
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
 (func $assembly/internal/test/TestGroup/TestGroup#run (; 120 ;) (type $FUNCSIG$vi) (param $0 i32)
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
   i32.const 4840
   i32.const 4888
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
     i32.const 4976
     i32.const 4888
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
 (func $assembly/index/__run (; 121 ;) (type $FUNCSIG$v)
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
 (func $assembly/internal/test/Collector/__set_performanceEnabled (; 122 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.performanceEnabledConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_maxSamples (; 123 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.set $assembly/internal/test/Collector/Collector.maxSamplesConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_maxTestRunTime (; 124 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.set $assembly/internal/test/Collector/Collector.maxTestRunTimeConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_roundDecimalPlaces (; 125 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.set $assembly/internal/test/Collector/Collector.roundDecimalPlacesConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordAverage (; 126 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordAverageConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordMedian (; 127 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordMedianConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordStdDev (; 128 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordStdDevConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordMax (; 129 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordMaxConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordMin (; 130 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordMinConfigurationValue
 )
 (func $assembly/internal/test/Collector/__set_recordVar (; 131 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/test/Collector/Collector.recordVarianceConfigurationValue
 )
 (func $assembly/internal/call/__call (; 132 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 133 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toStrictEqual.spec
 )
 (func "$~lib/array/Array<() => void>#__visit_impl" (; 134 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<f64>#__visit_impl (; 135 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<assembly/internal/test/TestResult/TestResult>#__visit_impl (; 137 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<~lib/string/String>#__visit_impl (; 138 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<assembly/internal/test/TestGroup/TestGroup>#__visit_impl (; 139 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/__visit_members (; 140 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block
   end
   block $switch$1$leave
    block $switch$1$default
     block $switch$1$case$14
      block $switch$1$case$13
       block $switch$1$case$12
        block $switch$1$case$11
         block $switch$1$case$10
          block $switch$1$case$9
           block $switch$1$case$8
            block $switch$1$case$7
             block $switch$1$case$4
              block $switch$1$case$2
               local.get $0
               i32.const 8
               i32.sub
               i32.load
               br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$2 $switch$1$case$2 $switch$1$case$7 $switch$1$case$8 $switch$1$case$9 $switch$1$case$10 $switch$1$case$11 $switch$1$case$12 $switch$1$case$13 $switch$1$case$14 $switch$1$case$14 $switch$1$default
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
 (func $null (; 141 ;) (type $FUNCSIG$v)
 )
)
