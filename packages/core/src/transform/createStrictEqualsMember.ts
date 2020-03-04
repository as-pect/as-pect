import {
  BlockStatement,
  ClassDeclaration,
  CommonFlags,
  FieldDeclaration,
  MethodDeclaration,
  IfStatement,
  NodeKind,
  ParameterKind,
  Range,
  Statement,
  Token,
  TypeNode,
  ParameterNode,
  PropertyAccessExpression,
  Expression,
} from "./assemblyscript";
import { createGenericTypeParameter } from "./createGenericTypeParameter";

/**
 * This method creates a single FunctionDeclaration that allows Reflect.equals
 * to validate normal class member values.
 *
 * @param {ClassDeclaration} classDeclaration - The class that requires a new function.
 */
export function createStrictEqualsMember(
  classDeclaration: ClassDeclaration,
): MethodDeclaration {
  const range = classDeclaration.name.range;

  // __aspectStrictEquals(ref: T, stackA: usize[], stackB: usize[], ignore: string[]): bool
  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression("__aspectStrictEquals", range),
    [
      TypeNode.createTypeParameter(
        TypeNode.createIdentifierExpression("T", range),
        null,
        null,
        range,
      ),
    ],
    TypeNode.createFunctionType(
      [
        // ref: T,
        createDefaultParameter(
          "ref",
          createGenericTypeParameter("T", range),
          range,
        ),
        // stack: usize[]
        createDefaultParameter("stack", createArrayType("usize", range), range),
        // cache: usize[]
        createDefaultParameter("cache", createArrayType("usize", range), range),
        // ignore: string[]
        createDefaultParameter(
          "ignore",
          createArrayType("string", range),
          range,
        ),
      ],
      // : bool
      createSimpleNamedType("bool", range),
      null,
      false,
      range,
    ),
    createStrictEqualsFunctionBody(classDeclaration),
    null,
    CommonFlags.PUBLIC |
      CommonFlags.INSTANCE |
      CommonFlags.GENERIC |
      (classDeclaration.isGeneric ? CommonFlags.GENERIC_CONTEXT : 0),
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
  return TypeNode.createNamedType(
    TypeNode.createSimpleTypeName(name, range),
    null,
    false,
    range,
  );
}

/**
 * This method creates an Array<usize> type with the given range.
 *
 * @param {Range} range - The source range.
 */
function createArrayType(name: string, range: Range): TypeNode {
  return TypeNode.createNamedType(
    TypeNode.createSimpleTypeName("Array", range),
    [
      TypeNode.createNamedType(
        TypeNode.createSimpleTypeName(name, range),
        null,
        false,
        range,
      ),
    ],
    false,
    range,
  );
}

/**
 * This method creates the entire function body for __aspectStrictEquals.
 *
 * @param {ClassDeclaration} classDeclaration - The class declaration.
 */
function createStrictEqualsFunctionBody(
  classDeclaration: ClassDeclaration,
): BlockStatement {
  const body = new Array<Statement>();
  const range = classDeclaration.name.range;
  const members = new Array<string>();
  // for each field declaration, generate a check
  for (const member of classDeclaration.members) {
    // if it's an instance member, and it isn't marked private or protected
    if (
      member.is(CommonFlags.INSTANCE) &&
      !member.is(CommonFlags.PRIVATE | CommonFlags.PROTECTED)
    ) {
      switch (member.kind) {
        // field declarations automatically get added
        case NodeKind.FIELDDECLARATION: {
          const fieldDeclaration = <FieldDeclaration>member;
          body.push(
            createStrictEqualsIfCheck(member.name.text, fieldDeclaration.range),
          );
          members.push(member.name.text);
          break;
        }

        // function declarations can be getters, check the get flag
        case NodeKind.METHODDECLARATION: {
          if (member.is(CommonFlags.GET)) {
            const methodDeclaration = <MethodDeclaration>member;
            body.push(
              createStrictEqualsIfCheck(
                methodDeclaration.name.text,
                methodDeclaration.range,
              ),
            );
            members.push(member.name.text);
          }
          break;
        }
      }
    }
  }

  // if (isDefined(...)) super.__aspectStrictEquals(ref, stack, cache, ignore.concat([...props]));
  body.push(createSuperCallStatement(classDeclaration, members));
  // return true;
  body.push(
    TypeNode.createReturnStatement(TypeNode.createTrueExpression(range), range),
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
  const equalsCheck = TypeNode.createBinaryExpression(
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
  );

  // !ignore.includes("prop")
  const includesCheck = TypeNode.createUnaryPrefixExpression(
    Token.EXCLAMATION,
    // ignore.includes("prop")
    TypeNode.createCallExpression(
      // ignore.includes
      TypeNode.createPropertyAccessExpression(
        TypeNode.createIdentifierExpression("ignore", range),
        TypeNode.createIdentifierExpression("includes", range),
        range,
      ),
      null,
      // ("prop")
      [TypeNode.createStringLiteralExpression(name, range)],
      range,
    ),
    range,
  );

  // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH) return false;
  return TypeNode.createIfStatement(
    // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH
    TypeNode.createBinaryExpression(
      Token.AMPERSAND_AMPERSAND,
      includesCheck,
      equalsCheck,
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
function createDefaultParameter(
  name: string,
  typeNode: TypeNode,
  range: Range,
): ParameterNode {
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
function createPropertyAccess(
  root: string,
  property: string,
  range: Range,
): PropertyAccessExpression {
  // root.property
  return TypeNode.createPropertyAccessExpression(
    TypeNode.createIdentifierExpression(root, range),
    TypeNode.createIdentifierExpression(property, range),
    range,
  );
}

function createSuperCallStatement(
  classDeclaration: ClassDeclaration,
  members: string[],
): Statement {
  const range = classDeclaration.name.range;
  const ifStatement = TypeNode.createIfStatement(
    TypeNode.createCallExpression(
      TypeNode.createIdentifierExpression("isDefined", range),
      null,
      [
        TypeNode.createPropertyAccessExpression(
          TypeNode.createSuperExpression(range),
          TypeNode.createIdentifierExpression("__aspectStrictEquals", range),
          range,
        ),
      ],
      range,
    ),
    TypeNode.createBlockStatement([
      TypeNode.createIfStatement(
        TypeNode.createUnaryPrefixExpression(
          Token.EXCLAMATION,
          createSuperCallExpression(members, range),
          range,
        ),
        TypeNode.createReturnStatement(
          TypeNode.createFalseExpression(range),
          range,
        ),
        null,
        range,
      ),
    ], range),
    null,
    range,
  );
  return ifStatement;
}

function createSuperCallExpression(
  propNames: string[],
  range: Range,
): Expression {
  return TypeNode.createCallExpression(
    TypeNode.createPropertyAccessExpression(
      TypeNode.createSuperExpression(range),
      TypeNode.createIdentifierExpression("__aspectStrictEquals", range),
      range,
    ),
    null,
    [
      TypeNode.createIdentifierExpression("ref", range),
      TypeNode.createIdentifierExpression("stack", range),
      TypeNode.createIdentifierExpression("cache", range),
      // ignore.concat([... props])
      TypeNode.createCallExpression(
        TypeNode.createPropertyAccessExpression(
          TypeNode.createIdentifierExpression("ignore", range),
          TypeNode.createIdentifierExpression("concat", range),
          range,
        ),
        null,
        [
          TypeNode.createArrayLiteralExpression(
            propNames.map(e =>
              TypeNode.createStringLiteralExpression(e, range),
            ),
            range,
          ),
        ],
        range,
      ),
    ],
    range,
  );
}
