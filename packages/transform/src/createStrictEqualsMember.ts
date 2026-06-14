import {
  HAS_EQ_OPERATOR_MEMBER_NAME,
  STRICT_EQUALS_MEMBER_NAME,
  createClassReflectionMemberPlan,
} from "./ClassReflectionTransform.js";

import {
  TypeNode,
  Range,
  BlockStatement,
  ClassDeclaration,
  Expression,
  IfStatement,
  MethodDeclaration,
  PropertyAccessExpression,
  Statement,
  AssertionKind,
  CommonFlags,
  Token,
} from "assemblyscript/dist/assemblyscript.js";

import { createArrayType, createDefaultParameter, createSimpleNamedType, createStaticArrayType } from "./astHelpers.js";
import { createInheritedIgnoreListExpression } from "./createInheritedIgnoreListExpression.js";

/**
 * This method creates a single FunctionDeclaration that allows Reflect.equals
 * to validate normal class member values.
 *
 * @param {ClassDeclaration} classDeclaration - The class that requires a new function.
 */
export function createStrictEqualsMember(classDeclaration: ClassDeclaration): MethodDeclaration {
  const range = classDeclaration.name.range;

  // __aspectStrictEquals(rawRef: Object, stackA: usize[], stackB: usize[], ignore: StaticArray<i64>): bool
  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression(STRICT_EQUALS_MEMBER_NAME, range),
    null,
    CommonFlags.Public | CommonFlags.Instance | (classDeclaration.isGeneric ? CommonFlags.GenericContext : 0),
    null,
    TypeNode.createFunctionType(
      [
        // rawRef: Object,
        createDefaultParameter("rawRef", createSimpleNamedType("Object", range), range),
        // stack: usize[]
        createDefaultParameter("stack", createArrayType("usize", range), range),
        // cache: usize[]
        createDefaultParameter("cache", createArrayType("usize", range), range),
        // ignore: StaticArray<i64>
        createDefaultParameter("ignore", createStaticArrayType("i64", range), range),
      ],
      // : bool
      createSimpleNamedType("bool", range),
      null,
      false,
      range,
    ),
    createStrictEqualsFunctionBody(classDeclaration),
    range,
  );
}

/** Create the inherited marker used to tell strict equality to defer to @operator("=="). */
export function createHasEqualsOperatorMember(classDeclaration: ClassDeclaration): MethodDeclaration {
  const range = classDeclaration.name.range;

  // protected __aspectHasEqOperator(): bool { return true; }
  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression(HAS_EQ_OPERATOR_MEMBER_NAME, range),
    null,
    CommonFlags.Protected | CommonFlags.Instance | (classDeclaration.isGeneric ? CommonFlags.GenericContext : 0),
    null,
    TypeNode.createFunctionType([], createSimpleNamedType("bool", range), null, false, range),
    TypeNode.createBlockStatement([TypeNode.createReturnStatement(TypeNode.createTrueExpression(range), range)], range),
    range,
  );
}

/**
 * This method creates the entire function body for __aspectStrictEquals.
 *
 * @param {ClassDeclaration} classDeclaration - The class declaration.
 */
function createStrictEqualsFunctionBody(classDeclaration: ClassDeclaration): BlockStatement {
  const body = new Array<Statement>();
  const range = classDeclaration.name.range;
  const memberPlan = createClassReflectionMemberPlan(classDeclaration);

  const rawRef = TypeNode.createIdentifierExpression("rawRef", range);
  const classType = TypeNode.createNamedType(
    TypeNode.createSimpleTypeName(classDeclaration.name.text, range),
    classDeclaration.isGeneric
      ? classDeclaration.typeParameters!.map((node) =>
          TypeNode.createNamedType(TypeNode.createSimpleTypeName(node.name.text, range), null, false, range),
        )
      : null,
    false,
    range,
  );

  // Check if the parameter is an instance of the class; return otherwise
  body.push(
    TypeNode.createIfStatement(
      TypeNode.createUnaryPrefixExpression(
        Token.Exclamation,
        TypeNode.createInstanceOfExpression(rawRef, classType, range),
        range,
      ),
      TypeNode.createReturnStatement(TypeNode.createFalseExpression(range), range),
      null,
      range,
    ),
  );

  // Cast rawRef into an instance of the class
  body.push(
    TypeNode.createVariableStatement(
      null,
      [
        TypeNode.createVariableDeclaration(
          TypeNode.createIdentifierExpression("ref", range),
          null,
          CommonFlags.Const,
          classType,
          TypeNode.createAssertionExpression(AssertionKind.As, rawRef, classType, range),
          range,
        ),
      ],
      range,
    ),
  );

  // If this class, or a parent class, defines @operator("=="), strict equality uses that operator as authoritative.
  body.push(createEqualsOperatorDelegationStatement(range));

  // Generate a check for each reflected/equality-relevant class member.
  for (const member of memberPlan.members) {
    body.push(createStrictEqualsIfCheck(member.name, member.hash, member.range));
  }

  // if (isDefined(...)) super.__aspectStrictEquals(ref, stack, cache, ignore.concat([...props]));
  body.push(createSuperCallStatement(classDeclaration, memberPlan.hashes));
  // return true;
  body.push(TypeNode.createReturnStatement(TypeNode.createTrueExpression(range), range));
  return TypeNode.createBlockStatement(body, range);
}

/** Create the optional fast path that lets user-defined equality decide strict equality. */
function createEqualsOperatorDelegationStatement(range: Range): IfStatement {
  return TypeNode.createIfStatement(
    TypeNode.createCallExpression(
      TypeNode.createIdentifierExpression("isDefined", range),
      null,
      [
        TypeNode.createPropertyAccessExpression(
          TypeNode.createThisExpression(range),
          TypeNode.createIdentifierExpression(HAS_EQ_OPERATOR_MEMBER_NAME, range),
          range,
        ),
      ],
      range,
    ),
    TypeNode.createReturnStatement(
      TypeNode.createBinaryExpression(
        Token.Equals_Equals,
        TypeNode.createThisExpression(range),
        TypeNode.createIdentifierExpression("ref", range),
        range,
      ),
      range,
    ),
    null,
    range,
  );
}

function createStrictEqualsIfCheck(name: string, hashValue: number, range: Range): IfStatement {
  const equalsCheck = TypeNode.createBinaryExpression(
    Token.Equals_Equals,
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
    Token.Exclamation,
    // ignore.includes("prop")
    TypeNode.createCallExpression(
      // ignore.includes
      TypeNode.createPropertyAccessExpression(
        TypeNode.createIdentifierExpression("ignore", range),
        TypeNode.createIdentifierExpression("includes", range),
        range,
      ),
      null,
      // (nameHash)
      [TypeNode.createIntegerLiteralExpression(f64_as_i64(hashValue), range)],
      range,
    ),
    range,
  );

  // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH) return false;
  return TypeNode.createIfStatement(
    // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH
    TypeNode.createBinaryExpression(Token.Ampersand_Ampersand, includesCheck, equalsCheck, range),

    // return false;
    TypeNode.createReturnStatement(TypeNode.createFalseExpression(range), range),
    null,
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

/**
 * This method creates the function call into super.__aspectStrictEquals,
 * wrapping it in a check to make sure the super function is defined first.
 *
 * @param {ClassDeclaration} classDeclaration - The given class declaration.
 * @param {number[]} nameHashes - A collection of hash values of the comparing class properties.
 */
function createSuperCallStatement(classDeclaration: ClassDeclaration, nameHashes: number[]): Statement {
  const range = classDeclaration.name.range;
  const ifStatement = TypeNode.createIfStatement(
    TypeNode.createCallExpression(
      TypeNode.createIdentifierExpression("isDefined", range),
      null,
      [
        TypeNode.createPropertyAccessExpression(
          TypeNode.createSuperExpression(range),
          TypeNode.createIdentifierExpression(STRICT_EQUALS_MEMBER_NAME, range),
          range,
        ),
      ],
      range,
    ),
    TypeNode.createBlockStatement(
      [
        TypeNode.createIfStatement(
          TypeNode.createUnaryPrefixExpression(Token.Exclamation, createSuperCallExpression(nameHashes, range), range),
          TypeNode.createReturnStatement(TypeNode.createFalseExpression(range), range),
          null,
          range,
        ),
      ],
      range,
    ),
    null,
    range,
  );
  return ifStatement;
}

/**
 * This method actually creates the super.__aspectStrictEquals function call.
 *
 * @param {number[]} hashValues - The collection of hashed property name values
 * @param {Range} range - The super call expression range
 */
function createSuperCallExpression(hashValues: number[], range: Range): Expression {
  return TypeNode.createCallExpression(
    TypeNode.createPropertyAccessExpression(
      TypeNode.createSuperExpression(range),
      TypeNode.createIdentifierExpression(STRICT_EQUALS_MEMBER_NAME, range),
      range,
    ),
    null,
    [
      TypeNode.createIdentifierExpression("ref", range),
      TypeNode.createIdentifierExpression("stack", range),
      TypeNode.createIdentifierExpression("cache", range),
      // StaticArray.concat(ignore, [... props] as StaticArray<i64>)
      createInheritedIgnoreListExpression(hashValues, range),
    ],
    range,
  );
}
