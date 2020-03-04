import {
  ClassDeclaration,
  TypeNode,
  CommonFlags,
  ParameterKind,
  BlockStatement,
  NodeKind,
  FieldDeclaration,
  MethodDeclaration,
  Statement,
  Range,
  Token,
} from "./assemblyscript";
import { createGenericTypeParameter } from "./createGenericTypeParameter";

export function createAddReflectedValueKeyValuePairsMember(
  classDeclaration: ClassDeclaration,
): MethodDeclaration {
  const range = classDeclaration.name.range;
  // __aspectAddReflectedValueKeyValuePairs(reflectedValue: i32, seen: Map<usize, i32>, ignore: string[]): void
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

        // ignore: string[]
        TypeNode.createParameter(
          TypeNode.createIdentifierExpression("ignore", range),
          TypeNode.createNamedType(
            TypeNode.createSimpleTypeName("Array", range),
            [
              createGenericTypeParameter("string", range),
            ],
            false,
            range,
          ),
          null,
          ParameterKind.DEFAULT,
          range,
        )
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
  const names = new Array<string>();
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
          pushKeyValueIfStatement(body, member.name.text, fieldDeclaration.range);
          names.push(member.name.text);
          break;
        }

        // function declarations can be getters, check the get flag
        case NodeKind.METHODDECLARATION: {
          if (member.is(CommonFlags.GET)) {
            const methodDeclaration = <MethodDeclaration>member;
            pushKeyValueIfStatement(body, member.name.text, methodDeclaration.range);
            names.push(member.name.text);
          }
          break;
        }
      }
    }
  }


  // if (isDefined(super.__aspectAddReflectedValueKeyValuePairs)) super.__aspectAddReflectedValueKeyValuePairs(reflectedValue, seen, ignore.concat([...]))
  body.push(
    TypeNode.createIfStatement(
      TypeNode.createCallExpression(
        TypeNode.createIdentifierExpression("isDefined", range),
        null,
        [
          TypeNode.createPropertyAccessExpression(
            TypeNode.createSuperExpression(range),
            TypeNode.createIdentifierExpression("__aspectAddReflectedValueKeyValuePairs", range),
            range,
          ),
        ],
        range,
      ),
      TypeNode.createBlockStatement([
        TypeNode.createExpressionStatement(
          TypeNode.createCallExpression(
            TypeNode.createPropertyAccessExpression(
              TypeNode.createSuperExpression(range),
              TypeNode.createIdentifierExpression("__aspectAddReflectedValueKeyValuePairs", range),
              range,
            ),
            null,
            [
              TypeNode.createIdentifierExpression("reflectedValue", range),
              TypeNode.createIdentifierExpression("seen", range),
              TypeNode.createCallExpression(
                TypeNode.createPropertyAccessExpression(
                  TypeNode.createIdentifierExpression("ignore", range),
                  TypeNode.createIdentifierExpression("concat", range),
                  range,
                ),
                null,
                [
                  TypeNode.createArrayLiteralExpression(
                    names.map(e => TypeNode.createStringLiteralExpression(e, range)),
                    range,
                  ),
                ],
                range,
              ),
            ],
            range,
          ),
        ),
      ], range),
      null,
      range,
    ),
  );

  return TypeNode.createBlockStatement(body, range);
}

function pushKeyValueIfStatement(body: Statement[], name: string, range: Range): void {
  body.push(
    TypeNode.createIfStatement(
      TypeNode.createUnaryPrefixExpression(
        Token.EXCLAMATION,
        TypeNode.createCallExpression(
          TypeNode.createPropertyAccessExpression(
            TypeNode.createIdentifierExpression("ignore", range),
            TypeNode.createIdentifierExpression("includes", range),
            range,
          ),
          null,
          [
            TypeNode.createStringLiteralExpression(name, range),
          ],
          range,
        ),
        range,
      ),
      TypeNode.createBlockStatement([
        createPushReflectedObjectKeyStatement(name, range),
        createPushReflectedObjectValueStatement(name, range),
      ], range),
      null,
      range,
    )
  );
}

// __aspectPushReflectedObjectKey
function createPushReflectedObjectKeyStatement(
  name: string,
  range: Range,
): Statement {
  // __aspectPushReflectedObjectKey(reflectedValue, Reflect.toReflectedValue("propertyName", seen));
  return TypeNode.createExpressionStatement(
    TypeNode.createCallExpression(
      TypeNode.createIdentifierExpression(
        "__aspectPushReflectedObjectKey",
        range,
      ),
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
  // __aspectPushReflectedObjectValue(reflectedValue, Reflect.toReflectedValue(this.propertyName, seen, ignore.concat([...])));
  return TypeNode.createExpressionStatement(
    // __aspectPushReflectedObjectValue(reflectedValue, Reflect.toReflectedValue(this.propertyName, seen, ignore.concat([...])))
    TypeNode.createCallExpression(
      // __aspectPushReflectedObjectValue
      TypeNode.createIdentifierExpression(
        "__aspectPushReflectedObjectValue",
        range,
      ),
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
