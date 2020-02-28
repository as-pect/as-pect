import { TestNode } from "../test/TestNode";
import { TestNodeType } from "@as-pect/assembly/assembly/internal/TestNodeType";

export function visitImmediateChildren(node: TestNode, type: TestNodeType, callback: (node: TestNode) => void): void {
  const children = node.children;
  for (let i = 0; i < children.length; i++) {
    const child = children[i];
    if (child.type === type) {
      visitImmediateChildren(child, type, callback);
      callback(child);
    }
  }
}

export function visitAllChildren(node: TestNode, callback: (node: TestNode) => void): void {
  const children = node.children;
  for (let i = 0; i < children.length; i++) {
    const child = children[i];
    visitAllChildren(child, callback);
    callback(child);
  }
}