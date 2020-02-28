import {
  IReporter,
} from "../../packages/core/src/reporter/IReporter";
import stringify, { Stringifier } from "csv-stringify";
import { WriteStream, createWriteStream } from "fs";
import { basename, extname, dirname, join } from "path";
import { TestContext } from '../core/src/test/TestContext';
import { TestNode } from '../core/src/test/TestNode';
import { TestNodeType } from '@as-pect/assembly/assembly/internal/TestNodeType';

/**
 * @ignore
 * This is a list of all the columns in the exported csv file.
 */
const csvColumns = [
  "Group",
  "Name",
  "Ran",
  "Pass",
  "Runtime",
  "Message",
  "Actual",
  "Expected",
];

/**
 * This class is responsible for creating a csv file located at {testName}.spec.csv. It will
 * contain a set of tests with relevant pass and fail information.
 */
export default class CSVReporter implements IReporter {
  protected output: Stringifier | null = null;
  protected fileName: WriteStream | null = null;
  
  public onEnter(ctx: TestContext): void {
    this.output = stringify({ columns: csvColumns });
    const extension = extname(ctx.fileName);
    const dir = dirname(ctx.fileName);
    const base = basename(ctx.fileName, extension);
    const outPath = join(process.cwd(), dir, base + ".csv");
    this.fileName = createWriteStream(outPath, "utf8");
    this.output.pipe(this.fileName);
    
    this.output.write(csvColumns);
  }

  public onExit(_ctx: TestContext, node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.onGroupFinish(node)
    }
  }

  public onFinish(): void {
    this.output!.end();
  }

  onGroupFinish(group: TestNode): void {
    if (group.children.length === 0) return;

    const tests: TestNode[] = group.getTestChildren();
    const allTodosUnderGroup: string[][] = tests.map(({ todos }) => todos);

    for (let i = 0; i < tests.length; i++) {
      this.onTestFinish(group, tests[i]);
    }

    group.todos.forEach((desc) => this.onTodo(group, desc));

    allTodosUnderGroup.forEach((todo) => {
      todo.forEach((desc) => this.onTodo(group, desc))
    });
  }
  
  onTestFinish(group: TestNode, test: TestNode) {
    this.output!.write([
      group.name,
      /**
       * @todo uncomment when ran is implemented
       */
      // test.ran ? "RAN" : "NOT RUN",
      test.name,
      test.pass ? "PASS" : "FAIL",
      test.deltaT,
      test.message,
      test.actual ? test.actual.stringify({ indent: 0 }) : "",
      /**
       * @todo manage output for negated cases
       */
      test.expected ? test.expected.stringify({ indent: 0 }) : "",
    ]);
  }

  onTodo(group: TestNode, desc: string) {
    this.output!.write([
      group.name,
      "TODO",
      desc,
      "",
      "",
      "",
      "",
      "",
    ]);
  }
}
