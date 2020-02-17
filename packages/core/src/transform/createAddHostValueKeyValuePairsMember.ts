import { FunctionDeclaration, ClassDeclaration, TypeNode, CommonFlags, ParameterKind, BlockStatement, NodeKind, FieldDeclaration, Statement, Range } from "assemblyscript";
import { createGenericTypeParameter } from "./createGenericTypeParameter";

export function createAddHostValueKeyValuePairsMember(classDeclaration: ClassDeclaration): FunctionDeclaration {
  const range = classDeclaration.name.range;
  // __aspectAddHostValueKeyValuePairs(hostObject: i32, seen: Map<usize, i32>): void
  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression("__aspectAddHostValueKeyValuePairs", range),
    null,
    TypeNode.createFunctionType(
      [
        // hostObject: i32
        TypeNode.createParameter(
          TypeNode.createIdentifierExpression("hostObject", range),
          createGenericTypeParameter("i32", range),
          null,
          ParameterKind.DEFAULT,
          range,
        ),

        // seen: Map<usize, i32>
        TypeNode.createParameter(
          TypeNode.createIdentifierExpression("seen", range),
          TypeNode.createNamedType(
            TypeNode.createSimpleTypeName("Map", range),
            [
              createGenericTypeParameter("usize", range),
              createGenericTypeParameter("i32", range),
            ],
            false,
            range,
          ),
          null,
          ParameterKind.DEFAULT,
          range,
        ),
      ],
      // :void
      createGenericTypeParameter("void", range),
      null,
      false,
      range,
    ),
    createAddHostValueKeyValuePairsFunctionBody(classDeclaration),
    null,
    CommonFlags.PUBLIC | CommonFlags.INSTANCE | CommonFlags.GENERIC | (classDeclaration.isGeneric ? CommonFlags.GENERIC_CONTEXT : 0),
    range
  );
}

function createAddHostValueKeyValuePairsFunctionBody(classDeclaration: ClassDeclaration): BlockStatement {
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
          body.push(createPushHostObjectKeyStatement(member.name.text, fieldDeclaration.range));
          body.push(createPushHostObjectValueStatement(member.name.text, fieldDeclaration.range));
          break;
        }

        // function declarations can be getters, check the get flag
        case NodeKind.FUNCTIONDECLARATION: {
          if (member.is(CommonFlags.GET)) {
            const functionDeclaration = <FunctionDeclaration>member;
            body.push(createPushHostObjectKeyStatement(functionDeclaration.name.text, functionDeclaration.range));
            body.push(createPushHostObjectValueStatement(functionDeclaration.name.text, functionDeclaration.range));
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
// __aspectPushHostObjectKey
function createPushHostObjectKeyStatement(name: string, range: Range): Statement {
  // __aspectPushHostObjectKey(hostObject, Reflect.toHostValue("propertyName", seen));
  return TypeNode.createExpressionStatement(
    TypeNode.createCallExpression(
      TypeNode.createIdentifierExpression("__aspectPushHostObjectKey", range),
      null,
      [
        // hostObject
        TypeNode.createIdentifierExpression("hostObject", range),
        // Reflect.toHostValue("propertyName", seen)
        TypeNode.createCallExpression(
          // Reflect.toHostValue
          TypeNode.createPropertyAccessExpression(
            TypeNode.createIdentifierExpression("Reflect", range),
            TypeNode.createIdentifierExpression("toHostValue", range),
            range,
          ),
          null,
          [
            TypeNode.createStringLiteralExpression(name, range),
            TypeNode.createIdentifierExpression("seen", range),
          ],
          range,
        ),
      ],
      range,
    )
  );
}


function createPushHostObjectValueStatement(name: string, range: Range): Statement {

  // __aspectPushHostObjectValue(hostObject, Reflect.toHostValue(this.propertyName, seen));
  return TypeNode.createExpressionStatement(
    // __aspectPushHostObjectValue(hostObject, Reflect.toHostValue(this.propertyName, seen))
    TypeNode.createCallExpression(
      // __aspectPushHostObjectValue
      TypeNode.createIdentifierExpression("__aspectPushHostObjectValue", range),
      null,
      [
        // hostObject
        TypeNode.createIdentifierExpression("hostObject", range),
        // Reflect.toHostValue(this.propertyName, seen))
        TypeNode.createCallExpression(
          // Reflect.toHostValue
          TypeNode.createPropertyAccessExpression(
            TypeNode.createIdentifierExpression("Reflect", range),
            TypeNode.createIdentifierExpression("toHostValue", range),
            range,
          ),
          null,
          [
            //this.propertyName
            TypeNode.createPropertyAccessExpression(
              TypeNode.createThisExpression(range),
              TypeNode.createIdentifierExpression(name, range),
              range,
            ),
            // seen
            TypeNode.createIdentifierExpression("seen", range),
          ],
          range,
        ),
      ],
      range,
    )
  );
}
