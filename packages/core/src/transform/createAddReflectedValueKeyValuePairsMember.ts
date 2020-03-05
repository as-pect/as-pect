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

/**
 * Create a prototype method called __aspectAddReflectedValueKeyValuePairs on a given
 * ClassDeclaration dynamically.
 *
 * @param {ClassDeclaration} classDeclaration - The target classDeclaration
 */
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
          // Array<string> -> string[]
          TypeNode.createNamedType(
            TypeNode.createSimpleTypeName("Array", range),
            [createGenericTypeParameter("string", range)],
            false,
            range,
          ),
          null,
          ParameterKind.DEFAULT,
          range,
        ),
      ],
      // : void
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

/**
 * Iterate over a given ClassDeclaration and return a block statement that contains the
 * body of a supposed function that reports the key value pairs of a given class.
 *
 * @param {ClassDeclaration} classDeclaration - The class declaration to be reported
 */
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
          pushKeyValueIfStatement(
            body,
            member.name.text,
            fieldDeclaration.range,
          );
          names.push(member.name.text);
          break;
        }

        // function declarations can be getters, check the get flag
        case NodeKind.METHODDECLARATION: {
          if (member.is(CommonFlags.GET)) {
            const methodDeclaration = <MethodDeclaration>member;
            pushKeyValueIfStatement(
              body,
              member.name.text,
              methodDeclaration.range,
            );
            names.push(member.name.text);
          }
          break;
        }
      }
    }
  }

  // call into super first after all the property checks have been added
  body.unshift(createIsDefinedIfStatement(names, range));

  return TypeNode.createBlockStatement(body, range);
}

/**
 * Create an isDefined() function call with an if statement to prevent calls to
 * super where they should not be made.
 *
 * @param {string[]} names - The array of property names to ignore in the children
 * @param {Range} range - The reporting range of this statement
 */
function createIsDefinedIfStatement(names: string[], range: Range): Statement {
  // if (isDefined(super.__aspectAddReflectedValueKeyValuePairs))
  //   super.__aspectAddReflectedValueKeyValuePairs(reflectedValue, seen, ignore.concat([...]))
  return TypeNode.createIfStatement(
    // isDefined(super.__aspectAddReflectedValueKeyValuePairs)
    TypeNode.createCallExpression(
      TypeNode.createIdentifierExpression("isDefined", range),
      null,
      [
        // super.__aspectAddReflectedValueKeyValuePairs
        TypeNode.createPropertyAccessExpression(
          TypeNode.createSuperExpression(range),
          TypeNode.createIdentifierExpression(
            "__aspectAddReflectedValueKeyValuePairs",
            range,
          ),
          range,
        ),
      ],
      range,
    ),
    TypeNode.createBlockStatement(
      [
        TypeNode.createExpressionStatement(
          // super.__aspectAddReflectedValueKeyValuePairs(reflectedValue, seen, ignore.concat([...]))
          TypeNode.createCallExpression(
            TypeNode.createPropertyAccessExpression(
              TypeNode.createSuperExpression(range),
              TypeNode.createIdentifierExpression(
                "__aspectAddReflectedValueKeyValuePairs",
                range,
              ),
              range,
            ),
            null,
            [
              // reflectedValue,
              TypeNode.createIdentifierExpression("reflectedValue", range),
              // seen,
              TypeNode.createIdentifierExpression("seen", range),
              // ignore.concat([...])
              TypeNode.createCallExpression(
                TypeNode.createPropertyAccessExpression(
                  TypeNode.createIdentifierExpression("ignore", range),
                  TypeNode.createIdentifierExpression("concat", range),
                  range,
                ),
                null,
                [
                  // [...propNames]
                  TypeNode.createArrayLiteralExpression(
                    names.map(e =>
                      TypeNode.createStringLiteralExpression(e, range),
                    ),
                    range,
                  ),
                ],
                range,
              ),
            ],
            range,
          ),
        ),
      ],
      range,
    ),
    null,
    range,
  );
}

/**
 * For each key-value pair, we need to perform a runtime check to make sure that this property
 * was not overridden in the parent of a given class.
 *
 * @param {Statement[]} body - The collection of statements for the function body
 * @param {string} name - The name of the property
 * @param {Range} range - The range for these statements
 */
function pushKeyValueIfStatement(
  body: Statement[],
  name: string,
  range: Range,
): void {
  body.push(
    // if (!ignore.includes("propName")) { ... }
    TypeNode.createIfStatement(
      TypeNode.createUnaryPrefixExpression(
        Token.EXCLAMATION,
        // ignore.includes("propName")
        TypeNode.createCallExpression(
          TypeNode.createPropertyAccessExpression(
            TypeNode.createIdentifierExpression("ignore", range),
            TypeNode.createIdentifierExpression("includes", range),
            range,
          ),
          null,
          [
            // "propName"
            TypeNode.createStringLiteralExpression(name, range),
          ],
          range,
        ),
        range,
      ),
      TypeNode.createBlockStatement(
        [
          createPushReflectedObjectKeyStatement(name, range),
          createPushReflectedObjectValueStatement(name, range),
        ],
        range,
      ),
      null,
      range,
    ),
  );
}

/**
 * Create a function call to __aspectPushReflectedObjectKey to add a key to a given
 * reflected value.
 *
 * @param {string} name - The name of the property
 * @param {Range} range - The reange for this function call
 */
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

/**
 * Create a function call to __aspectPushReflectedObjectValue to add a key to a given
 * reflected value.
 *
 * @param {string} name - The name of the property
 * @param {Range} range - The reange for this function call
 */
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
