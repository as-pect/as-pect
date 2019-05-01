(module
 (type $FUNCSIG$iiddd (func (param i32 f64 f64 f64) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$id (func (param f64) (result i32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vd (func (param f64)))
 (type $FUNCSIG$vid (func (param i32 f64)))
 (type $FUNCSIG$vdi (func (param f64 i32)))
 (type $FUNCSIG$ddd (func (param f64 f64) (result f64)))
 (type $FUNCSIG$ddi (func (param f64 i32) (result f64)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "__aspect" "reportActualValue" (func $assembly/internal/Expectation/reportActualFloat (param f64)))
 (import "__aspect" "reportExpectedValue" (func $assembly/internal/Expectation/reportExpectedFloat (param f64 i32)))
 (import "__aspect" "clearExpected" (func $assembly/internal/Expectation/clearExpected))
 (import "__aspect" "reportTest" (func $assembly/internal/Test/reportTest (param i32 i32)))
 (import "__aspect" "reportNegatedTest" (func $assembly/internal/Test/reportNegatedTest (param i32 i32 i32)))
 (import "__aspect" "reportDescribe" (func $assembly/internal/Describe/reportDescribe (param i32)))
 (import "__aspect" "reportEndDescribe" (func $assembly/internal/Describe/reportEndDescribe))
 (memory $0 1)
 (data (i32.const 8) "\10\00\00\00(\00\00\00\00\00\00\00\00\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 64) "\10\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00C\00l\00o\00s\00e\00T\00o\00")
 (data (i32.const 104) "\10\00\00\00F\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00e\00x\00p\00e\00c\00t\00 \00v\00a\00l\00u\00e\00s\00 \00t\00h\00a\00t\00 \00a\00r\00e\00 \00c\00l\00o\00s\00e\00")
 (data (i32.const 192) "\10\00\00\000\00\00\00\00\00\00\00\00\00\00\001\00.\000\000\000\000\000\001\00 \00i\00s\00 \00c\00l\00o\00s\00e\00 \00t\00o\00 \001\00.\000\00")
 (data (i32.const 256) "\10\00\00\00l\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00C\00l\00o\00s\00e\00T\00o\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00m\00u\00s\00t\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00a\00 \00f\00l\00o\00a\00t\00 \00v\00a\00l\00u\00e\00.\00")
 (data (i32.const 384) "\10\00\00\00@\00\00\00\00\00\00\00\00\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00E\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00.\00t\00s\00")
 (data (i32.const 464) "\10\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00C\00l\00o\00s\00e\00T\00o\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00f\00a\00i\00l\00s\00 \00b\00e\00c\00a\00u\00s\00e\00 \00a\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00f\00i\00n\00i\00t\00e\00")
 (data (i32.const 608) "\10\00\00\00\82\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00C\00l\00o\00s\00e\00T\00o\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00 \00f\00a\00i\00l\00s\00 \00b\00e\00c\00a\00u\00s\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00f\00i\00n\00i\00t\00e\00.\00")
 (data (i32.const 760) "\10\00\00\00Z\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00c\00l\00o\00s\00e\00")
 (data (i32.const 872) "\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 888) "\10\00\00\00T\00\00\00\00\00\00\00\00\00\00\001\00.\000\000\000\000\000\001\00 \00i\00s\00 \00c\00l\00o\00s\00e\00 \00t\00o\00 \001\00.\000\00,\00 \00a\00n\00d\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 992) "\10\00\00\00`\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00a\00s\00s\00e\00r\00t\00 \00i\00f\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00c\00l\00o\00s\00e\00")
 (data (i32.const 1104) "\10\00\00\002\00\00\00\00\00\00\00\00\00\00\001\000\000\00.\000\00 \00i\00s\00 \00n\00o\00t\00 \00c\00l\00o\00s\00e\00 \00t\00o\00 \001\00.\000\00")
 (data (i32.const 1176) "\10\00\00\00^\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00c\00l\00o\00s\00e\00")
 (data (i32.const 1288) "\10\00\00\00V\00\00\00\00\00\00\00\00\00\00\001\00.\000\00 \00i\00s\00 \00n\00o\00t\00 \00c\00l\00o\00s\00e\00 \00t\00o\00 \001\000\000\00.\000\00,\00 \00a\00n\00d\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00")
 (data (i32.const 1392) "\10\00\00\00N\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00t\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00N\00a\00N\00")
 (data (i32.const 1488) "\10\00\00\00v\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00N\00a\00N\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1624) "\10\00\00\00z\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00N\00a\00N\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 1768) "\10\00\00\00F\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00b\00o\00t\00h\00 \00v\00a\00l\00u\00e\00s\00 \00a\00r\00e\00 \00N\00a\00N\00")
 (data (i32.const 1856) "\10\00\00\00\88\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00a\00n\00d\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00t\00h\00e\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 2008) "\10\00\00\00\8a\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00v\00a\00l\00u\00e\00 \00N\00a\00N\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00t\00h\00e\00 \00n\00e\00g\00a\00t\00e\00d\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 2168) "\10\00\00\00\98\00\00\00\00\00\00\00\00\00\00\00T\00h\00e\00 \00e\00x\00p\00e\00c\00t\00e\00d\00 \00a\00n\00d\00 \00a\00c\00t\00u\00a\00l\00 \00v\00a\00l\00u\00e\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00u\00s\00e\00 \00t\00h\00e\00 \00n\00e\00g\00a\00t\00e\00d\00 \00e\00x\00p\00e\00c\00t\00a\00t\00i\00o\00n\00 \00t\00o\00 \00t\00h\00r\00o\00w\00.\00")
 (data (i32.const 2336) "\10\00\00\00\88\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00u\00s\00e\00d\00 \00f\00o\00r\00 \00a\00 \00t\00o\00B\00e\00C\00l\00o\00s\00e\00T\00o\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00")
 (data (i32.const 2488) "\10\00\00\00X\00\00\00\00\00\00\00\00\00\00\00t\00o\00B\00e\00C\00l\00o\00s\00e\00T\00o\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00c\00a\00l\00l\00e\00d\00 \00o\00n\00 \00v\00a\00l\00u\00e\00 \00t\00y\00p\00e\00s\00.\00")
 (data (i32.const 2592) "\10\00\00\00\86\00\00\00\00\00\00\00\00\00\00\00R\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00s\00 \00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00w\00h\00e\00n\00 \00u\00s\00e\00d\00 \00w\00i\00t\00h\00 \00t\00o\00B\00e\00C\00l\00o\00s\00e\00T\00o\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00s\00.\00")
 (data (i32.const 2744) "\10\00\00\00\98\00\00\00\00\00\00\00\00\00\00\00s\00h\00o\00u\00l\00d\00 \00t\00h\00r\00o\00w\00 \00i\00f\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00 \00t\00y\00p\00e\00 \00i\00s\00 \00u\00s\00e\00d\00 \00f\00o\00r\00 \00a\00 \00n\00e\00g\00a\00t\00e\00d\00 \00t\00o\00B\00e\00C\00l\00o\00s\00e\00T\00o\00 \00a\00s\00s\00e\00r\00t\00i\00o\00n\00")
 (table $0 15 funcref)
 (elem (i32.const 0) $null $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|0 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|1 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|2 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|3 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|4 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|5 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|6 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|7 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|8 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|9 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|10 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|11 $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/util/runtime/HEADER_SIZE i32 (i32.const 16))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/util/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $assembly/__tests__/toBeCloseTo.spec/vec1 (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 14))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 2912))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (start $start)
 (func $~lib/util/runtime/adjust (; 8 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 1
  i32.const 32
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.add
  i32.const 1
  i32.sub
  i32.clz
  i32.sub
  i32.shl
 )
 (func $~lib/allocator/arena/__mem_allocate (; 9 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.const 1073741824
  i32.gt_u
  if
   unreachable
  end
  global.get $~lib/allocator/arena/offset
  local.set $1
  local.get $1
  local.get $0
  local.tee $2
  i32.const 1
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.add
  i32.const 7
  i32.add
  i32.const 7
  i32.const -1
  i32.xor
  i32.and
  local.set $4
  current_memory
  local.set $5
  local.get $4
  local.get $5
  i32.const 16
  i32.shl
  i32.gt_u
  if
   local.get $4
   local.get $1
   i32.sub
   i32.const 65535
   i32.add
   i32.const 65535
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.shr_u
   local.set $2
   local.get $5
   local.tee $3
   local.get $2
   local.tee $6
   local.get $3
   local.get $6
   i32.gt_s
   select
   local.set $3
   local.get $3
   grow_memory
   i32.const 0
   i32.lt_s
   if
    local.get $2
    grow_memory
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $4
  global.set $~lib/allocator/arena/offset
  local.get $1
 )
 (func $~lib/memory/memory.allocate (; 10 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/allocator/arena/__mem_allocate
  return
 )
 (func $~lib/util/runtime/allocate (; 11 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/util/runtime/adjust
  call $~lib/memory/memory.allocate
  local.set $1
  local.get $1
  global.get $~lib/util/runtime/HEADER_MAGIC
  i32.store
  local.get $1
  local.get $0
  i32.store offset=4
  local.get $1
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.add
 )
 (func $~lib/util/runtime/register (; 12 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/memory/HEAP_BASE
  i32.gt_u
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 129
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  global.get $~lib/util/runtime/HEADER_SIZE
  i32.sub
  local.set $2
  local.get $2
  i32.load
  global.get $~lib/util/runtime/HEADER_MAGIC
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 24
   i32.const 131
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  local.get $1
  i32.store
  local.get $0
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (; 13 ;) (type $FUNCSIG$iiddd) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 24
    call $~lib/util/runtime/allocate
    i32.const 17
    call $~lib/util/runtime/register
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
 (func $assembly/internal/Expectation/Expectation<f64>#constructor (; 14 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 16
    call $~lib/util/runtime/allocate
    i32.const 18
    call $~lib/util/runtime/register
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   f64.const 0
   f64.store offset=8
   local.get $0
  end
  local.get $1
  f64.store offset=8
  local.get $0
 )
 (func $assembly/internal/Expectation/expect<f64> (; 15 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#constructor
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportActual (; 16 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  f64.load offset=8
  call $assembly/internal/Expectation/reportActualFloat
 )
 (func $assembly/internal/Expectation/Expectation<f64>#reportExpected (; 17 ;) (type $FUNCSIG$vid) (param $0 i32) (param $1 f64)
  local.get $1
  local.get $0
  i32.load
  call $assembly/internal/Expectation/reportExpectedFloat
 )
 (func $~lib/builtins/isFinite<f64> (; 18 ;) (type $FUNCSIG$id) (param $0 f64) (result i32)
  local.get $0
  local.get $0
  f64.sub
  f64.const 0
  f64.eq
 )
 (func $~lib/math/NativeMath.scalbn (; 19 ;) (type $FUNCSIG$ddi) (param $0 f64) (param $1 i32) (result f64)
  (local $2 f64)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  local.set $2
  local.get $1
  i32.const 1023
  i32.gt_s
  if
   local.get $2
   f64.const 8988465674311579538646525e283
   f64.mul
   local.set $2
   local.get $1
   i32.const 1023
   i32.sub
   local.set $1
   local.get $1
   i32.const 1023
   i32.gt_s
   if
    local.get $2
    f64.const 8988465674311579538646525e283
    f64.mul
    local.set $2
    local.get $1
    i32.const 1023
    i32.sub
    local.tee $3
    i32.const 1023
    local.tee $4
    local.get $3
    local.get $4
    i32.lt_s
    select
    local.set $1
   end
  else   
   local.get $1
   i32.const -1022
   i32.lt_s
   if
    local.get $2
    f64.const 2.2250738585072014e-308
    f64.const 9007199254740992
    f64.mul
    f64.mul
    local.set $2
    local.get $1
    i32.const 1022
    i32.const 53
    i32.sub
    i32.add
    local.set $1
    local.get $1
    i32.const -1022
    i32.lt_s
    if
     local.get $2
     f64.const 2.2250738585072014e-308
     f64.const 9007199254740992
     f64.mul
     f64.mul
     local.set $2
     local.get $1
     i32.const 1022
     i32.add
     i32.const 53
     i32.sub
     local.tee $3
     i32.const -1022
     local.tee $4
     local.get $3
     local.get $4
     i32.gt_s
     select
     local.set $1
    end
   end
  end
  local.get $2
  i64.const 1023
  local.get $1
  i64.extend_i32_s
  i64.add
  i64.const 52
  i64.shl
  f64.reinterpret_i64
  f64.mul
 )
 (func $~lib/math/NativeMath.pow (; 20 ;) (type $FUNCSIG$ddd) (param $0 f64) (param $1 f64) (result f64)
  (local $2 i64)
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
  (local $15 f64)
  (local $16 f64)
  (local $17 f64)
  (local $18 f64)
  (local $19 f64)
  (local $20 f64)
  (local $21 f64)
  (local $22 f64)
  (local $23 f64)
  (local $24 f64)
  (local $25 f64)
  (local $26 f64)
  (local $27 f64)
  (local $28 i32)
  (local $29 i32)
  (local $30 f64)
  (local $31 f64)
  (local $32 f64)
  (local $33 f64)
  (local $34 f64)
  (local $35 f64)
  (local $36 f64)
  (local $37 f64)
  (local $38 f64)
  (local $39 f64)
  (local $40 f64)
  (local $41 i32)
  local.get $0
  i64.reinterpret_f64
  local.set $2
  local.get $2
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $3
  local.get $2
  i32.wrap_i64
  local.set $4
  local.get $1
  i64.reinterpret_f64
  local.set $2
  local.get $2
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $5
  local.get $2
  i32.wrap_i64
  local.set $6
  local.get $3
  i32.const 2147483647
  i32.and
  local.set $7
  local.get $5
  i32.const 2147483647
  i32.and
  local.set $8
  local.get $8
  local.get $6
  i32.or
  i32.const 0
  i32.eq
  if
   f64.const 1
   return
  end
  local.get $7
  i32.const 2146435072
  i32.gt_s
  if (result i32)
   i32.const 1
  else   
   local.get $7
   i32.const 2146435072
   i32.eq
   if (result i32)
    local.get $4
    i32.const 0
    i32.ne
   else    
    i32.const 0
   end
  end
  if (result i32)
   i32.const 1
  else   
   local.get $8
   i32.const 2146435072
   i32.gt_s
  end
  if (result i32)
   i32.const 1
  else   
   local.get $8
   i32.const 2146435072
   i32.eq
   if (result i32)
    local.get $6
    i32.const 0
    i32.ne
   else    
    i32.const 0
   end
  end
  if
   local.get $0
   local.get $1
   f64.add
   return
  end
  i32.const 0
  local.set $9
  local.get $3
  i32.const 0
  i32.lt_s
  if
   local.get $8
   i32.const 1128267776
   i32.ge_s
   if
    i32.const 2
    local.set $9
   else    
    local.get $8
    i32.const 1072693248
    i32.ge_s
    if
     local.get $8
     i32.const 20
     i32.shr_s
     i32.const 1023
     i32.sub
     local.set $10
     local.get $10
     i32.const 20
     i32.gt_s
     local.set $11
     i32.const 52
     i32.const 20
     local.get $11
     select
     local.get $10
     i32.sub
     local.set $12
     local.get $6
     local.get $8
     local.get $11
     select
     local.set $13
     local.get $13
     local.get $12
     i32.shr_s
     local.set $14
     local.get $14
     local.get $12
     i32.shl
     local.get $13
     i32.eq
     if
      i32.const 2
      local.get $14
      i32.const 1
      i32.and
      i32.sub
      local.set $9
     end
    end
   end
  end
  local.get $6
  i32.const 0
  i32.eq
  if
   local.get $8
   i32.const 2146435072
   i32.eq
   if
    local.get $7
    i32.const 1072693248
    i32.sub
    local.get $4
    i32.or
    i32.const 0
    i32.eq
    if
     f64.const nan:0x8000000000000
     return
    else     
     local.get $7
     i32.const 1072693248
     i32.ge_s
     if
      local.get $5
      i32.const 0
      i32.ge_s
      if (result f64)
       local.get $1
      else       
       f64.const 0
      end
      return
     else      
      local.get $5
      i32.const 0
      i32.ge_s
      if (result f64)
       f64.const 0
      else       
       local.get $1
       f64.neg
      end
      return
     end
     unreachable
    end
    unreachable
    unreachable
   end
   local.get $8
   i32.const 1072693248
   i32.eq
   if
    local.get $5
    i32.const 0
    i32.ge_s
    if
     local.get $0
     return
    end
    f64.const 1
    local.get $0
    f64.div
    return
   end
   local.get $5
   i32.const 1073741824
   i32.eq
   if
    local.get $0
    local.get $0
    f64.mul
    return
   end
   local.get $5
   i32.const 1071644672
   i32.eq
   if
    local.get $3
    i32.const 0
    i32.ge_s
    if
     local.get $0
     f64.sqrt
     return
    end
   end
  end
  local.get $0
  f64.abs
  local.set $15
  local.get $4
  i32.const 0
  i32.eq
  if
   local.get $7
   i32.const 0
   i32.eq
   if (result i32)
    i32.const 1
   else    
    local.get $7
    i32.const 2146435072
    i32.eq
   end
   if (result i32)
    i32.const 1
   else    
    local.get $7
    i32.const 1072693248
    i32.eq
   end
   if
    local.get $15
    local.set $16
    local.get $5
    i32.const 0
    i32.lt_s
    if
     f64.const 1
     local.get $16
     f64.div
     local.set $16
    end
    local.get $3
    i32.const 0
    i32.lt_s
    if
     local.get $7
     i32.const 1072693248
     i32.sub
     local.get $9
     i32.or
     i32.const 0
     i32.eq
     if
      local.get $16
      local.get $16
      f64.sub
      local.set $17
      local.get $17
      local.get $17
      f64.div
      local.set $16
     else      
      local.get $9
      i32.const 1
      i32.eq
      if
       local.get $16
       f64.neg
       local.set $16
      end
     end
    end
    local.get $16
    return
   end
  end
  f64.const 1
  local.set $18
  local.get $3
  i32.const 0
  i32.lt_s
  if
   local.get $9
   i32.const 0
   i32.eq
   if
    local.get $0
    local.get $0
    f64.sub
    local.set $17
    local.get $17
    local.get $17
    f64.div
    return
   end
   local.get $9
   i32.const 1
   i32.eq
   if
    f64.const -1
    local.set $18
   end
  end
  local.get $8
  i32.const 1105199104
  i32.gt_s
  if
   local.get $8
   i32.const 1139802112
   i32.gt_s
   if
    local.get $7
    i32.const 1072693247
    i32.le_s
    if
     local.get $5
     i32.const 0
     i32.lt_s
     if (result f64)
      f64.const 1.e+300
      f64.const 1.e+300
      f64.mul
     else      
      f64.const 1e-300
      f64.const 1e-300
      f64.mul
     end
     return
    end
    local.get $7
    i32.const 1072693248
    i32.ge_s
    if
     local.get $5
     i32.const 0
     i32.gt_s
     if (result f64)
      f64.const 1.e+300
      f64.const 1.e+300
      f64.mul
     else      
      f64.const 1e-300
      f64.const 1e-300
      f64.mul
     end
     return
    end
   end
   local.get $7
   i32.const 1072693247
   i32.lt_s
   if
    local.get $5
    i32.const 0
    i32.lt_s
    if (result f64)
     local.get $18
     f64.const 1.e+300
     f64.mul
     f64.const 1.e+300
     f64.mul
    else     
     local.get $18
     f64.const 1e-300
     f64.mul
     f64.const 1e-300
     f64.mul
    end
    return
   end
   local.get $7
   i32.const 1072693248
   i32.gt_s
   if
    local.get $5
    i32.const 0
    i32.gt_s
    if (result f64)
     local.get $18
     f64.const 1.e+300
     f64.mul
     f64.const 1.e+300
     f64.mul
    else     
     local.get $18
     f64.const 1e-300
     f64.mul
     f64.const 1e-300
     f64.mul
    end
    return
   end
   local.get $15
   f64.const 1
   f64.sub
   local.set $24
   local.get $24
   local.get $24
   f64.mul
   f64.const 0.5
   local.get $24
   f64.const 0.3333333333333333
   local.get $24
   f64.const 0.25
   f64.mul
   f64.sub
   f64.mul
   f64.sub
   f64.mul
   local.set $27
   f64.const 1.4426950216293335
   local.get $24
   f64.mul
   local.set $25
   local.get $24
   f64.const 1.9259629911266175e-08
   f64.mul
   local.get $27
   f64.const 1.4426950408889634
   f64.mul
   f64.sub
   local.set $26
   local.get $25
   local.get $26
   f64.add
   local.set $19
   local.get $19
   i64.reinterpret_f64
   i64.const -4294967296
   i64.and
   f64.reinterpret_i64
   local.set $19
   local.get $26
   local.get $19
   local.get $25
   f64.sub
   f64.sub
   local.set $20
  else   
   i32.const 0
   local.set $29
   local.get $7
   i32.const 1048576
   i32.lt_s
   if
    local.get $15
    f64.const 9007199254740992
    f64.mul
    local.set $15
    local.get $29
    i32.const 53
    i32.sub
    local.set $29
    local.get $15
    i64.reinterpret_f64
    i64.const 32
    i64.shr_u
    i32.wrap_i64
    local.set $7
   end
   local.get $29
   local.get $7
   i32.const 20
   i32.shr_s
   i32.const 1023
   i32.sub
   i32.add
   local.set $29
   local.get $7
   i32.const 1048575
   i32.and
   local.set $28
   local.get $28
   i32.const 1072693248
   i32.or
   local.set $7
   local.get $28
   i32.const 235662
   i32.le_s
   if
    i32.const 0
    local.set $10
   else    
    local.get $28
    i32.const 767610
    i32.lt_s
    if
     i32.const 1
     local.set $10
    else     
     i32.const 0
     local.set $10
     local.get $29
     i32.const 1
     i32.add
     local.set $29
     local.get $7
     i32.const 1048576
     i32.sub
     local.set $7
    end
   end
   local.get $15
   i64.reinterpret_f64
   i64.const 4294967295
   i64.and
   local.get $7
   i64.extend_i32_s
   i64.const 32
   i64.shl
   i64.or
   f64.reinterpret_i64
   local.set $15
   f64.const 1.5
   f64.const 1
   local.get $10
   select
   local.set $35
   local.get $15
   local.get $35
   f64.sub
   local.set $25
   f64.const 1
   local.get $15
   local.get $35
   f64.add
   f64.div
   local.set $26
   local.get $25
   local.get $26
   f64.mul
   local.set $17
   local.get $17
   local.set $31
   local.get $31
   i64.reinterpret_f64
   i64.const -4294967296
   i64.and
   f64.reinterpret_i64
   local.set $31
   local.get $7
   i32.const 1
   i32.shr_s
   i32.const 536870912
   i32.or
   i32.const 524288
   i32.add
   local.get $10
   i32.const 18
   i32.shl
   i32.add
   i64.extend_i32_s
   i64.const 32
   i64.shl
   f64.reinterpret_i64
   local.set $33
   local.get $15
   local.get $33
   local.get $35
   f64.sub
   f64.sub
   local.set $34
   local.get $26
   local.get $25
   local.get $31
   local.get $33
   f64.mul
   f64.sub
   local.get $31
   local.get $34
   f64.mul
   f64.sub
   f64.mul
   local.set $32
   local.get $17
   local.get $17
   f64.mul
   local.set $30
   local.get $30
   local.get $30
   f64.mul
   f64.const 0.5999999999999946
   local.get $30
   f64.const 0.4285714285785502
   local.get $30
   f64.const 0.33333332981837743
   local.get $30
   f64.const 0.272728123808534
   local.get $30
   f64.const 0.23066074577556175
   local.get $30
   f64.const 0.20697501780033842
   f64.mul
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.add
   f64.mul
   local.set $23
   local.get $23
   local.get $32
   local.get $31
   local.get $17
   f64.add
   f64.mul
   f64.add
   local.set $23
   local.get $31
   local.get $31
   f64.mul
   local.set $30
   f64.const 3
   local.get $30
   f64.add
   local.get $23
   f64.add
   local.set $33
   local.get $33
   i64.reinterpret_f64
   i64.const -4294967296
   i64.and
   f64.reinterpret_i64
   local.set $33
   local.get $23
   local.get $33
   f64.const 3
   f64.sub
   local.get $30
   f64.sub
   f64.sub
   local.set $34
   local.get $31
   local.get $33
   f64.mul
   local.set $25
   local.get $32
   local.get $33
   f64.mul
   local.get $34
   local.get $17
   f64.mul
   f64.add
   local.set $26
   local.get $25
   local.get $26
   f64.add
   local.set $21
   local.get $21
   i64.reinterpret_f64
   i64.const -4294967296
   i64.and
   f64.reinterpret_i64
   local.set $21
   local.get $26
   local.get $21
   local.get $25
   f64.sub
   f64.sub
   local.set $22
   f64.const 0.9617967009544373
   local.get $21
   f64.mul
   local.set $36
   f64.const 1.350039202129749e-08
   f64.const 0
   local.get $10
   select
   local.set $37
   f64.const -7.028461650952758e-09
   local.get $21
   f64.mul
   local.get $22
   f64.const 0.9617966939259756
   f64.mul
   f64.add
   local.get $37
   f64.add
   local.set $38
   local.get $29
   f64.convert_i32_s
   local.set $24
   f64.const 0.5849624872207642
   f64.const 0
   local.get $10
   select
   local.set $39
   local.get $36
   local.get $38
   f64.add
   local.get $39
   f64.add
   local.get $24
   f64.add
   local.set $19
   local.get $19
   i64.reinterpret_f64
   i64.const -4294967296
   i64.and
   f64.reinterpret_i64
   local.set $19
   local.get $38
   local.get $19
   local.get $24
   f64.sub
   local.get $39
   f64.sub
   local.get $36
   f64.sub
   f64.sub
   local.set $20
  end
  local.get $1
  local.set $40
  local.get $40
  i64.reinterpret_f64
  i64.const -4294967296
  i64.and
  f64.reinterpret_i64
  local.set $40
  local.get $1
  local.get $40
  f64.sub
  local.get $19
  f64.mul
  local.get $1
  local.get $20
  f64.mul
  f64.add
  local.set $22
  local.get $40
  local.get $19
  f64.mul
  local.set $21
  local.get $22
  local.get $21
  f64.add
  local.set $16
  local.get $16
  i64.reinterpret_f64
  local.set $2
  local.get $2
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $28
  local.get $2
  i32.wrap_i64
  local.set $41
  local.get $28
  i32.const 1083179008
  i32.ge_s
  if
   local.get $28
   i32.const 1083179008
   i32.sub
   local.get $41
   i32.or
   i32.const 0
   i32.ne
   if
    local.get $18
    f64.const 1.e+300
    f64.mul
    f64.const 1.e+300
    f64.mul
    return
   end
   local.get $22
   f64.const 8.008566259537294e-17
   f64.add
   local.get $16
   local.get $21
   f64.sub
   f64.gt
   if
    local.get $18
    f64.const 1.e+300
    f64.mul
    f64.const 1.e+300
    f64.mul
    return
   end
  else   
   local.get $28
   i32.const 2147483647
   i32.and
   i32.const 1083231232
   i32.ge_s
   if
    local.get $28
    i32.const -1064252416
    i32.sub
    local.get $41
    i32.or
    i32.const 0
    i32.ne
    if
     local.get $18
     f64.const 1e-300
     f64.mul
     f64.const 1e-300
     f64.mul
     return
    end
    local.get $22
    local.get $16
    local.get $21
    f64.sub
    f64.le
    if
     local.get $18
     f64.const 1e-300
     f64.mul
     f64.const 1e-300
     f64.mul
     return
    end
   end
  end
  local.get $28
  i32.const 2147483647
  i32.and
  local.set $41
  local.get $41
  i32.const 20
  i32.shr_s
  i32.const 1023
  i32.sub
  local.set $10
  i32.const 0
  local.set $29
  local.get $41
  i32.const 1071644672
  i32.gt_s
  if
   local.get $28
   i32.const 1048576
   local.get $10
   i32.const 1
   i32.add
   i32.shr_s
   i32.add
   local.set $29
   local.get $29
   i32.const 2147483647
   i32.and
   i32.const 20
   i32.shr_s
   i32.const 1023
   i32.sub
   local.set $10
   f64.const 0
   local.set $24
   local.get $29
   i32.const 1048575
   local.get $10
   i32.shr_s
   i32.const -1
   i32.xor
   i32.and
   i64.extend_i32_s
   i64.const 32
   i64.shl
   f64.reinterpret_i64
   local.set $24
   local.get $29
   i32.const 1048575
   i32.and
   i32.const 1048576
   i32.or
   i32.const 20
   local.get $10
   i32.sub
   i32.shr_s
   local.set $29
   local.get $28
   i32.const 0
   i32.lt_s
   if
    i32.const 0
    local.get $29
    i32.sub
    local.set $29
   end
   local.get $21
   local.get $24
   f64.sub
   local.set $21
  end
  local.get $22
  local.get $21
  f64.add
  local.set $24
  local.get $24
  i64.reinterpret_f64
  i64.const -4294967296
  i64.and
  f64.reinterpret_i64
  local.set $24
  local.get $24
  f64.const 0.6931471824645996
  f64.mul
  local.set $25
  local.get $22
  local.get $24
  local.get $21
  f64.sub
  f64.sub
  f64.const 0.6931471805599453
  f64.mul
  local.get $24
  f64.const -1.904654299957768e-09
  f64.mul
  f64.add
  local.set $26
  local.get $25
  local.get $26
  f64.add
  local.set $16
  local.get $26
  local.get $16
  local.get $25
  f64.sub
  f64.sub
  local.set $27
  local.get $16
  local.get $16
  f64.mul
  local.set $24
  local.get $16
  local.get $24
  f64.const 0.16666666666666602
  local.get $24
  f64.const -2.7777777777015593e-03
  local.get $24
  f64.const 6.613756321437934e-05
  local.get $24
  f64.const -1.6533902205465252e-06
  local.get $24
  f64.const 4.1381367970572385e-08
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  f64.sub
  local.set $19
  local.get $16
  local.get $19
  f64.mul
  local.get $19
  f64.const 2
  f64.sub
  f64.div
  local.get $27
  local.get $16
  local.get $27
  f64.mul
  f64.add
  f64.sub
  local.set $23
  f64.const 1
  local.get $23
  local.get $16
  f64.sub
  f64.sub
  local.set $16
  local.get $16
  i64.reinterpret_f64
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $28
  local.get $28
  local.get $29
  i32.const 20
  i32.shl
  i32.add
  local.set $28
  local.get $28
  i32.const 20
  i32.shr_s
  i32.const 0
  i32.le_s
  if
   local.get $16
   local.get $29
   call $~lib/math/NativeMath.scalbn
   local.set $16
  else   
   local.get $16
   i64.reinterpret_f64
   i64.const 4294967295
   i64.and
   local.get $28
   i64.extend_i32_s
   i64.const 32
   i64.shl
   i64.or
   f64.reinterpret_i64
   local.set $16
  end
  local.get $18
  local.get $16
  f64.mul
 )
 (func $~lib/allocator/arena/__mem_free (; 21 ;) (type $FUNCSIG$vi) (param $0 i32)
  nop
 )
 (func $~lib/memory/memory.free (; 22 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  call $~lib/allocator/arena/__mem_free
 )
 (func $assembly/internal/Expectation/Expectation<f64>#cleanup (; 23 ;) (type $FUNCSIG$vi) (param $0 i32)
  call $assembly/internal/Expectation/clearExpected
  local.get $0
  call $~lib/memory/memory.free
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|0 (; 24 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const 1
  call $assembly/internal/Expectation/expect<f64>
  local.set $3
  f64.const 1.00001
  local.set $0
  i32.const 2
  local.set $2
  i32.const 208
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Test/it (; 25 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $assembly/internal/Test/reportTest
 )
 (func $assembly/internal/Expectation/Expectation<f64>#get:not (; 26 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|1 (; 27 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const 1
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $3
  f64.const 1.00001
  local.set $0
  i32.const 2
  local.set $2
  i32.const 888
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Test/throws (; 28 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  call $assembly/internal/Test/reportNegatedTest
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|2 (; 29 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const 1
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $3
  f64.const 100
  local.set $0
  i32.const 2
  local.set $2
  i32.const 1120
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|3 (; 30 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const 1
  call $assembly/internal/Expectation/expect<f64>
  local.set $3
  f64.const 100
  local.set $0
  i32.const 2
  local.set $2
  i32.const 888
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|4 (; 31 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $3
  f64.const 0
  local.set $0
  i32.const 2
  local.set $2
  i32.const 888
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|5 (; 32 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const 0
  call $assembly/internal/Expectation/expect<f64>
  local.set $3
  f64.const nan:0x8000000000000
  local.set $0
  i32.const 2
  local.set $2
  i32.const 888
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|6 (; 33 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  local.set $3
  f64.const nan:0x8000000000000
  local.set $0
  i32.const 2
  local.set $2
  i32.const 888
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|7 (; 34 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $3
  f64.const 0
  local.set $0
  i32.const 2
  local.set $2
  i32.const 888
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|8 (; 35 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const 0
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $3
  f64.const nan:0x8000000000000
  local.set $0
  i32.const 2
  local.set $2
  i32.const 888
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|9 (; 36 ;) (type $FUNCSIG$v)
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  f64.const nan:0x8000000000000
  call $assembly/internal/Expectation/expect<f64>
  call $assembly/internal/Expectation/Expectation<f64>#get:not
  local.set $3
  f64.const nan:0x8000000000000
  local.set $0
  i32.const 2
  local.set $2
  i32.const 888
  local.set $1
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#reportActual
  local.get $3
  local.get $0
  call $assembly/internal/Expectation/Expectation<f64>#reportExpected
  i32.const 1
  i32.eqz
  if
   i32.const 272
   i32.const 400
   i32.const 401
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  f64.load offset=8
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 480
   i32.const 400
   i32.const 404
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/builtins/isFinite<f64>
  i32.eqz
  if
   i32.const 624
   i32.const 400
   i32.const 407
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $3
  f64.load offset=8
  f64.sub
  f64.abs
  f64.const 0.1
  local.get $2
  f64.convert_i32_s
  call $~lib/math/NativeMath.pow
  f64.lt
  local.set $4
  local.get $3
  i32.load
  local.get $4
  i32.xor
  i32.eqz
  if
   local.get $1
   i32.const 400
   i32.const 417
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  call $assembly/internal/Expectation/Expectation<f64>#cleanup
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor (; 37 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    i32.const 8
    call $~lib/util/runtime/allocate
    i32.const 19
    call $~lib/util/runtime/register
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
 (func $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3> (; 38 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 0
  local.get $0
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#constructor
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|10 (; 39 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $assembly/__tests__/toBeCloseTo.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  local.set $3
  global.get $assembly/__tests__/toBeCloseTo.spec/vec1
  local.set $2
  i32.const 2
  local.set $1
  i32.const 888
  local.set $0
  i32.const 0
  i32.eqz
  if
   i32.const 2504
   i32.const 400
   i32.const 395
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not (; 40 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.store
  local.get $0
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0~anonymous|11 (; 41 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $assembly/__tests__/toBeCloseTo.spec/vec1
  call $assembly/internal/Expectation/expect<assembly/__tests__/setup/Vec3/Vec3>
  call $assembly/internal/Expectation/Expectation<assembly/__tests__/setup/Vec3/Vec3>#get:not
  local.set $3
  global.get $assembly/__tests__/toBeCloseTo.spec/vec1
  local.set $2
  i32.const 2
  local.set $1
  i32.const 888
  local.set $0
  i32.const 0
  i32.eqz
  if
   i32.const 2504
   i32.const 400
   i32.const 395
   i32.const 6
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec~anonymous|0 (; 42 ;) (type $FUNCSIG$v)
  i32.const 120
  i32.const 1
  call $assembly/internal/Test/it
  i32.const 776
  i32.const 2
  i32.const 904
  call $assembly/internal/Test/throws
  i32.const 1008
  i32.const 3
  call $assembly/internal/Test/it
  i32.const 1192
  i32.const 4
  i32.const 1304
  call $assembly/internal/Test/throws
  i32.const 1408
  i32.const 5
  i32.const 1504
  call $assembly/internal/Test/throws
  i32.const 1408
  i32.const 6
  i32.const 1640
  call $assembly/internal/Test/throws
  i32.const 1784
  i32.const 7
  i32.const 1872
  call $assembly/internal/Test/throws
  i32.const 1408
  i32.const 8
  i32.const 1504
  call $assembly/internal/Test/throws
  i32.const 1408
  i32.const 9
  i32.const 2024
  call $assembly/internal/Test/throws
  i32.const 1784
  i32.const 10
  i32.const 2184
  call $assembly/internal/Test/throws
  i32.const 2352
  i32.const 11
  i32.const 2608
  call $assembly/internal/Test/throws
  i32.const 2760
  i32.const 12
  i32.const 2608
  call $assembly/internal/Test/throws
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 43 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/Describe/describe (; 44 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  local.get $0
  call $assembly/internal/Describe/reportDescribe
  i32.const 0
  global.set $~lib/argc
  local.get $1
  call_indirect (type $FUNCSIG$v)
  call $assembly/internal/Describe/reportEndDescribe
 )
 (func $start:assembly/__tests__/toBeCloseTo.spec (; 45 ;) (type $FUNCSIG$v)
  global.get $~lib/memory/HEAP_BASE
  i32.const 7
  i32.add
  i32.const 7
  i32.const -1
  i32.xor
  i32.and
  global.set $~lib/allocator/arena/startOffset
  global.get $~lib/allocator/arena/startOffset
  global.set $~lib/allocator/arena/offset
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  global.set $assembly/__tests__/toBeCloseTo.spec/vec1
  i32.const 80
  i32.const 13
  call $assembly/internal/Describe/describe
 )
 (func $assembly/internal/call/__call (; 46 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $start (; 47 ;) (type $FUNCSIG$v)
  call $start:assembly/__tests__/toBeCloseTo.spec
 )
 (func $null (; 48 ;) (type $FUNCSIG$v)
 )
)
