# `@as-pect/transform`

AssemblyScript transform for `as-pect` reflection support.

The transform injects the generated class reflection shape that the runtime helpers in `@as-pect/assembly` depend on when tests compare class instances or print reflected object values.

## Generated shape

For each class declaration found in source files and namespaces, the transform appends two public instance methods:

- `__aspectStrictEquals(rawRef: Object, stack: usize[], cache: usize[], ignore: StaticArray<i64>): bool`
- `__aspectAddReflectedValueKeyValuePairs(reflectedValue: i32, seen: Map<usize, i32>, ignore: StaticArray<i64>): void`

These method names are compatibility-sensitive. `packages/assembly/assembly/internal/Reflect.ts` calls them directly when it cannot use a built-in comparison or reflected-value path.

## ClassReflectionTransform

`ClassReflectionTransform` is the module that owns the shared class-member plan for generated class reflection behavior. It inspects each class once and records the instance members that should participate in both strict equality and reflected key/value generation.

The member plan includes, in source order:

- instance fields
- instance getters

The member plan excludes:

- static members
- regular instance methods
- inherited members, which are handled by generated `super` calls

Each planned member carries its name, source range, getter/field kind, and `djb2` name hash. Generated methods pass these hashes through `ignore: StaticArray<i64>` when calling `super` so inherited generated methods do not duplicate members overridden by a child class.

Hash values intentionally remain the compatibility seam with existing generated code. If two inherited member names ever collide under `djb2`, the generated ignore list treats them as the same inherited member and suppresses the parent entry deterministically; the transform does not rename members or attempt a runtime fallback.

## Runtime relationship

`@as-pect/assembly` uses the generated methods in two places:

1. `Reflect.equals()` calls `__aspectStrictEquals` to compare class instances structurally.
2. `Reflect.toReflectedValue()` calls `__aspectAddReflectedValueKeyValuePairs` to add reflected object keys and values.

The transform and runtime therefore share a seam: the transform owns the generated method shape, and the runtime assumes that shape exists after compilation with `@as-pect/transform`.

## Compatibility expectations

- Keep both generated method names unchanged unless a coordinated runtime migration is planned.
- Keep the `ignore` hash behavior stable so inherited and overridden members are not reported twice.
- Keep generated behavior dependency-free; this package should remain a small local transform.
- Preserve source order when adding reflected/equality-relevant members so reporter output remains stable.
- Keep transform generation idempotent for the same parsed source; repeated passes should not append duplicate generated members.
- Reject user-authored `__aspectStrictEquals` or `__aspectAddReflectedValueKeyValuePairs` members with a clear transform error instead of silently overwriting them.
