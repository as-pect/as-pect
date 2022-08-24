import { Parser } from "assemblyscript/dist/assemblyscript.js";
import { Transform } from "assemblyscript/dist/transform.js";

/**
 * Just an empty transformer.
 */
export default class AspectTransform extends Transform {
  // @ts-ignore
  afterParse(_parser: Parser): void {}
};
