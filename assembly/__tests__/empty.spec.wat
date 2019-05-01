(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$vi (func (param i32)))
 (memory $0 0)
 (table $0 2 funcref)
 (elem (i32.const 0) $null $start:assembly/internal/noOp~anonymous|0)
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $assembly/internal/noOp/noOp i32 (i32.const 1))
 (global $~lib/argc (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (func $start:assembly/internal/noOp~anonymous|0 (; 0 ;) (type $FUNCSIG$v)
  nop
 )
 (func $assembly/internal/call/__call (; 1 ;) (type $FUNCSIG$vi) (param $0 i32)
  i32.const 0
  global.set $~lib/argc
  local.get $0
  call_indirect (type $FUNCSIG$v)
 )
 (func $null (; 2 ;) (type $FUNCSIG$v)
 )
)
