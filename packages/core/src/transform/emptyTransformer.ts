import { Transform, Parser } from "./assemblyscript";

/**
 * Just an empty transformer.
 */
export = class AspectTransform extends Transform {
  afterParse(_: Parser): void {}
};
