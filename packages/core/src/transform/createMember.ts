import {
  ClassDeclaration,
  FunctionDeclaration,
  BlockStatement,
  NodeKind,
  FieldDeclaration,
  IfStatement,
  Token,
  TypeNode,
  CommonFlags,
  ArrowKind,
  TypeName,
  ParameterKind,
} from "assemblyscript";

export function createMember(classDeclaration: ClassDeclaration): FunctionDeclaration {
  const range = classDeclaration.name.range;

  // __aspectStrictEquals(ref: T, stackA: usize[], stackB: usize[]): bool
  return TypeNode.createFunctionDeclaration(
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
            false,
            range,
          ),
          null,
          ParameterKind.DEFAULT,
          range,
        ),
        // stackA: usize[]
        TypeNode.createParameter(
          TypeNode.createIdentifierExpression("stackA", range),
          // Array<usize>
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
        // stackB: usize[]
        TypeNode.createParameter(
          TypeNode.createIdentifierExpression("stackA", range),
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
    CommonFlags.PUBLIC,
    ArrowKind.NONE,
    range,
  );
}

function createFunctionBody(classDeclaration: ClassDeclaration): BlockStatement {
  const body = new BlockStatement();
  const range = classDeclaration.name.range;

  // if (this === ref) return true;
  body.statements.push(createExactEqualCheck(classDeclaration));

  //if (i32(this === null) ^ i32(ref === null)) return false;
  body.statements.push(createNullCheck(classDeclaration));

  // for each field declaration, generate a check
  for (const member of classDeclaration.members) {
    switch (member.kind) {
      case NodeKind.FIELDDECLARATION: {
        const fieldDeclaration = <FieldDeclaration>member;
        body.statements.push(createFieldCheck(classDeclaration, fieldDeclaration));
        break;
      }
    }
  }

  // return true
  body.statements.push(
    TypeNode.createReturnStatement(
      TypeNode.createTrueExpression(range),
      range,
    )
  );
  return body;
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
    TypeNode.createReturnStatement(
      TypeNode.createTrueExpression(range),
      range,
    ),
    null,
    range,
  );
}

/**
 * This method is not even a valid field check. TODO: Implement the logic
 * to generate a single if statement that validates value equality.
 */
function createFieldCheck(_classDeclaration: ClassDeclaration, fieldDeclaration: FieldDeclaration): IfStatement {
  const range = fieldDeclaration.name.range;
  // if (false) return false;
  return TypeNode.createIfStatement(
    TypeNode.createFalseExpression(range),
    TypeNode.createReturnStatement(TypeNode.createFalseExpression(range), range),
    null,
    range,
  );
}
