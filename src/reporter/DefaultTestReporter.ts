
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
import { TestContext } from "../test/TestContext";
import chalk from "chalk";
import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { TestReporter } from "../test/TestReporter";
import { IWritable } from "./IWriteable";

const enum ValueType {
  Actual,
  Expected,
}

/**
 * This method stringifies an actual or expected test value.
 *
 * @param {ValueType} type - Actual or Expected.
 * @param {ActualValue | null} value - The reported value.
 */
function stringifyActualValue(type: ValueType, value: ActualValue | null): string {
  if (!value) return "";
  let byteString: string = "";

  if (value.bytes.length > 0) {
    byteString = "\n               " + createReferenceString(value.bytes, value.pointer, value.offset)
      .split("\n")
      .join("\n               ");
  }

  const stackString = "\n           " + value.stack
    .split("\n")
    .join("\n           ");

  return type === ValueType.Expected
     ? chalk`{green ${value.message}}{blue ${byteString}}{yellow ${stackString}}\n`
     : chalk`{red ${value.message}}{blue ${byteString}}{yellow ${stackString}}\n`
}

/**
 * This function generates a 2 digit hexadecimal string from the given number.
 *
 * @param {number} value - A number from [0-255].
 * @returns {string} - The hexadecimal string representing the byte
 */
function hex(value: number): string {
  var result: string = value.toString(16);
  if (result.length === 1) return "0" + result;
  return result;
}

/**
 * This function returns a string that formats the bytes into rows of 8 bytes with a space between
 * byte 4 and 5 on each row.
 *
 * @param {number[]} bytes - The byte array
 * @param {number} pointer - The pointer of the reference.
 * @param {number} offset - The offset of the reference.
 */
function createReferenceString(bytes: number[], pointer: number, offset: number): string {
  const referenceEnd = pointer + offset;
  // start with a tabbed out string
  let result = `Range: [dec: ${pointer.toString()}~${referenceEnd.toString()}] [hex: 0x${pointer.toString(16)}~0x${referenceEnd.toString(16)}]`;
  result += "\n07 06 05 04   03 02 01 00";
  result += "\n~~~~~~~~~~~~~~~~~~~~~~~~~";
  result += "\n";

  // for each byte
  for (let i = 0; i < offset; i++) {
    // append a byte and an empty space
    result += hex(bytes[i]) + " ";
    if (i % 8 === 7) {
      // every 8 characters add a newline
      result += "\n";
    } else if (i % 4 === 3) {
      // every 4 characters add an extra two spaces
      result += "  ";
    }
  }

  // remove leading space
  return result.trimRight();
}

/**
 * This weakmap is used to keep track of which logs have already been printed, and from what index.
 */
const groupLogIndex: WeakMap<TestGroup, number> = new WeakMap();

/**
 * This is the default test reporter class for the `asp` command line application. It will pipe
 * all relevant details about each tests to the `stdout` WriteStream.
 */
export class DefaultTestReporter extends TestReporter {
  protected stdout: IWritable | null = null;

  public onStart(suite: TestContext): void {
    this.stdout = suite.stdout || process.stdout;
  }
  public onGroupStart(group: TestGroup): void {
    this.stdout!.write(chalk`\n[Describe]: ${group.name}\n\n`);

    for (const logValue of group.logs) {
      this.onLog(logValue);
    }
    groupLogIndex.set(group, group.logs.length);

  }
  public onGroupFinish(group: TestGroup): void {
    const result = group.pass
      ? chalk`{green ✔ PASS}`
      : chalk`{red ✖ FAIL}`;
    const todoCount = group.todos.length;
    const successCount = group.tests.filter(e => e.pass).length;
    const count = group.tests.length;

    for (const logValue of group.logs.slice(groupLogIndex.get(group) || 0)) {
      this.onLog(logValue);
    }

    const fail = (count === successCount)
      ? `0 fail`
      : chalk`{red ${(count - successCount).toString()} fail}`

    const rtraceDelta = group.rtraceDelta === 0
      ? ""
      : chalk`{yellow RTrace: ${ (group.rtraceDelta > 0 ? "+" : "-") + group.rtraceDelta.toString()}}`;

    const output = chalk`
  [Result]: ${result} ${rtraceDelta}
   [Tests]: {green ${successCount.toString()} pass}, ${fail}, ${count.toString()} total
    [Todo]: ${todoCount.toString()} tests
    [Time]: ${group.time.toString()}ms
`;
    this.stdout!.write(output);
  }
  public onTestStart(_group: TestGroup, _test: TestResult): void {}
  public onTestFinish(_group: TestGroup, test: TestResult): void {
    if (test.pass) {
      const rtraceDelta = test.rtraceDelta === 0
        ? ""
        : chalk`{yellow RTrace: ${ (test.rtraceDelta > 0 ? "+" : "-") + test.rtraceDelta.toString()}}`;
      this.stdout!.write(chalk` {green [Success]: ✔} ${test.name} ${rtraceDelta}\n`);
    } else {
      this.stdout!.write(chalk`    {red [Fail]: ✖} ${test.name}\n`);

      if (!test.negated) {
        this.stdout!.write(`
   [Actual]: ${stringifyActualValue(ValueType.Actual, test.actual)}
 [Expected]: ${stringifyActualValue(ValueType.Expected, test.expected)}
`);
      }

      if (test.message) {
        this.stdout!.write(chalk`  [Message]: {yellow ${test.message}}\n`);
      }
      if (test.stack) {
        this.stdout!.write(`    [Stack]: ${test.stack.split("\n").join("\n           ")}\n`);
      }
    }

    if (test.performance) {
      this.stdout!.write(chalk` {yellow [Samples]}: ${test.times.length.toString()} runs\n`);

      // log statistics
      if (test.hasAverage) {
        this.stdout!.write(chalk`    {yellow [Mean]}: ${test.average.toString()}ms\n`);
      }

      if (test.hasMedian) {
        this.stdout!.write(chalk`  {yellow [Median]}: ${test.median.toString()}ms\n`);
      }

      if (test.hasVariance) {
        this.stdout!.write(chalk`{yellow [Variance]}: ${test.variance.toString()}ms\n`);
      }

      if (test.hasStdDev) {
        this.stdout!.write(chalk`  {yellow [StdDev]}: ${test.stdDev.toString()}ms\n`);
      }

      if (test.hasMax) {
        this.stdout!.write(chalk`     {yellow [Max]}: ${test.max.toString()}ms\n`);
      }

      if (test.hasMin) {
        this.stdout!.write(chalk`     {yellow [Min]}: ${test.min.toString()}ms\n`);
      }
    } else {
      // log the log values
      for (const logValue of test.logs) {
        this.onLog(logValue);
      }
    }
  }
  public onFinish(suite: TestContext): void {
    if (suite.testGroups.length === 0) return;
    const result = suite.pass
      ? chalk`{green ✔ Pass}`
      : chalk`{red ✖ Fail}`;

    const count = suite.testGroups
      .map(e => e.tests.length)
      .reduce((a, b) => a + b, 0);
    const successCount = suite.testGroups
      .map(e => e.tests.filter(f => f.pass).length)
      .reduce((a, b) => a + b, 0);

    const fail = (count === successCount)
      ? `0 fail`
      : chalk`{red ${(count - successCount).toString()} fail}`;

    const rtcount = suite.allocationCount - suite.freeCount;

    const rtraceDelta = rtcount === 0
      ? ""
      : chalk`{yellow RTrace: ${ (rtcount > 0 ? "+" : "-") + rtcount.toString()}}`;

    this.stdout!.write(chalk`
${"~".repeat(process.stdout.columns! - 10)}

    [File]: ${suite.fileName} ${rtraceDelta}
  [Groups]: {green ${suite.testGroups.filter(e => e.pass).length.toString()} pass}, ${suite.testGroups.length.toString()} total
  [Result]: ${result}
 [Summary]: {green ${successCount.toString()} pass},  ${fail}, ${count.toString()} total
 [Startup]: ${suite.startupTime.toString()}ms
    [Time]: ${suite.time.toString()}ms
`);

  }
  public onTodo(_group: TestGroup, todo: string): void {
    this.stdout!.write(chalk`    {yellow [Todo]:} ${todo}\n`);
  }

  /**
   * A custom logger function for the default reporter that writes the log values using `console.log()`
   *
   * @param {LogValue} logValue - A value to be logged to the console
   */
  public onLog(logValue: LogValue): void {
    // create string representations of the pointer
    var pointer: string = logValue.pointer.toString();
    var hexPointer: string = logValue.pointer.toString(16);

    // log the log message
    if (logValue.pointer > 0) {
      this.stdout!.write(chalk`     {yellow [Log]:} Reference at address [${pointer}] [hex: 0x${hexPointer}] ${logValue.message}\n`);
    } else {
      this.stdout!.write(chalk`     {yellow [Log]:} ${logValue.message}\n`);
    }

    // if there are bytes to show, create a logging representation of the bytes
    if (logValue.bytes.length > 0) {
      const value = createReferenceString(logValue.bytes, logValue.pointer, logValue.offset);
      this.stdout!.write(chalk`            {blueBright ${value.split("\n").join("\n            ")}}\n`);
    }

    this.stdout!.write(chalk`        {yellow ${logValue.stack.split("\n").join("\n        ")}}\n\n`);
  }
}
