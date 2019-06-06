/**
 * This interface is a utitily used to describe the shape of something that has a `write()` method.
 */
export interface IWritable {
  write(chunk: string): void;
}
