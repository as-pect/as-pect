import { Transform } from "assemblyscript/dist/transform.js";

import {
  ClassDeclaration,
  InterfaceDeclaration,
  NamespaceDeclaration,
  NodeKind,
  Parser,
  Statement,
  Source,
} from "assemblyscript/dist/assemblyscript.js";

import {
  appendGeneratedClassReflectionMembers,
  appendGeneratedInterfaceReflectionMembers,
} from "./appendGeneratedClassReflectionMembers.js";

// @ts-ignore
export default class AspectTransform extends Transform {
  /**
   * This method results in a pure AST transform that inserts a strictEquals member
   * into each ClassDeclaration.
   *
   * @param {Parser} parser - The AssemblyScript parser.
   */
  // @ts-ignore
  afterParse(parser: Parser): void {
    // For backwards compatibility
    let sources: Source[] = (parser as any).program ? (parser as any).program.sources : parser.sources;
    // for each program source
    for (const source of sources) {
      traverseStatements(source.statements);
    }
  }
}

function traverseStatements(statements: Statement[]): void {
  // for each statement in the source
  for (const statement of statements) {
    // find each class declaration
    if (statement.kind === NodeKind.ClassDeclaration) {
      appendGeneratedClassReflectionMembers(<ClassDeclaration>statement);
    } else if (statement.kind === NodeKind.InterfaceDeclaration) {
      appendGeneratedInterfaceReflectionMembers(<InterfaceDeclaration>statement);
    } else if (statement.kind === NodeKind.NamespaceDeclaration) {
      const namespaceDeclaration = <NamespaceDeclaration>statement;
      traverseStatements(namespaceDeclaration.members);
    }
  }
}
