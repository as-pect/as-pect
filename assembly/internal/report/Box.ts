/**
 * This class is reponsible for performing a single heap allocation to store a single value on the
 * heap.
 */
export class Box<T> {
  constructor(
    public value: T,
  ) {}
}
