import {
  CommonFlags,
  InterfaceDeclaration,
  MethodDeclaration,
  ParameterKind,
  Range,
  TypeNode,
} from "assemblyscript/dist/assemblyscript.js";

import {
  ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME,
  STRICT_EQUALS_MEMBER_NAME,
} from "./ClassReflectionTransform.js";

/** Create the interface contract consumed by Reflect.equals for structural equality. */
export function createInterfaceStrictEqualsMember(interfaceDeclaration: InterfaceDeclaration): MethodDeclaration {
  const range = interfaceDeclaration.name.range;

  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression(STRICT_EQUALS_MEMBER_NAME, range),
    null,
    createInterfaceMemberFlags(interfaceDeclaration),
    null,
    TypeNode.createFunctionType(
      [
        createDefaultParameter("rawRef", createSimpleNamedType("Object", range), range),
        createDefaultParameter("stack", createArrayType("usize", range), range),
        createDefaultParameter("cache", createArrayType("usize", range), range),
        createDefaultParameter("ignore", createStaticArrayType("i64", range), range),
      ],
      createSimpleNamedType("bool", range),
      null,
      false,
      range,
    ),
    null,
    range,
  );
}

/** Create the interface contract consumed by Reflect.toReflectedValue for member reporting. */
export function createInterfaceAddReflectedValueKeyValuePairsMember(
  interfaceDeclaration: InterfaceDeclaration,
): MethodDeclaration {
  const range = interfaceDeclaration.name.range;

  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression(ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME, range),
    null,
    createInterfaceMemberFlags(interfaceDeclaration),
    null,
    TypeNode.createFunctionType(
      [
        createDefaultParameter("reflectedValue", createSimpleNamedType("i32", range), range),
        createDefaultParameter("seen", createMapType("usize", "i32", range), range),
        createDefaultParameter("ignore", createStaticArrayType("i64", range), range),
      ],
      createSimpleNamedType("void", range),
      null,
      false,
      range,
    ),
    null,
    range,
  );
}

function createInterfaceMemberFlags(interfaceDeclaration: InterfaceDeclaration): CommonFlags {
  return CommonFlags.Public | CommonFlags.Instance | (interfaceDeclaration.isGeneric ? CommonFlags.GenericContext : 0);
}

function createDefaultParameter(name: string, type: TypeNode, range: Range) {
  return TypeNode.createParameter(
    ParameterKind.Default,
    TypeNode.createIdentifierExpression(name, range),
    type,
    null,
    range,
  );
}

function createSimpleNamedType(name: string, range: Range): TypeNode {
  return TypeNode.createNamedType(TypeNode.createSimpleTypeName(name, range), null, false, range);
}

function createArrayType(name: string, range: Range): TypeNode {
  return TypeNode.createNamedType(
    TypeNode.createSimpleTypeName("Array", range),
    [createSimpleNamedType(name, range)],
    false,
    range,
  );
}

function createStaticArrayType(name: string, range: Range): TypeNode {
  return TypeNode.createNamedType(
    TypeNode.createSimpleTypeName("StaticArray", range),
    [createSimpleNamedType(name, range)],
    false,
    range,
  );
}

function createMapType(keyName: string, valueName: string, range: Range): TypeNode {
  return TypeNode.createNamedType(
    TypeNode.createSimpleTypeName("Map", range),
    [createSimpleNamedType(keyName, range), createSimpleNamedType(valueName, range)],
    false,
    range,
  );
}
