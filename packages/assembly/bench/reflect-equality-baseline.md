# Reflection equality benchmark baseline

Recorded: June 12, 2026

## Environment

- Node.js: `v26.3.0`
- npm: `11.16.0`
- Command: `npm run bench:assembly-reflect`
- Benchmark settings: default settings (`ASPECT_REFLECT_BENCH_ITERATIONS=10`, `ASPECT_REFLECT_BENCH_WARMUP=3`, `ASPECT_REFLECT_BENCH_INNER=20`)

## Baseline results

```jsonl
{"benchmark":"assembly-reflect-equality","version":1,"area":"reflect-equals-set","case":"set-i32-size-10","operation":"Reflect.equals<Set<i32>>","iterations":10,"warmupIterations":3,"innerIterations":20,"totalMs":0.846,"meanMs":0.085,"minMs":0.05,"maxMs":0.257,"meanEqualsMs":0.004,"entries":10}
{"benchmark":"assembly-reflect-equality","version":1,"area":"reflect-equals-set","case":"set-i32-size-100","operation":"Reflect.equals<Set<i32>>","iterations":10,"warmupIterations":3,"innerIterations":20,"totalMs":3.098,"meanMs":0.31,"minMs":0.275,"maxMs":0.357,"meanEqualsMs":0.015,"entries":100}
{"benchmark":"assembly-reflect-equality","version":1,"area":"reflect-equals-set","case":"set-i32-size-1000","operation":"Reflect.equals<Set<i32>>","iterations":10,"warmupIterations":3,"innerIterations":20,"totalMs":29.952,"meanMs":2.995,"minMs":2.447,"maxMs":3.478,"meanEqualsMs":0.15,"entries":1000}
{"benchmark":"assembly-reflect-equality","version":1,"area":"reflect-equals-map","case":"map-string-i32-size-10","operation":"Reflect.equals<Map<string, i32>>","iterations":10,"warmupIterations":3,"innerIterations":20,"totalMs":0.939,"meanMs":0.094,"minMs":0.072,"maxMs":0.211,"meanEqualsMs":0.005,"entries":10}
{"benchmark":"assembly-reflect-equality","version":1,"area":"reflect-equals-map","case":"map-string-i32-size-100","operation":"Reflect.equals<Map<string, i32>>","iterations":10,"warmupIterations":3,"innerIterations":20,"totalMs":4.227,"meanMs":0.423,"minMs":0.348,"maxMs":0.542,"meanEqualsMs":0.021,"entries":100}
{"benchmark":"assembly-reflect-equality","version":1,"area":"reflect-equals-map","case":"map-string-i32-size-1000","operation":"Reflect.equals<Map<string, i32>>","iterations":10,"warmupIterations":3,"innerIterations":20,"totalMs":46.473,"meanMs":4.647,"minMs":4.063,"maxMs":5.995,"meanEqualsMs":0.232,"entries":1000}
{"benchmark":"assembly-reflect-equality","version":1,"area":"reflect-equals-array","case":"nested-arrays","operation":"Reflect.equals<i32[][][]>","iterations":10,"warmupIterations":3,"innerIterations":20,"totalMs":1.88,"meanMs":0.188,"minMs":0.152,"maxMs":0.314,"meanEqualsMs":0.009,"depth":3,"width":6,"leafLength":5}
{"benchmark":"assembly-reflect-equality","version":1,"area":"reflect-equals-class","case":"transformed-classes","operation":"Reflect.equals<TransformedClassNode>","iterations":10,"warmupIterations":3,"innerIterations":20,"totalMs":0.776,"meanMs":0.078,"minMs":0.062,"maxMs":0.139,"meanEqualsMs":0.004,"depth":5,"valuesPerNode":4}
{"benchmark":"assembly-reflect-equality","version":1,"area":"reflect-equals-class","case":"cyclic-classes","operation":"Reflect.equals<CyclicClassNode>","iterations":10,"warmupIterations":3,"innerIterations":20,"totalMs":3.697,"meanMs":0.37,"minMs":0.297,"maxMs":0.485,"meanEqualsMs":0.018,"nodes":32,"cycles":1}
```
