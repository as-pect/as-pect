import { ArrayBufferView } from "arraybuffer";

@global
export class Reflect {
  public static FAIL: i32 = 0;
  public static MATCH: i32 = 1;
  public static DEFER: i32 = 2;

  public static equals<T>(left: T, right: T, stack: usize[] = [], cache: usize[] = []): i32 {
    // use `==` operator to work with operator overloads and strings
    if (left == right) return Reflect.MATCH; // works immutably for string comparison

    // if it's possible for T to be null
    if (isNullable<T>()) {
      // mutual exclusion null
      if (i32(left === null) ^ i32(right === null)) return Reflect.FAIL;
    }

    // check every reference that isn't a function reference, because `left == right` suffices
    // for a proper comparison
    if (isReference<T>() && !isFunction<T>()) {
      let a = changetype<usize>(left);
      let b = changetype<usize>(right);

      let cacheLength = cache.length;
      // must be EVEN or there's a big problem
      assert((cacheLength & 0x00000001) === 0);

      // check the cache for matched pairs
      for (let i = 0; i < cacheLength; i += 2) {
        if (a === unchecked(cache[i]) && b === unchecked(cache[i + 1])) return Reflect.MATCH;
      }

      // short circuit because this pair might already be resolving
      let length = stack.length;
      for (let i = 0; i < length; i += 2) {
        let aSeen = unchecked(stack[i]);
        let bSeen = unchecked(stack[i + 1]);
        if (aSeen === a && bSeen === b) return Reflect.MATCH;
      }

      // once we've determined we need to check the references for their values, arraybuffers
      // require a memory compare
      if (left instanceof ArrayBuffer) {
        // @ts-ignore: typesafe access to byteLength property because T is ArrayBuffer
        if (left.byteLength !== right.byteLength) return Reflect.FAIL;
        let result = memory.compare(a, b, left.byteLength);
        if (result === 0) {
          cache.push(a);
          cache.push(b);
          return Reflect.MATCH;
        } else return Reflect.FAIL;
      }

      // compile time array values should be compared over a for loop
      if (left instanceof ArrayBufferView) {
        let aLength = left.length;
        // @ts-ignore: typesafe access to length
        let bLength = right.length;

        // assert the lengths are good
        if (aLength !== bLength) return Reflect.FAIL;

        // check each item
        for (let i = 0; i < aLength; i++) {
          let result = Reflect.equals(
            // @ts-ignore: typesafe and runtime check safe array access
            unchecked(left[i]), unchecked(right[i]),
            stack,
            cache,
          );
          if (result === Reflect.FAIL) return Reflect.FAIL;
        }

        // cache this result
        cache.push(a);
        cache.push(b);

        return Reflect.MATCH;
      }

      // todo: handle Set<keyof<T>> and Map<keyof<T>, valueof<T>>

      // we are trying to resolve this pair, push it to the stack
      stack.push(a);
      stack.push(b);
      // @ts-ignore: __aspectStrictEquals is defined at this point, and left cannot be null
      let result = left.__aspectStrictEquals(right, stack, cache);

      if (result) {
        cache.push(a);
        cache.push(b);
      }

      stack.pop();
      stack.pop();
      return select(Reflect.MATCH, Reflect.FAIL, result);
    } else {
      // value type, and strict equality cannot be asserted
      return Reflect.FAIL;
    }
  }
}