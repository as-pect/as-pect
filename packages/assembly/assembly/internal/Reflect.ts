import { ArrayBufferView } from "arraybuffer";
import { Set } from "set";
import { assert } from "./assert";
import { HostValueType } from "./HostValueType";
import { Box } from "./Box";

function pairSeen(a1: usize, a2: usize, b1: usize, b2: usize): bool {
  return bool((i32(a1 == b1) & i32(a2 == b2)) | (i32(a1 == b2) & i32(a2 == b1)));
}

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "attachStackTraceToHostValue")
declare function attachStackTraceToHostValue(id: i32): void;

// @ts-ignore: linked function decorator
@external("__aspect", "createHostValue")
declare function createHostValue(
  isNull: bool,
  hasKeys: bool,
  nullable: bool,
  offset: i32,
  pointer: usize,
  signed: bool,
  size: i32,
  hostTypeValue: HostValueType,
  typeId: i32,
  typeName: string,
  value: usize,
  hasValues: bool,
): i32;

// @ts-ignore: external declaration
@external("__aspect", "pushHostObjectValue")
@global
declare function __aspectPushHostObjectValue(hostObject: i32, value: i32): void;

// @ts-ignore: external declaration
@external("__aspect", "pushHostObjectKey")
@global
declare function __aspectPushHostObjectKey(hostObject: i32, value: i32): void;

@global
// @ts-ignore: global decorator is allowed here
export class Reflect {
  /**
   * Create a host value for inspection.
   *
   * @param {T} value - The value to be inspected.
   * @param {Map<usize, i32>} seen - A map of pointers to hostObject for caching purposes.
   */
  public static toHostValue<T>(value: T, seen: Map<usize, i32> = new Map<usize, i32>()): i32 {
    // if T is a reference
    if (isReference<T>()) {
      // if the value is null, create a Null host value
      if (changetype<usize>(value) == 0) {
        return createHostValue(
          true,
          false,
          true,
          0,
          0,
          false,
          sizeof<T>(),
          isFunction<T>() ? HostValueType.Function : HostValueType.Class,
          idof<T>(),
          isFunction<T>() ? "Function" : nameof<T>(),
          0,
          false,
        );
      }

      // check the cache for anything that isn't a function
      if (!isFunction<T>()) {
        if (seen.has(changetype<usize>(value))) {
          return seen.get(changetype<usize>(value));
        }
      }
      if (value instanceof ArrayBuffer) {
        let hostValue = createHostValue(
          false,
          false,
          isNullable<T>(),
          value.byteLength,
          changetype<usize>(value),
          false,
          value.byteLength,
          HostValueType.ArrayBuffer,
          idof<T>(),
          nameof<T>(),
          0,
          true,
        );
        seen.set(changetype<usize>(value), hostValue);
        let length = value.byteLength;
        for (let i = 0; i < length; i++) {
          __aspectPushHostObjectValue(
            hostValue,
            Reflect.toHostValue(load<u8>(changetype<usize>(value) + <usize>i), seen),
          );
        }
        return hostValue
      } else if (isFunction<T>()) {
        let hostValue = createHostValue(
          false,
          false,
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          0,
          HostValueType.Function,
          idof<T>(),
          "Function",
          changetype<usize>(value),
          false,
        );
        return hostValue;
      } else if (value instanceof Set) {
        // create a Set host object
        let hostObject = createHostValue(
          false,
          false, // sets don't have keys
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          value.size,
          HostValueType.Set,
          idof<T>(),
          nameof<T>(),
          0,
          true, // sets have values
        );

        // cache this value
        seen.set(changetype<usize>(value), hostObject);

        // loop over each item and push it to the Set
        let values = value.values();
        let length = values.length;
        for (let i = 0; i < length; i++) {
          let value = unchecked(values[i]);
          let hostValueID = Reflect.toHostValue(value, seen);
          __aspectPushHostObjectValue(hostObject, hostValueID);
        }
      } else if (value instanceof Map) {
        // create a Set host object
        let hostObject = createHostValue(
          false,
          true, // maps have keys
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          value.size,
          HostValueType.Map,
          idof<T>(),
          nameof<T>(),
          0,
          true, // maps have values
        );

        // cache this value
        seen.set(changetype<usize>(value), hostObject);

        // loop over each key and push the key value pair to the host Map
        let keys = value.keys();
        let length = keys.length;
        for (let i = 0; i < length; i++) {
          let mapKey = unchecked(keys[i]);
          let hostKeyID = Reflect.toHostValue(mapKey, seen);
          __aspectPushHostObjectKey(hostObject, hostKeyID);

          let mapValue = value.get(mapKey);
          let hostValueID = Reflect.toHostValue(mapValue, seen);
          __aspectPushHostObjectKey(hostObject, hostValueID);
        }

        return hostObject;
      } else if (value instanceof ArrayBufferView) {
        let length = value.length;

        // create a Set host object
        let hostObject = createHostValue(
          false,
          false, // arrays don't have keys
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          length,
          HostValueType.TypedArray,
          idof<T>(),
          nameof<T>(),
          0,
          true, // maps have values
        );

        // cache this value
        seen.set(changetype<usize>(value), hostObject);

        // loop over each value and push it to the host object
        for (let i = 0; i < length; i++) {
          // @ts-ignore index signature is garunteed at this point
          let arrayValue = unchecked(value[i]);
          let hostArrayValueID = Reflect.toHostValue(arrayValue, seen);
          __aspectPushHostObjectValue(hostObject, hostArrayValueID);
        }

        return hostObject;
      } else if (value instanceof String) {
        let hostValue = createHostValue(
          false,
          false,
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          value.length,
          HostValueType.String,
          idof<T>(),
          nameof<T>(),
          changetype<usize>(value),
          false,
        );
        seen.set(changetype<usize>(value), hostValue);
        return hostValue;
      } else if (isArrayLike<T>()) {
        // @ts-ignore: arraylike has length property
        let length = <i32>value.length;

        // create a Set host object
        let hostObject = createHostValue(
          false,
          false, // arrays don't have keys
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          length,
          HostValueType.Array,
          isManaged<T>() ? idof<T>() : 0,
          nameof<T>(),
          0,
          true, // maps have values
        );

        // cache this value
        seen.set(changetype<usize>(value), hostObject);

        // loop over each array item and push it to the host object
        for (let i = 0; i < length; i++) {
          // @ts-ignore: index signature in arraylike
          if (isDefined(unchecked(value[0]))) {
            // @ts-ignore: index signature in arraylike
            let arrayValue = unchecked(value[i]);
            let hostArrayValueID = Reflect.toHostValue(arrayValue, seen);
            __aspectPushHostObjectValue(hostObject, hostArrayValueID);
          } else {
            // @ts-ignore: index signature in arraylike
            let arrayValue = value[i];
            let hostArrayValueID = Reflect.toHostValue(arrayValue, seen);
            __aspectPushHostObjectValue(hostObject, hostArrayValueID);
          }
        }
        return hostObject;
      } else {
        // generic class
        let hostValue = createHostValue(
          false,
          true, // classes have keys
          isNullable<T>(),
          offsetof<T>(),
          changetype<usize>(value),
          false,
          RTrace.sizeOf(changetype<usize>(value)),
          HostValueType.Class,
          isManaged<T>() ? idof<T>() : 0,
          nameof<T>(),
          0,
          true, // classes have values
        );

        // cache this object
        seen.set(changetype<usize>(value), hostValue);

        // @ts-ignore: __aspectAddHostValueKeyValuePairs is auto-generated by the transform
        value.__aspectAddHostValueKeyValuePairs(hostValue, seen);

        return hostValue;
      }
    } else {
      // box the number first before passing up the pointer to collect the value
      let box = new Box<T>(value);
      let hostObject = createHostValue(
        false,
        false,
        false,
        0,
        changetype<usize>(box),
        isSigned<T>(),
        sizeof<T>(),
        isBoolean<T>()
          ? HostValueType.Boolean
          : (isInteger<T>() ? HostValueType.Integer : HostValueType.Float),
        0,
        nameof<T>(),
        changetype<usize>(box),
        false,
      );
      return hostObject;
    }
    return 0;
  }

  public static equals<T>(left: T, right: T, stack: usize[] = [], cache: usize[] = []): i32 { 
    // use `==` operator to work with operator overloads and strings
    if (left == right) return Reflect.SUCCESSFUL_MATCH; // works immutably for string comparison

    // floats should equal each other
    if (isFloat<T>(left)) {
      if (i32(isNaN(left)) & i32(isNaN(right))) return Reflect.SUCCESSFUL_MATCH;
    }

    // short circuit for strings
    if (left instanceof String) {
      return Reflect.FAILED_MATCH;
    }

    // if it's possible for T to be null
    if (isNullable<T>()) {
      // mutual exclusion null
      if (i32(changetype<usize>(left) == 0) ^ i32(changetype<usize>(right) == null)) return Reflect.FAILED_MATCH;
    }

    // check every reference that isn't a function reference, because `left == right` suffices
    // for a proper comparison
    if (isReference<T>() && !isFunction<T>()) {
      let a = changetype<usize>(left);
      let b = changetype<usize>(right);

      let cacheLength = cache.length;
      // must be EVEN or there's a big problem
      assert(i32((cacheLength & 0x00000001) == 0), "cacheLength should be even");

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
        // @ts-ignore: typesafe access to byteLength property because T is ArrayBuffer
        if (left.byteLength != right.byteLength) return Reflect.FAILED_MATCH;
        let result = memory.compare(a, b, left.byteLength);
        if (result == 0) {
          cache.push(a);
          cache.push(b);
          return Reflect.SUCCESSFUL_MATCH;
        } else return Reflect.FAILED_MATCH;
      }

      // @ts-ignore: valid index signature check
      if (isDefined(left[0])) { // test for safe indexof usage
        // set match
        if (left instanceof Set) {
          // @ts-ignore: size is a valid property of Set
          if (left.size != right.size) return Reflect.FAILED_MATCH;
          stack.push(a);
          stack.push(b);
          // @ts-ignore: values() is a valid function of Set
          let leftValues = left.values();
          // @ts-ignore: values() is a valid function of Set
          let rightValues = right.values();
          let length = leftValues.length;
          let leftoverLength = length;
          for (let i = 0; i < length; i++) {
            let leftItem = unchecked(leftValues[i]);
            let continueOuter = false;
            for (let j = 0; j < leftoverLength; j++) {
              let rightItem = unchecked(rightValues[j]);
              if (Reflect.equals(leftItem, rightItem, stack, cache) != Reflect.FAILED_MATCH) {
                rightValues.splice(j, 1);
                leftoverLength--;
                continueOuter = true;
                break;
              };
            }
            if (continueOuter) continue;

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
          // @ts-ignore: size is a valid property of Map
          if (left.size != right.size) return Reflect.FAILED_MATCH;
          stack.push(a);
          stack.push(b);

          // collect all the keys and loop over each one
          let leftKeys = left.keys();
          // @ts-ignore: keys() is a valid function of Map
          let rightKeys = right.keys();

          // @ts-ignore: length is a valid property of Array
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
              if (Reflect.equals(leftKey, rightKey, stack, cache) != Reflect.FAILED_MATCH) {
                // the key potentially matches, obtain the values associated with the keys
                let leftValue = left.get(leftKey);
                // @ts-ignore: get() is a valid function of Map
                let rightValue = right.get(rightKey);

                // if the values match, or are still being resolved
                if (Reflect.equals(leftValue, rightValue, stack, cache) != Reflect.FAILED_MATCH) {
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
          if (result == Reflect.SUCCESSFUL_MATCH) {
            cache.push(a);
            cache.push(b);
          }

          stack.pop();
          stack.pop();
          return result;
        }
      }

      // compile time array values should be compared over a for loop
      if (left instanceof ArrayBufferView) {
        // @ts-ignore: typesafe access to length
        let aLength = left.length;
        // @ts-ignore: typesafe access to length
        let bLength = right.length;

        // assert the lengths are good
        if (aLength != bLength) return Reflect.FAILED_MATCH;

        // check each item
        for (let i = 0; i < aLength; i++) {
          let result = Reflect.equals(
            // @ts-ignore: typesafe and runtime check safe array access
            unchecked(left[i]), unchecked(right[i]),
            stack,
            cache,
          );
          if (result == Reflect.FAILED_MATCH) return Reflect.FAILED_MATCH;
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

  /**
   * Attach a stack trace to a value.
   *
   * @param {i32} hostValueID - The host value to attach the current stack trace to.
   */
  public static attachStackTrace(id: i32): void {
    attachStackTraceToHostValue(id);
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
