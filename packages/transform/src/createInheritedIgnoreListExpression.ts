import { AssertionKind, Expression, Range, TypeNode } from "assemblyscript/dist/assemblyscript.js";
import { createStaticArrayType } from "./astHelpers.js";

/**
 * Create `StaticArray.concat(ignore, [...hashes] as StaticArray<i64>)` for inherited member suppression.
 */
export function createInheritedIgnoreListExpression(nameHashes: number[], range: Range): Expression {
  return TypeNode.createCallExpression(
    TypeNode.createPropertyAccessExpression(
      TypeNode.createIdentifierExpression("StaticArray", range),
      TypeNode.createIdentifierExpression("concat", range),
      range,
    ),
    null,
    [
      TypeNode.createIdentifierExpression("ignore", range),
      TypeNode.createAssertionExpression(
        AssertionKind.As,
        TypeNode.createArrayLiteralExpression(
          nameHashes.map((hash) => TypeNode.createIntegerLiteralExpression(f64_as_i64(hash), range)),
          range,
        ),
        createStaticArrayType("i64", range),
        range,
      ),
    ],
    range,
  );
}
