---
"@as-pect/cli": patch
"@as-pect/core": patch
---

Remove direct `chalk` and `chalk-template` runtime dependencies by replacing CLI and default reporter coloring with small local ANSI helpers.
