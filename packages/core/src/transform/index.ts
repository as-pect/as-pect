import { Transform } from "assemblyscript/cli/transform";
import { Parser, NodeKind, ClassDeclaration, MethodDeclaration, BlockStatement, ExpressionStatement, Statement } from "assemblyscript";

export = class AspectTransform extends Transform {
  afterParse(parser: Parser): void {
    for (const source of parser.program.sources) {
      for (const statement of source.statements) {
        if (statement.kind === NodeKind.CLASSDECLARATION) {
          // loop over each class declaration
          const classDeclaration = <ClassDeclaration>statement;
          for (const member of classDeclaration.members) {

            // look for methods in the class
            if (member.kind === NodeKind.METHODDECLARATION) {
              const methodDeclaration = <MethodDeclaration>member;
              if (methodDeclaration.body && methodDeclaration.body.kind === NodeKind.BLOCK) {
                const methodBlock = <BlockStatement>methodDeclaration.body;
                // loop over each statement, and observe ExpressionStatements that call __aspectForOfProps()
                traverseStatements(classDeclaration, methodBlock.statements);
              }
            }
          }
        }
      }
    }
  }
}


function traverseStatements(classDeclaration: ClassDeclaration, statements: Statement[]): void {
  const length = statements.length;
  for (let i = 0; i < length; i++) {
    const statement = statements[i];
    if (statement instanceof ExpressionStatement) {
      const expression = statement.expression;
    } else if (statement instanceof BlockStatement) {
      traverseStatements(classDeclaration, statement.statements);
    }
  }
}