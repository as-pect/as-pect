(module
 (type $none_=>_none (func))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_=>_none (func (param i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $i32_i64_i32_=>_i32 (func (param i32 i64 i32) (result i32)))
 (type $f64_i32_=>_i32 (func (param f64 i32) (result i32)))
 (type $f64_=>_none (func (param f64)))
 (type $i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_=>_i32 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $i32_i32_i32_i32_f64_=>_i32 (func (param i32 i32 i32 i32 f64) (result i32)))
 (type $i32_f64_=>_i32 (func (param i32 f64) (result i32)))
 (type $i32_f64_f64_f64_=>_i32 (func (param i32 f64 f64 f64) (result i32)))
 (type $f64_=>_i32 (func (param f64) (result i32)))
 (import "env" "memory" (memory $0 1))
 (data (i32.const 16) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00")
 (data (i32.const 64) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00a\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00")
 (data (i32.const 128) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00p\00u\00r\00e\00.\00t\00s\00")
 (data (i32.const 176) "\12\00\00\00\01\00\00\00\01\00\00\00\12\00\00\00t\00o\00B\00e\00F\00a\00l\00s\00y\00")
 (data (i32.const 224) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \000\00 \00t\00o\00 \00b\00e\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 304) "2\00\00\00\01\00\00\00\01\00\00\002\00\00\000\00 \00i\00s\00 \00f\00a\00l\00s\00y\00 \00b\00y\00 \00d\00e\00f\00i\00n\00i\00t\00i\00o\00n\00.\00")
 (data (i32.const 384) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00i\003\002\00")
 (data (i32.const 416) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 464) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 528) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00a\00s\00s\00e\00r\00t\00.\00t\00s\00")
 (data (i32.const 608) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\000\00.\000\00 \00i\00s\00 \00f\00a\00l\00s\00y\00 \00b\00y\00 \00d\00e\00f\00i\00n\00i\00t\00i\00o\00n\00.\00")
 (data (i32.const 688) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00f\006\004\00")
 (data (i32.const 720) "4\00\00\00\01\00\00\00\01\00\00\004\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00r\00r\00o\00r\00 \00i\00f\00 \000\00 \00i\00s\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 800) "\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00")
 (data (i32.const 816) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\000\00 \00i\00s\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 864) ">\00\00\00\01\00\00\00\01\00\00\00>\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00f\00a\00l\00s\00e\00 \00t\00o\00 \00b\00e\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 944) "8\00\00\00\01\00\00\00\01\00\00\008\00\00\00F\00a\00l\00s\00e\00 \00i\00s\00 \00f\00a\00l\00s\00y\00 \00b\00y\00 \00d\00e\00f\00i\00n\00i\00t\00i\00o\00n\00")
 (data (i32.const 1024) "\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00b\00o\00o\00l\00")
 (data (i32.const 1056) "4\00\00\00\01\00\00\00\01\00\00\004\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \000\00 \00i\00s\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 1136) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00f\00a\00l\00s\00e\00 \00i\00s\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 1184) "\\\00\00\00\01\00\00\00\01\00\00\00\\\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00o\00n\00-\00z\00e\00r\00o\00 \00n\00u\00m\00b\00e\00r\00s\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 1296) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\001\00 \00i\00s\00 \00n\00o\00t\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 1344) " \00\00\00\01\00\00\00\01\00\00\00 \00\00\001\00.\000\00 \00i\00s\00 \00n\00o\00t\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 1392) "<\00\00\00\01\00\00\00\01\00\00\00<\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \001\00 \00i\00s\00 \00n\00o\00t\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 1472) "D\00\00\00\01\00\00\00\01\00\00\00D\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00t\00r\00u\00e\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 1568) ">\00\00\00\01\00\00\00\01\00\00\00>\00\00\00T\00r\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00f\00a\00l\00s\00y\00 \00b\00y\00 \00d\00e\00f\00i\00n\00i\00t\00i\00o\00n\00")
 (data (i32.const 1648) ":\00\00\00\01\00\00\00\01\00\00\00:\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00r\00u\00e\00 \00i\00s\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 1728) "\"\00\00\00\01\00\00\00\01\00\00\00\"\00\00\00t\00r\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 1792) ":\00\00\00\01\00\00\00\01\00\00\00:\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00N\00a\00N\00 \00t\00o\00 \00b\00e\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 1872) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00N\00a\00N\00 \00i\00s\00 \00a\00l\00w\00a\00y\00s\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 1936) "@\00\00\00\01\00\00\00\01\00\00\00@\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00N\00a\00N\00 \00i\00s\00 \00n\00o\00t\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 2016) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00N\00a\00N\00 \00i\00s\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 2064) "<\00\00\00\01\00\00\00\01\00\00\00<\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00u\00l\00l\00 \00t\00o\00 \00b\00e\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 2144) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00N\00u\00l\00l\00 \00i\00s\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 2192) "\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00V\00e\00c\003\00")
 (data (i32.const 2224) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t\00")
 (data (i32.const 2288) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s\00")
 (data (i32.const 2336) "\00\00\00\00\01\00\00\00\t\00\00\00\00\00\00\00")
 (data (i32.const 2352) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00x\00")
 (data (i32.const 2384) "\0c\00\00\00\01\00\00\00\01\00\00\00\0c\00\00\00S\00t\00r\00i\00n\00g\00")
 (data (i32.const 2416) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00y\00")
 (data (i32.const 2448) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00z\00")
 (data (i32.const 2480) "B\00\00\00\01\00\00\00\01\00\00\00B\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00n\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00f\00a\00s\00l\00y\00")
 (data (i32.const 2576) "b\00\00\00\01\00\00\00\01\00\00\00b\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00n\00o\00n\00-\00n\00u\00l\00l\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00n\00o\00t\00 \00t\00o\00 \00b\00e\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 2704) "D\00\00\00\01\00\00\00\01\00\00\00D\00\00\00N\00o\00n\00-\00n\00u\00l\00l\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00n\00o\00t\00 \00f\00a\00l\00s\00y\00.\00")
 (data (i32.const 2800) "Z\00\00\00\01\00\00\00\01\00\00\00Z\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00n\00o\00n\00-\00n\00u\00l\00l\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00 \00a\00r\00e\00 \00f\00a\00l\00s\00y\00")
 (data (i32.const 2912) "\0b\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\000\t\02\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00$\n\00\00\00\00\00\00\"\01\00\00\00\00\00\00")
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "rtrace" "onalloc" (func $~lib/rt/rtrace/onalloc (param i32)))
 (import "rtrace" "onincrement" (func $~lib/rt/rtrace/onincrement (param i32)))
 (import "__aspect" "createReflectedNumber" (func $assembly/internal/Reflect/createReflectedNumber (param i32 i32 i32 i32 f64) (result i32)))
 (import "__aspect" "attachStackTraceToReflectedValue" (func $assembly/internal/Reflect/attachStackTraceToReflectedValue (param i32)))
 (import "__aspect" "reportActualReflectedValue" (func $assembly/internal/Actual/reportActualReflectedValue (param i32)))
 (import "__aspect" "reportExpectedFalsy" (func $assembly/internal/Expected/reportExpectedFalsy (param i32)))
 (import "__aspect" "clearActual" (func $assembly/internal/Actual/clearActual))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expected/clearExpected))
 (import "__aspect" "reportTestTypeNode" (func $assembly/internal/Test/it (param i32 i32)))
 (import "__aspect" "reportNegatedTestNode" (func $assembly/internal/Test/throws (param i32 i32 i32)))
 (import "__aspect" "createReflectedValue" (func $assembly/internal/Reflect/createReflectedValue (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (import "__aspect" "pushReflectedObjectKey" (func $assembly/internal/Reflect/__aspectPushReflectedObjectKey (param i32 i32)))
 (import "__aspect" "pushReflectedObjectValue" (func $assembly/internal/Reflect/__aspectPushReflectedObjectValue (param i32 i32)))
 (import "__aspect" "reportGroupTypeNode" (func $assembly/internal/Test/describe (param i32 i32)))
 (import "rtrace" "ondecrement" (func $~lib/rt/rtrace/ondecrement (param i32)))
 (import "rtrace" "onfree" (func $~lib/rt/rtrace/onfree (param i32)))
 (table $0 21 funcref)
 (elem (i32.const 1) $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|13 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|14 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|15 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|16 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|17 $start:assembly/__tests__/toBeFalsy.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/ASC_LOW_MEMORY_LIMIT i32 (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $~lib/gc/gc.auto (mut i32) (i32.const 1))
 (global $assembly/__tests__/toBeFalsy.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/internal/Reflect/Reflect.FAILED_MATCH i32 (i32.const 0))
 (global $assembly/internal/Reflect/Reflect.SUCCESSFUL_MATCH i32 (i32.const 1))
 (global $assembly/internal/Reflect/Reflect.DEFER_MATCH i32 (i32.const 2))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $assembly/internal/RTrace/RTrace.enabled (mut i32) (i32.const 1))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $assembly/internal/noOp/noOp i32 (i32.const 20))
 (global $assembly/internal/log/ignoreLogs (mut i32) (i32.const 0))
 (global $~started (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 2912))
 (global $~lib/heap/__heap_base i32 (i32.const 3004))
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
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
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
  i32.const 1
  drop
  local.get $2
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 277
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $3
  i32.const 1
  drop
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
   i32.const 14
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
  i32.const 1
  drop
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
   i32.const 14
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
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
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
  i32.const 1
  drop
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 205
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load
  local.set $2
  i32.const 1
  drop
  local.get $2
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 207
   i32.const 14
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
   i32.const 1
   drop
   local.get $3
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 32
    i32.const 228
    i32.const 16
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
  i32.const 1
  drop
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
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 1
  drop
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
   i32.const 14
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
  i32.const 1
  drop
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
   i32.const 14
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
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  i32.const 1
  drop
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
   i32.const 5
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
   i32.const 1
   drop
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
    i32.const 16
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
   i32.const 1
   drop
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
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $2
  local.get $1
  i32.sub
  local.set $6
  local.get $6
  i32.const 16
  i32.const 16
  i32.add
  i32.const 16
  i32.add
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
 (func $~lib/rt/tlsf/maybeInitialize (result i32)
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
   i32.const 15
   i32.const -1
   i32.xor
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
   local.get $1
   i32.const 1572
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   local.set $5
   i32.const 0
   drop
   local.get $0
   local.get $5
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
 (func $~lib/rt/tlsf/prepareSize (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741808
  i32.ge_u
  if
   i32.const 80
   i32.const 32
   i32.const 461
   i32.const 30
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
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
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
  i32.const 1
  drop
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
   i32.const 14
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
    i32.const 1
    drop
    local.get $6
    i32.eqz
    if
     i32.const 0
     i32.const 32
     i32.const 351
     i32.const 18
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
 (func $~lib/rt/tlsf/growMemory (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 0
  drop
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
 (func $~lib/rt/tlsf/prepareBlock (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.set $3
  i32.const 1
  drop
  local.get $2
  i32.const 15
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 365
   i32.const 14
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
  i32.const 16
  i32.const 16
  i32.add
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
 (func $~lib/rt/tlsf/allocateBlock (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 1
  drop
  global.get $~lib/rt/tlsf/collectLock
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 500
   i32.const 14
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
    drop
    i32.const 1
    global.set $~lib/rt/tlsf/collectLock
    call $~lib/rt/pure/__collect
    i32.const 1
    drop
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
     i32.const 1
     drop
     local.get $4
     i32.eqz
     if
      i32.const 0
      i32.const 32
      i32.const 512
      i32.const 20
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
    i32.const 1
    drop
    local.get $4
    i32.eqz
    if
     i32.const 0
     i32.const 32
     i32.const 517
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  i32.const 1
  drop
  local.get $4
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $3
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 520
   i32.const 14
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
  i32.const 1
  drop
  local.get $4
  call $~lib/rt/rtrace/onalloc
  local.get $4
 )
 (func $~lib/rt/tlsf/__alloc (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/allocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/rt/pure/increment (param $0 i32)
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
   i32.const 144
   i32.const 109
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  i32.store offset=4
  i32.const 1
  drop
  local.get $0
  call $~lib/rt/rtrace/onincrement
  i32.const 1
  drop
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
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/rt/pure/__retain (param $0 i32) (result i32)
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
 (func $~lib/rt/pure/__release (param $0 i32)
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
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
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
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (param $0 i32) (param $1 i32) (result i32)
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
  local.get $1
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<i32> (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<i32> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 2
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  i32.const 1
  i32.const 4
  i32.const 7
  i32.const 400
  local.get $0
  f64.convert_i32_s
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $~lib/memory/memory.fill (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  (local $10 i32)
  block $~lib/util/memory/memset|inlined.0
   local.get $0
   local.set $5
   local.get $1
   local.set $4
   local.get $2
   local.set $3
   i32.const 0
   i32.const 1
   i32.gt_s
   drop
   local.get $3
   i32.eqz
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $3
   i32.add
   i32.const 4
   i32.sub
   local.set $6
   local.get $5
   local.get $4
   i32.store8
   local.get $6
   local.get $4
   i32.store8 offset=3
   local.get $3
   i32.const 2
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $4
   i32.store8 offset=1
   local.get $5
   local.get $4
   i32.store8 offset=2
   local.get $6
   local.get $4
   i32.store8 offset=2
   local.get $6
   local.get $4
   i32.store8 offset=1
   local.get $3
   i32.const 6
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $4
   i32.store8 offset=3
   local.get $6
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
   local.set $7
   local.get $5
   local.get $7
   i32.add
   local.set $5
   local.get $3
   local.get $7
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
   local.set $8
   local.get $5
   local.get $3
   i32.add
   i32.const 28
   i32.sub
   local.set $6
   local.get $5
   local.get $8
   i32.store
   local.get $6
   local.get $8
   i32.store offset=24
   local.get $3
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $8
   i32.store offset=4
   local.get $5
   local.get $8
   i32.store offset=8
   local.get $6
   local.get $8
   i32.store offset=16
   local.get $6
   local.get $8
   i32.store offset=20
   local.get $3
   i32.const 24
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $8
   i32.store offset=12
   local.get $5
   local.get $8
   i32.store offset=16
   local.get $5
   local.get $8
   i32.store offset=20
   local.get $5
   local.get $8
   i32.store offset=24
   local.get $6
   local.get $8
   i32.store
   local.get $6
   local.get $8
   i32.store offset=4
   local.get $6
   local.get $8
   i32.store offset=8
   local.get $6
   local.get $8
   i32.store offset=12
   i32.const 24
   local.get $5
   i32.const 4
   i32.and
   i32.add
   local.set $7
   local.get $5
   local.get $7
   i32.add
   local.set $5
   local.get $3
   local.get $7
   i32.sub
   local.set $3
   local.get $8
   i64.extend_i32_u
   local.get $8
   i64.extend_i32_u
   i64.const 32
   i64.shl
   i64.or
   local.set $9
   loop $while-continue|0
    local.get $3
    i32.const 32
    i32.ge_u
    local.set $10
    local.get $10
    if
     local.get $5
     local.get $9
     i64.store
     local.get $5
     local.get $9
     i64.store offset=8
     local.get $5
     local.get $9
     i64.store offset=16
     local.get $5
     local.get $9
     i64.store offset=24
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
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.const 1073741808
  i32.gt_u
  if
   i32.const 432
   i32.const 480
   i32.const 49
   i32.const 43
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
  local.set $3
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $~lib/map/Map<usize,i32>#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
   i32.const 5
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 4
  i32.const 12
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
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
  local.get $0
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<i32>@varargs (param $0 i32) (param $1 i32) (result i32)
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
  call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/Reflect/Reflect.attachStackTrace (param $0 i32)
  local.get $0
  call $assembly/internal/Reflect/attachStackTraceToReflectedValue
 )
 (func $assembly/internal/Actual/Actual.report<i32> (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
 )
 (func $assembly/internal/Expected/Expected.reportFalsy (param $0 i32)
  local.get $0
  call $assembly/internal/Expected/reportExpectedFalsy
 )
 (func $assembly/internal/assert/assert (param $0 i32) (param $1 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.eqz
  if
   local.get $1
   i32.const 544
   i32.const 2
   i32.const 19
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Actual/clearActual
 )
 (func $assembly/internal/Expected/Expected.clear
  call $assembly/internal/Expected/clearExpected
 )
 (func $assembly/internal/Expectation/Expectation<i32>#toBeFalsy (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  call $assembly/internal/Actual/Actual.report<i32>
  local.get $0
  i32.load
  local.set $3
  local.get $3
  call $assembly/internal/Expected/Expected.reportFalsy
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1
  drop
  local.get $2
  i32.const 0
  i32.eq
  local.set $4
  local.get $4
  local.get $3
  i32.xor
  local.get $1
  call $assembly/internal/assert/assert
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|0
  (local $0 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  i32.const 320
  call $assembly/internal/Expectation/Expectation<i32>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (param $0 i32) (param $1 f64) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 16
   i32.const 6
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  f64.const 0
  f64.store offset=8
  local.get $0
  local.get $1
  f64.store offset=8
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<f64> (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<f64> (param $0 f64) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 3
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 0
  else
   i32.const 0
  end
  drop
  i32.const 1
  i32.const 8
  i32.const 8
  i32.const 704
  local.get $0
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<f64>@varargs (param $0 f64) (param $1 i32) (result i32)
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
  call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/Actual/Actual.report<f64> (param $0 f64)
  (local $1 i32)
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
 )
 (func $assembly/internal/Expectation/Expectation<f64>#toBeFalsy (param $0 i32) (param $1 i32)
  (local $2 f64)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  f64.load offset=8
  local.set $2
  local.get $2
  call $assembly/internal/Actual/Actual.report<f64>
  local.get $0
  i32.load
  local.set $3
  local.get $3
  call $assembly/internal/Expected/Expected.reportFalsy
  i32.const 0
  drop
  i32.const 1
  drop
  local.get $2
  local.get $2
  f64.ne
  local.tee $4
  if (result i32)
   local.get $4
  else
   local.get $2
   f64.const 0
   f64.eq
  end
  local.set $4
  local.get $4
  local.get $3
  i32.xor
  local.get $1
  call $assembly/internal/assert/assert
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|1
  (local $0 i32)
  f64.const 0
  call $assembly/internal/Expectation/expect<f64>
  local.tee $0
  i32.const 624
  call $assembly/internal/Expectation/Expectation<f64>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<i32>#get:not (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|2
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.tee $1
  i32.const 816
  call $assembly/internal/Expectation/Expectation<i32>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<f64>#get:not (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|3
  (local $0 i32)
  (local $1 i32)
  f64.const 0
  call $assembly/internal/Expectation/expect<f64>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.tee $1
  i32.const 816
  call $assembly/internal/Expectation/Expectation<f64>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<bool>#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 5
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
  i32.store8 offset=4
  local.get $0
  local.get $1
  i32.store8 offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<bool> (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<bool>#constructor
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<bool> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 0
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  i32.const 0
  i32.const 1
  i32.const 9
  i32.const 1040
  local.get $0
  f64.convert_i32_u
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<bool>@varargs (param $0 i32) (param $1 i32) (result i32)
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
  call $assembly/internal/Reflect/Reflect.toReflectedValue<bool>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/Actual/Actual.report<bool> (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<bool>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
 )
 (func $assembly/internal/Expectation/Expectation<bool>#toBeFalsy (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.load8_u offset=4
  local.set $2
  local.get $2
  call $assembly/internal/Actual/Actual.report<bool>
  local.get $0
  i32.load
  local.set $3
  local.get $3
  call $assembly/internal/Expected/Expected.reportFalsy
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1
  drop
  local.get $2
  i32.const 0
  i32.ne
  i32.const 0
  i32.eq
  local.set $4
  local.get $4
  local.get $3
  i32.xor
  local.get $1
  call $assembly/internal/assert/assert
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|4
  (local $0 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<bool>
  local.tee $0
  i32.const 960
  call $assembly/internal/Expectation/Expectation<bool>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<bool>#get:not (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|5
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<bool>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<bool>#get:not
  local.tee $1
  i32.const 816
  call $assembly/internal/Expectation/Expectation<bool>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|6
  (local $0 i32)
  (local $1 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<i32>#get:not
  local.tee $1
  i32.const 1312
  call $assembly/internal/Expectation/Expectation<i32>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|7
  (local $0 i32)
  (local $1 i32)
  f64.const 1
  call $assembly/internal/Expectation/expect<f64>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.tee $1
  i32.const 1360
  call $assembly/internal/Expectation/Expectation<f64>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|8
  (local $0 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  i32.const 816
  call $assembly/internal/Expectation/Expectation<i32>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|9
  (local $0 i32)
  f64.const 1
  call $assembly/internal/Expectation/expect<f64>
  local.tee $0
  i32.const 816
  call $assembly/internal/Expectation/Expectation<f64>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|10
  (local $0 i32)
  (local $1 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<bool>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<bool>#get:not
  local.tee $1
  i32.const 1584
  call $assembly/internal/Expectation/Expectation<bool>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|11
  (local $0 i32)
  i32.const 1
  call $assembly/internal/Expectation/expect<bool>
  local.tee $0
  i32.const 816
  call $assembly/internal/Expectation/Expectation<bool>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|12
  (local $0 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.tee $0
  i32.const 1888
  call $assembly/internal/Expectation/Expectation<f64>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|13
  (local $0 i32)
  (local $1 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.tee $1
  i32.const 816
  call $assembly/internal/Expectation/Expectation<f64>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
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
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3 | null> (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#constructor
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $~lib/util/hash/hash32 (param $0 i32) (result i32)
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
 (func $~lib/map/Map<usize,i32>#find (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/map/Map<usize,i32>#has (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<usize>|inlined.0 (result i32)
   local.get $1
   local.set $2
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 4
   i32.const 1
   i32.eq
   drop
   i32.const 4
   i32.const 2
   i32.eq
   drop
   i32.const 4
   i32.const 4
   i32.eq
   drop
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<usize>|inlined.0
  end
  call $~lib/map/Map<usize,i32>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/map/Map<usize,i32>#get (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<usize>|inlined.1 (result i32)
   local.get $1
   local.set $2
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 4
   i32.const 1
   i32.eq
   drop
   i32.const 4
   i32.const 2
   i32.eq
   drop
   i32.const 4
   i32.const 4
   i32.eq
   drop
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<usize>|inlined.1
  end
  call $~lib/map/Map<usize,i32>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 2240
   i32.const 2304
   i32.const 104
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.load offset=4
 )
 (func $assembly/internal/RTrace/RTrace.sizeOf (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $~lib/map/Map<usize,i32>#rehash (param $0 i32) (param $1 i32)
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
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 4
      i32.const 1
      i32.eq
      drop
      i32.const 4
      i32.const 2
      i32.eq
      drop
      i32.const 4
      i32.const 4
      i32.eq
      drop
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
 (func $~lib/map/Map<usize,i32>#set (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $~lib/util/hash/HASH<usize>|inlined.2 (result i32)
   local.get $1
   local.set $3
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 4
   i32.const 1
   i32.eq
   drop
   i32.const 4
   i32.const 2
   i32.eq
   drop
   i32.const 4
   i32.const 4
   i32.eq
   drop
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
   i32.const 0
   drop
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
 (func $~lib/util/memory/memcpy (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/memory/memory.copy (param $0 i32) (param $1 i32) (param $2 i32)
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
   i32.const 0
   i32.const 1
   i32.lt_s
   drop
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
    i32.const 0
    i32.const 2
    i32.lt_s
    drop
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
    i32.const 0
    i32.const 2
    i32.lt_s
    drop
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
 (func $~lib/rt/__allocBuffer (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/staticarray/StaticArray<i64>#get:length (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 3
  i32.shr_u
 )
 (func $~lib/staticarray/StaticArray<i64>#indexOf (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
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
 (func $~lib/staticarray/StaticArray<i64>#includes (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  i32.const 0
  drop
  local.get $0
  local.get $1
  local.get $2
  call $~lib/staticarray/StaticArray<i64>#indexOf
  i32.const 0
  i32.ge_s
  return
 )
 (func $~lib/string/String#get:length (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
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
   i32.const 2400
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
  i32.const 0
  i32.eqz
  drop
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
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1
  drop
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
  i32.const 2400
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
 (func $assembly/__tests__/setup/Vec3/Vec3#__aspectAddReflectedValueKeyValuePairs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  drop
  local.get $3
  i64.const 4685345497827770368
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2368
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
   i32.const 2432
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
   i32.const 2464
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
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3 | null> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 3
   i32.const 2208
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
  i32.const 0
  i32.eqz
  drop
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
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.const 1
  i32.const 24
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 3
  i32.const 2208
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
  i32.const 9
  i32.const 2352
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
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3 | null>@varargs (param $0 i32) (param $1 i32) (result i32)
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
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3 | null>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/Actual/Actual.report<assembly/__tests__/setup/Vec3/Vec3 | null> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3 | null>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#toBeFalsy (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $2
  call $assembly/internal/Actual/Actual.report<assembly/__tests__/setup/Vec3/Vec3 | null>
  local.get $0
  i32.load
  local.set $3
  local.get $3
  call $assembly/internal/Expected/Expected.reportFalsy
  i32.const 1
  drop
  i32.const 0
  drop
  local.get $2
  i32.const 0
  i32.eq
  local.set $4
  local.get $4
  local.get $3
  i32.xor
  local.get $1
  call $assembly/internal/assert/assert
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|14
  (local $0 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3 | null>
  local.tee $0
  i32.const 2160
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#get:not (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|15
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3 | null>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#get:not
  local.tee $1
  i32.const 816
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|16
  (local $0 i32)
  (local $1 i32)
  global.get $assembly/__tests__/toBeFalsy.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3 | null>
  local.tee $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#get:not
  local.tee $1
  i32.const 2720
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0~anonymous|17
  (local $0 i32)
  global.get $assembly/__tests__/toBeFalsy.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3 | null>
  local.tee $0
  i32.const 816
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3 | null>#toBeFalsy
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/toBeFalsy.spec~anonymous|0
  i32.const 240
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 240
  i32.const 2
  call $assembly/internal/Test/it
  i32.const 736
  i32.const 3
  i32.const 832
  call $assembly/internal/Test/throws
  i32.const 736
  i32.const 4
  i32.const 832
  call $assembly/internal/Test/throws
  i32.const 880
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1072
  i32.const 6
  i32.const 1152
  call $assembly/internal/Test/throws
  i32.const 1200
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1200
  i32.const 8
  call $assembly/internal/Test/it
  i32.const 1408
  i32.const 9
  i32.const 1312
  call $assembly/internal/Test/throws
  i32.const 1408
  i32.const 10
  i32.const 1360
  call $assembly/internal/Test/throws
  i32.const 1488
  i32.const 11
  call $assembly/internal/Test/it
  i32.const 1664
  i32.const 12
  i32.const 1744
  call $assembly/internal/Test/throws
  i32.const 1808
  i32.const 13
  call $assembly/internal/Test/it
  i32.const 1952
  i32.const 14
  i32.const 2032
  call $assembly/internal/Test/throws
  i32.const 2080
  i32.const 15
  call $assembly/internal/Test/it
  i32.const 2496
  i32.const 16
  i32.const 2160
  call $assembly/internal/Test/throws
  i32.const 2592
  i32.const 17
  call $assembly/internal/Test/it
  i32.const 2816
  i32.const 18
  i32.const 2720
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/__tests__/toBeFalsy.spec
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toBeFalsy.spec/vec1
  i32.const 192
  i32.const 19
  call $assembly/internal/Test/describe
 )
 (func $start:assembly/internal/noOp~anonymous|0
  nop
 )
 (func $assembly/internal/call/__call (param $0 i32)
  i32.const 0
  global.set $~argumentsLength
  local.get $0
  call_indirect (type $none_=>_none)
 )
 (func $assembly/internal/log/__ignoreLogs (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/log/ignoreLogs
 )
 (func $assembly/internal/RTrace/__disableRTrace
  i32.const 0
  global.set $assembly/internal/RTrace/RTrace.enabled
 )
 (func $assembly/internal/RTrace/__getUsizeArrayId (result i32)
  i32.const 10
 )
 (func $~start
  global.get $~started
  if
   return
  else
   i32.const 1
   global.set $~started
  end
  call $start:assembly/__tests__/toBeFalsy.spec
 )
 (func $~lib/rt/pure/__collect
  i32.const 1
  drop
  return
 )
 (func $~lib/rt/tlsf/freeBlock (param $0 i32) (param $1 i32)
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
  i32.const 1
  drop
  local.get $1
  call $~lib/rt/rtrace/onfree
 )
 (func $~lib/rt/pure/finalize (param $0 i32)
  i32.const 0
  drop
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  call $~lib/rt/tlsf/freeBlock
 )
 (func $~lib/rt/pure/decrement (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 268435455
  i32.and
  local.set $2
  i32.const 1
  drop
  local.get $0
  call $~lib/rt/rtrace/ondecrement
  i32.const 1
  drop
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
   i32.const 14
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
   i32.const 1
   drop
   i32.const 1
   drop
   local.get $1
   i32.const -2147483648
   i32.and
   i32.eqz
   i32.eqz
   if
    i32.const 0
    i32.const 144
    i32.const 126
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   call $~lib/rt/pure/finalize
  else
   i32.const 1
   drop
   local.get $2
   i32.const 0
   i32.gt_u
   i32.eqz
   if
    i32.const 0
    i32.const 144
    i32.const 136
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   i32.const 1
   drop
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
 (func $~lib/rt/pure/__visit (param $0 i32) (param $1 i32)
  local.get $0
  global.get $~lib/heap/__heap_base
  i32.lt_u
  if
   return
  end
  i32.const 1
  drop
  i32.const 1
  drop
  local.get $1
  i32.const 1
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 144
   i32.const 69
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.sub
  call $~lib/rt/pure/decrement
 )
 (func $~lib/map/Map<usize,i32>#__visit_impl (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/pure/__visit
  local.get $0
  i32.load offset=8
  local.set $2
  i32.const 0
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  local.get $2
  local.get $1
  call $~lib/rt/pure/__visit
 )
 (func $~lib/staticarray/StaticArray<i64>#__visit_impl (param $0 i32) (param $1 i32)
  i32.const 0
  drop
 )
 (func $~lib/array/Array<usize>#__visit_impl (param $0 i32) (param $1 i32)
  i32.const 0
  drop
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/pure/__visit
 )
 (func $~lib/rt/__visit_members (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $switch$1$default
   block $switch$1$case$12
    block $switch$1$case$11
     block $switch$1$case$10
      block $switch$1$case$7
       block $switch$1$case$4
        block $switch$1$case$2
         local.get $0
         i32.const 8
         i32.sub
         i32.load
         br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$2 $switch$1$case$2 $switch$1$case$7 $switch$1$case$2 $switch$1$case$2 $switch$1$case$10 $switch$1$case$11 $switch$1$case$12 $switch$1$default
        end
        return
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
      end
      local.get $0
      local.get $1
      call $~lib/map/Map<usize,i32>#__visit_impl
      return
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
    call $~lib/staticarray/StaticArray<i64>#__visit_impl
    return
   end
   local.get $0
   local.get $1
   call $~lib/array/Array<usize>#__visit_impl
   return
  end
  unreachable
 )
)
