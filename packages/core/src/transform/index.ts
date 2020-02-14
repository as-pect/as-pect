import { Transform } from "assemblyscript/cli/transform";
import { Parser, NodeKind, ClassDeclaration } from "assemblyscript";
import { createStrictEqualsMember } from "./createStrictEqualsMember";

export = class AspectTransform extends Transform {
  /**
   * This method results in a pure AST transform that inserts a strictEquals member
   * into each ClassDeclaration.
   *
   * @param {Parser} parser - The AssemblyScript parser.
   */
  afterParse(parser: Parser): void {
    // for each program source
    for (const source of parser.program.sources) {

      // for each statement in the source
      for (const statement of source.statements) {

        // find each class declaration
        if (statement.kind === NodeKind.CLASSDECLARATION) {

          // cast and create a strictEquals function
          const classDeclaration = <ClassDeclaration>statement;
          classDeclaration.members.push(createStrictEqualsMember(classDeclaration));
        }
      }
    }
  }
}
