import { createWriteStream } from "fs";
import { basename, dirname, extname, join } from "path";
import { Writable } from "stream";
import { finished } from "stream/promises";

export interface FileBackedReport {
  fileName: string;
  hasResults: boolean;
}

export type CreateReporterWriteStream = (filePath: string, encoding: BufferEncoding) => Writable;

export interface StartedFileBackedReport {
  filePath: string;
  stream: Writable;
}

export function reporterOutputPath(fileName: string, extension: string, root: string = process.cwd()): string {
  const suffix = extension.startsWith(".") ? extension : "." + extension;
  const sourceExtension = extname(fileName);
  const dir = dirname(fileName);
  const base = basename(fileName, sourceExtension);

  return join(root, dir, base + suffix);
}

export class ReporterFileOutput {
  private pendingFlush: Promise<void> = Promise.resolve();

  public constructor(
    private readonly createStream: CreateReporterWriteStream = createWriteStream,
    private readonly root: string = process.cwd(),
  ) {}

  public start(report: FileBackedReport, extension: string): StartedFileBackedReport | null {
    if (report.hasResults === false) return null;

    const filePath = reporterOutputPath(report.fileName, extension, this.root);
    const stream = this.createStream(filePath, "utf8");
    this.trackFlush(finished(stream).then(() => undefined));

    return { filePath, stream };
  }

  public trackFlush(...flushes: Promise<unknown>[]): void {
    if (flushes.length === 0) return;

    this.pendingFlush = Promise.all([this.pendingFlush, ...flushes]).then(() => undefined);
  }

  public flush(): Promise<void> {
    return this.pendingFlush;
  }
}
