import {
  AssertionKind,
  BlockStatement,
  ClassDeclaration,
  CommonFlags,
  FieldDeclaration,
  MethodDeclaration,
  NodeKind,
  ParameterKind,
  Range,
  Statement,
  Token,
  TypeNode,
} from "./assemblyscript";
import { createGenericTypeParameter } from "./createGenericTypeParameter";
import { djb2Hash } from "./hash";

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
  // __aspectAddReflectedValueKeyValuePairs(reflectedValue: i32, seen: Map<usize, i32>, ignore: StaticArray<i64>): void
  return TypeNode.createMethodDeclaration(
    TypeNode.createIdentifierExpression(
      "__aspectAddReflectedValueKeyValuePairs",
      range,
    ),
    null,
    CommonFlags.PUBLIC |
      CommonFlags.INSTANCE |
      (classDeclaration.isGeneric ? CommonFlags.GENERIC_CONTEXT : 0),
    null,
    TypeNode.createFunctionType(
      [
        // reflectedValue: i32
        TypeNode.createParameter(
          ParameterKind.DEFAULT,
          TypeNode.createIdentifierExpression("reflectedValue", range),
          createGenericTypeParameter("i32", range),
          null,
          range,
        ),

        // seen: Map<usize, i32>
        TypeNode.createParameter(
          ParameterKind.DEFAULT,
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
          range,
        ),

        // ignore: i64[]
        TypeNode.createParameter(
          ParameterKind.DEFAULT,
          TypeNode.createIdentifierExpression("ignore", range),
          // Array<i64> -> i64[]
          TypeNode.createNamedType(
            TypeNode.createSimpleTypeName("StaticArray", range),
            [createGenericTypeParameter("i64", range)],
            false,
            range,
          ),
          null,
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
  const nameHashes = new Array<number>();
  // for each field declaration, generate a check
  for (const member of classDeclaration.members) {
    // if it's an instance member, regardless of access modifier
    if (member.is(CommonFlags.INSTANCE)) {
      switch (member.kind) {
        // field declarations automatically get added
        case NodeKind.FIELDDECLARATION: {
          const fieldDeclaration = <FieldDeclaration>member;
          const hashValue = djb2Hash(member.name.text);
          pushKeyValueIfStatement(
            body,
            member.name.text,
            hashValue,
            fieldDeclaration.range,
          );
          nameHashes.push(hashValue);
          break;
        }

        // function declarations can be getters, check the get flag
        case NodeKind.METHODDECLARATION: {
          if (member.is(CommonFlags.GET)) {
            const methodDeclaration = <MethodDeclaration>member;
            const hashValue = djb2Hash(member.name.text);
            pushKeyValueIfStatement(
              body,
              member.name.text,
              hashValue,
              methodDeclaration.range,
            );
            nameHashes.push(hashValue);
          }
          break;
        }
      }
    }
  }

  // call into super first after all the property checks have been added
  body.unshift(createIsDefinedIfStatement(nameHashes, range));

  return TypeNode.createBlockStatement(body, range);
}

/**
 * Create an isDefined() function call with an if statement to prevent calls to
 * super where they should not be made.
 *
 * @param {number[]} nameHashes - The array of property names to ignore in the children
 * @param {Range} range - The reporting range of this statement
 */
function createIsDefinedIfStatement(
  nameHashes: number[],
  range: Range,
): Statement {
  // if (isDefined(super.__aspectAddReflectedValueKeyValuePairs))
  //   super.__aspectAddReflectedValueKeyValuePairs(reflectedValue, seen, StaticArray.concat(ignore, [...] as StaticArray<i64>))
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
          // super.__aspectAddReflectedValueKeyValuePairs(reflectedValue, seen, StaticArray.concat(ignore, [...] as StaticArray<i64>))
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
              // StaticArray.concat(ignore, [...])
              TypeNode.createCallExpression(
                TypeNode.createPropertyAccessExpression(
                  TypeNode.createIdentifierExpression("StaticArray", range),
                  TypeNode.createIdentifierExpression("concat", range),
                  range,
                ),
                null,
                [
                  TypeNode.createIdentifierExpression("ignore", range),
                  // [...propNames]
                  TypeNode.createAssertionExpression(
                    AssertionKind.AS,
                    TypeNode.createArrayLiteralExpression(
                      nameHashes.map(e =>
                        TypeNode.createIntegerLiteralExpression(
                          f64_as_i64(e),
                          range,
                        ),
                      ),
                      range,
                    ),
                    TypeNode.createNamedType(
                      TypeNode.createSimpleTypeName("StaticArray", range),
                      [
                        TypeNode.createNamedType(
                          TypeNode.createSimpleTypeName("i64", range),
                          null,
                          false,
                          range,
                        ),
                      ],
                      false,
                      range,
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
  hashValue: number,
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
            // hashValue
            TypeNode.createIntegerLiteralExpression(
              f64_as_i64(hashValue),
              range,
            ),
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
