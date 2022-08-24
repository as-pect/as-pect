import { TestNode } from "../../src/index.js";

export function removeStackTraces(node: TestNode): void {
  node.logs.forEach((e) => {
    e.stack = e.stack ? "Has Stack Trace" : "No Stack Trace";
  });
  node.errors.forEach((e) => {
    e.stackTrace = e.stackTrace ? "Has Stack Trace" : "No Stack Trace";
  });
  node.stackTrace = node.stackTrace ? "Has Stack Trace" : "No Stack Trace";
}
