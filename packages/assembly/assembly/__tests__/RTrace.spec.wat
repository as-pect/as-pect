(module
 (type $none_=>_none (func))
 (type $i32_=>_none (func (param i32)))
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (type $i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_=>_i32 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $i32_f64_f64_f64_=>_i32 (func (param i32 f64 f64 f64) (result i32)))
 (import "env" "memory" (memory $0 1))
 (data (i32.const 16) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00")
 (data (i32.const 64) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00a\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00")
 (data (i32.const 128) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00p\00u\00r\00e\00.\00t\00s\00")
 (data (i32.const 176) "\0c\00\00\00\01\00\00\00\01\00\00\00\0c\00\00\00R\00T\00r\00a\00c\00e\00")
 (data (i32.const 208) "~\00\00\00\01\00\00\00\01\00\00\00~\00\00\00s\00h\00o\00u\00l\00d\00 \00s\00t\00a\00r\00t\00 \00a\00n\00d\00 \00e\00n\00d\00 \00w\00i\00t\00h\00 \00t\00h\00e\00 \00c\00o\00r\00r\00e\00c\00t\00 \00d\00e\00l\00t\00a\00 \00i\00n\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00c\00o\00u\00n\00t\00s\00")
 (data (i32.const 352) "L\00\00\00\01\00\00\00\01\00\00\00L\00\00\00R\00T\00r\00a\00c\00e\00 \00c\00o\00u\00n\00t\00s\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00g\00r\00e\00a\00t\00e\00r\00 \00t\00h\00a\00n\00 \000\00")
 (data (i32.const 448) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00i\003\002\00")
 (data (i32.const 480) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 528) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 592) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00a\00s\00s\00e\00r\00t\00.\00t\00s\00")
 (data (i32.const 672) "`\00\00\00\01\00\00\00\01\00\00\00`\00\00\00d\00e\00l\00t\00a\00 \00f\00r\00o\00m\00 \00R\00T\00r\00a\00c\00e\00.\00e\00n\00d\00(\00)\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00g\00r\00e\00a\00t\00e\00r\00 \00t\00h\00a\00n\00 \000\00")
 (data (i32.const 784) ">\00\00\00\01\00\00\00\01\00\00\00>\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \00a\00 \00p\00o\00s\00i\00t\00i\00v\00e\00 \00n\00u\00m\00b\00e\00r\00")
 (data (i32.const 864) "h\00\00\00\01\00\00\00\01\00\00\00h\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \00a\00 \00c\00o\00r\00r\00e\00c\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00c\00o\00u\00n\00t\00 \00o\00f\00 \00a\00 \00p\00o\00i\00n\00t\00e\00r\00")
 (data (i32.const 992) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00u\003\002\00")
 (data (i32.const 1024) "\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00")
 (data (i32.const 1040) "l\00\00\00\01\00\00\00\01\00\00\00l\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \00a\00 \00c\00o\00r\00r\00e\00c\00t\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00c\00o\00u\00n\00t\00 \00o\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 1168) "z\00\00\00\01\00\00\00\01\00\00\00z\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \000\00 \00f\00o\00r\00 \00t\00h\00e\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00c\00o\00u\00n\00t\00 \00o\00f\00 \00a\00n\00 \00u\00n\00m\00a\00n\00a\00g\00e\00d\00 \00c\00l\00a\00s\00s\00")
 (data (i32.const 1312) "R\00\00\00\01\00\00\00\01\00\00\00R\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \00a\00 \00c\00o\00r\00r\00e\00c\00t\00 \00s\00i\00z\00e\00 \00o\00f\00 \00a\00 \00p\00o\00i\00n\00t\00e\00r\00")
 (data (i32.const 1424) "V\00\00\00\01\00\00\00\01\00\00\00V\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \00a\00 \00c\00o\00r\00r\00e\00c\00t\00 \00s\00i\00z\00e\00 \00o\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 1536) "d\00\00\00\01\00\00\00\01\00\00\00d\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \00a\00 \00c\00o\00r\00r\00e\00c\00t\00 \00s\00i\00z\00e\00 \00o\00f\00 \00a\00n\00 \00u\00n\00m\00a\00n\00a\00g\00e\00d\00 \00c\00l\00a\00s\00s\00")
 (data (i32.const 1664) "X\00\00\00\01\00\00\00\01\00\00\00X\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \00a\00 \00c\00o\00r\00r\00e\00c\00t\00 \00t\00y\00p\00e\00 \00i\00d\00 \00o\00f\00 \00a\00 \00p\00o\00i\00n\00t\00e\00r\00")
 (data (i32.const 1776) "\\\00\00\00\01\00\00\00\01\00\00\00\\\00\00\00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \00a\00 \00c\00o\00r\00r\00e\00c\00t\00 \00t\00y\00p\00e\00 \00i\00d\00 \00o\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 1888) "P\00\00\00\01\00\00\00\01\00\00\00P\00\00\00w\00h\00e\00n\00 \00n\00u\00l\00l\00 \00i\00s\00 \00p\00a\00s\00s\00e\00d\00 \00t\00o\00 \00t\00y\00p\00e\00I\00d\00O\00f\00R\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 1984) "X\00\00\00\01\00\00\00\01\00\00\00X\00\00\00C\00a\00n\00n\00o\00t\00 \00g\00e\00t\00 \00t\00y\00p\00e\00I\00d\00 \00o\00f\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00h\00a\00t\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2096) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00R\00T\00r\00a\00c\00e\00.\00t\00s\00")
 (data (i32.const 2176) "r\00\00\00\01\00\00\00\01\00\00\00r\00\00\00N\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00v\00a\00l\00i\00d\00 \00p\00a\00r\00a\00m\00e\00t\00e\00r\00 \00v\00a\00l\00u\00e\00 \00f\00o\00r\00 \00t\00y\00p\00e\00I\00d\00O\00f\00R\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 2320) "T\00\00\00\01\00\00\00\01\00\00\00T\00\00\00w\00h\00e\00n\00 \00n\00u\00l\00l\00 \00i\00s\00 \00p\00a\00s\00s\00e\00d\00 \00t\00o\00 \00r\00e\00f\00C\00o\00u\00n\00t\00O\00f\00R\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 2432) "\\\00\00\00\01\00\00\00\01\00\00\00\\\00\00\00C\00a\00n\00n\00o\00t\00 \00g\00e\00t\00 \00r\00e\00f\00C\00o\00u\00n\00t\00 \00o\00f\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00h\00a\00t\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2544) "v\00\00\00\01\00\00\00\01\00\00\00v\00\00\00N\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00v\00a\00l\00i\00d\00 \00p\00a\00r\00a\00m\00e\00t\00e\00r\00 \00v\00a\00l\00u\00e\00 \00f\00o\00r\00 \00r\00e\00f\00C\00o\00u\00n\00t\00O\00f\00R\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 2688) "L\00\00\00\01\00\00\00\01\00\00\00L\00\00\00w\00h\00e\00n\00 \00n\00u\00l\00l\00 \00i\00s\00 \00p\00a\00s\00s\00e\00d\00 \00t\00o\00 \00s\00i\00z\00e\00O\00f\00R\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 2784) "T\00\00\00\01\00\00\00\01\00\00\00T\00\00\00C\00a\00n\00n\00o\00t\00 \00g\00e\00t\00 \00s\00i\00z\00e\00 \00o\00f\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00h\00a\00t\00 \00i\00s\00 \00n\00u\00l\00l\00.\00")
 (data (i32.const 2896) "n\00\00\00\01\00\00\00\01\00\00\00n\00\00\00N\00u\00l\00l\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00v\00a\00l\00i\00d\00 \00p\00a\00r\00a\00m\00e\00t\00e\00r\00 \00v\00a\00l\00u\00e\00 \00f\00o\00r\00 \00s\00i\00z\00e\00O\00f\00R\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 3024) "\n\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\98\04\01\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93\00\00\00\02\00\00\00")
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "rtrace" "onalloc" (func $~lib/rt/rtrace/onalloc (param i32)))
 (import "rtrace" "onincrement" (func $~lib/rt/rtrace/onincrement (param i32)))
 (import "__aspect" "startRTrace" (func $assembly/internal/RTrace/startRTrace (param i32)))
 (import "__aspect" "getRTraceCount" (func $assembly/internal/RTrace/getRTraceCount (result i32)))
 (import "__aspect" "createReflectedValue" (func $assembly/internal/Reflect/createReflectedValue (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (import "__aspect" "attachStackTraceToReflectedValue" (func $assembly/internal/Reflect/attachStackTraceToReflectedValue (param i32)))
 (import "__aspect" "reportActualReflectedValue" (func $assembly/internal/Actual/reportActualReflectedValue (param i32)))
 (import "__aspect" "reportInvalidExpectCall" (func $assembly/internal/Expected/reportInvalidExpectCall))
 (import "__aspect" "reportExpectedReflectedValue" (func $assembly/internal/Expected/reportExpectedReflectedValue (param i32 i32)))
 (import "__aspect" "clearActual" (func $assembly/internal/Actual/clearActual))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expected/clearExpected))
 (import "__aspect" "endRTrace" (func $assembly/internal/RTrace/endRTrace (param i32) (result i32)))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (import "rtrace" "ondecrement" (func $~lib/rt/rtrace/ondecrement (param i32)))
 (import "rtrace" "onfree" (func $~lib/rt/rtrace/onfree (param i32)))
 (table $0 16 funcref)
 (elem (i32.const 1) $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|12 $start:assembly/__tests__/RTrace.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $~lib/gc/gc.auto (mut i32) (i32.const 1))
 (global $assembly/__tests__/RTrace.spec/globalVec (mut i32) (i32.const 0))
 (global $assembly/internal/RTrace/RTrace.enabled (mut i32) (i32.const 1))
 (global $assembly/internal/Expected/Expected.ready (mut i32) (i32.const 0))
 (global $assembly/internal/Reflect/Reflect.FAILED_MATCH i32 (i32.const 0))
 (global $assembly/internal/Reflect/Reflect.SUCCESSFUL_MATCH i32 (i32.const 1))
 (global $assembly/internal/Reflect/Reflect.DEFER_MATCH i32 (i32.const 2))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/ASC_OPTIMIZE_LEVEL i32 (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 15))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $assembly/internal/log/ignoreLogs (mut i32) (i32.const 0))
 (global $~started (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 3024))
 (global $~lib/heap/__heap_base i32 (i32.const 3108))
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
 (export "__ignoreLogs" (func $assembly/internal/log/__ignoreLogs))
 (export "__disableRTrace" (func $assembly/internal/RTrace/__disableRTrace))
 (export "__getUsizeArrayId" (func $assembly/internal/RTrace/__getUsizeArrayId))
 (func $~lib/rt/tlsf/removeBlock (; 19 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/insertBlock (; 20 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/addMemory (; 21 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/maybeInitialize (; 22 ;) (result i32)
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
 (func $~lib/rt/tlsf/prepareSize (; 23 ;) (param $0 i32) (result i32)
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
 (func $~lib/rt/tlsf/searchBlock (; 24 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/rt/tlsf/growMemory (; 25 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/prepareBlock (; 26 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/allocateBlock (; 27 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/__alloc (; 28 ;) (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/allocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/rt/pure/increment (; 29 ;) (param $0 i32)
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
 (func $~lib/rt/pure/__retain (; 30 ;) (param $0 i32) (result i32)
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
 (func $~lib/rt/pure/__release (; 31 ;) (param $0 i32)
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
 (func $assembly/internal/RTrace/RTrace.start (; 32 ;) (param $0 i32)
  global.get $assembly/internal/RTrace/RTrace.enabled
  if
   local.get $0
   call $assembly/internal/RTrace/startRTrace
  end
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 33 ;) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
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
 (func $assembly/internal/RTrace/RTrace.count (; 34 ;) (result i32)
  global.get $assembly/internal/RTrace/RTrace.enabled
  if
   call $assembly/internal/RTrace/getRTraceCount
   return
  end
  i32.const 0
 )
 (func $assembly/internal/Expectation/Expectation<i32>#constructor (; 35 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $assembly/internal/Expectation/expect<i32> (; 36 ;) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<i32>#constructor
 )
 (func $assembly/internal/Box/Box<i32>#constructor (; 37 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 6
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store
  local.get $0
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<i32> (; 38 ;) (param $0 i32) (param $1 i32) (result i32)
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
  i32.const 464
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
 (func $~lib/memory/memory.fill (; 39 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 40 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.const 1073741808
  i32.gt_u
  if
   i32.const 496
   i32.const 544
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
 (func $~lib/map/Map<usize,i32>#clear (; 41 ;) (param $0 i32)
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
 (func $~lib/map/Map<usize,i32>#constructor (; 42 ;) (param $0 i32) (result i32)
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
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<i32>|trampoline (; 43 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~setArgumentsLength (; 44 ;) (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $assembly/internal/Reflect/Reflect.attachStackTrace (; 45 ;) (param $0 i32)
  local.get $0
  call $assembly/internal/Reflect/attachStackTraceToReflectedValue
 )
 (func $assembly/internal/Actual/Actual.report<i32> (; 46 ;) (param $0 i32)
  (local $1 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>|trampoline
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
 )
 (func $assembly/internal/Expected/Expected.report<i32> (; 47 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  global.get $assembly/internal/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/Expected/reportInvalidExpectCall
   return
  end
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>|trampoline
  local.set $2
  local.get $2
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $2
  local.get $1
  call $assembly/internal/Expected/reportExpectedReflectedValue
 )
 (func $assembly/internal/assert/assert (; 48 ;) (param $0 i32) (param $1 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.eqz
  if
   local.get $1
   call $~lib/rt/pure/__release
   local.get $1
   i32.const 608
   i32.const 9
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Actual/Actual.clear (; 49 ;)
  call $assembly/internal/Actual/clearActual
 )
 (func $assembly/internal/Expected/Expected.clear (; 50 ;)
  call $assembly/internal/Expected/clearExpected
 )
 (func $assembly/internal/Expectation/Expectation<i32>#toBeGreaterThan (; 51 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.load offset=4
  local.set $3
  local.get $0
  i32.load
  local.set $4
  local.get $3
  call $assembly/internal/Actual/Actual.report<i32>
  local.get $1
  local.get $4
  call $assembly/internal/Expected/Expected.report<i32>
  local.get $4
  local.get $3
  local.get $1
  i32.gt_s
  i32.xor
  local.get $2
  call $assembly/internal/assert/assert
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/RTrace/RTrace.end (; 52 ;) (param $0 i32) (result i32)
  global.get $assembly/internal/RTrace/RTrace.enabled
  if
   local.get $0
   call $assembly/internal/RTrace/endRTrace
   return
  end
  i32.const 0
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|0 (; 53 ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1
  call $assembly/internal/RTrace/RTrace.start
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  local.set $0
  global.get $assembly/__tests__/RTrace.spec/globalVec
  call $~lib/rt/pure/__release
  local.get $0
  global.set $assembly/__tests__/RTrace.spec/globalVec
  call $assembly/internal/RTrace/RTrace.count
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  i32.const 0
  i32.const 368
  call $assembly/internal/Expectation/Expectation<i32>#toBeGreaterThan
  i32.const 1
  call $assembly/internal/RTrace/RTrace.end
  local.set $1
  local.get $1
  call $assembly/internal/Expectation/expect<i32>
  local.tee $2
  i32.const 0
  i32.const 688
  call $assembly/internal/Expectation/Expectation<i32>#toBeGreaterThan
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Test/it (; 54 ;) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|1 (; 55 ;)
  (local $0 i32)
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  local.set $0
  global.get $assembly/__tests__/RTrace.spec/globalVec
  call $~lib/rt/pure/__release
  local.get $0
  global.set $assembly/__tests__/RTrace.spec/globalVec
  call $assembly/internal/RTrace/RTrace.count
  call $assembly/internal/Expectation/expect<i32>
  local.tee $0
  i32.const 0
  i32.const 368
  call $assembly/internal/Expectation/Expectation<i32>#toBeGreaterThan
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/RTrace/RTrace.refCountOf (; 56 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=4
  i32.const 268435455
  i32.and
 )
 (func $assembly/internal/Expectation/Expectation<u32>#constructor (; 57 ;) (param $0 i32) (param $1 i32) (result i32)
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
  local.get $1
  i32.store offset=4
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<u32> (; 58 ;) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<u32>#constructor
 )
 (func $assembly/internal/Box/Box<u32>#constructor (; 59 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 8
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store
  local.get $0
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<u32> (; 60 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  local.get $0
  call $assembly/internal/Box/Box<u32>#constructor
  local.set $2
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $2
  i32.const 0
  i32.const 4
  i32.const 7
  i32.const 0
  i32.const 1008
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
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<u32>|trampoline (; 61 ;) (param $0 i32) (param $1 i32) (result i32)
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
  call $assembly/internal/Reflect/Reflect.toReflectedValue<u32>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/Actual/Actual.report<u32> (; 62 ;) (param $0 i32)
  (local $1 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<u32>|trampoline
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/Actual/reportActualReflectedValue
 )
 (func $assembly/internal/Expected/Expected.report<u32> (; 63 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  global.get $assembly/internal/Expected/Expected.ready
  i32.eqz
  if
   call $assembly/internal/Expected/reportInvalidExpectCall
   return
  end
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<u32>|trampoline
  local.set $2
  local.get $2
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $2
  local.get $1
  call $assembly/internal/Expected/reportExpectedReflectedValue
 )
 (func $assembly/internal/Expectation/Expectation<u32>#toBe (; 64 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  i32.eq
  local.set $3
  local.get $0
  i32.load offset=4
  call $assembly/internal/Actual/Actual.report<u32>
  local.get $1
  i32.const 0
  call $assembly/internal/Expected/Expected.report<u32>
  local.get $3
  local.get $0
  i32.load
  i32.xor
  local.get $2
  call $assembly/internal/assert/assert
  call $assembly/internal/Actual/Actual.clear
  call $assembly/internal/Expected/Expected.clear
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|2 (; 65 ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 24
  i32.const 3
  call $~lib/rt/tlsf/__alloc
  local.set $0
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const 5
   i32.lt_s
   local.set $2
   local.get $2
   if
    local.get $0
    call $~lib/rt/pure/__retain
    drop
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  call $assembly/internal/RTrace/RTrace.refCountOf
  call $assembly/internal/Expectation/expect<u32>
  local.tee $1
  i32.const 5
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   i32.const 3
   i32.lt_s
   local.set $3
   local.get $3
   if
    local.get $0
    call $~lib/rt/pure/__release
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
  local.get $0
  call $assembly/internal/RTrace/RTrace.refCountOf
  call $assembly/internal/Expectation/expect<u32>
  local.tee $2
  i32.const 2
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  i32.const 0
  local.set $3
  loop $for-loop|2
   local.get $3
   i32.const 2
   i32.lt_s
   local.set $4
   local.get $4
   if
    local.get $0
    call $~lib/rt/pure/__release
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|2
   end
  end
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/RTrace/RTrace.refCountOfReference<assembly/__tests__/setup/Vec3/Vec3> (; 66 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.refCountOf
  local.set $1
  local.get $1
  i32.const 1
  i32.sub
  local.set $2
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|3 (; 67 ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.refCountOfReference<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/expect<u32>
  local.tee $1
  i32.const 1
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   i32.const 5
   i32.lt_s
   local.set $3
   local.get $3
   if
    local.get $0
    call $~lib/rt/pure/__retain
    drop
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $0
  call $assembly/internal/RTrace/RTrace.refCountOfReference<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/expect<u32>
  local.tee $2
  i32.const 6
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  i32.const 0
  local.set $3
  loop $for-loop|1
   local.get $3
   i32.const 3
   i32.lt_s
   local.set $4
   local.get $4
   if
    local.get $0
    call $~lib/rt/pure/__release
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $0
  call $assembly/internal/RTrace/RTrace.refCountOfReference<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/expect<u32>
  local.tee $3
  i32.const 3
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  i32.const 0
  local.set $4
  loop $for-loop|2
   local.get $4
   i32.const 2
   i32.lt_s
   local.set $5
   local.get $5
   if
    local.get $0
    call $~lib/rt/pure/__release
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|2
   end
  end
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/RTrace.spec/TestUnmanaged#constructor (; 68 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/tlsf/__alloc
   local.set $0
  end
  local.get $0
 )
 (func $assembly/internal/RTrace/RTrace.refCountOfReference<assembly/__tests__/RTrace.spec/TestUnmanaged> (; 69 ;) (param $0 i32) (result i32)
  i32.const 0
  return
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|4 (; 70 ;)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/__tests__/RTrace.spec/TestUnmanaged#constructor
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.refCountOfReference<assembly/__tests__/RTrace.spec/TestUnmanaged>
  call $assembly/internal/Expectation/expect<u32>
  local.tee $1
  i32.const 0
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/RTrace/RTrace.sizeOf (; 71 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|5 (; 72 ;)
  (local $0 i32)
  (local $1 i32)
  i32.const 24
  i32.const 3
  call $~lib/rt/tlsf/__alloc
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  call $assembly/internal/Expectation/expect<u32>
  local.tee $1
  i32.const 24
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/RTrace/RTrace.sizeOfReference<assembly/__tests__/setup/Vec3/Vec3> (; 73 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|6 (; 74 ;)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOfReference<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/expect<u32>
  local.tee $1
  i32.const 24
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/RTrace/RTrace.sizeOfReference<assembly/__tests__/RTrace.spec/TestUnmanaged> (; 75 ;) (param $0 i32) (result i32)
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|7 (; 76 ;)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $assembly/__tests__/RTrace.spec/TestUnmanaged#constructor
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOfReference<assembly/__tests__/RTrace.spec/TestUnmanaged>
  call $assembly/internal/Expectation/expect<u32>
  local.tee $1
  i32.const 0
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/RTrace/RTrace.typeIdOf (; 77 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=8
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|8 (; 78 ;)
  (local $0 i32)
  (local $1 i32)
  i32.const 24
  i32.const 3
  call $~lib/rt/tlsf/__alloc
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.typeIdOf
  call $assembly/internal/Expectation/expect<u32>
  local.tee $1
  i32.const 3
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/RTrace/RTrace.typeIdOfReference<assembly/__tests__/setup/Vec3/Vec3> (; 79 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.typeIdOf
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|9 (; 80 ;)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  local.set $0
  local.get $0
  call $assembly/internal/RTrace/RTrace.typeIdOfReference<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/expect<u32>
  local.tee $1
  i32.const 3
  i32.const 1040
  call $assembly/internal/Expectation/Expectation<u32>#toBe
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/RTrace/RTrace.typeIdOfReference<assembly/__tests__/setup/Vec3/Vec3 | null> (; 81 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2000
   i32.const 2112
   i32.const 259
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/RTrace/RTrace.typeIdOf
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|10 (; 82 ;)
  i32.const 0
  call $assembly/internal/RTrace/RTrace.typeIdOfReference<assembly/__tests__/setup/Vec3/Vec3 | null>
  drop
 )
 (func $assembly/internal/Test/throws (; 83 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $assembly/internal/RTrace/RTrace.refCountOfReference<assembly/__tests__/setup/Vec3/Vec3 | null> (; 84 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2448
   i32.const 2112
   i32.const 335
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/RTrace/RTrace.refCountOf
  local.set $1
  local.get $1
  i32.const 1
  i32.sub
  local.set $2
  local.get $0
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|11 (; 85 ;)
  i32.const 0
  call $assembly/internal/RTrace/RTrace.refCountOfReference<assembly/__tests__/setup/Vec3/Vec3 | null>
  drop
 )
 (func $assembly/internal/RTrace/RTrace.sizeOfReference<assembly/__tests__/setup/Vec3/Vec3 | null> (; 86 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  i32.const 0
  i32.ne
  i32.eqz
  if
   i32.const 2800
   i32.const 2112
   i32.const 285
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  local.set $1
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0~anonymous|12 (; 87 ;)
  i32.const 0
  call $assembly/internal/RTrace/RTrace.sizeOfReference<assembly/__tests__/setup/Vec3/Vec3 | null>
  drop
 )
 (func $start:assembly/__tests__/RTrace.spec~anonymous|0 (; 88 ;)
  i32.const 224
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 800
  i32.const 2
  call $assembly/internal/Test/it
  i32.const 880
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 1056
  i32.const 4
  call $assembly/internal/Test/it
  i32.const 1184
  i32.const 5
  call $assembly/internal/Test/it
  i32.const 1328
  i32.const 6
  call $assembly/internal/Test/it
  i32.const 1440
  i32.const 7
  call $assembly/internal/Test/it
  i32.const 1552
  i32.const 8
  call $assembly/internal/Test/it
  i32.const 1680
  i32.const 9
  call $assembly/internal/Test/it
  i32.const 1792
  i32.const 10
  call $assembly/internal/Test/it
  i32.const 1904
  i32.const 11
  i32.const 2192
  call $assembly/internal/Test/throws
  i32.const 2336
  i32.const 12
  i32.const 2560
  call $assembly/internal/Test/throws
  i32.const 2704
  i32.const 13
  i32.const 2912
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 89 ;)
  nop
 )
 (func $assembly/internal/Describe/describe (; 90 ;) (param $0 i32) (param $1 i32)
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
 (func $start:assembly/__tests__/RTrace.spec (; 91 ;)
  i32.const 192
  i32.const 14
  call $assembly/internal/Describe/describe
 )
 (func $assembly/index/__ready (; 92 ;)
  i32.const 1
  global.set $assembly/internal/Expected/Expected.ready
 )
 (func $assembly/internal/call/__call (; 93 ;) (param $0 i32)
  i32.const 0
  global.set $~argumentsLength
  local.get $0
  call_indirect (type $none_=>_none)
 )
 (func $assembly/internal/log/__ignoreLogs (; 94 ;) (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/log/ignoreLogs
 )
 (func $assembly/internal/RTrace/__disableRTrace (; 95 ;)
  i32.const 0
  global.set $assembly/internal/RTrace/RTrace.enabled
 )
 (func $assembly/internal/RTrace/__getUsizeArrayId (; 96 ;) (result i32)
  i32.const 9
 )
 (func $~start (; 97 ;)
  global.get $~started
  if
   return
  else
   i32.const 1
   global.set $~started
  end
  call $start:assembly/__tests__/RTrace.spec
 )
 (func $~lib/rt/pure/__collect (; 98 ;)
  return
 )
 (func $~lib/rt/tlsf/freeBlock (; 99 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/pure/decrement (; 100 ;) (param $0 i32)
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
 (func $~lib/rt/pure/__visit (; 101 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/map/Map<usize,i32>#__visit_impl (; 102 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<usize>#__visit_impl (; 103 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/rt/__visit_members (; 104 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$4$break
   block $switch$1$default
    block $switch$1$case$11
     block $switch$1$case$7
      block $switch$1$case$4
       block $switch$1$case$2
        local.get $0
        i32.const 8
        i32.sub
        i32.load
        br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$2 $switch$1$case$2 $switch$1$case$7 $switch$1$case$2 $switch$1$case$2 $switch$1$case$2 $switch$1$case$11 $switch$1$default
       end
       return
      end
      br $block$4$break
     end
     local.get $0
     local.get $1
     call $~lib/map/Map<usize,i32>#__visit_impl
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
