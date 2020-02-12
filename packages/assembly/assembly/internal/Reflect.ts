import { ArrayBufferView } from "arraybuffer";
import { Set } from "set";
import { assert } from "./comparison/assert";

function pairSeen(a1: usize, a2: usize, b1: usize, b2: usize): bool {
  return bool((i32(a1 === b1) & i32(a2 === b2)) | (i32(a1 === b2) & i32(a2 === b1)));
}


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
      assert(i32((cacheLength & 0x00000001) === 0), "cacheLength should be even");

      // check the cache for matched pairs
      for (let i = 0; i < cacheLength; i += 2) {
        if (pairSeen(a, b, unchecked(cache[i]), unchecked(cache[i + 1]))) return Reflect.MATCH;
      }

      // short circuit because this pair might already be resolving
      let length = stack.length;
      for (let i = 0; i < length; i += 2) {
        if (pairSeen(a, b, unchecked(stack[i]), unchecked(stack[i + 1]))) return Reflect.DEFER;
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

      if (isDefined(left[0])) { // test for safe indexof usage
        // set match
        if (left instanceof Set<indexof<T>>) {
          if (left.size !== right.size) return Reflect.FAIL;
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
                if (Reflect.equals(leftItem, rightItem, stack, cache) !== Reflect.FAIL) {
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
            return Reflect.FAIL;
          }

          cache.push(a);
          cache.push(b);

          stack.pop();
          stack.pop();
          return Reflect.MATCH;
        }

        if (left instanceof Map<indexof<T>, valueof<T>>) {
          if (left.size !== right.size) return Reflect.FAIL;
          stack.push(a);
          stack.push(b);

          let leftKeys = left.keys();
          let rightKeys = right.keys();

          let keyLength = leftKeys.length;
          let leftoverKeyLength = keyLength;
          // for each key
          for (let i = 0; i < keyLength; i++) {
            let leftKey = unchecked(leftKeys[i]);
            // assume won't find it
            let found = false;

            // find a matching key
            for (let j = 0; j < leftoverKeyLength; j++) {
              let rightKey = unchecked(rightKeys[j]);
              if (Reflect.equals(leftKey, rightKey, stack, cache) !== Reflect.FAIL) {
                // the key potentially matches at least
                let leftValue = left.get(leftKey);
                let rightValue = right.get(rightKey);

                // the values potentially match
                if (Reflect.equals(leftValue, rightValue, stack, cache) !== Reflect.FAIL) {
                  leftoverKeyLength--;
                  rightKeys.splice(j, 1); // remove this key from the list
                  found = true;
                  break;
                }
              }
            }
            if (found) {
              continue;
            } else {
              // there was no match for this key value pair
              stack.pop();
              stack.pop();
              return Reflect.FAIL;
            }
          }

          stack.pop();
          stack.pop();
          return Reflect.MATCH;
        }
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
      return select(Reflect.MATCH, Reflect.FAIL, result);
    } else {
      // value type, and strict equality cannot be asserted
      return Reflect.FAIL;
    }
  }
}
