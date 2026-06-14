import { ParameterKind, ParameterNode, Range, TypeNode } from "assemblyscript/dist/assemblyscript.js";

/** Create a named type without type arguments. */
export function createSimpleNamedType(name: string, range: Range): TypeNode {
  return TypeNode.createNamedType(TypeNode.createSimpleTypeName(name, range), null, false, range);
}

/** Create an Array<T> type for generated reflection members. */
export function createArrayType(elementName: string, range: Range): TypeNode {
  return TypeNode.createNamedType(
    TypeNode.createSimpleTypeName("Array", range),
    [createSimpleNamedType(elementName, range)],
    false,
    range,
  );
}

/** Create a StaticArray<T> type for generated reflection members. */
export function createStaticArrayType(elementName: string, range: Range): TypeNode {
  return TypeNode.createNamedType(
    TypeNode.createSimpleTypeName("StaticArray", range),
    [createSimpleNamedType(elementName, range)],
    false,
    range,
  );
}

/** Create a Map<K, V> type for generated reflection members. */
export function createMapType(keyName: string, valueName: string, range: Range): TypeNode {
  return TypeNode.createNamedType(
    TypeNode.createSimpleTypeName("Map", range),
    [createSimpleNamedType(keyName, range), createSimpleNamedType(valueName, range)],
    false,
    range,
  );
}

/** Create a default parameter with the generated member range. */
export function createDefaultParameter(name: string, type: TypeNode, range: Range): ParameterNode {
  return TypeNode.createParameter(
    ParameterKind.Default,
    TypeNode.createIdentifierExpression(name, range),
    type,
    null,
    range,
  );
}
