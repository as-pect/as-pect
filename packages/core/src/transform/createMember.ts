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
} from "assemblyscript";

export function createMember(classDeclaration: ClassDeclaration): FunctionDeclaration {
  const range = classDeclaration.name.range;
  // __aspectStrictEquals(ref: T, stackA: usize[], stackB: usize[]): bool

  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression("__aspectStrictEquals", range),
    null,
    TypeNode.createFunctionType(
      [
        // ref: T,
        TypeNode.createParameter(
          TypeNode.createIdentifierExpression("ref", range),
          TypeNode.createNamedType(
            TypeNode.createSimpleTypeName(classDeclaration.name.text, range),
            null,
            true,
            range,
          ),
          null,
          ParameterKind.DEFAULT,
          range,
        ),
        // stack: usize[]
        TypeNode.createParameter(
          TypeNode.createIdentifierExpression("stack", range),
          // Array<usize>
          TypeNode.createNamedType(
            TypeNode.createSimpleTypeName("Array", range),
            [TypeNode.createNamedType(
              TypeNode.createSimpleTypeName("usize", range),
              null,
              false,
              range,
            )],
            false,
            range,
          ),
          null,
          ParameterKind.DEFAULT,
          range,
        ),
        // cache: usize[]
        TypeNode.createParameter(
          TypeNode.createIdentifierExpression("cache", range),
          TypeNode.createNamedType(
            TypeNode.createSimpleTypeName("Array", range),
            [
              TypeNode.createNamedType(
                TypeNode.createSimpleTypeName("usize", range),
                null,
                false,
                range,
              ),
            ],
            false,
            range,
          ),
          null,
          ParameterKind.DEFAULT,
          range,
        ),
      ],
      // : bool
      TypeNode.createNamedType(
        TypeNode.createSimpleTypeName("bool", range),
        null,
        false,
        range,
      ),
      null,
      false,
      range,
    ),
    createFunctionBody(classDeclaration),
    null,
    CommonFlags.PUBLIC | CommonFlags.INSTANCE,
    range,
  );
}

function createFunctionBody(classDeclaration: ClassDeclaration): BlockStatement {
  const body: Statement[] = [];
  const range = classDeclaration.name.range;

  // if (this === ref) return true;
  body.push(createExactEqualCheck(classDeclaration));

  //if (i32(this === null) ^ i32(ref === null)) return false;
  body.push(createNullCheck(classDeclaration));

  // for each field declaration, generate a check
  for (const member of classDeclaration.members) {
    switch (member.kind) {
      case NodeKind.FIELDDECLARATION: {
        if (member.is(CommonFlags.PUBLIC)) {
          const fieldDeclaration = <FieldDeclaration>member;
          body.push(createIfCheck(member.name.text, fieldDeclaration.range));
        }
        break;
      }
      case NodeKind.FUNCTIONDECLARATION: {
        if (member.is(CommonFlags.PUBLIC | CommonFlags.GET)) {
          const functionDeclaration = <FunctionDeclaration>member;
          body.push(createIfCheck(functionDeclaration.name.text, functionDeclaration.range));
        }
        break;
      }
    }
  }

  // return true
  body.push(
    TypeNode.createReturnStatement(
      TypeNode.createTrueExpression(range),
      range,
    )
  );
  return TypeNode.createBlockStatement(body, range);
}

function createNullCheck(classDeclaration: ClassDeclaration): IfStatement {
  const range = classDeclaration.name.range;

  return TypeNode.createIfStatement(
    // i32(this === null) ^ i32(ref === null)
    TypeNode.createBinaryExpression(
      Token.CARET,
      // i32(this === null)
      TypeNode.createCallExpression(
        TypeNode.createIdentifierExpression("i32", range),
        null,
        [TypeNode.createBinaryExpression(
          Token.EQUALS_EQUALS_EQUALS,
          TypeNode.createThisExpression(range),
          TypeNode.createNullExpression(range),
          range,
        )],
        range,
      ),
      // i32(ref === null)
      TypeNode.createCallExpression(
        TypeNode.createIdentifierExpression("i32", range),
        null,
        [TypeNode.createBinaryExpression(
          Token.EQUALS_EQUALS_EQUALS,
          TypeNode.createIdentifierExpression("ref", range),
          TypeNode.createNullExpression(range),
          range,
        )],
        range,
      ),
      range,
    ),
    TypeNode.createReturnStatement(
      TypeNode.createFalseExpression(range),
      range,
    ),
    null,
    range,
  );
}

function createExactEqualCheck(classDeclaration: ClassDeclaration): IfStatement {
  const range = classDeclaration.name.range;

  // if (this === ref) return true;
  return TypeNode.createIfStatement(
    TypeNode.createBinaryExpression(
      Token.EQUALS_EQUALS_EQUALS,
      TypeNode.createThisExpression(range),
      TypeNode.createIdentifierExpression("ref", range),
      range,
    ),
    // return true
    TypeNode.createReturnStatement(
      TypeNode.createTrueExpression(range),
      range,
    ),
    null,
    range,
  );
}

function createIfCheck(name: string, range: Range): IfStatement {

  // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAIL) return false;
  return TypeNode.createIfStatement(
    // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAIL
    TypeNode.createBinaryExpression(
      Token.EQUALS_EQUALS_EQUALS,
      // Reflect.equals(this.prop, ref.prop, stack, cache)
      TypeNode.createCallExpression(
        TypeNode.createPropertyAccessExpression(
          TypeNode.createIdentifierExpression("Reflect", range),
          TypeNode.createIdentifierExpression("equals", range),
          range,
        ),
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
          TypeNode.createPropertyAccessExpression(
            TypeNode.createIdentifierExpression("ref", range),
            TypeNode.createIdentifierExpression(name, range),
            range,
          ),
          // stack
          TypeNode.createIdentifierExpression("stack", range),
          // cache
          TypeNode.createIdentifierExpression("cache", range),
        ],
        range,
      ),
      TypeNode.createPropertyAccessExpression(
        TypeNode.createIdentifierExpression("Reflect", range),
        TypeNode.createIdentifierExpression("FAIL", range),
        range,
      ),
      range,
    ),
    TypeNode.createReturnStatement(
      TypeNode.createFalseExpression(range),
      range,
    ),
    null,
    range,
  );
}
