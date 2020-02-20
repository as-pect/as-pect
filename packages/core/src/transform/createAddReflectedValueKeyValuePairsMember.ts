import {
  FunctionDeclaration,
  ClassDeclaration,
  TypeNode,
  CommonFlags,
  ParameterKind,
  BlockStatement,
  NodeKind,
  FieldDeclaration,
  Statement,
  Range,
} from "./assemblyscript";
import { createGenericTypeParameter } from "./createGenericTypeParameter";

export function createAddReflectedValueKeyValuePairsMember(
  classDeclaration: ClassDeclaration,
): FunctionDeclaration {
  const range = classDeclaration.name.range;
  // __aspectAddReflectedValueKeyValuePairs(reflectedValue: i32, seen: Map<usize, i32>): void
  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression(
      "__aspectAddReflectedValueKeyValuePairs",
      range,
    ),
    null,
    TypeNode.createFunctionType(
      [
        // reflectedValue: i32
        TypeNode.createParameter(
          TypeNode.createIdentifierExpression("reflectedValue", range),
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
      TypeNode.createNamedType(
        TypeNode.createSimpleTypeName("void", range),
        [],
        false,
        range,
      ),
      null,
      false,
      range,
    ),
    createAddReflectedValueKeyValuePairsFunctionBody(classDeclaration),
    null,
    CommonFlags.PUBLIC |
      CommonFlags.INSTANCE |
      (classDeclaration.isGeneric ? CommonFlags.GENERIC_CONTEXT : 0),
    range,
  );
}

function createAddReflectedValueKeyValuePairsFunctionBody(
  classDeclaration: ClassDeclaration,
): BlockStatement {
  const body = new Array<Statement>();
  const range = classDeclaration.name.range;

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
            createPushReflectedObjectKeyStatement(
              member.name.text,
              fieldDeclaration.range,
            ),
          );
          body.push(
            createPushReflectedObjectValueStatement(
              member.name.text,
              fieldDeclaration.range,
            ),
          );
          break;
        }

        // function declarations can be getters, check the get flag
        case NodeKind.FUNCTIONDECLARATION: {
          if (member.is(CommonFlags.GET)) {
            const functionDeclaration = <FunctionDeclaration>member;
            body.push(
              createPushReflectedObjectKeyStatement(
                functionDeclaration.name.text,
                functionDeclaration.range,
              ),
            );
            body.push(
              createPushReflectedObjectValueStatement(
                functionDeclaration.name.text,
                functionDeclaration.range,
              ),
            );
          }
          break;
        }
      }
    }
  }

  return TypeNode.createBlockStatement(body, range);
}

// __aspectPushReflectedObjectKey
function createPushReflectedObjectKeyStatement(
  name: string,
  range: Range,
): Statement {
  // __aspectPushReflectedObjectKey(reflectedValue, Reflect.toReflectedValue("propertyName", seen));
  return TypeNode.createExpressionStatement(
    TypeNode.createCallExpression(
      TypeNode.createIdentifierExpression("__aspectPushReflectedObjectKey", range),
      null,
      [
        // reflectedValue
        TypeNode.createIdentifierExpression("reflectedValue", range),
        // Reflect.toReflectedValue("propertyName", seen)
        TypeNode.createCallExpression(
          // Reflect.toReflectedValue
          TypeNode.createPropertyAccessExpression(
            TypeNode.createIdentifierExpression("Reflect", range),
            TypeNode.createIdentifierExpression("toReflectedValue", range),
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
    ),
  );
}

function createPushReflectedObjectValueStatement(
  name: string,
  range: Range,
): Statement {
  // __aspectPushReflectedObjectValue(reflectedValue, Reflect.toReflectedValue(this.propertyName, seen));
  return TypeNode.createExpressionStatement(
    // __aspectPushReflectedObjectValue(reflectedValue, Reflect.toReflectedValue(this.propertyName, seen))
    TypeNode.createCallExpression(
      // __aspectPushReflectedObjectValue
      TypeNode.createIdentifierExpression("__aspectPushReflectedObjectValue", range),
      null,
      [
        // reflectedValue
        TypeNode.createIdentifierExpression("reflectedValue", range),
        // Reflect.toReflectedValue(this.propertyName, seen))
        TypeNode.createCallExpression(
          // Reflect.toReflectedValue
          TypeNode.createPropertyAccessExpression(
            TypeNode.createIdentifierExpression("Reflect", range),
            TypeNode.createIdentifierExpression("toReflectedValue", range),
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
    ),
  );
}
