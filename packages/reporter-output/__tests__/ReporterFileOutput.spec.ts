import { jest } from "@jest/globals";
import { Writable } from "stream";
import { join } from "path";
import { ReporterFileOutput, reporterOutputPath, type CreateReporterWriteStream } from "../index.js";

class DelayedWritable extends Writable {
  private finalCallback: (() => void) | null = null;

  public _write(_chunk: Buffer, _encoding: BufferEncoding, callback: (error?: Error | null) => void): void {
    callback();
  }

  public _final(callback: (error?: Error | null) => void): void {
    this.finalCallback = callback;
  }

  public finish(): void {
    this.finalCallback?.();
  }
}

describe("ReporterFileOutput", () => {
  it("builds reporter output paths next to the source test entry", () => {
    expect(reporterOutputPath("assembly/__tests__/entry.spec.ts", ".json", "/workspace/project")).toBe(
      join("/workspace/project", "assembly", "__tests__", "entry.spec.json"),
    );
  });

  it("does not create a stream for reports with no executed results", async () => {
    const createStream = jest.fn<CreateReporterWriteStream>();
    const output = new ReporterFileOutput(createStream, "/workspace/project");

    expect(output.start({ fileName: "assembly/__tests__/entry.spec.ts", hasResults: false }, ".csv")).toBeNull();
    await expect(output.flush()).resolves.toBeUndefined();
    expect(createStream).not.toHaveBeenCalled();
  });

  it("keeps flush pending until the output stream finishes", async () => {
    const stream = new DelayedWritable();
    const output = new ReporterFileOutput(() => stream, "/workspace/project");
    const started = output.start({ fileName: "assembly/__tests__/entry.spec.ts", hasResults: true }, ".json");
    let flushed = false;

    started?.stream.end("[]");
    const pendingFlush = output.flush().then(() => {
      flushed = true;
    });
    await Promise.resolve();

    expect(flushed).toBe(false);

    stream.finish();
    await pendingFlush;
    expect(flushed).toBe(true);
  });

  it("surfaces stream write errors through flush", async () => {
    const stream = new Writable({
      write(_chunk, _encoding, callback): void {
        callback(new Error("write failed"));
      },
    });
    const output = new ReporterFileOutput(() => stream, "/workspace/project");
    const started = output.start({ fileName: "assembly/__tests__/entry.spec.ts", hasResults: true }, ".json");

    started?.stream.write("[]");
    started?.stream.end();

    await expect(output.flush()).rejects.toThrow("write failed");
  });
});
