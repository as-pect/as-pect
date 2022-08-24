import { assemblyscript } from "@as-pect/assemblyscript";

const { TypeNode, Range } = assemblyscript;
type TypeNode = InstanceType<typeof TypeNode>;
type Range = InstanceType<typeof Range>;

/**
 * This method makes a generic named parameter.
 *
 * @param {string} name - The name of the type.
 * @param {Range} range - The range given for the type parameter.
 */
export function createGenericTypeParameter(
  name: string,
  range: Range,
): TypeNode {
  return TypeNode.createNamedType(
    TypeNode.createSimpleTypeName(name, range),
    null,
    false,
    range,
  );
}
