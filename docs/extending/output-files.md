# Output files

File-backed reporters can use `@as-pect/reporter-output` to keep output path behavior consistent.

## Output path behavior

`reporterOutputPath(fileName, extension, root)` replaces the test entry extension with the reporter extension under the output root.

```ts
reporterOutputPath("assembly/__tests__/entry.spec.ts", ".xml", projectRoot);
```

Result:

```text
<projectRoot>/assembly/__tests__/entry.spec.xml
```

The extension may include or omit the leading dot.

## Skip empty reports

`ReporterFileOutput.start(report, extension)` returns `null` when:

```ts
report.hasResults === false
```

This prevents reporters from creating empty output files for entries that did not produce reportable results.

## Stream lifecycle

`ReporterFileOutput` creates a writable stream and tracks stream completion.

```ts
const fileReport = fileOutput.start(report, ".json");
if (!fileReport) return;

fileReport.stream.end(JSON.stringify(data));
```

If you pipe another stream into the file stream, track that stream too:

```ts
this.fileOutput.trackFlush(finished(sourceStream).then(() => undefined));
```

Then implement reporter flush:

```ts
onFlush(): Promise<void> {
  return this.fileOutput.flush();
}
```

The CLI calls `onFlush` after a test entry runs.

## Output roots

Built-in file reporters receive the Test session project path from the CLI. Programmatic users can pass another root to reporter constructors such as:

```ts
new JUnitReporter(outputRoot)
```

Custom reporters should expose a similar constructor argument if they need configurable output roots.

## Built-in file extensions

| Reporter | Extension |
| --- | --- |
| CSV | `.csv` |
| Legacy JSON | `.json` |
| JUnit XML | `.xml` |
| CTRF JSON | `.ctrf.json` |

## Next steps

- Build a file reporter in [Custom reporters](custom-reporters.md).
- Review `@as-pect/reporter-output` types in [Reporter output types](../types/reporter-output.md).
- Compare built-in file reporters in [Built-in reporters](built-in-reporters.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
