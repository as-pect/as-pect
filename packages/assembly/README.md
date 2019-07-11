# @as-pect/assembly

## Table Of Contents

1. [Philosophy](#philosophy)
1. [Usage](#usage)
1. [Contributers](#contributers)

## Philosophy

Testing is the first step of every project and you have a responsibility to
make sure that the software you write works as intended. The `as-pect` project
was created to help quickly scaffold and bootstrap AssemblyScript tests so
that you can be confident in yourself and the software you write.

One of the goals of this project is 100% portability to `jest` so that tests
can be run in two different environments.

## Usage

To use the `@as-pect/assembly` package, typically, it's best to use the
`@as-pect/cli` package to output a binary using `--outputBinary`. However
in the case of generating the binary manually, it's possible to use the
following AssemblyScript `asc` cli options:

<!-- markdownlint-disable MD040 -->

```
asc entry.ts ./node_modules/@as-pect/assembly/assembly/index.ts \
  --use ASC_RTRACE=1 \
  --explicitStart
```

This will compile the binary with all of the required `as-pect` setup functions.

## Contributors

To contribute please see [CONTRIBUTING.md](./CONTRIBUTING.md).

Thanks to [@willemneal](github.com/willemneal) and
[@MaxGraey](github.com/maxgraey) for all their support in making `as-pect` the
best software it can be.

Other Contributors:

- [@trusktr](github.com/trusktr) - Documentation Changes
- [@MaxGraey](github.com/maxgraey) - Performance API suggestions
- [@torch2424](github.com/torch2424) - Documentation Changes
- [@dcodeio](github.com/torch2424) - Made AssemblyScript itself!

## Special Thanks

Special thanks to the [AssemblyScript](github.com/AssemblyScript/assemblyscript)
team for creating AssemblyScript itself.
