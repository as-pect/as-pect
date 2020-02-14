(module
 (type $none_=>_none (func))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_=>_none (func (param i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $f64_i32_i32_=>_none (func (param f64 i32 i32)))
 (type $f64_i32_i32_i32_=>_none (func (param f64 i32 i32 i32)))
 (type $i32_i32_i32_i32_=>_i32 (func (param i32 i32 i32 i32) (result i32)))
 (type $i32_f64_f64_f64_=>_i32 (func (param i32 f64 f64 f64) (result i32)))
 (import "env" "memory" (memory $0 1))
 (data (i32.const 16) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00")
 (data (i32.const 64) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00a\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00")
 (data (i32.const 128) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00p\00u\00r\00e\00.\00t\00s\00")
 (data (i32.const 176) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 224) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 288) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 336) "\n\00\00\00\01\00\00\00\01\00\00\00\n\00\00\00h\00e\00l\00l\00o\00")
 (data (i32.const 368) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 400) ",\00\00\00\01\00\00\00\01\00\00\00,\00\00\00t\00o\00I\00n\00c\00l\00u\00d\00e\00 \00v\00a\00l\00u\00e\00 \00a\00r\00r\00a\00y\00s\00")
 (data (i32.const 464) ",\00\00\00\01\00\00\00\01\00\00\00,\00\00\00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00n\00u\00m\00b\00e\00r\00s\00")
 (data (i32.const 528) ":\00\00\00\01\00\00\00\01\00\00\00:\00\00\00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \002\00")
 (data (i32.const 608) "\10\00\00\00\01\00\00\00\01\00\00\00\10\00\00\00I\00n\00c\00l\00u\00d\00e\00d\00")
 (data (i32.const 640) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00N\00o\00t\00 \00I\00n\00c\00l\00u\00d\00e\00d\00")
 (data (i32.const 688) "L\00\00\00\01\00\00\00\01\00\00\00L\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00c\00o\00m\00p\00a\00r\00i\00s\00o\00n\00/\00a\00s\00s\00e\00r\00t\00.\00t\00s\00")
 (data (i32.const 784) "T\00\00\00\01\00\00\00\01\00\00\00T\00\00\00w\00h\00e\00n\00 \00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00d\00o\00e\00s\00n\00\'\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00n\00u\00m\00b\00e\00r\00")
 (data (i32.const 896) "\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00")
 (data (i32.const 912) "B\00\00\00\01\00\00\00\01\00\00\00B\00\00\00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \004\00")
 (data (i32.const 1008) "4\00\00\00\01\00\00\00\01\00\00\004\00\00\00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00n\00u\00m\00b\00e\00r\00s\00")
 (data (i32.const 1088) "\84\00\00\00\01\00\00\00\01\00\00\00\84\00\00\00w\00h\00e\00n\00 \00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00i\00n\00c\00l\00u\00d\00e\00s\00 \00a\00 \00n\00u\00m\00b\00e\00r\00 \00b\00u\00t\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 1248) "@\00\00\00\01\00\00\00\01\00\00\00@\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00s\00e\00t\00u\00p\00/\00V\00e\00c\003\00.\00t\00s\00")
 (data (i32.const 1328) "4\00\00\00\01\00\00\00\01\00\00\004\00\00\00t\00o\00I\00n\00c\00l\00u\00d\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00a\00r\00r\00a\00y\00s\00")
 (data (i32.const 1408) "4\00\00\00\01\00\00\00\01\00\00\004\00\00\00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 1488) "X\00\00\00\01\00\00\00\01\00\00\00X\00\00\00r\00e\00f\00e\00r\00e\00n\00c\00e\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00w\00o\00")
 (data (i32.const 1600) "`\00\00\00\01\00\00\00\01\00\00\00`\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00T\00e\00s\00t\00e\00r\00 \00d\00o\00e\00s\00n\00\'\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 1712) "H\00\00\00\01\00\00\00\01\00\00\00H\00\00\00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00f\00o\00u\00r\00")
 (data (i32.const 1808) "<\00\00\00\01\00\00\00\01\00\00\00<\00\00\00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 1888) "b\00\00\00\01\00\00\00\01\00\00\00b\00\00\00r\00e\00f\00e\00r\00e\00n\00c\00e\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00f\00o\00u\00r\00")
 (data (i32.const 2016) "\90\00\00\00\01\00\00\00\01\00\00\00\90\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00T\00e\00s\00t\00e\00r\00 \00i\00n\00c\00l\00u\00d\00e\00s\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00b\00u\00t\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 2176) "B\00\00\00\01\00\00\00\01\00\00\00B\00\00\00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00p\00o\00i\00n\00t\00e\00r\00")
 (data (i32.const 2272) "f\00\00\00\01\00\00\00\01\00\00\00f\00\00\00S\00h\00o\00u\00l\00d\00 \00h\00a\00n\00d\00l\00e\00 \00t\00h\00e\00 \00n\00e\00g\00a\00t\00e\00d\00 \00i\00n\00c\00l\00u\00d\00e\00d\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00p\00o\00i\00n\00t\00e\00r\00")
 (data (i32.const 2400) ">\00\00\00\01\00\00\00\01\00\00\00>\00\00\00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00i\00t\00e\00m\00s\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00")
 (data (i32.const 2480) "N\00\00\00\01\00\00\00\01\00\00\00N\00\00\00T\00h\00e\00 \00i\00t\00e\00m\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00i\00n\00c\00l\00u\00d\00e\00d\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00.\00")
 (data (i32.const 2576) "H\00\00\00\01\00\00\00\01\00\00\00H\00\00\00w\00h\00e\00n\00 \00i\00t\00e\00m\00 \00i\00s\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00d\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00")
 (data (i32.const 2672) "V\00\00\00\01\00\00\00\01\00\00\00V\00\00\00T\00h\00e\00 \00i\00t\00e\00m\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00b\00e\00 \00i\00n\00c\00l\00u\00d\00e\00d\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00.\00")
 (data (i32.const 2784) "b\00\00\00\01\00\00\00\01\00\00\00b\00\00\00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00n\00 \00i\00t\00e\00m\00 \00t\00h\00a\00t\00 \00i\00s\00 \00n\00o\00t\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00")
 (data (i32.const 2912) "\10\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93\00\00\00\02\00\00\00\93\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\94\04\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\94 \00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93\00\00\00\02\00\00\00")
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "rtrace" "onalloc" (func $~lib/rt/rtrace/onalloc (param i32)))
 (import "rtrace" "onincrement" (func $~lib/rt/rtrace/onincrement (param i32)))
 (import "rtrace" "onrealloc" (func $~lib/rt/rtrace/onrealloc (param i32 i32)))
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
 (import "__aspect" "reportActualFunction" (func $assembly/internal/report/Actual/reportActualFunction (param i32 i32)))
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
 (import "__aspect" "reportExpectedFunction" (func $assembly/internal/report/Expected/reportExpectedFunction (param i32 i32 i32)))
 (import "rtrace" "ondecrement" (func $~lib/rt/rtrace/ondecrement (param i32)))
 (table $0 23 funcref)
 (elem (i32.const 1) $start:assembly/__tests__/setup/Event~anonymous|0 $start:assembly/__tests__/setup/Event~anonymous|1 $start:assembly/__tests__/toInclude.spec~anonymous|0 $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|0 $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/toInclude.spec~anonymous|1 $start:assembly/internal/noOp~anonymous|0 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|1 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|2 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|3 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|4 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|5 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|6 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|7 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|8 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|9 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|10 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|11 $start:assembly/__tests__/toInclude.spec~anonymous|2)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $~lib/gc/gc.auto (mut i32) (i32.const 1))
 (global $assembly/__tests__/setup/Event/listener i32 (i32.const 1))
 (global $assembly/__tests__/setup/Event/anotherListener i32 (i32.const 2))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/eventDispatcher (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/newListener i32 (i32.const 3))
 (global $assembly/__tests__/toInclude.spec/numberTester (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.type (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.signed (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.float (mut f64) (f64.const 0))
 (global $assembly/internal/report/Actual/Actual.integer (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.reference (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.offset (mut i32) (i32.const 0))
 (global $assembly/internal/report/Actual/Actual.stackTrace (mut i32) (i32.const -1))
 (global $assembly/internal/report/Actual/Actual.isManaged (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.ready (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.type (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.signed (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.float (mut f64) (f64.const 0))
 (global $assembly/internal/report/Expected/Expected.integer (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.reference (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.offset (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.negated (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.stackTrace (mut i32) (i32.const 0))
 (global $assembly/internal/report/Expected/Expected.isManaged (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 9))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/referenceTester (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/one (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/two (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/three (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/referenceSet (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/four (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $assembly/internal/log/ignoreLogs (mut i32) (i32.const 0))
 (global $assembly/internal/Reflect/Reflect.FAILED_MATCH i32 (i32.const 0))
 (global $assembly/internal/Reflect/Reflect.SUCCESSFUL_MATCH i32 (i32.const 1))
 (global $assembly/internal/Reflect/Reflect.DEFER_MATCH i32 (i32.const 2))
 (global $assembly/internal/RTrace/RTrace.enabled (mut i32) (i32.const 1))
 (global $~started (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 2912))
 (global $~lib/heap/__heap_base i32 (i32.const 3044))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (export "_start" (func $~start))
 (export "memory" (memory $0))
 (export "table" (table $0))
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
 (func $~lib/rt/tlsf/removeBlock (; 34 ;) (param $0 i32) (param $1 i32)
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
   i32.const 32
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
   i32.const 32
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
   i32.const 32
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
 (func $~lib/rt/tlsf/insertBlock (; 35 ;) (param $0 i32) (param $1 i32)
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
   i32.const 32
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
   i32.const 32
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
    i32.const 32
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
   i32.const 32
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
   i32.const 32
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
   i32.const 32
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
 (func $~lib/rt/tlsf/addMemory (; 36 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
   i32.const 32
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
    i32.const 32
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
    i32.const 32
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
 (func $~lib/rt/tlsf/maybeInitialize (; 37 ;) (result i32)
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
  global.get $~lib/rt/tlsf/ROOT
  local.set $0
  local.get $0
  i32.eqz
  if
   global.get $~lib/heap/__heap_base
   i32.const 15
   i32.add
   i32.const -16
   i32.and
   local.set $1
   memory.size
   local.set $2
   local.get $1
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
   local.set $3
   local.get $3
   local.get $2
   i32.gt_s
   if (result i32)
    local.get $3
    local.get $2
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
   local.get $1
   local.set $0
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   local.set $5
   i32.const 0
   local.set $4
   local.get $5
   local.get $4
   i32.store offset=1568
   i32.const 0
   local.set $5
   loop $for-loop|0
    local.get $5
    i32.const 23
    i32.lt_u
    local.set $4
    local.get $4
    if
     local.get $0
     local.set $8
     local.get $5
     local.set $7
     i32.const 0
     local.set $6
     local.get $8
     local.get $7
     i32.const 2
     i32.shl
     i32.add
     local.get $6
     i32.store offset=4
     i32.const 0
     local.set $8
     loop $for-loop|1
      local.get $8
      i32.const 16
      i32.lt_u
      local.set $7
      local.get $7
      if
       local.get $0
       local.set $11
       local.get $5
       local.set $10
       local.get $8
       local.set $9
       i32.const 0
       local.set $6
       local.get $11
       local.get $10
       i32.const 4
       i32.shl
       local.get $9
       i32.add
       i32.const 2
       i32.shl
       i32.add
       local.get $6
       i32.store offset=96
       local.get $8
       i32.const 1
       i32.add
       local.set $8
       br $for-loop|1
      end
     end
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|0
    end
   end
   local.get $0
   local.get $1
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
   local.get $0
   global.set $~lib/rt/tlsf/ROOT
  end
  local.get $0
 )
 (func $~lib/rt/tlsf/prepareSize (; 38 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741808
  i32.ge_u
  if
   i32.const 80
   i32.const 32
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
 (func $~lib/rt/tlsf/searchBlock (; 39 ;) (param $0 i32) (param $1 i32) (result i32)
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
   i32.const 32
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
     i32.const 32
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
 (func $~lib/rt/tlsf/growMemory (; 40 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/prepareBlock (; 41 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
   i32.const 32
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
 (func $~lib/rt/tlsf/allocateBlock (; 42 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/rt/tlsf/collectLock
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 490
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/rt/tlsf/prepareSize
  local.set $3
  local.get $0
  local.get $3
  call $~lib/rt/tlsf/searchBlock
  local.set $4
  local.get $4
  i32.eqz
  if
   global.get $~lib/gc/gc.auto
   if
    i32.const 1
    global.set $~lib/rt/tlsf/collectLock
    call $~lib/rt/pure/__collect
    i32.const 0
    global.set $~lib/rt/tlsf/collectLock
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/searchBlock
    local.set $4
    local.get $4
    i32.eqz
    if
     local.get $0
     local.get $3
     call $~lib/rt/tlsf/growMemory
     local.get $0
     local.get $3
     call $~lib/rt/tlsf/searchBlock
     local.set $4
     local.get $4
     i32.eqz
     if
      i32.const 0
      i32.const 32
      i32.const 502
      i32.const 19
      call $~lib/builtins/abort
      unreachable
     end
    end
   else
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/growMemory
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/searchBlock
    local.set $4
    local.get $4
    i32.eqz
    if
     i32.const 0
     i32.const 32
     i32.const 507
     i32.const 17
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  local.get $4
  i32.load
  i32.const -4
  i32.and
  local.get $3
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 510
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 0
  i32.store offset=4
  local.get $4
  local.get $2
  i32.store offset=8
  local.get $4
  local.get $1
  i32.store offset=12
  local.get $0
  local.get $4
  call $~lib/rt/tlsf/removeBlock
  local.get $0
  local.get $4
  local.get $3
  call $~lib/rt/tlsf/prepareBlock
  local.get $4
  call $~lib/rt/rtrace/onalloc
  local.get $4
 )
 (func $~lib/rt/tlsf/__alloc (; 43 ;) (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/allocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/rt/pure/increment (; 44 ;) (param $0 i32)
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
   i32.const 144
   i32.const 109
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
   i32.const 144
   i32.const 112
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/rt/pure/__retain (; 45 ;) (param $0 i32) (result i32)
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
 (func $~lib/rt/pure/__release (; 46 ;) (param $0 i32)
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
 (func $start:assembly/__tests__/setup/Event~anonymous|0 (; 47 ;) (param $0 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/setup/Event~anonymous|1 (; 48 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 0
  local.set $1
  local.get $1
  local.get $1
  i32.add
  drop
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/memory/memory.fill (; 49 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
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
   loop $while-continue|0
    local.get $3
    i32.const 32
    i32.ge_u
    local.set $9
    local.get $9
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
     br $while-continue|0
    end
   end
  end
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 50 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 1073741808
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 192
   i32.const 240
   i32.const 23
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
  local.tee $6
  i32.ne
  if
   local.get $5
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $6
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
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#constructor" (; 51 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 16
   i32.const 5
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  local.get $1
  i32.store offset=12
  local.get $0
 )
 (func $assembly/__tests__/setup/Event/EventDispatcher#constructor (; 52 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 4
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 0
  call "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#constructor"
  i32.store
  local.get $0
 )
 (func $~lib/rt/tlsf/checkUsedBlock (; 53 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 16
  i32.sub
  local.set $1
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
  if (result i32)
   local.get $1
   i32.load
   i32.const 1
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $1
   i32.load offset=4
   i32.const -268435456
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 570
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
 )
 (func $~lib/util/memory/memcpy (; 54 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  loop $while-continue|0
   local.get $2
   if (result i32)
    local.get $1
    i32.const 3
    i32.and
   else
    i32.const 0
   end
   local.set $5
   local.get $5
   if
    local.get $0
    local.tee $6
    i32.const 1
    i32.add
    local.set $0
    local.get $6
    local.get $1
    local.tee $6
    i32.const 1
    i32.add
    local.set $1
    local.get $6
    i32.load8_u
    i32.store8
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    br $while-continue|0
   end
  end
  local.get $0
  i32.const 3
  i32.and
  i32.const 0
  i32.eq
  if
   loop $while-continue|1
    local.get $2
    i32.const 16
    i32.ge_u
    local.set $5
    local.get $5
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
     br $while-continue|1
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
      loop $while-continue|3
       local.get $2
       i32.const 17
       i32.ge_u
       local.set $5
       local.get $5
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
        br $while-continue|3
       end
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
     loop $while-continue|4
      local.get $2
      i32.const 18
      i32.ge_u
      local.set $5
      local.get $5
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
       br $while-continue|4
      end
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
    loop $while-continue|5
     local.get $2
     i32.const 19
     i32.ge_u
     local.set $5
     local.get $5
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
      br $while-continue|5
     end
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
 (func $~lib/memory/memory.copy (; 55 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
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
     loop $while-continue|0
      local.get $5
      i32.const 7
      i32.and
      local.set $6
      local.get $6
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
       local.get $5
       local.tee $7
       i32.const 1
       i32.add
       local.set $5
       local.get $7
       local.get $4
       local.tee $7
       i32.const 1
       i32.add
       local.set $4
       local.get $7
       i32.load8_u
       i32.store8
       br $while-continue|0
      end
     end
     loop $while-continue|1
      local.get $3
      i32.const 8
      i32.ge_u
      local.set $6
      local.get $6
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
       br $while-continue|1
      end
     end
    end
    loop $while-continue|2
     local.get $3
     local.set $6
     local.get $6
     if
      local.get $5
      local.tee $7
      i32.const 1
      i32.add
      local.set $5
      local.get $7
      local.get $4
      local.tee $7
      i32.const 1
      i32.add
      local.set $4
      local.get $7
      i32.load8_u
      i32.store8
      local.get $3
      i32.const 1
      i32.sub
      local.set $3
      br $while-continue|2
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
     loop $while-continue|3
      local.get $5
      local.get $3
      i32.add
      i32.const 7
      i32.and
      local.set $6
      local.get $6
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
       br $while-continue|3
      end
     end
     loop $while-continue|4
      local.get $3
      i32.const 8
      i32.ge_u
      local.set $6
      local.get $6
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
       br $while-continue|4
      end
     end
    end
    loop $while-continue|5
     local.get $3
     local.set $6
     local.get $6
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
      br $while-continue|5
     end
    end
   end
  end
 )
 (func $~lib/rt/tlsf/freeBlock (; 56 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $1
  i32.load
  local.set $2
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
 (func $~lib/rt/tlsf/reallocateBlock (; 57 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
  local.get $1
  i32.load offset=8
  call $~lib/rt/tlsf/allocateBlock
  local.set $8
  local.get $8
  local.get $1
  i32.load offset=4
  i32.store offset=4
  local.get $8
  i32.const 16
  i32.add
  local.get $1
  i32.const 16
  i32.add
  local.get $2
  call $~lib/memory/memory.copy
  local.get $1
  global.get $~lib/heap/__heap_base
  i32.ge_u
  if
   local.get $1
   local.get $8
   call $~lib/rt/rtrace/onrealloc
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/freeBlock
  end
  local.get $8
 )
 (func $~lib/rt/tlsf/__realloc (; 58 ;) (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  call $~lib/rt/tlsf/checkUsedBlock
  local.get $1
  call $~lib/rt/tlsf/reallocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/array/ensureSize (; 59 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
    i32.const 192
    i32.const 304
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
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#push" (; 60 ;) (param $0 i32) (param $1 i32) (result i32)
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
  i32.const 2
  call $~lib/array/ensureSize
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store
  local.get $0
  local.get $3
  i32.store offset=12
  local.get $3
 )
 (func $assembly/__tests__/setup/Event/initializeDispatcher (; 61 ;) (result i32)
  (local $0 i32)
  i32.const 0
  call $assembly/__tests__/setup/Event/EventDispatcher#constructor
  local.set $0
  local.get $0
  i32.load
  global.get $assembly/__tests__/setup/Event/listener
  call "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#push"
  drop
  local.get $0
  i32.load
  global.get $assembly/__tests__/setup/Event/anotherListener
  call "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#push"
  drop
  local.get $0
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|0 (; 62 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 352
  local.set $1
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/rt/__allocArray (; 63 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 64 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
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
  local.tee $2
  local.get $1
  local.tee $3
  local.get $2
  i32.load offset=4
  local.tee $4
  i32.ne
  if
   local.get $3
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $3
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/array/Array<i32>> (; 65 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $assembly/internal/report/Actual/Actual.report<~lib/array/Array<i32>> (; 66 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Actual/Actual.isManaged
  if
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
  end
  local.get $1
  global.set $assembly/internal/report/Actual/Actual.reference
  i32.const 1
  global.set $assembly/internal/report/Actual/Actual.isManaged
  i32.const 6
  global.set $assembly/internal/report/Actual/Actual.type
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Expected/Expected.report<~lib/string/String> (; 67 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
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
  local.set $2
  local.get $2
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Expected/Expected.isManaged
  if
   global.get $assembly/internal/report/Expected/Expected.reference
   call $~lib/rt/pure/__release
  end
  local.get $2
  global.set $assembly/internal/report/Expected/Expected.reference
  i32.const 1
  global.set $assembly/internal/report/Expected/Expected.isManaged
  i32.const 5
  global.set $assembly/internal/report/Expected/Expected.type
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<i32>#get:length (; 68 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $~lib/array/Array<i32>#__unchecked_get (; 69 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $assembly/internal/report/Actual/Actual.report<~lib/string/String> (; 70 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Actual/Actual.isManaged
  if
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
  end
  local.get $1
  global.set $assembly/internal/report/Actual/Actual.reference
  i32.const 1
  global.set $assembly/internal/report/Actual/Actual.isManaged
  i32.const 5
  global.set $assembly/internal/report/Actual/Actual.type
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/comparison/assert/assert (; 71 ;) (param $0 i32) (param $1 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.eqz
  if
   local.get $1
   call $~lib/rt/pure/__release
   local.get $1
   i32.const 704
   i32.const 9
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/array/Array<i32>,i32> (; 72 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  local.get $0
  call $assembly/internal/report/Actual/Actual.report<~lib/array/Array<i32>>
  i32.const 624
  local.get $2
  call $assembly/internal/report/Expected/Expected.report<~lib/string/String>
  i32.const 0
  local.set $4
  local.get $0
  call $~lib/array/Array<i32>#get:length
  local.set $5
  i32.const 0
  local.set $6
  block $for-break0
   loop $for-loop|0
    local.get $6
    local.get $5
    i32.lt_s
    local.set $7
    local.get $7
    if
     local.get $0
     local.get $6
     call $~lib/array/Array<i32>#__unchecked_get
     local.get $1
     i32.eq
     if
      i32.const 1
      local.set $4
      br $for-break0
     end
     local.get $6
     i32.const 1
     i32.add
     local.set $6
     br $for-loop|0
    end
   end
  end
  local.get $4
  if (result i32)
   i32.const 624
   call $~lib/rt/pure/__retain
   local.tee $5
  else
   i32.const 656
   call $~lib/rt/pure/__retain
   local.tee $6
  end
  call $assembly/internal/report/Actual/Actual.report<~lib/string/String>
  local.get $2
  local.get $4
  i32.xor
  local.get $3
  call $assembly/internal/comparison/assert/assert
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/report/Actual/Actual.clear (; 73 ;)
  i32.const 0
  global.set $assembly/internal/report/Actual/Actual.type
  global.get $assembly/internal/report/Actual/Actual.reference
  i32.const 0
  i32.gt_u
  if
   global.get $assembly/internal/report/Actual/Actual.isManaged
   if
    global.get $assembly/internal/report/Actual/Actual.reference
    call $~lib/rt/pure/__release
   end
   i32.const 0
   global.set $assembly/internal/report/Actual/Actual.reference
   i32.const 0
   global.set $assembly/internal/report/Actual/Actual.isManaged
  end
  i32.const -1
  global.set $assembly/internal/report/Actual/Actual.stackTrace
 )
 (func $assembly/internal/report/Expected/Expected.clear (; 74 ;)
  i32.const 0
  global.set $assembly/internal/report/Expected/Expected.type
  global.get $assembly/internal/report/Expected/Expected.reference
  i32.const 0
  i32.ne
  if
   global.get $assembly/internal/report/Expected/Expected.isManaged
   if
    global.get $assembly/internal/report/Expected/Expected.reference
    call $~lib/rt/pure/__release
   end
   i32.const 0
   global.set $assembly/internal/report/Expected/Expected.reference
   i32.const 0
   global.set $assembly/internal/report/Expected/Expected.isManaged
  end
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32> (; 75 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  local.get $0
  i32.load
  local.get $2
  call $assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/array/Array<i32>,i32>
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|0 (; 76 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/numberTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  i32.const 2
  i32.const 544
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/it (; 77 ;) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|1 (; 78 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/numberTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  i32.const 4
  i32.const 912
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/throws (; 79 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 80 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|2 (; 81 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/numberTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.tee $1
  i32.const 4
  i32.const 928
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|3 (; 82 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/numberTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.tee $1
  i32.const 2
  i32.const 912
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1 (; 83 ;)
  i32.const 480
  i32.const 4
  call $assembly/internal/Test/it
  i32.const 800
  i32.const 5
  i32.const 928
  call $assembly/internal/Test/throws
  i32.const 1024
  i32.const 6
  call $assembly/internal/Test/it
  i32.const 1104
  i32.const 7
  i32.const 912
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 84 ;)
  nop
 )
 (func $~setArgumentsLength (; 85 ;) (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $assembly/internal/Describe/describe (; 86 ;) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~argumentsLength
  local.get $1
  call_indirect (type $none_=>_none)
  call $assembly/internal/Describe/reportEndDescribe
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 87 ;) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  local.get $1
  i32.store offset=12
  local.get $0
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 88 ;) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
   i32.const 9
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
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#push (; 89 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
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
  local.get $1
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  local.get $3
  i32.store offset=12
  local.get $3
  local.set $4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 90 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.const 1073741808
  i32.gt_u
  if
   i32.const 192
   i32.const 240
   i32.const 54
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
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#clear (; 91 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.tee $1
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $2
  local.get $1
  i32.load
  call $~lib/rt/pure/__release
  local.get $2
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  local.tee $1
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $2
  local.get $1
  i32.load offset=8
  call $~lib/rt/pure/__release
  local.get $2
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 92 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
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
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#clear
  local.get $0
 )
 (func $~lib/util/hash/hash32 (; 93 ;) (param $0 i32) (result i32)
  (local $1 i32)
  i32.const -2128831035
  local.set $1
  local.get $1
  local.get $0
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 16
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 24
  i32.shr_u
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#__equals (; 94 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $1
  local.get $0
  i32.eq
  if
   i32.const 1
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $1
  i32.const 0
  i32.eq
  local.get $0
  i32.const 0
  i32.eq
  i32.xor
  if
   i32.const 0
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $0
  f64.load
  local.get $1
  local.tee $2
  if (result i32)
   local.get $2
  else
   i32.const 0
   i32.const 1264
   i32.const 54
   i32.const 21
   call $~lib/builtins/abort
   unreachable
  end
  f64.load
  f64.eq
  if (result i32)
   local.get $0
   f64.load offset=8
   local.get $1
   local.tee $2
   if (result i32)
    local.get $2
   else
    i32.const 0
    i32.const 1264
    i32.const 55
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   f64.load offset=8
   f64.eq
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   f64.load offset=16
   local.get $1
   local.tee $2
   if (result i32)
    local.get $2
   else
    i32.const 0
    i32.const 1264
    i32.const 56
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
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
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#find (; 95 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  loop $while-continue|0
   local.get $3
   local.set $4
   local.get $4
   if
    local.get $3
    i32.load offset=4
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $3
     i32.load
     local.get $1
     call $assembly/__tests__/setup/Vec3/Vec3#__equals
    else
     i32.const 0
    end
    if
     local.get $3
     local.set $5
     local.get $1
     call $~lib/rt/pure/__release
     local.get $5
     return
    end
    local.get $3
    i32.load offset=4
    i32.const 1
    i32.const -1
    i32.xor
    i32.and
    local.set $3
    br $while-continue|0
   end
  end
  i32.const 0
  local.set $4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
 )
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#rehash (; 96 ;) (param $0 i32) (param $1 i32)
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
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  i32.const 8
  i32.mul
  i32.const 3
  i32.div_s
  local.set $4
  i32.const 0
  local.get $4
  i32.const 8
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  i32.const 8
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  loop $while-continue|0
   local.get $6
   local.get $7
   i32.ne
   local.set $9
   local.get $9
   if
    local.get $6
    local.set $10
    local.get $10
    i32.load offset=4
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $8
     local.set $11
     local.get $11
     local.get $10
     i32.load
     i32.store
     block $~lib/util/hash/HASH<assembly/__tests__/setup/Vec3/Vec3>|inlined.1 (result i32)
      local.get $10
      i32.load
      call $~lib/rt/pure/__retain
      local.set $12
      local.get $12
      call $~lib/util/hash/hash32
      local.set $13
      local.get $12
      call $~lib/rt/pure/__release
      local.get $13
      br $~lib/util/hash/HASH<assembly/__tests__/setup/Vec3/Vec3>|inlined.1
     end
     local.get $1
     i32.and
     local.set $12
     local.get $3
     local.get $12
     i32.const 4
     i32.mul
     i32.add
     local.set $13
     local.get $11
     local.get $13
     i32.load
     i32.store offset=4
     local.get $13
     local.get $8
     i32.store
     local.get $8
     i32.const 8
     i32.add
     local.set $8
    end
    local.get $6
    i32.const 8
    i32.add
    local.set $6
    br $while-continue|0
   end
  end
  local.get $0
  local.tee $9
  local.get $3
  local.tee $11
  local.get $9
  i32.load
  local.tee $13
  i32.ne
  if
   local.get $11
   call $~lib/rt/pure/__retain
   local.set $11
   local.get $13
   call $~lib/rt/pure/__release
  end
  local.get $11
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.tee $9
  local.get $5
  local.tee $12
  local.get $9
  i32.load offset=8
  local.tee $11
  i32.ne
  if
   local.get $12
   call $~lib/rt/pure/__retain
   local.set $12
   local.get $11
   call $~lib/rt/pure/__release
  end
  local.get $12
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
  local.get $3
  call $~lib/rt/pure/__release
  local.get $5
  call $~lib/rt/pure/__release
 )
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#add (; 97 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  block $~lib/util/hash/HASH<assembly/__tests__/setup/Vec3/Vec3>|inlined.0 (result i32)
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   local.set $3
   local.get $2
   call $~lib/rt/pure/__release
   local.get $3
   br $~lib/util/hash/HASH<assembly/__tests__/setup/Vec3/Vec3>|inlined.0
  end
  local.set $4
  local.get $0
  local.get $1
  local.get $4
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#find
  local.set $5
  local.get $5
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#rehash
   end
   local.get $0
   i32.load offset=8
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $2
   i32.const 8
   i32.mul
   i32.add
   local.set $5
   local.get $5
   local.get $1
   call $~lib/rt/pure/__retain
   i32.store
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $4
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $2
   local.get $5
   local.get $2
   i32.load
   i32.store offset=4
   local.get $2
   local.get $5
   i32.store
  end
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#constructor (; 98 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
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
  local.tee $4
  i32.ne
  if
   local.get $3
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $3
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>> (; 99 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $assembly/internal/report/Actual/Actual.report<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>> (; 100 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Actual/Actual.isManaged
  if
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
  end
  local.get $1
  global.set $assembly/internal/report/Actual/Actual.reference
  i32.const 1
  global.set $assembly/internal/report/Actual/Actual.isManaged
  i32.const 6
  global.set $assembly/internal/report/Actual/Actual.type
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#get:length (; 101 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_get (; 102 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>,assembly/__tests__/setup/Vec3/Vec3> (; 103 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  local.get $0
  call $assembly/internal/report/Actual/Actual.report<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  i32.const 624
  local.get $2
  call $assembly/internal/report/Expected/Expected.report<~lib/string/String>
  i32.const 0
  local.set $4
  local.get $0
  call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#get:length
  local.set $5
  i32.const 0
  local.set $6
  block $for-break0
   loop $for-loop|0
    local.get $6
    local.get $5
    i32.lt_s
    local.set $7
    local.get $7
    if
     local.get $0
     local.get $6
     call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_get
     local.tee $8
     local.get $1
     i32.eq
     if
      i32.const 1
      local.set $4
      local.get $8
      call $~lib/rt/pure/__release
      br $for-break0
     end
     local.get $8
     call $~lib/rt/pure/__release
     local.get $6
     i32.const 1
     i32.add
     local.set $6
     br $for-loop|0
    end
   end
  end
  local.get $4
  if (result i32)
   i32.const 624
   call $~lib/rt/pure/__retain
   local.tee $5
  else
   i32.const 656
   call $~lib/rt/pure/__retain
   local.tee $6
  end
  call $assembly/internal/report/Actual/Actual.report<~lib/string/String>
  local.get $2
  local.get $4
  i32.xor
  local.get $3
  call $assembly/internal/comparison/assert/assert
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3> (; 104 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  local.get $0
  i32.load
  local.get $2
  call $assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>,assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|0 (; 105 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  global.get $assembly/__tests__/toInclude.spec/two
  i32.const 1504
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|1 (; 106 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  global.get $assembly/__tests__/toInclude.spec/four
  i32.const 912
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#get:not (; 107 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|2 (; 108 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#get:not
  local.tee $1
  global.get $assembly/__tests__/toInclude.spec/four
  i32.const 1904
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|3 (; 109 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#get:not
  local.tee $1
  global.get $assembly/__tests__/toInclude.spec/two
  i32.const 912
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#constructor" (; 110 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
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
  local.tee $2
  local.get $1
  local.tee $3
  local.get $2
  i32.load offset=4
  local.tee $4
  i32.ne
  if
   local.get $3
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $3
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>" (; 111 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 0
  local.get $0
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#constructor"
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func "$assembly/internal/report/Actual/Actual.report<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>" (; 112 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Actual/Actual.isManaged
  if
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
  end
  local.get $1
  global.set $assembly/internal/report/Actual/Actual.reference
  i32.const 1
  global.set $assembly/internal/report/Actual/Actual.isManaged
  i32.const 6
  global.set $assembly/internal/report/Actual/Actual.type
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#get:length" (; 113 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#__unchecked_get" (; 114 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func "$assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>,(event: assembly/__tests__/setup/Event/Event) => void>" (; 115 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  local.get $0
  call "$assembly/internal/report/Actual/Actual.report<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  i32.const 624
  local.get $2
  call $assembly/internal/report/Expected/Expected.report<~lib/string/String>
  i32.const 0
  local.set $4
  local.get $0
  call "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#get:length"
  local.set $5
  i32.const 0
  local.set $6
  block $for-break0
   loop $for-loop|0
    local.get $6
    local.get $5
    i32.lt_s
    local.set $7
    local.get $7
    if
     local.get $0
     local.get $6
     call "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#__unchecked_get"
     local.get $1
     i32.eq
     if
      i32.const 1
      local.set $4
      br $for-break0
     end
     local.get $6
     i32.const 1
     i32.add
     local.set $6
     br $for-loop|0
    end
   end
  end
  local.get $4
  if (result i32)
   i32.const 624
   call $~lib/rt/pure/__retain
   local.tee $5
  else
   i32.const 656
   call $~lib/rt/pure/__retain
   local.tee $6
  end
  call $assembly/internal/report/Actual/Actual.report<~lib/string/String>
  local.get $2
  local.get $4
  i32.xor
  local.get $3
  call $assembly/internal/comparison/assert/assert
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>" (; 116 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  local.get $0
  i32.load
  local.get $2
  call "$assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>,(event: assembly/__tests__/setup/Event/Event) => void>"
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|4 (; 117 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.load
  call "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  local.tee $0
  global.get $assembly/__tests__/setup/Event/listener
  i32.const 912
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>"
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#get:not" (; 118 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|5 (; 119 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.load
  call "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  local.tee $0
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#get:not"
  local.tee $1
  global.get $assembly/__tests__/toInclude.spec/newListener
  i32.const 912
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>"
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|6 (; 120 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.load
  call "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  local.tee $0
  global.get $assembly/__tests__/toInclude.spec/newListener
  i32.const 912
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>"
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|7 (; 121 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.load
  call "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  local.tee $0
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#get:not"
  local.tee $1
  global.get $assembly/__tests__/setup/Event/listener
  i32.const 912
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>"
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#constructor (; 122 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
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
  local.tee $4
  i32.ne
  if
   local.get $3
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $3
  i32.store offset=4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>> (; 123 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $assembly/internal/report/Actual/Actual.report<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>> (; 124 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  call $assembly/internal/report/Actual/getStackTrace
  global.set $assembly/internal/report/Actual/Actual.stackTrace
  local.get $0
  local.set $1
  local.get $1
  call $~lib/rt/pure/__retain
  drop
  global.get $assembly/internal/report/Actual/Actual.isManaged
  if
   global.get $assembly/internal/report/Actual/Actual.reference
   call $~lib/rt/pure/__release
  end
  local.get $1
  global.set $assembly/internal/report/Actual/Actual.reference
  i32.const 1
  global.set $assembly/internal/report/Actual/Actual.isManaged
  i32.const 4
  global.set $assembly/internal/report/Actual/Actual.type
  i32.const 24
  global.set $assembly/internal/report/Actual/Actual.offset
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#has (; 125 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<assembly/__tests__/setup/Vec3/Vec3>|inlined.2 (result i32)
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   local.set $3
   local.get $2
   call $~lib/rt/pure/__release
   local.get $3
   br $~lib/util/hash/HASH<assembly/__tests__/setup/Vec3/Vec3>|inlined.2
  end
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#find
  i32.const 0
  i32.ne
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>,assembly/__tests__/setup/Vec3/Vec3> (; 126 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  local.get $0
  call $assembly/internal/report/Actual/Actual.report<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>
  i32.const 624
  local.get $2
  call $assembly/internal/report/Expected/Expected.report<~lib/string/String>
  i32.const 0
  local.set $4
  local.get $0
  local.get $1
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#has
  local.set $4
  local.get $4
  if (result i32)
   i32.const 624
   call $~lib/rt/pure/__retain
   local.tee $5
  else
   i32.const 656
   call $~lib/rt/pure/__retain
   local.tee $6
  end
  call $assembly/internal/report/Actual/Actual.report<~lib/string/String>
  local.get $2
  local.get $4
  i32.xor
  local.get $3
  call $assembly/internal/comparison/assert/assert
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3> (; 127 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  local.get $0
  i32.load
  local.get $2
  call $assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>,assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/report/Actual/Actual.clear
  call $assembly/internal/report/Expected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|8 (; 128 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceSet
  call $assembly/internal/Expectation/expect<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  global.get $assembly/__tests__/toInclude.spec/one
  i32.const 2496
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|9 (; 129 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceSet
  call $assembly/internal/Expectation/expect<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  i32.const 0
  f64.const 10
  f64.const 11
  f64.const 12
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  local.tee $1
  i32.const 912
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#get:not (; 130 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|10 (; 131 ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceSet
  call $assembly/internal/Expectation/expect<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#get:not
  local.tee $1
  i32.const 0
  f64.const 10
  f64.const 11
  f64.const 12
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  local.tee $2
  i32.const 2688
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/test (; 132 ;) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|11 (; 133 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceSet
  call $assembly/internal/Expectation/expect<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#get:not
  local.tee $1
  global.get $assembly/__tests__/toInclude.spec/one
  i32.const 912
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2 (; 134 ;)
  i32.const 1424
  i32.const 10
  call $assembly/internal/Test/it
  i32.const 1616
  i32.const 11
  i32.const 1728
  call $assembly/internal/Test/throws
  i32.const 1824
  i32.const 12
  call $assembly/internal/Test/it
  i32.const 2032
  i32.const 13
  i32.const 912
  call $assembly/internal/Test/throws
  i32.const 2192
  i32.const 14
  call $assembly/internal/Test/it
  i32.const 2288
  i32.const 15
  call $assembly/internal/Test/it
  i32.const 2192
  i32.const 16
  i32.const 912
  call $assembly/internal/Test/throws
  i32.const 2192
  i32.const 17
  i32.const 912
  call $assembly/internal/Test/throws
  i32.const 2416
  i32.const 18
  call $assembly/internal/Test/it
  i32.const 2592
  i32.const 19
  i32.const 2688
  call $assembly/internal/Test/throws
  i32.const 2800
  i32.const 20
  call $assembly/internal/Test/test
  i32.const 2592
  i32.const 21
  i32.const 2496
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/__tests__/toInclude.spec (; 135 ;)
  (local $0 i32)
  (local $1 i32)
  call $assembly/__tests__/setup/Event/initializeDispatcher
  global.set $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.const 3
  i32.const 2
  i32.const 6
  i32.const 384
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  global.set $assembly/__tests__/toInclude.spec/numberTester
  i32.const 416
  i32.const 8
  call $assembly/internal/Describe/describe
  i32.const 0
  i32.const 0
  call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#constructor
  global.set $assembly/__tests__/toInclude.spec/referenceTester
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toInclude.spec/one
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toInclude.spec/two
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toInclude.spec/three
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  global.get $assembly/__tests__/toInclude.spec/one
  call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#push
  drop
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  global.get $assembly/__tests__/toInclude.spec/two
  call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#push
  drop
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  global.get $assembly/__tests__/toInclude.spec/three
  call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#push
  drop
  i32.const 0
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#constructor
  global.set $assembly/__tests__/toInclude.spec/referenceSet
  global.get $assembly/__tests__/toInclude.spec/referenceSet
  global.get $assembly/__tests__/toInclude.spec/one
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#add
  call $~lib/rt/pure/__release
  global.get $assembly/__tests__/toInclude.spec/referenceSet
  global.get $assembly/__tests__/toInclude.spec/two
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#add
  call $~lib/rt/pure/__release
  global.get $assembly/__tests__/toInclude.spec/referenceSet
  global.get $assembly/__tests__/toInclude.spec/three
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#add
  call $~lib/rt/pure/__release
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toInclude.spec/four
  i32.const 1344
  i32.const 22
  call $assembly/internal/Describe/describe
 )
 (func $assembly/index/__ready (; 136 ;)
  i32.const 1
  global.set $assembly/internal/report/Expected/Expected.ready
 )
 (func $assembly/internal/call/__call (; 137 ;) (param $0 i32)
  i32.const 0
  global.set $~argumentsLength
  local.get $0
  call_indirect (type $none_=>_none)
 )
 (func $assembly/internal/report/Actual/__sendActual (; 138 ;)
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
             local.get $0
             i32.const 12
             i32.eq
             br_if $case9|0
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
   global.get $assembly/internal/report/Actual/Actual.integer
   global.get $assembly/internal/report/Actual/Actual.stackTrace
   call $assembly/internal/report/Actual/reportActualFunction
   br $break|0
  end
 )
 (func $assembly/internal/report/Expected/__sendExpected (; 139 ;)
  (local $0 i32)
  block $break|0
   block $case11|0
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
               local.get $0
               i32.const 12
               i32.eq
               br_if $case11|0
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
   global.get $assembly/internal/report/Expected/Expected.reference
   global.get $assembly/internal/report/Expected/Expected.negated
   global.get $assembly/internal/report/Expected/Expected.stackTrace
   call $assembly/internal/report/Expected/reportExpectedFunction
  end
 )
 (func $assembly/internal/log/__ignoreLogs (; 140 ;) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/log/ignoreLogs
 )
 (func $assembly/internal/RTrace/__disableRTrace (; 141 ;)
  i32.const 0
  global.set $assembly/internal/RTrace/RTrace.enabled
 )
 (func $assembly/internal/RTrace/__getUsizeArrayId (; 142 ;) (result i32)
  i32.const 15
 )
 (func $assembly/internal/Expectation/__cleanup (; 143 ;)
  call $assembly/internal/report/Expected/Expected.clear
  call $assembly/internal/report/Actual/Actual.clear
 )
 (func $~start (; 144 ;)
  global.get $~started
  if
   return
  else
   i32.const 1
   global.set $~started
  end
  call $start:assembly/__tests__/toInclude.spec
 )
 (func $~lib/rt/pure/__collect (; 145 ;)
  return
 )
 (func $~lib/rt/pure/decrement (; 146 ;) (param $0 i32)
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
   i32.const 144
   i32.const 122
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
   i32.eqz
   if
    i32.const 0
    i32.const 144
    i32.const 126
    i32.const 17
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/rt/tlsf/ROOT
   local.get $0
   call $~lib/rt/tlsf/freeBlock
  else
   local.get $2
   i32.const 0
   i32.gt_u
   i32.eqz
   if
    i32.const 0
    i32.const 144
    i32.const 136
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
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
 )
 (func $~lib/rt/pure/__visit (; 147 ;) (param $0 i32) (param $1 i32)
  local.get $0
  global.get $~lib/heap/__heap_base
  i32.lt_u
  if
   return
  end
  local.get $1
  i32.const 1
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 144
   i32.const 69
   i32.const 15
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.sub
  call $~lib/rt/pure/decrement
 )
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#__visit_impl" (; 148 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<i32>#__visit_impl (; 149 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/set/Set<i32>#__visit_impl (; 150 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/pure/__visit
  local.get $0
  i32.load offset=8
  local.set $2
  local.get $2
  local.get $1
  call $~lib/rt/pure/__visit
 )
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__visit_impl (; 151 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
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
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   local.set $4
   local.get $4
   if
    local.get $2
    i32.load
    local.set $5
    local.get $5
    if
     local.get $5
     local.get $1
     call $~lib/rt/pure/__visit
    end
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
 )
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#__visit_impl (; 152 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/pure/__visit
  local.get $0
  i32.load offset=8
  local.set $2
  local.get $2
  local.set $3
  local.get $3
  local.get $0
  i32.load offset=16
  i32.const 8
  i32.mul
  i32.add
  local.set $4
  loop $while-continue|0
   local.get $3
   local.get $4
   i32.lt_u
   local.set $5
   local.get $5
   if
    local.get $3
    local.set $6
    local.get $6
    i32.load offset=4
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $6
     i32.load
     local.set $7
     local.get $7
     local.get $1
     call $~lib/rt/pure/__visit
    end
    local.get $3
    i32.const 8
    i32.add
    local.set $3
    br $while-continue|0
   end
  end
  local.get $2
  local.get $1
  call $~lib/rt/pure/__visit
 )
 (func $~lib/array/Array<usize>#__visit_impl (; 153 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/__visit_members (; 154 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block $switch$1$default
    block $switch$1$case$17
     block $switch$1$case$13
      block $switch$1$case$12
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
             br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$4 $switch$1$case$4 $switch$1$case$7 $switch$1$case$8 $switch$1$case$9 $switch$1$case$10 $switch$1$case$2 $switch$1$case$12 $switch$1$case$13 $switch$1$case$9 $switch$1$case$9 $switch$1$case$9 $switch$1$case$17 $switch$1$default
            end
            return
           end
           br $block$4$break
          end
          local.get $0
          local.get $1
          call "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#__visit_impl"
          br $block$4$break
         end
         local.get $0
         local.get $1
         call $~lib/array/Array<i32>#__visit_impl
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
       call $~lib/set/Set<i32>#__visit_impl
       return
      end
      local.get $0
      local.get $1
      call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__visit_impl
      br $block$4$break
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#__visit_impl
     return
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
)
