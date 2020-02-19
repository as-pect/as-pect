import {
  BlockStatement,
  ClassDeclaration,
  CommonFlags,
  FieldDeclaration,
  FunctionDeclaration,
  IfStatement,
  NodeKind,
  ParameterKind,
  Range,
  Statement,
  Token,
  TypeNode,
  ParameterNode,
  PropertyAccessExpression,
} from "./assemblyscript";
import { createGenericTypeParameter } from "./createGenericTypeParameter";

/**
 * This method creates a single FunctionDeclaration that allows Reflect.equals
 * to validate normal class member values.
 *
 * @param {ClassDeclaration} classDeclaration - The class that requires a new function.
 */
export function createStrictEqualsMember(classDeclaration: ClassDeclaration): FunctionDeclaration {
  const range = classDeclaration.name.range;

  // __aspectStrictEquals(ref: T, stackA: usize[], stackB: usize[]): bool
  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression("__aspectStrictEquals", range),
    [TypeNode.createTypeParameter(
      TypeNode.createIdentifierExpression("T", range),
      null,
      null,
      range,
    )],
    TypeNode.createFunctionType(
      [
        // ref: T,
        createDefaultParameter("ref", createGenericTypeParameter("T", range), range),
        // stack: usize[]
        createDefaultParameter("stack", createUsizeArrayType(range), range),
        // cache: usize[]
        createDefaultParameter("cache", createUsizeArrayType(range), range),
      ],
      // : bool
      createSimpleNamedType("bool", range),
      null,
      false,
      range,
    ),
    createStrictEqualsFunctionBody(classDeclaration),
    null,
    CommonFlags.PUBLIC | CommonFlags.INSTANCE | CommonFlags.GENERIC | (classDeclaration.isGeneric ? CommonFlags.GENERIC_CONTEXT : 0),
    range,
  );
}

/**
 * This method creates a simple name type with the given name and source range.
 *
 * @param {string} name - The name of the type.
 * @param {Range} range - The given source range.
 */
function createSimpleNamedType(name: string, range: Range): TypeNode {
  return TypeNode.createNamedType(TypeNode.createSimpleTypeName(name, range), null, false, range);
}

/**
 * This method creates an Array<usize> type with the given range.
 *
 * @param {Range} range - The source range.
 */
function createUsizeArrayType(range: Range): TypeNode {
  return TypeNode.createNamedType(TypeNode.createSimpleTypeName("Array", range), [
    TypeNode.createNamedType(TypeNode.createSimpleTypeName("usize", range), null, false, range),
  ], false, range);
}

/**
 * This method creates the entire function body for __aspectStrictEquals.
 *
 * @param {ClassDeclaration} classDeclaration - The class declaration.
 */
function createStrictEqualsFunctionBody(classDeclaration: ClassDeclaration): BlockStatement {
  const body = new Array<Statement>();
  const range = classDeclaration.name.range;

  // for each field declaration, generate a check
  for (const member of classDeclaration.members) {
    // if it's an instance member, and it isn't marked private or protected
    if (member.is(CommonFlags.INSTANCE) && !member.is(CommonFlags.PRIVATE | CommonFlags.PROTECTED)) {
      switch (member.kind) {

        // field declarations automatically get added
        case NodeKind.FIELDDECLARATION: {
          const fieldDeclaration = <FieldDeclaration>member;
          body.push(createStrictEqualsIfCheck(member.name.text, fieldDeclaration.range));
          break;
        }

        // function declarations can be getters, check the get flag
        case NodeKind.FUNCTIONDECLARATION: {
          if (member.is(CommonFlags.GET)) {
            const functionDeclaration = <FunctionDeclaration>member;
            body.push(createStrictEqualsIfCheck(functionDeclaration.name.text, functionDeclaration.range));
          }
          break;
        }
      }
    }
  }

  // return true;
  body.push(
    TypeNode.createReturnStatement(
      TypeNode.createTrueExpression(range),
      range,
    )
  );
  return TypeNode.createBlockStatement(body, range);
}

/**
 * This function generates a single IfStatement with a nested ReturnStatement
 * to validate a nested property on a given class.
 *
 * @param {string} name - The name of the property.
 * @param {Range} range - The source range for the given property.
 */
function createStrictEqualsIfCheck(name: string, range: Range): IfStatement {
  // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH) return false;
  return TypeNode.createIfStatement(
    // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH
    TypeNode.createBinaryExpression(
      Token.EQUALS_EQUALS_EQUALS,
      // Reflect.equals(this.prop, ref.prop, stack, cache)
      TypeNode.createCallExpression(
        // Reflect.equals
        createPropertyAccess("Reflect", "equals", range),
        null, // types can be inferred by the compiler!
        // arguments
        [
          // this.prop
          TypeNode.createPropertyAccessExpression(
            TypeNode.createThisExpression(range),
            TypeNode.createIdentifierExpression(name, range),
            range,
          ),
          // ref.prop
          createPropertyAccess("ref", name, range),
          // stack
          TypeNode.createIdentifierExpression("stack", range),
          // cache
          TypeNode.createIdentifierExpression("cache", range),
        ],
        range,
      ),
      createPropertyAccess("Reflect", "FAILED_MATCH", range),
      range,
    ),

    // return false;
    TypeNode.createReturnStatement(
      TypeNode.createFalseExpression(range),
      range,
    ),
    null,
    range,
  );
}

/**
 * Create a simple default parameter with a name and a type.
 *
 * @param {string} name - The name of the parameter.
 * @param {TypeNode} typeNode - The type of the parameter.
 * @param {Range} range - The source range of the parameter.
 */
function createDefaultParameter(name: string, typeNode: TypeNode, range: Range): ParameterNode {
  return TypeNode.createParameter(
    TypeNode.createIdentifierExpression(name, range),
    typeNode,
    null,
    ParameterKind.DEFAULT,
    range,
  );
}

/**
 * This method creates a single property access and passes the given range to the AST.
 *
 * @param {string} root - The name of the identifier representing the root.
 * @param {string} property - The name of the identifier representing the property.
 * @param {Range} range - The range of the property access.
 */
function createPropertyAccess(root: string, property: string, range: Range): PropertyAccessExpression {
  // root.property
  return TypeNode.createPropertyAccessExpression(
    TypeNode.createIdentifierExpression(root, range),
    TypeNode.createIdentifierExpression(property, range),
    range,
  );
}
