import { Transform } from "assemblyscript/cli/transform";
import { Parser, NodeKind, ClassDeclaration } from "assemblyscript";
import { createStrictEqualsMember } from "./createStrictEqualsMember";

export = class AspectTransform extends Transform {
  afterParse(parser: Parser): void {
    for (const source of parser.program.sources) {
      for (const statement of source.statements) {
        if (statement.kind === NodeKind.CLASSDECLARATION) {
          const classDeclaration = <ClassDeclaration>statement;
          classDeclaration.members.push(createStrictEqualsMember(classDeclaration));
        }
      }
    }
  }
}
