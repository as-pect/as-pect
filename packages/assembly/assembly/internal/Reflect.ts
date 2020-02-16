import { ArrayBufferView } from "arraybuffer";
import { Set } from "set";
import { assert } from "./comparison/assert";

function pairSeen(a1: usize, a2: usize, b1: usize, b2: usize): bool {
  return bool((i32(a1 === b1) & i32(a2 === b2)) | (i32(a1 === b2) & i32(a2 === b1)));
}


@global
export class Reflect {
  public static equals<T>(left: T, right: T, stack: usize[] = [], cache: usize[] = []): i32 {
    // use `==` operator to work with operator overloads and strings
    if (left == right) return Reflect.SUCCESSFUL_MATCH; // works immutably for string comparison

    // short circuit for strings
    if (left instanceof String) {
      return Reflect.FAILED_MATCH;
    }

    // if it's possible for T to be null
    if (isNullable<T>()) {
      // mutual exclusion null
      if (i32(left === null) ^ i32(right === null)) return Reflect.FAILED_MATCH;
    }

    // check every reference that isn't a function reference, because `left == right` suffices
    // for a proper comparison
    if (isReference<T>() && !isFunction<T>()) {
      let a = changetype<usize>(left);
      let b = changetype<usize>(right);

      let cacheLength = cache.length;
      // must be EVEN or there's a big problem
      assert(i32((cacheLength & 0x00000001) === 0), "cacheLength should be even");

      // check the cache for matched pairs
      for (let i = 0; i < cacheLength; i += 2) {
        if (pairSeen(a, b, unchecked(cache[i]), unchecked(cache[i + 1]))) return Reflect.SUCCESSFUL_MATCH;
      }

      // short circuit because this pair might already be resolving
      let length = stack.length;
      for (let i = 0; i < length; i += 2) {
        if (pairSeen(a, b, unchecked(stack[i]), unchecked(stack[i + 1]))) return Reflect.DEFER_MATCH;
      }

      // once we've determined we need to check the references for their values, arraybuffers
      // require a memory compare
      if (left instanceof ArrayBuffer) {
        if (left.byteLength !== right.byteLength) return Reflect.FAILED_MATCH;
        let result = memory.compare(a, b, left.byteLength);
        if (result === 0) {
          cache.push(a);
          cache.push(b);
          return Reflect.SUCCESSFUL_MATCH;
        } else return Reflect.FAILED_MATCH;
      }

      // set match
      if (left instanceof Set) {
        if (left.size !== right.size) return Reflect.FAILED_MATCH;
        stack.push(a);
        stack.push(b);
        let leftValues = left.values();
        let rightValues = right.values();
        let length = leftValues.length;
        let leftoverLength = length;
        for (let i = 0; i < length; i++) {
          let leftItem = unchecked(leftValues[i]);
          if (rightValues.includes(leftItem)) {
            let index = rightValues.indexOf(leftItem);
            rightValues.splice(index, 1);
            leftoverLength--;
            continue; // short circuit
          }

          if (isReference<indexof<T>>() && !isFunction<indexof<T>>()) {
            let continueOuter = false;
            // long path, compare every item in the set
            for (let j = 0; j < leftoverLength; j++) {
              let rightItem = unchecked(rightValues[j]);
              if (Reflect.equals(leftItem, rightItem, stack, cache) !== Reflect.FAILED_MATCH) {
                rightValues.splice(j, 1);
                leftoverLength--;
                continueOuter = true;
                break;
              };
            }
            if (continueOuter) continue;
          }

          stack.pop();
          stack.pop();
          return Reflect.FAILED_MATCH;
        }

        cache.push(a);
        cache.push(b);

        stack.pop();
        stack.pop();
        return Reflect.SUCCESSFUL_MATCH;
      }

      if (left instanceof Map) {
        if (left.size !== right.size) return Reflect.FAILED_MATCH;
        stack.push(a);
        stack.push(b);

        // collect all the keys and loop over each one
        let leftKeys = left.keys();
        let rightKeys = right.keys();

        let keyLength = leftKeys.length;
        let leftoverKeyLength = keyLength;

        // assume we match and determine if the match was a failure
        let result = Reflect.SUCCESSFUL_MATCH;

        // for each key
        for (let i = 0; i < keyLength; i++) {
          let leftKey = unchecked(leftKeys[i]);
          // assume won't find it
          let found = false;

          // find a matching key
          for (let j = 0; j < leftoverKeyLength; j++) {
            let rightKey = unchecked(rightKeys[j]);

            // if the keys match, or are still being resolved
            if (Reflect.equals(leftKey, rightKey, stack, cache) !== Reflect.FAILED_MATCH) {
              // the key potentially matches, obtain the values associated with the keys
              let leftValue = left.get(leftKey);
              let rightValue = right.get(rightKey);

              // if the values match, or are still being resolved
              if (Reflect.equals(leftValue, rightValue, stack, cache) !== Reflect.FAILED_MATCH) {
                leftoverKeyLength--;
                rightKeys.splice(j, 1); // remove this key from the list
                found = true;
                break;
              }
            }
          }

          // if there was no match for this key value pair, the result is Failed
          if (!found) {
            result = Reflect.FAILED_MATCH;
            break;
          }
        }

        // if every key matched, result is still equal to `Reflect.MATCH`
        if (result === Reflect.SUCCESSFUL_MATCH) {
          cache.push(a);
          cache.push(b);
        }

        stack.pop();
        stack.pop();
        return result;
      }

      // compile time array values should be compared over a for loop
      if (left instanceof ArrayBufferView) {
        let aLength = left.length;
        // @ts-ignore: typesafe access to length
        let bLength = right.length;

        // assert the lengths are good
        if (aLength !== bLength) return Reflect.FAILED_MATCH;



        // check each item
        for (let i = 0; i < aLength; i++) {
          let result = Reflect.equals(
            // @ts-ignore: typesafe and runtime check safe array access
            unchecked(left[i]), unchecked(right[i]),
            stack,
            cache,
          );
          if (result === Reflect.FAILED_MATCH) return Reflect.FAILED_MATCH;
        }

        // cache this result
        cache.push(a);
        cache.push(b);

        return Reflect.SUCCESSFUL_MATCH;
      }

      // todo: handle Set<keyof<T>> and Map<keyof<T>, valueof<T>>

      // we are trying to resolve this pair, push it to the stack
      stack.push(a);
      stack.push(b);

      let result = false;
      if (isNullable<T>()) {
        // @ts-ignore: __aspectStrictEquals is defined at this point, and left and right cannot be null
        result = left!.__aspectStrictEquals(right!, stack, cache);
      } else {
        // @ts-ignore: __aspectStrictEquals is defined at this point
        result = left.__aspectStrictEquals(right, stack, cache);
      }

      if (result) {
        cache.push(a);
        cache.push(b);
      }

      stack.pop();
      stack.pop();
      return select(Reflect.SUCCESSFUL_MATCH, Reflect.FAILED_MATCH, result);
    } else {
      // value type, and strict equality cannot be asserted
      return Reflect.FAILED_MATCH;
    }
  }
}

export namespace Reflect {
  /**
   * A return value from the Reflect.equals function used to indicate two values
   * do not strictly equal each other.
   */
  export const FAILED_MATCH = 0;
  /**
   * A return value from the Reflect.equals function used to indicate two values
   * strictly equal each other.
   */
  export const SUCCESSFUL_MATCH = 1;
  /**
   * A return value from the Reflect.equals function used to indicate two values
   * potentially strictly equal each other, but because the pair is currently
   * resolving because of circular references, we cannot confirm it's a succesful
   * match. Instead, we *assume* it's succesful and ignore the current pair.
   */
  export const DEFER_MATCH = 2;
}
