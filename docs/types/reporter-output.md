# `@as-pect/reporter-output` types

Package-root exports from current `master`.

```ts
export interface FileBackedReport {
  fileName: string;
  hasResults: boolean;
}

export type CreateReporterWriteStream = (
  filePath: string,
  encoding: BufferEncoding,
) => import("stream").Writable;

export interface StartedFileBackedReport {
  filePath: string;
  stream: import("stream").Writable;
}

export function reporterOutputPath(
  fileName: string,
  extension: string,
  root?: string,
): string;

export class ReporterFileOutput {
  constructor(createStream?: CreateReporterWriteStream, root?: string);
  start(report: FileBackedReport, extension: string): StartedFileBackedReport | null;
  trackFlush(...flushes: Promise<unknown>[]): void;
  flush(): Promise<void>;
}
```

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
