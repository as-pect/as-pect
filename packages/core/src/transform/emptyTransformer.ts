import {Transform, Parser} from "./assemblyscript";

export = class AspectTransform extends Transform {
  /**
   * This method results in a pure AST transform that inserts a strictEquals member
   * into each ClassDeclaration.
   *
   * @param {Parser} parser - The AssemblyScript parser.
   */
  afterParse(_: Parser): void {
  }
}
