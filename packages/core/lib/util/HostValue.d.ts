import { HostValueType } from "@as-pect/assembly/assembly/internal/HostValueType";
import { StringifyHostValueProps } from "./stringifyHostValue";
/**
 * A JavaScript object that represents a reflected value from the as-pect testing
 * module.
 */
export declare class HostValue {
    /** An indicator if the reflected object was managed by the runtime. */
    isManaged: boolean;
    /** An indicator if the reflected object was null. */
    isNull: boolean;
    /** A set of keys for Maps or Classes in the reflected object. */
    keys: HostValue[] | null;
    /** Used to indicate if an expected assertion value was negated. */
    negated: boolean;
    /** An indicator wether the reflected object was in a nullable context. */
    nullable: boolean;
    /** The size of the heap allocation for a given class. */
    offset: number;
    /** The pointer to the value in the module. */
    pointer: number;
    /** An indicator if a number was signed. */
    signed: boolean;
    /** The size of an array, or the byte size of a number. */
    size: number;
    /** A stack trace for the given value. */
    stack: string;
    /** The host value type. */
    type: HostValueType;
    /** The runtime class id for the reflected host value. */
    typeId: number;
    /** The name of the class for a given reflected host value. */
    typeName: string | null;
    /** A string or number representing the host value. */
    value: number | string;
    /** A set of values that are contained in a given reflected Set, Map, or Class object. */
    values: HostValue[] | null;
    /**
     * Stringify the HostValue with custom formatting.
     *
     * @param {Partial<StringifyHostValueProps>} props - The stringify configuration
     */
    stringify(props?: Partial<StringifyHostValueProps>): string;
}
