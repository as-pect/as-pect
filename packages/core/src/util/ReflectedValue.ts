import { ReflectedValueType } from "./ReflectedValueType.js";
import { StringifyReflectedValueProps, stringifyReflectedValue } from "./stringifyReflectedValue.js";

/**
 * A JavaScript object that represents a reflected value from the as-pect testing
 * module.
 */
export class ReflectedValue {
  /** An indicator if the reflected object was managed by the runtime. */
  isManaged: boolean = false;
  /** An indicator if the reflected object was null. */
  isNull: boolean = false;
  /** A set of keys for Maps or Classes in the reflected object. */
  keys: ReflectedValue[] | null = null;
  /** Used to indicate if an expected assertion value was negated. */
  negated: boolean = false;
  /** An indicator wether the reflected object was in a nullable context. */
  nullable: boolean = false;
  /** The size of the heap allocation for a given class. */
  offset: number = 0;
  /** The pointer to the value in the module. */
  pointer: number = 0;
  /** An indicator if a number was signed. */
  signed: boolean = false;
  /** The size of an array, or the byte size of a number. */
  size: number = 0;
  /** A stack trace for the given value. */
  stack: string = "";
  /** The reflected value type. */
  type: ReflectedValueType = ReflectedValueType.None;
  /** The runtime class id for the reflected reflected value. */
  typeId: number = 0;
  /** The name of the class for a given reflected reflected value. */
  typeName: string | null = null;
  /** A string or number representing the reflected value. */
  value: number | string = 0;
  /** A set of values that are contained in a given reflected Set, Map, or Class object. */
  values: ReflectedValue[] | null = null;

  /**
   * Stringify the ReflectedValue with custom formatting.
   *
   * @param {Partial<StringifyReflectedValueProps>} props - The stringify configuration
   */
  stringify(props: Partial<StringifyReflectedValueProps> = {}): string {
    return stringifyReflectedValue(this, props);
  }
}
