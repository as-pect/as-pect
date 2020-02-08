import { ClassDeclaration, FunctionDeclaration, IdentifierExpression, BlockStatement, FunctionTypeNode, TypeNode, Range } from "assemblyscript";

export function createMember(classDeclaration: ClassDeclaration): FunctionDeclaration {
  let p = new FunctionDeclaration();
  p.name.text = "__aspectStrictEquals";
  p.body = createFunctionBody(classDeclaration);
  p.signature = createFunctionSignature(classDeclaration);
  return p;
}

function createFunctionBody(classDeclaration: ClassDeclaration): BlockStatement {

}

function createFunctionSignature(classDeclaration: ClassDeclaration): FunctionTypeNode {

}