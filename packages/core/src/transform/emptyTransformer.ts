import { Transform } from "assemblyscript/cli/transform";
import { Parser } from "assemblyscript";

export = class AspectTransform extends Transform {
  /**
   * This method results in a pure AST transform that inserts a strictEquals member
   * into each ClassDeclaration.
   *
   * @param {Parser} parser - The AssemblyScript parser.
   */
  //@ts-ignore
  afterParse(_: Parser): void {
  }
}
