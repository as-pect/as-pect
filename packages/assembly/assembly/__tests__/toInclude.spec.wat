(module
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $none_=>_none (func))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_=>_none (func (param i32)))
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $i32_i64_i32_=>_i32 (func (param i32 i64 i32) (result i32)))
 (type $i32_i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32 i32)))
 (type $i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_=>_i32 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $i32_f64_=>_i32 (func (param i32 f64) (result i32)))
 (type $i32_f64_f64_f64_=>_i32 (func (param i32 f64 f64 f64) (result i32)))
 (type $f64_i32_=>_i32 (func (param f64 i32) (result i32)))
 (import "env" "memory" (memory $0 1))
 (data (i32.const 16) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00")
 (data (i32.const 64) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00a\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00")
 (data (i32.const 128) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00p\00u\00r\00e\00.\00t\00s\00")
 (data (i32.const 176) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 224) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 288) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 336) "\n\00\00\00\01\00\00\00\01\00\00\00\n\00\00\00h\00e\00l\00l\00o\00")
 (data (i32.const 368) "\0c\00\00\00\01\00\00\00\00\00\00\00\0c\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
 (data (i32.const 400) "\10\00\00\00\01\00\00\00\06\00\00\00\10\00\00\00\80\01\00\00\80\01\00\00\0c\00\00\00\03\00\00\00")
 (data (i32.const 432) ",\00\00\00\01\00\00\00\01\00\00\00,\00\00\00t\00o\00I\00n\00c\00l\00u\00d\00e\00 \00v\00a\00l\00u\00e\00 \00a\00r\00r\00a\00y\00s\00")
 (data (i32.const 496) ",\00\00\00\01\00\00\00\01\00\00\00,\00\00\00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00n\00u\00m\00b\00e\00r\00s\00")
 (data (i32.const 560) ":\00\00\00\01\00\00\00\01\00\00\00:\00\00\00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \002\00")
 (data (i32.const 640) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00A\00r\00r\00a\00y\00<\00i\003\002\00>\00")
 (data (i32.const 688) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t\00")
 (data (i32.const 752) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s\00")
 (data (i32.const 800) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00i\003\002\00")
 (data (i32.const 832) "\10\00\00\00\01\00\00\00\01\00\00\00\10\00\00\00I\00n\00c\00l\00u\00d\00e\00d\00")
 (data (i32.const 864) "\0c\00\00\00\01\00\00\00\01\00\00\00\0c\00\00\00S\00t\00r\00i\00n\00g\00")
 (data (i32.const 896) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00N\00o\00t\00 \00I\00n\00c\00l\00u\00d\00e\00d\00")
 (data (i32.const 944) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00a\00s\00s\00e\00r\00t\00.\00t\00s\00")
 (data (i32.const 1024) "T\00\00\00\01\00\00\00\01\00\00\00T\00\00\00w\00h\00e\00n\00 \00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00d\00o\00e\00s\00n\00\'\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00n\00u\00m\00b\00e\00r\00")
 (data (i32.const 1136) "\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00")
 (data (i32.const 1152) "B\00\00\00\01\00\00\00\01\00\00\00B\00\00\00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \004\00")
 (data (i32.const 1248) "4\00\00\00\01\00\00\00\01\00\00\004\00\00\00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00n\00u\00m\00b\00e\00r\00s\00")
 (data (i32.const 1328) "\84\00\00\00\01\00\00\00\01\00\00\00\84\00\00\00w\00h\00e\00n\00 \00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00i\00n\00c\00l\00u\00d\00e\00s\00 \00a\00 \00n\00u\00m\00b\00e\00r\00 \00b\00u\00t\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 1488) "@\00\00\00\01\00\00\00\01\00\00\00@\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00s\00e\00t\00u\00p\00/\00V\00e\00c\003\00.\00t\00s\00")
 (data (i32.const 1568) "4\00\00\00\01\00\00\00\01\00\00\004\00\00\00t\00o\00I\00n\00c\00l\00u\00d\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00a\00r\00r\00a\00y\00s\00")
 (data (i32.const 1648) "4\00\00\00\01\00\00\00\01\00\00\004\00\00\00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 1728) "X\00\00\00\01\00\00\00\01\00\00\00X\00\00\00r\00e\00f\00e\00r\00e\00n\00c\00e\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00w\00o\00")
 (data (i32.const 1840) "R\00\00\00\01\00\00\00\01\00\00\00R\00\00\00A\00r\00r\00a\00y\00<\00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00s\00e\00t\00u\00p\00/\00V\00e\00c\003\00/\00V\00e\00c\003\00>\00")
 (data (i32.const 1952) "\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00V\00e\00c\003\00")
 (data (i32.const 1984) "\00\00\00\00\01\00\00\00\0e\00\00\00\00\00\00\00")
 (data (i32.const 2000) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00x\00")
 (data (i32.const 2032) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00f\006\004\00")
 (data (i32.const 2064) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00y\00")
 (data (i32.const 2096) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00z\00")
 (data (i32.const 2128) "`\00\00\00\01\00\00\00\01\00\00\00`\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00T\00e\00s\00t\00e\00r\00 \00d\00o\00e\00s\00n\00\'\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 2240) "H\00\00\00\01\00\00\00\01\00\00\00H\00\00\00n\00u\00m\00b\00e\00r\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00f\00o\00u\00r\00")
 (data (i32.const 2336) "<\00\00\00\01\00\00\00\01\00\00\00<\00\00\00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 2416) "b\00\00\00\01\00\00\00\01\00\00\00b\00\00\00r\00e\00f\00e\00r\00e\00n\00c\00e\00T\00e\00s\00t\00e\00r\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00f\00o\00u\00r\00")
 (data (i32.const 2544) "\90\00\00\00\01\00\00\00\01\00\00\00\90\00\00\00w\00h\00e\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00T\00e\00s\00t\00e\00r\00 \00i\00n\00c\00l\00u\00d\00e\00s\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00b\00u\00t\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00i\00s\00 \00n\00e\00g\00a\00t\00e\00d\00")
 (data (i32.const 2704) "B\00\00\00\01\00\00\00\01\00\00\00B\00\00\00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00p\00o\00i\00n\00t\00e\00r\00")
 (data (i32.const 2800) "x\00\00\00\01\00\00\00\01\00\00\00x\00\00\00A\00r\00r\00a\00y\00<\00(\00e\00v\00e\00n\00t\00:\00 \00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00s\00e\00t\00u\00p\00/\00E\00v\00e\00n\00t\00/\00E\00v\00e\00n\00t\00)\00 \00=\00>\00 \00v\00o\00i\00d\00>\00")
 (data (i32.const 2944) "\10\00\00\00\01\00\00\00\01\00\00\00\10\00\00\00F\00u\00n\00c\00t\00i\00o\00n\00")
 (data (i32.const 2976) "f\00\00\00\01\00\00\00\01\00\00\00f\00\00\00S\00h\00o\00u\00l\00d\00 \00h\00a\00n\00d\00l\00e\00 \00t\00h\00e\00 \00n\00e\00g\00a\00t\00e\00d\00 \00i\00n\00c\00l\00u\00d\00e\00d\00 \00f\00u\00n\00c\00t\00i\00o\00n\00 \00p\00o\00i\00n\00t\00e\00r\00")
 (data (i32.const 3104) ">\00\00\00\01\00\00\00\01\00\00\00>\00\00\00s\00h\00o\00u\00l\00d\00 \00i\00n\00c\00l\00u\00d\00e\00 \00i\00t\00e\00m\00s\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00")
 (data (i32.const 3184) "N\00\00\00\01\00\00\00\01\00\00\00N\00\00\00T\00h\00e\00 \00i\00t\00e\00m\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00i\00n\00c\00l\00u\00d\00e\00d\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00.\00")
 (data (i32.const 3280) "N\00\00\00\01\00\00\00\01\00\00\00N\00\00\00S\00e\00t\00<\00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00s\00e\00t\00u\00p\00/\00V\00e\00c\003\00/\00V\00e\00c\003\00>\00")
 (data (i32.const 3376) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00")
 (data (i32.const 3440) "H\00\00\00\01\00\00\00\01\00\00\00H\00\00\00w\00h\00e\00n\00 \00i\00t\00e\00m\00 \00i\00s\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00d\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00")
 (data (i32.const 3536) "V\00\00\00\01\00\00\00\01\00\00\00V\00\00\00T\00h\00e\00 \00i\00t\00e\00m\00 \00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00b\00e\00 \00i\00n\00c\00l\00u\00d\00e\00d\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00.\00")
 (data (i32.const 3648) "b\00\00\00\01\00\00\00\01\00\00\00b\00\00\00s\00h\00o\00u\00l\00d\00 \00n\00o\00t\00 \00i\00n\00c\00l\00u\00d\00e\00 \00a\00n\00 \00i\00t\00e\00m\00 \00t\00h\00a\00t\00 \00i\00s\00 \00n\00o\00t\00 \00i\00n\00 \00t\00h\00e\00 \00s\00e\00t\00")
 (data (i32.const 3776) "\13\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93\00\00\00\02\00\00\00\93\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\98\04\01\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\94 \00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93\00\00\00\02\00\00\00")
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "rtrace" "onalloc" (func $~lib/rt/rtrace/onalloc (param i32)))
 (import "rtrace" "onincrement" (func $~lib/rt/rtrace/onincrement (param i32)))
 (import "rtrace" "onrealloc" (func $~lib/rt/rtrace/onrealloc (param i32 i32)))
 (import "rtrace" "onfree" (func $~lib/rt/rtrace/onfree (param i32)))
 (import "__aspect" "createReflectedValue" (func $assembly/internal/Reflect/createReflectedValue (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (import "__aspect" "pushReflectedObjectValue" (func $assembly/internal/Reflect/__aspectPushReflectedObjectValue (param i32 i32)))
 (import "__aspect" "attachStackTraceToReflectedValue" (func $assembly/internal/Reflect/attachStackTraceToReflectedValue (param i32)))
 (import "__aspect" "reportActualReflectedValue" (func $assembly/internal/Actual/reportActualReflectedValue (param i32)))
 (import "__aspect" "reportExpectedReflectedValue" (func $assembly/internal/Expected/reportExpectedReflectedValue (param i32 i32)))
 (import "__aspect" "clearActual" (func $assembly/internal/Actual/clearActual))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expected/clearExpected))
 (import "__aspect" "reportTestNode" (func $assembly/internal/Test/reportTestNode (param i32 i32 i32 i32 i32)))
 (import "__aspect" "pushReflectedObjectKey" (func $assembly/internal/Reflect/__aspectPushReflectedObjectKey (param i32 i32)))
 (import "rtrace" "ondecrement" (func $~lib/rt/rtrace/ondecrement (param i32)))
 (table $0 23 funcref)
 (elem (i32.const 1) $start:assembly/__tests__/setup/Event~anonymous|0 $start:assembly/__tests__/setup/Event~anonymous|1 $start:assembly/__tests__/toInclude.spec~anonymous|0 $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|0 $start:assembly/internal/noOp~anonymous|0 $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|1 $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|2 $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|3 $start:assembly/__tests__/toInclude.spec~anonymous|1 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|0 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|1 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|2 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|3 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|4 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|5 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|6 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|7 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|8 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|9 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|10 $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|11 $start:assembly/__tests__/toInclude.spec~anonymous|2)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $~lib/gc/gc.auto (mut i32) (i32.const 1))
 (global $assembly/__tests__/setup/Event/listener i32 (i32.const 1))
 (global $assembly/__tests__/setup/Event/anotherListener i32 (i32.const 2))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/eventDispatcher (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/newListener i32 (i32.const 3))
 (global $assembly/__tests__/toInclude.spec/numberTester (mut i32) (i32.const 416))
 (global $assembly/internal/Reflect/Reflect.FAILED_MATCH i32 (i32.const 0))
 (global $assembly/internal/Reflect/Reflect.SUCCESSFUL_MATCH i32 (i32.const 1))
 (global $assembly/internal/Reflect/Reflect.DEFER_MATCH i32 (i32.const 2))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 5))
 (global $assembly/__tests__/toInclude.spec/referenceTester (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/one (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/two (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/three (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/referenceSet (mut i32) (i32.const 0))
 (global $assembly/__tests__/toInclude.spec/four (mut i32) (i32.const 0))
 (global $assembly/internal/RTrace/RTrace.enabled (mut i32) (i32.const 1))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $assembly/internal/log/ignoreLogs (mut i32) (i32.const 0))
 (global $~started (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 3776))
 (global $~lib/heap/__heap_base i32 (i32.const 3932))
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
 (export "__call" (func $assembly/internal/call/__call))
 (export "__ignoreLogs" (func $assembly/internal/log/__ignoreLogs))
 (export "__disableRTrace" (func $assembly/internal/RTrace/__disableRTrace))
 (export "__getUsizeArrayId" (func $assembly/internal/RTrace/__getUsizeArrayId))
 (func $~lib/rt/tlsf/removeBlock (; 15 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/insertBlock (; 16 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/addMemory (; 17 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/maybeInitialize (; 18 ;) (result i32)
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
 (func $~lib/rt/tlsf/prepareSize (; 19 ;) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/searchBlock (; 20 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/growMemory (; 21 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/prepareBlock (; 22 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/allocateBlock (; 23 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/__alloc (; 24 ;) (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/allocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/rt/pure/increment (; 25 ;) (param $0 i32)
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
 (func $~lib/rt/pure/__retain (; 26 ;) (param $0 i32) (result i32)
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
 (func $~lib/rt/pure/__release (; 27 ;) (param $0 i32)
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
 (func $start:assembly/__tests__/setup/Event~anonymous|0 (; 28 ;) (param $0 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/setup/Event~anonymous|1 (; 29 ;) (param $0 i32)
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
 (func $~lib/memory/memory.fill (; 30 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 31 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#constructor" (; 32 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/__tests__/setup/Event/EventDispatcher#constructor (; 33 ;) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/checkUsedBlock (; 34 ;) (param $0 i32) (result i32)
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
 (func $~lib/util/memory/memcpy (; 35 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/memory/memory.copy (; 36 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/freeBlock (; 37 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/reallocateBlock (; 38 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/__realloc (; 39 ;) (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  call $~lib/rt/tlsf/checkUsedBlock
  local.get $1
  call $~lib/rt/tlsf/reallocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/array/ensureSize (; 40 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#push" (; 41 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/__tests__/setup/Event/initializeDispatcher (; 42 ;) (result i32)
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
 (func $start:assembly/__tests__/toInclude.spec~anonymous|0 (; 43 ;) (param $0 i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#constructor (; 44 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/array/Array<i32>> (; 45 ;) (param $0 i32) (result i32)
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
 (func $~lib/util/hash/hash32 (; 46 ;) (param $0 i32) (result i32)
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
 (func $~lib/map/Map<usize,i32>#find (; 47 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
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
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $3
     i32.load
     local.get $1
     i32.eq
    else
     i32.const 0
    end
    if
     local.get $3
     return
    end
    local.get $3
    i32.load offset=8
    i32.const 1
    i32.const -1
    i32.xor
    i32.and
    local.set $3
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $~lib/map/Map<usize,i32>#has (; 48 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<usize>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<usize>|inlined.0
  end
  call $~lib/map/Map<usize,i32>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/map/Map<usize,i32>#get (; 49 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<usize>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<usize>|inlined.1
  end
  call $~lib/map/Map<usize,i32>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 704
   i32.const 768
   i32.const 111
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.load offset=4
 )
 (func $~lib/array/Array<i32>#get:length (; 50 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 51 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/map/Map<usize,i32>#rehash (; 52 ;) (param $0 i32) (param $1 i32)
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
  i32.const 12
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  i32.const 12
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
    i32.load offset=8
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
     local.get $11
     local.get $10
     i32.load offset=4
     i32.store offset=4
     block $~lib/util/hash/HASH<usize>|inlined.3 (result i32)
      local.get $10
      i32.load
      local.set $12
      local.get $12
      call $~lib/util/hash/hash32
      br $~lib/util/hash/HASH<usize>|inlined.3
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
     i32.store offset=8
     local.get $13
     local.get $8
     i32.store
     local.get $8
     i32.const 12
     i32.add
     local.set $8
    end
    local.get $6
    i32.const 12
    i32.add
    local.set $6
    br $while-continue|0
   end
  end
  local.get $0
  local.tee $11
  local.get $3
  local.tee $12
  local.get $11
  i32.load
  local.tee $9
  i32.ne
  if
   local.get $12
   call $~lib/rt/pure/__retain
   local.set $12
   local.get $9
   call $~lib/rt/pure/__release
  end
  local.get $12
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.tee $13
  local.get $5
  local.tee $9
  local.get $13
  i32.load offset=8
  local.tee $11
  i32.ne
  if
   local.get $9
   call $~lib/rt/pure/__retain
   local.set $9
   local.get $11
   call $~lib/rt/pure/__release
  end
  local.get $9
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
 (func $~lib/map/Map<usize,i32>#set (; 53 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $~lib/util/hash/HASH<usize>|inlined.2 (result i32)
   local.get $1
   local.set $3
   local.get $3
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<usize>|inlined.2
  end
  local.set $4
  local.get $0
  local.get $1
  local.get $4
  call $~lib/map/Map<usize,i32>#find
  local.set $5
  local.get $5
  if
   local.get $5
   local.get $2
   i32.store offset=4
  else
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
    call $~lib/map/Map<usize,i32>#rehash
   end
   local.get $0
   i32.load offset=8
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $3
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $6
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $6
   i32.const 12
   i32.mul
   i32.add
   local.set $5
   local.get $5
   local.get $1
   i32.store
   local.get $5
   local.get $2
   i32.store offset=4
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
   local.set $6
   local.get $5
   local.get $6
   i32.load
   i32.store offset=8
   local.get $6
   local.get $5
   i32.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<i32>#__unchecked_get (; 54 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $assembly/internal/Box/Box<i32>#constructor (; 55 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 9
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store
  local.get $0
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<i32> (; 56 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  local.get $0
  call $assembly/internal/Box/Box<i32>#constructor
  local.set $2
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $2
  i32.const 1
  i32.const 4
  i32.const 7
  i32.const 0
  i32.const 816
  local.get $2
  i32.const 0
  i32.const 0
  call $assembly/internal/Reflect/createReflectedValue
  local.set $3
  local.get $3
  local.set $4
  local.get $2
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<i32>> (; 57 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 6
   i32.const 656
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $0
  call $~lib/array/Array<i32>#get:length
  local.set $2
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  local.get $2
  i32.const 10
  i32.const 6
  i32.const 656
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $3
  local.get $1
  local.get $0
  local.get $3
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  i32.const 0
  local.set $4
  loop $for-loop|0
   local.get $4
   local.get $2
   i32.lt_s
   local.set $5
   local.get $5
   if
    local.get $0
    local.get $4
    call $~lib/array/Array<i32>#__unchecked_get
    local.set $6
    local.get $6
    local.get $1
    call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>
    local.set $7
    local.get $3
    local.get $7
    call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $3
  local.set $4
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $~lib/map/Map<usize,i32>#clear (; 58 ;) (param $0 i32)
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
  local.tee $2
  i32.const 0
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  local.get $2
  i32.load offset=8
  call $~lib/rt/pure/__release
  local.get $1
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
 (func $~lib/map/Map<usize,i32>#constructor (; 59 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
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
  call $~lib/map/Map<usize,i32>#clear
  local.get $0
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<i32>>|trampoline (; 60 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<i32>>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $~setArgumentsLength (; 61 ;) (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $assembly/internal/Reflect/Reflect.attachStackTrace (; 62 ;) (param $0 i32)
  local.get $0
  call $assembly/internal/Reflect/attachStackTraceToReflectedValue
 )
 (func $assembly/internal/Actual/Actual.report<~lib/array/Array<i32>> (; 63 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<i32>>|trampoline
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/string/String#get:length (; 64 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String> (; 65 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 1
   i32.const 880
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  local.get $0
  call $~lib/string/String#get:length
  i32.const 2
  i32.const 1
  i32.const 880
  local.get $0
  i32.const 0
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $2
  local.set $3
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>|trampoline (; 66 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/Expected/Expected.report<~lib/string/String> (; 67 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>|trampoline
  local.set $2
  local.get $2
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $2
  local.get $1
  call $assembly/internal/Expected/reportExpectedReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Actual/Actual.report<~lib/string/String> (; 68 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>|trampoline
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/assert/assert (; 69 ;) (param $0 i32) (param $1 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.eqz
  if
   local.get $1
   call $~lib/rt/pure/__release
   local.get $1
   i32.const 960
   i32.const 9
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/array/Array<i32>,i32> (; 70 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
  call $assembly/internal/Actual/Actual.report<~lib/array/Array<i32>>
  i32.const 848
  local.get $2
  call $assembly/internal/Expected/Expected.report<~lib/string/String>
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
   i32.const 848
   call $~lib/rt/pure/__retain
   local.tee $5
  else
   i32.const 912
   call $~lib/rt/pure/__retain
   local.tee $6
  end
  call $assembly/internal/Actual/Actual.report<~lib/string/String>
  local.get $2
  local.get $4
  i32.xor
  local.get $3
  call $assembly/internal/assert/assert
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Actual/Actual.clear (; 71 ;)
  call $assembly/internal/Actual/clearActual
 )
 (func $assembly/internal/Expected/Expected.clear (; 72 ;)
  call $assembly/internal/Expected/clearExpected
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32> (; 73 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|0 (; 74 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/numberTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  i32.const 2
  i32.const 576
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 75 ;)
  nop
 )
 (func $assembly/internal/Test/it (; 76 ;) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 0
  local.get $0
  local.get $1
  i32.const 0
  i32.const 0
  call $assembly/internal/Test/reportTestNode
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|1 (; 77 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/numberTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  i32.const 4
  i32.const 1152
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/throws (; 78 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  i32.const 0
  local.get $0
  local.get $1
  i32.const 1
  local.get $2
  call $assembly/internal/Test/reportTestNode
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not (; 79 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|2 (; 80 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/numberTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.tee $1
  i32.const 4
  i32.const 1168
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1~anonymous|3 (; 81 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/numberTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<i32>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#get:not
  local.tee $1
  i32.const 2
  i32.const 1152
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<i32>>#toInclude<i32>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|1 (; 82 ;)
  i32.const 512
  i32.const 4
  call $assembly/internal/Test/it
  i32.const 1040
  i32.const 6
  i32.const 1168
  call $assembly/internal/Test/throws
  i32.const 1264
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1344
  i32.const 8
  i32.const 0
  call $assembly/internal/Test/throws
 )
 (func $assembly/internal/Test/describe (; 83 ;) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 1
  local.get $0
  local.get $1
  i32.const 0
  i32.const 0
  call $assembly/internal/Test/reportTestNode
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 84 ;) (param $0 i32) (param $1 i32) (result i32)
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
  local.set $0
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  local.get $1
  i32.store offset=12
  local.get $0
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 85 ;) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
   i32.const 10
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
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#push (; 86 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#clear (; 87 ;) (param $0 i32)
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
  local.tee $2
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  local.get $2
  i32.load offset=8
  call $~lib/rt/pure/__release
  local.get $1
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
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 88 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
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
 (func $assembly/__tests__/setup/Vec3/Vec3#__equals (; 89 ;) (param $0 i32) (param $1 i32) (result i32)
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
   i32.const 1504
   i32.const 52
   i32.const 16
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
    i32.const 1504
    i32.const 52
    i32.const 42
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
    i32.const 1504
    i32.const 52
    i32.const 68
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
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#find (; 90 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#rehash (; 91 ;) (param $0 i32) (param $1 i32)
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
  local.tee $11
  local.get $3
  local.tee $12
  local.get $11
  i32.load
  local.tee $9
  i32.ne
  if
   local.get $12
   call $~lib/rt/pure/__retain
   local.set $12
   local.get $9
   call $~lib/rt/pure/__release
  end
  local.get $12
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.tee $13
  local.get $5
  local.tee $9
  local.get $13
  i32.load offset=8
  local.tee $11
  i32.ne
  if
   local.get $9
   call $~lib/rt/pure/__retain
   local.set $9
   local.get $11
   call $~lib/rt/pure/__release
  end
  local.get $9
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
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#add (; 92 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#constructor (; 93 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>> (; 94 ;) (param $0 i32) (result i32)
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
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#get:length (; 95 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_get (; 96 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $assembly/internal/RTrace/RTrace.sizeOf (; 97 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $~lib/rt/__allocBuffer (; 98 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/__alloc
  local.set $3
  local.get $2
  if
   local.get $3
   local.get $2
   local.get $0
   call $~lib/memory/memory.copy
  end
  local.get $3
 )
 (func $~lib/staticarray/StaticArray<i64>#get:length (; 99 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 3
  i32.shr_u
 )
 (func $~lib/staticarray/StaticArray<i64>#indexOf (; 100 ;) (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  call $~lib/staticarray/StaticArray<i64>#get:length
  local.set $3
  local.get $3
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $2
   local.get $3
   i32.ge_s
  end
  if
   i32.const -1
   return
  end
  local.get $2
  i32.const 0
  i32.lt_s
  if
   local.get $3
   local.get $2
   i32.add
   local.tee $4
   i32.const 0
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   local.set $2
  end
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_s
   local.set $4
   local.get $4
   if
    local.get $0
    local.get $2
    i32.const 3
    i32.shl
    i32.add
    i64.load
    local.get $1
    i64.eq
    if
     local.get $2
     return
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  i32.const -1
 )
 (func $~lib/staticarray/StaticArray<i64>#includes (; 101 ;) (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  local.get $0
  local.get $1
  local.get $2
  call $~lib/staticarray/StaticArray<i64>#indexOf
  i32.const 0
  i32.ge_s
  return
 )
 (func $assembly/internal/Box/Box<f64>#constructor (; 102 ;) (param $0 i32) (param $1 f64) (result i32)
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
  local.get $1
  f64.store
  local.get $0
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<f64> (; 103 ;) (param $0 f64) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  local.get $0
  call $assembly/internal/Box/Box<f64>#constructor
  local.set $2
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $2
  i32.const 1
  i32.const 8
  i32.const 8
  i32.const 0
  i32.const 2048
  local.get $2
  i32.const 0
  i32.const 0
  call $assembly/internal/Reflect/createReflectedValue
  local.set $3
  local.get $3
  local.set $4
  local.get $2
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#__aspectAddReflectedValueKeyValuePairs (; 104 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  local.get $3
  i64.const 4685345497827770368
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2016
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685345532187508736
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2080
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load offset=8
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685345566547247104
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2112
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load offset=16
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3> (; 105 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 10
   i32.const 1968
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.const 1
  i32.const 0
  i32.const 24
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 10
  i32.const 1968
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  local.get $2
  local.get $1
  i32.const 0
  i32.const 14
  i32.const 2000
  call $~lib/rt/__allocBuffer
  call $~lib/rt/pure/__retain
  local.tee $3
  call $assembly/__tests__/setup/Vec3/Vec3#__aspectAddReflectedValueKeyValuePairs
  local.get $2
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>> (; 106 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 11
   i32.const 1856
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $0
  call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#get:length
  local.set $2
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  local.get $2
  i32.const 10
  i32.const 11
  i32.const 1856
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $3
  local.get $1
  local.get $0
  local.get $3
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  i32.const 0
  local.set $4
  loop $for-loop|0
   local.get $4
   local.get $2
   i32.lt_s
   local.set $5
   local.get $5
   if
    local.get $0
    local.get $4
    call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_get
    local.tee $6
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $7
    local.get $1
    call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3>
    local.set $8
    local.get $3
    local.get $8
    call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
    local.get $6
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $3
  local.set $4
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>|trampoline (; 107 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/Actual/Actual.report<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>> (; 108 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>|trampoline
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>,assembly/__tests__/setup/Vec3/Vec3> (; 109 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
  call $assembly/internal/Actual/Actual.report<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  i32.const 848
  local.get $2
  call $assembly/internal/Expected/Expected.report<~lib/string/String>
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
   i32.const 848
   call $~lib/rt/pure/__retain
   local.tee $5
  else
   i32.const 912
   call $~lib/rt/pure/__retain
   local.tee $6
  end
  call $assembly/internal/Actual/Actual.report<~lib/string/String>
  local.get $2
  local.get $4
  i32.xor
  local.get $3
  call $assembly/internal/assert/assert
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3> (; 110 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|0 (; 111 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  global.get $assembly/__tests__/toInclude.spec/two
  i32.const 1744
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|1 (; 112 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  global.get $assembly/__tests__/toInclude.spec/four
  i32.const 1152
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#get:not (; 113 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|2 (; 114 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#get:not
  local.tee $1
  global.get $assembly/__tests__/toInclude.spec/four
  i32.const 2432
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|3 (; 115 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceTester
  call $assembly/internal/Expectation/expect<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#get:not
  local.tee $1
  global.get $assembly/__tests__/toInclude.spec/two
  i32.const 1152
  call $assembly/internal/Expectation/Expectation<~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#constructor" (; 116 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>" (; 117 ;) (param $0 i32) (result i32)
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
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#get:length" (; 118 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#__unchecked_get" (; 119 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func "$assembly/internal/Reflect/Reflect.toReflectedValue<(event: assembly/__tests__/setup/Event/Event) => void>" (; 120 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 6
   i32.const 0
   i32.const 2960
   i32.const 0
   i32.const 0
   i32.const 0
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  i32.const 0
  i32.const 6
  i32.const 31
  i32.const 2960
  local.get $0
  i32.const 0
  i32.const 0
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func "$assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>" (; 121 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 5
   i32.const 2816
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $0
  call "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#get:length"
  local.set $2
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  local.get $2
  i32.const 10
  i32.const 5
  i32.const 2816
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $3
  local.get $1
  local.get $0
  local.get $3
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  i32.const 0
  local.set $4
  loop $for-loop|0
   local.get $4
   local.get $2
   i32.lt_s
   local.set $5
   local.get $5
   if
    local.get $0
    local.get $4
    call "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#__unchecked_get"
    local.set $6
    local.get $6
    local.get $1
    call "$assembly/internal/Reflect/Reflect.toReflectedValue<(event: assembly/__tests__/setup/Event/Event) => void>"
    local.set $7
    local.get $3
    local.get $7
    call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $3
  local.set $4
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func "$assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>|trampoline" (; 122 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call "$assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func "$assembly/internal/Actual/Actual.report<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>" (; 123 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call "$assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>|trampoline"
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func "$assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>,(event: assembly/__tests__/setup/Event/Event) => void>" (; 124 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
  call "$assembly/internal/Actual/Actual.report<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  i32.const 848
  local.get $2
  call $assembly/internal/Expected/Expected.report<~lib/string/String>
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
   i32.const 848
   call $~lib/rt/pure/__retain
   local.tee $5
  else
   i32.const 912
   call $~lib/rt/pure/__retain
   local.tee $6
  end
  call $assembly/internal/Actual/Actual.report<~lib/string/String>
  local.get $2
  local.get $4
  i32.xor
  local.get $3
  call $assembly/internal/assert/assert
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>" (; 125 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|4 (; 126 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.load
  call "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  local.tee $0
  global.get $assembly/__tests__/setup/Event/listener
  i32.const 1152
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>"
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#get:not" (; 127 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|5 (; 128 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.load
  call "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  local.tee $0
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#get:not"
  local.tee $1
  global.get $assembly/__tests__/toInclude.spec/newListener
  i32.const 1152
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>"
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|6 (; 129 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.load
  call "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  local.tee $0
  global.get $assembly/__tests__/toInclude.spec/newListener
  i32.const 1152
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>"
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|7 (; 130 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.load
  call "$assembly/internal/Expectation/expect<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>"
  local.tee $0
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#get:not"
  local.tee $1
  global.get $assembly/__tests__/setup/Event/listener
  i32.const 1152
  call "$assembly/internal/Expectation/Expectation<~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>>#toInclude<(event: assembly/__tests__/setup/Event/Event) => void>"
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#constructor (; 131 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>> (; 132 ;) (param $0 i32) (result i32)
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
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#get:size (; 133 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_set (; 134 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  local.get $3
  i32.load
  local.set $4
  local.get $2
  local.get $4
  i32.ne
  if
   local.get $3
   local.get $2
   call $~lib/rt/pure/__retain
   i32.store
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__set (; 135 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    local.get $2
    call $~lib/rt/pure/__release
    i32.const 3392
    i32.const 304
    i32.const 109
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   i32.const 2
   call $~lib/array/ensureSize
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   i32.store offset=12
  end
  local.get $0
  local.get $1
  local.get $2
  call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_set
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#values (; 136 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  i32.load offset=8
  local.set $1
  local.get $0
  i32.load offset=16
  local.set $2
  i32.const 0
  local.get $2
  call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#constructor
  local.set $3
  i32.const 0
  local.set $4
  i32.const 0
  local.set $5
  loop $for-loop|0
   local.get $5
   local.get $2
   i32.lt_s
   local.set $6
   local.get $6
   if
    local.get $1
    local.get $5
    i32.const 8
    i32.mul
    i32.add
    local.set $7
    local.get $7
    i32.load offset=4
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $3
     local.get $4
     local.tee $8
     i32.const 1
     i32.add
     local.set $4
     local.get $8
     local.get $7
     i32.load
     call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__set
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  local.get $3
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>> (; 137 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 12
   i32.const 3296
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  local.get $0
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#get:size
  i32.const 5
  i32.const 12
  i32.const 3296
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#values
  local.set $3
  local.get $3
  call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#get:length
  local.set $4
  i32.const 0
  local.set $5
  loop $for-loop|0
   local.get $5
   local.get $4
   i32.lt_s
   local.set $6
   local.get $6
   if
    local.get $3
    local.get $5
    call $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__unchecked_get
    local.tee $7
    call $~lib/rt/pure/__retain
    local.set $8
    local.get $8
    local.get $1
    call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3>
    local.set $9
    local.get $2
    local.get $9
    call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
    local.get $7
    call $~lib/rt/pure/__release
    local.get $8
    call $~lib/rt/pure/__release
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  local.get $3
  call $~lib/rt/pure/__release
  i32.const 0
  local.set $4
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>|trampoline (; 138 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/Actual/Actual.report<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>> (; 139 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>|trampoline
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#has (; 140 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/comparison/toIncludeComparison/toIncludeComparison<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>,assembly/__tests__/setup/Vec3/Vec3> (; 141 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
  call $assembly/internal/Actual/Actual.report<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>
  i32.const 848
  local.get $2
  call $assembly/internal/Expected/Expected.report<~lib/string/String>
  i32.const 0
  local.set $4
  local.get $0
  local.get $1
  call $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#has
  local.set $4
  local.get $4
  if (result i32)
   i32.const 848
   call $~lib/rt/pure/__retain
   local.tee $5
  else
   i32.const 912
   call $~lib/rt/pure/__retain
   local.tee $6
  end
  call $assembly/internal/Actual/Actual.report<~lib/string/String>
  local.get $2
  local.get $4
  i32.xor
  local.get $3
  call $assembly/internal/assert/assert
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3> (; 142 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|8 (; 143 ;)
  (local $0 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceSet
  call $assembly/internal/Expectation/expect<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  global.get $assembly/__tests__/toInclude.spec/one
  i32.const 3200
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|9 (; 144 ;)
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
  i32.const 1152
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#get:not (; 145 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|10 (; 146 ;)
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
  i32.const 3552
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/test (; 147 ;) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 0
  local.get $0
  local.get $1
  i32.const 0
  i32.const 0
  call $assembly/internal/Test/reportTestNode
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2~anonymous|11 (; 148 ;)
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toInclude.spec/referenceSet
  call $assembly/internal/Expectation/expect<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#get:not
  local.tee $1
  global.get $assembly/__tests__/toInclude.spec/one
  i32.const 1152
  call $assembly/internal/Expectation/Expectation<~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>>#toInclude<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toInclude.spec~anonymous|2 (; 149 ;)
  i32.const 1664
  i32.const 10
  call $assembly/internal/Test/it
  i32.const 2144
  i32.const 11
  i32.const 2256
  call $assembly/internal/Test/throws
  i32.const 2352
  i32.const 12
  call $assembly/internal/Test/it
  i32.const 2560
  i32.const 13
  i32.const 0
  call $assembly/internal/Test/throws
  i32.const 2720
  i32.const 14
  call $assembly/internal/Test/it
  i32.const 2992
  i32.const 15
  call $assembly/internal/Test/it
  i32.const 2720
  i32.const 16
  i32.const 0
  call $assembly/internal/Test/throws
  i32.const 2720
  i32.const 17
  i32.const 0
  call $assembly/internal/Test/throws
  i32.const 3120
  i32.const 18
  call $assembly/internal/Test/it
  i32.const 3456
  i32.const 19
  i32.const 3552
  call $assembly/internal/Test/throws
  i32.const 3664
  i32.const 20
  call $assembly/internal/Test/test
  i32.const 3456
  i32.const 21
  i32.const 3200
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/__tests__/toInclude.spec (; 150 ;)
  (local $0 i32)
  (local $1 i32)
  call $assembly/__tests__/setup/Event/initializeDispatcher
  global.set $assembly/__tests__/toInclude.spec/eventDispatcher
  i32.const 448
  i32.const 9
  call $assembly/internal/Test/describe
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
  i32.const 1584
  i32.const 22
  call $assembly/internal/Test/describe
 )
 (func $assembly/internal/call/__call (; 151 ;) (param $0 i32)
  i32.const 0
  global.set $~argumentsLength
  local.get $0
  call_indirect (type $none_=>_none)
 )
 (func $assembly/internal/log/__ignoreLogs (; 152 ;) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/log/ignoreLogs
 )
 (func $assembly/internal/RTrace/__disableRTrace (; 153 ;)
  i32.const 0
  global.set $assembly/internal/RTrace/RTrace.enabled
 )
 (func $assembly/internal/RTrace/__getUsizeArrayId (; 154 ;) (result i32)
  i32.const 18
 )
 (func $~start (; 155 ;)
  global.get $~started
  if
   return
  else
   i32.const 1
   global.set $~started
  end
  call $start:assembly/__tests__/toInclude.spec
 )
 (func $~lib/rt/pure/__collect (; 156 ;)
  return
 )
 (func $~lib/rt/pure/decrement (; 157 ;) (param $0 i32)
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
 (func $~lib/rt/pure/__visit (; 158 ;) (param $0 i32) (param $1 i32)
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
 (func "$~lib/array/Array<(event: assembly/__tests__/setup/Event/Event) => void>#__visit_impl" (; 159 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<i32>#__visit_impl (; 160 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/map/Map<usize,i32>#__visit_impl (; 161 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<assembly/__tests__/setup/Vec3/Vec3>#__visit_impl (; 162 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/set/Set<assembly/__tests__/setup/Vec3/Vec3>#__visit_impl (; 163 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/staticarray/StaticArray<i64>#__visit_impl (; 164 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<usize>#__visit_impl (; 165 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/__visit_members (; 166 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block $switch$1$default
    block $switch$1$case$20
     block $switch$1$case$16
      block $switch$1$case$14
       block $switch$1$case$13
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
              br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$4 $switch$1$case$4 $switch$1$case$7 $switch$1$case$8 $switch$1$case$9 $switch$1$case$10 $switch$1$case$2 $switch$1$case$2 $switch$1$case$13 $switch$1$case$14 $switch$1$case$9 $switch$1$case$16 $switch$1$case$2 $switch$1$case$9 $switch$1$case$9 $switch$1$case$20 $switch$1$default
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
        call $~lib/map/Map<usize,i32>#__visit_impl
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
     call $~lib/staticarray/StaticArray<i64>#__visit_impl
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
