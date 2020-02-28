import {
  IReporter,
} from "../../packages/core/src/reporter/IReporter";
import { TestContext } from '../core/src/test/TestContext';
import { WriteStream, createWriteStream } from "fs";
import { basename, extname, dirname, join } from "path";
import { TestNode } from '../core/src/test/TestNode';
import { TestNodeType } from '@as-pect/assembly/assembly/internal/TestNodeType';

/**
 * This class reports all relevant test statistics to a JSON file located at
 * `{testLocation}.spec.json`.
 */
export default class JSONReporter implements IReporter {
  protected file: WriteStream | null = null;
  
  private first: boolean = true;
  
  public onEnter(ctx: TestContext): void {
    const extension = extname(ctx.fileName);
    const dir = dirname(ctx.fileName);
    const base = basename(ctx.fileName, extension);
    const outPath = join(process.cwd(), dir, base + ".json");
    this.file = createWriteStream(outPath, "utf8");
    this.file.write("[");
    this.first = true;
  }

  public onExit(ctx: TestContext, node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.onGroupFinish(node)
    }
  }

  public onFinish(_ctx: TestContext): void {
    this.file!.end();
  }

  onGroupFinish(group: TestNode) {
    if (group.children.length === 0) return;
  
    const tests: TestNode[] = group.getTestChildren();
    const allTodosUnderGroup: string[][] = tests.map(({ todos }) => todos);
  
    for (let i = 0; i < tests.length; i++) {
      this.onTestFinish(group, tests[i]);
    }
  
    /**
     * @fixme can do this better
     */
    group.todos.forEach((desc) => this.onTodo(group, desc));
  
    allTodosUnderGroup.forEach((todo) => {
      todo.forEach((desc) => this.onTodo(group, desc))
    });
  }

  onTestFinish(group: TestNode, test: TestNode): void {
    this.file!.write(
      (this.first ? "\n" : ",\n") +
        JSON.stringify({
          group: group.name,
          name: test.name,
          /**
           * @todo uncomment when ran is implemented
           */
          // ran: test.ran,
          pass: test.pass,
          runtime: test.deltaT,
          message: test.message,
          actual: test.actual ? test.actual.stringify({ indent: 0 }) : null,
          /**
           * @todo manage output for negated cases better
           */
          expected: test.expected
            ? test.expected.stringify({ indent: 0 })
            : null,
        }),
    );
    this.first = false;
  }

  onTodo(group: TestNode, desc: string) {
    this.file!.write(
      (this.first ? "\n" : ",\n") +
        JSON.stringify({
          group: group.name,
          name: "TODO:" + desc,
          ran: false,
          pass: null,
          runtime: 0,
          message: "",
          actual: null,
          expected: null,
        }),
    );
    this.first = false;
  }
}
