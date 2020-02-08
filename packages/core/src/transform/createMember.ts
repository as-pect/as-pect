import {
  ClassDeclaration,
  FunctionDeclaration,
  BlockStatement,
  FunctionTypeNode,
  ReturnStatement,

  FalseExpression,
} from "assemblyscript";

export function createMember(classDeclaration: ClassDeclaration): FunctionDeclaration {
  const member = new FunctionDeclaration();
  member.name.text = "__aspectStrictEquals";
  member.body = createFunctionBody(classDeclaration);
  member.signature = createFunctionSignature(classDeclaration);
  return member;
}

function createFunctionBody(_classDeclaration: ClassDeclaration): BlockStatement {
  const body = new BlockStatement();
  const returnStatement = new ReturnStatement();
  returnStatement.value = new FalseExpression();
  body.statements.push(returnStatement);
  return body;
}

function createFunctionSignature(_classDeclaration: ClassDeclaration): FunctionTypeNode {
  
}
