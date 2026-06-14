import { CommonFlags, InterfaceDeclaration, MethodDeclaration, TypeNode } from "assemblyscript/dist/assemblyscript.js";

import {
  ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME,
  STRICT_EQUALS_MEMBER_NAME,
} from "./ClassReflectionTransform.js";
import {
  createArrayType,
  createDefaultParameter,
  createMapType,
  createSimpleNamedType,
  createStaticArrayType,
} from "./astHelpers.js";

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
