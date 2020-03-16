import { ArrayBufferView } from "arraybuffer";
import { Set } from "set";
import { assert } from "./assert";
import { ReflectedValueType } from "./ReflectedValueType";
import { Box } from "./Box";

function pairSeen(a1: usize, a2: usize, b1: usize, b2: usize): bool {
  return bool(
    (i32(a1 == b1) & i32(a2 == b2)) | (i32(a1 == b2) & i32(a2 == b1)),
  );
}

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "attachStackTraceToReflectedValue")
declare function attachStackTraceToReflectedValue(id: i32): void;

// @ts-ignore: linked function decorator
@external("__aspect", "createReflectedValue")
declare function createReflectedValue(
  isNull: bool,
  hasKeys: bool,
  nullable: bool,
  offset: i32,
  pointer: usize,
  signed: bool,
  size: i32,
  reflectedTypeValue: ReflectedValueType,
  typeId: i32,
  typeName: string,
  value: usize,
  hasValues: bool,
  isManaged: bool,
): i32;

// @ts-ignore: external declaration
@external("__aspect", "pushReflectedObjectValue")
@global
declare function __aspectPushReflectedObjectValue(
  parentID: i32,
  value: i32,
): void;

// @ts-ignore: external declaration
@external("__aspect", "pushReflectedObjectKey")
@global
declare function __aspectPushReflectedObjectKey(
  parentID: i32,
  value: i32,
): void;

@global
// @ts-ignore: global decorator is allowed here
export class Reflect {
  /**
   * Create a reflected value for inspection.
   *
   * @param {T} value - The value to be inspected.
   * @param {Map<usize, i32>} seen - A map of pointers to ReflectedValue ids for caching purposes.
   */
  public static toReflectedValue<T>(
    value: T,
    seen: Map<usize, i32> = new Map<usize, i32>(),
  ): i32 {
    // if T is a reference
    if (isReference<T>()) {
      // if the value is null, create a Null reflected value
      if (changetype<usize>(value) == 0) {
        return createReflectedValue(
          true,
          false,
          isNullable<T>(),
          0,
          0,
          false,
          sizeof<T>(),
          isFunction<T>()
            ? ReflectedValueType.Function
            : ReflectedValueType.Class,
          isManaged<T>() ? idof<T>() : 0,
          isFunction<T>() ? "Function" : nameof<T>(),
          0,
          false,
          isManaged<T>(),
        );
      }

      // check the cache for anything that isn't a function
      if (!isFunction<T>()) {
        if (seen.has(changetype<usize>(value))) {
          return seen.get(changetype<usize>(value));
        }
      }

      // @ts-ignore: __aspectReflectAs() can potentially be implemented
      if (isDefined(value.__aspectReflectAs())) {
        // @ts-ignore: typesafe call to __aspectReflectAs()
        let displayValue = value.__aspectReflectAs();
        if (
          !isInteger(displayValue) &&
          !isFloat(displayValue) &&
          !isManaged(displayValue)
        ) {
          ERROR(
            "__aspectReflectAs() function should return a managed type or a number",
          );
        }
        return Reflect.toReflectedValue(displayValue, seen);
      }

      if (value instanceof ArrayBuffer) {
        let reflectedValue = createReflectedValue(
          false,
          false,
          isNullable<T>(),
          value.byteLength,
          changetype<usize>(value),
          false,
          value.byteLength,
          ReflectedValueType.ArrayBuffer,
          idof<T>(),
          nameof<T>(),
          0,
          true,
          true,
        );
        seen.set(changetype<usize>(value), reflectedValue);
        let length = value.byteLength;
        for (let i = 0; i < length; i++) {
          __aspectPushReflectedObjectValue(
            reflectedValue,
            Reflect.toReflectedValue(
              load<u8>(changetype<usize>(value) + <usize>i),
              seen,
            ),
          );
        }
        return reflectedValue;
      } else if (isFunction<T>()) {
        let reflectedValue = createReflectedValue(
          false,
          false,
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          0,
          ReflectedValueType.Function,
          idof<T>(),
          "Function",
          changetype<usize>(value),
          false,
          isManaged<T>(),
        );
        return reflectedValue;
      } else if (value instanceof Set) {
        // create a Set reflected value
        let reflectedObject = createReflectedValue(
          false,
          false, // sets don't have keys
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          value.size,
          ReflectedValueType.Set,
          idof<T>(),
          nameof<T>(),
          0,
          true, // sets have values
          true,
        );

        // cache this value
        seen.set(changetype<usize>(value), reflectedObject);

        // loop over each item and push it to the Set
        let values = value.values();
        let length = values.length;
        for (let i = 0; i < length; i++) {
          let value = unchecked(values[i]);
          let reflectedValueID = Reflect.toReflectedValue(value, seen);
          __aspectPushReflectedObjectValue(reflectedObject, reflectedValueID);
        }
      } else if (value instanceof Map) {
        // create a Set reflected object
        let reflectedValue = createReflectedValue(
          false,
          true, // maps have keys
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          value.size,
          ReflectedValueType.Map,
          idof<T>(),
          nameof<T>(),
          0,
          true, // maps have values
          true,
        );

        // cache this value
        seen.set(changetype<usize>(value), reflectedValue);

        // loop over each key and push the key value pair to the reflected Map
        let keys = value.keys();
        let length = keys.length;
        for (let i = 0; i < length; i++) {
          let mapKey = unchecked(keys[i]);
          let reflectedKeyID = Reflect.toReflectedValue(mapKey, seen);
          __aspectPushReflectedObjectKey(reflectedValue, reflectedKeyID);

          let mapValue = value.get(mapKey);
          let reflectedValueID = Reflect.toReflectedValue(mapValue, seen);
          __aspectPushReflectedObjectValue(reflectedValue, reflectedValueID);
        }

        return reflectedValue;
      } else if (value instanceof ArrayBufferView) {
        let length = value.length;

        // create an arraylike reflected value
        let reflectedValue = createReflectedValue(
          false,
          false, // arrays don't have keys
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          length,
          value instanceof Array
            ? ReflectedValueType.Array
            : ReflectedValueType.TypedArray,
          idof<T>(),
          nameof<T>(),
          0,
          true, // maps have values
          isManaged<T>(),
        );

        // cache this value
        seen.set(changetype<usize>(value), reflectedValue);

        // loop over each value and push it to the reflected value
        for (let i = 0; i < length; i++) {
          // @ts-ignore index signature is garunteed at this point
          let arrayValue = unchecked(value[i]);
          let reflectedArrayValueID = Reflect.toReflectedValue(
            arrayValue,
            seen,
          );
          __aspectPushReflectedObjectValue(
            reflectedValue,
            reflectedArrayValueID,
          );
        }

        return reflectedValue;
      } else if (value instanceof String) {
        let reflectedStringID = createReflectedValue(
          false,
          false,
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          value.length,
          ReflectedValueType.String,
          idof<T>(),
          nameof<T>(),
          changetype<usize>(value),
          false,
          true,
        );
        seen.set(changetype<usize>(value), reflectedStringID);
        return reflectedStringID;
      } else if (isArrayLike<T>()) {
        // @ts-ignore: arraylike has length property
        let length = <i32>value.length;

        // create an arraylike reflected value
        let reflectedValue = createReflectedValue(
          false,
          false, // arrays don't have keys
          isNullable<T>(),
          0,
          changetype<usize>(value),
          false,
          length,
          ReflectedValueType.Array,
          isManaged<T>() ? idof<T>() : 0,
          nameof<T>(),
          0,
          true, // maps have values
          isManaged<T>(),
        );

        // cache this value
        seen.set(changetype<usize>(value), reflectedValue);

        // loop over each array item and push it to the reflected value
        for (let i = 0; i < length; i++) {
          // @ts-ignore: index signature in arraylike
          if (isDefined(unchecked(value[0]))) {
            // @ts-ignore: index signature in arraylike
            let arrayValue = unchecked(value[i]);
            let reflectedArrayValueID = Reflect.toReflectedValue(
              arrayValue,
              seen,
            );
            __aspectPushReflectedObjectValue(
              reflectedValue,
              reflectedArrayValueID,
            );
          } else {
            // @ts-ignore: index signature in arraylike
            let arrayValue = value[i];
            let reflectedArrayValueID = Reflect.toReflectedValue(
              arrayValue,
              seen,
            );
            __aspectPushReflectedObjectValue(
              reflectedValue,
              reflectedArrayValueID,
            );
          }
        }
        return reflectedValue;
      } else {
        // generic class
        let reflectedObjectID = createReflectedValue(
          false,
          true, // classes have keys
          isNullable<T>(),
          offsetof<T>(),
          changetype<usize>(value),
          false,
          RTrace.sizeOf(changetype<usize>(value)),
          ReflectedValueType.Class,
          isManaged<T>() ? idof<T>() : 0,
          nameof<T>(),
          0,
          true, // classes have values
          isManaged<T>(),
        );

        // cache this object
        seen.set(changetype<usize>(value), reflectedObjectID);

        // @ts-ignore: __aspectAddReflectedValueKeyValuePairs is auto-generated by the transform
        value.__aspectAddReflectedValueKeyValuePairs(
          reflectedObjectID,
          seen,
          [] as StaticArray<i64>,
        );

        return reflectedObjectID;
      }
    } else {
      // box the number first before passing up the pointer to collect the value
      let box = new Box<T>(value);
      let reflectedValue = createReflectedValue(
        false,
        false,
        false,
        0,
        changetype<usize>(box),
        isSigned<T>(),
        sizeof<T>(),
        isBoolean<T>()
          ? ReflectedValueType.Boolean
          : isInteger<T>()
          ? ReflectedValueType.Integer
          : ReflectedValueType.Float,
        0,
        nameof<T>(),
        changetype<usize>(box),
        false,
        false,
      );
      return reflectedValue;
    }
    return 0;
  }

  public static equals<T>(
    left: T,
    right: T,
    stack: usize[] = [],
    cache: usize[] = [],
  ): i32 {
    // use `==` operator to work with operator overloads and strings
    if (left == right) return Reflect.SUCCESSFUL_MATCH; // works immutably for string comparison

    // floats should equal each other
    if (isFloat<T>(left)) {
      if (i32(isNaN(left)) & i32(isNaN(right))) return Reflect.SUCCESSFUL_MATCH;
    }

    if (isReference(left)) {
      // T can always be null if it's a reference, emit a runtime check for it regardless of type
      if (i32(changetype<usize>(left) == 0) ^ i32(changetype<usize>(right) == 0)) {
        return Reflect.FAILED_MATCH;
      }
    }

    // check every reference that isn't a function reference
    if (isReference<T>() && !isFunction<T>()) {
      if (isNullable<T>()) {
        return referencesEqual(left!, right!, stack, cache);
      } else {
        return referencesEqual(left, right, stack, cache);
      }
    } else {
      // value type, and strict equality cannot be asserted
      return Reflect.FAILED_MATCH;
    }
  }

  /**
   * Attach a stack trace to a value.
   *
   * @param {i32} id - The reflected value to attach the current stack trace to.
   */
  public static attachStackTrace(id: i32): void {
    attachStackTraceToReflectedValue(id);
  }
}

function referencesEqual<T>(left: T, right: T, stack: usize[], cache: usize[]): i32 {
  let a = changetype<usize>(left);
  let b = changetype<usize>(right);

  let cacheLength = cache.length;
  // must be EVEN or there's a big problem
  assert(
    i32((cacheLength & 0x00000001) == 0),
    "cacheLength should be even",
  );

  // short circuit for strings
  if (left instanceof String) {
    return Reflect.FAILED_MATCH;
  }

  // check the cache for matched pairs
  for (let i = 0; i < cacheLength; i += 2) {
    if (pairSeen(a, b, unchecked(cache[i]), unchecked(cache[i + 1])))
      return Reflect.SUCCESSFUL_MATCH;
  }

  // short circuit because this pair might already be resolving
  let length = stack.length;
  for (let i = 0; i < length; i += 2) {
    if (pairSeen(a, b, unchecked(stack[i]), unchecked(stack[i + 1])))
      return Reflect.DEFER_MATCH;
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
  if (isDefined(left[0])) {
    // test for safe indexof usage
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
          if (
            Reflect.equals(leftItem, rightItem, stack, cache) !=
            Reflect.FAILED_MATCH
          ) {
            rightValues.splice(j, 1);
            leftoverLength--;
            continueOuter = true;
            break;
          }
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
          if (
            Reflect.equals(leftKey, rightKey, stack, cache) !=
            Reflect.FAILED_MATCH
          ) {
            // the key potentially matches, obtain the values associated with the keys
            let leftValue = left.get(leftKey);
            // @ts-ignore: get() is a valid function of Map
            let rightValue = right.get(rightKey);

            // if the values match, or are still being resolved
            if (
              Reflect.equals(leftValue, rightValue, stack, cache) !=
              Reflect.FAILED_MATCH
            ) {
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

    // compile time array values should be compared over a for loop
    if (isDefined(left.length)) {
      // @ts-ignore: typesafe access to length
      let aLength = left.length;
      // @ts-ignore: typesafe access to length
      let bLength = right.length;

      // assert the lengths are good
      if (aLength != bLength) return Reflect.FAILED_MATCH;

      // check each item
      for (let i = 0; i < aLength; i++) {
        if (isDefined(unchecked(left[0]))) {
          let result = Reflect.equals(
            // @ts-ignore: typesafe and runtime check safe array access
            unchecked(left[i]),
            // @ts-ignore: typesafe and runtime check safe array access
            unchecked(right[i]),
            stack,
            cache,
          );
          if (result == Reflect.FAILED_MATCH) return Reflect.FAILED_MATCH;
        } else {
          let result = Reflect.equals(
            // @ts-ignore: typesafe and runtime check safe array access
            left[i],
            // @ts-ignore: typesafe and runtime check safe array access
            right[i],
            stack,
            cache,
          );
          if (result == Reflect.FAILED_MATCH) return Reflect.FAILED_MATCH;
        }
      }

      // cache this result
      cache.push(a);
      cache.push(b);

      return Reflect.SUCCESSFUL_MATCH;
    }
  }

  // todo: handle Set<keyof<T>> and Map<keyof<T>, valueof<T>>

  // we are trying to resolve this pair, push it to the stack
  stack.push(a);
  stack.push(b);

  let result = false;
  // @ts-ignore: __aspectStrictEquals is defined at this point
  result = (isNullable(left) ? left! : left).__aspectStrictEquals(
    right,
    stack,
    cache,
    [] as StaticArray<i64>,
  );

  if (result) {
    cache.push(a);
    cache.push(b);
  }

  stack.pop();
  stack.pop();
  return select(Reflect.SUCCESSFUL_MATCH, Reflect.FAILED_MATCH, result);
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
