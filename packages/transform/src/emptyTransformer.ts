
import { transform, assemblyscript } from "@as-pect/assemblyscript";
type Parser = typeof assemblyscript.Parser;
const { Transform } = transform;

/**
 * Just an empty transformer.
 */
export default class AspectTransform extends Transform {
  // @ts-ignore
  afterParse(_parser: Parser): void {}
};
