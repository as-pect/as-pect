(module
 (type $FUNCSIG$v (func))
 (memory $0 0)
 (table $0 2 funcref)
 (elem (i32.const 0) $null $start:assembly/internal/noOp~anonymous|0)
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $assembly/internal/noOp/noOp i32 (i32.const 1))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 8))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (start $start)
 (func $start:~lib/allocator/arena (; 0 ;) (type $FUNCSIG$v)
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
 )
 (func $start:assembly/internal/noOp~anonymous|0 (; 1 ;) (type $FUNCSIG$v)
  nop
 )
 (func $start:assembly/index (; 2 ;) (type $FUNCSIG$v)
  call $start:~lib/allocator/arena
 )
 (func $start (; 3 ;) (type $FUNCSIG$v)
  call $start:assembly/index
 )
 (func $null (; 4 ;) (type $FUNCSIG$v)
 )
)
