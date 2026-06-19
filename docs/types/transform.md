# `@as-pect/transform` types

Package-root exports from current `master`.

```ts
export default class AspectTransform extends import("assemblyscript/dist/transform.js").Transform {
  afterParse(parser: import("assemblyscript/dist/assemblyscript.js").Parser): void;
}
```

The package source also contains internal helper types for class reflection planning. Treat the package-root default transform as the public API used by AssemblyScript compiler configuration.

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
