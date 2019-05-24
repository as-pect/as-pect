
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
import { TestContext } from "../test/TestContext";
import chalk from "chalk";
import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { TestReporter } from "../test/TestReporter";

const enum ValueType {
  Actual,
  Expected,
}

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

const groupLogIndex: WeakMap<TestGroup, number> = new WeakMap();

export class DefaultTestReporter extends TestReporter {
  public onStart(_suite: TestContext): void {

  }
  public onGroupStart(group: TestGroup): void {
    console.log("");
    console.log(chalk`[Describe]: ${group.name}`);
    console.log("");

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

    console.log("");
    console.log(chalk`  [Result]: ${result}`);
    console.log(chalk`   [Tests]: ${successCount.toString()} pass, ${(count - successCount).toString()} fail, ${count.toString()} total`);
    console.log(chalk`    [Todo]: ${todoCount.toString()} tests`);
    console.log(chalk`    [Time]: ${group.time.toString()}ms`);
  }
  public onTestStart(_group: TestGroup, _test: TestResult): void {}
  public onTestFinish(_group: TestGroup, test: TestResult): void {
    if (test.pass) {
      console.log(chalk` {green [Success]: ✔} ${test.name}`);
    } else {
      console.log(chalk`    {red [Fail]: ✖} ${test.name}`);
      console.log("");
      if (!test.negated) {
        console.log(`   [Actual]: ${stringifyActualValue(ValueType.Actual, test.actual)}`);
        console.log(` [Expected]: ${stringifyActualValue(ValueType.Expected, test.expected)}`);
      }

      if (test.message) {
        console.log(chalk`  [Message]: {yellow ${test.message}}`);
      }
      if (test.stack) {
        console.log(`    [Stack]: ${test.stack.split("\n").join("\n           ")}`);
      }
    }

    if (test.performance) {
      console.log(chalk` {yellow [Samples]}: ${test.times.length.toString()}`);

      // log statistics
      if (test.hasAverage) {
        console.log(chalk`    {yellow [Mean]}: ${test.average.toString()}ms`);
      }

      if (test.hasMedian) {
        console.log(chalk`  {yellow [Median]}: ${test.median.toString()}ms`);
      }

      if (test.hasVariance) {
        console.log(chalk`{yellow [Variance]}: ${test.variance.toString()}ms`);
      }

      if (test.hasStdDev) {
        console.log(chalk`  {yellow [StdDev]}: ${test.stdDev.toString()}ms`);
      }

      if (test.hasMax) {
        console.log(chalk`     {yellow [Max]}: ${test.max.toString()}ms`);
      }

      if (test.hasMin) {
        console.log(chalk`     {yellow [Min]}: ${test.min.toString()}ms`);
      }
    } else {
      // log the log values
      for (const logValue of test.logs) {
        this.onLog(logValue);
      }
    }
  }
  public onFinish(suite: TestContext): void {
    const result = suite.pass
      ? chalk`{green ✔ Pass}`
      : chalk`{red ✖ Fail}`;

    const count = suite.testGroups
      .map(e => e.tests.length)
      .reduce((a, b) => a + b, 0);
    const successCount = suite.testGroups
      .map(e => e.tests.filter(f => f.pass).length)
      .reduce((a, b) => a + b, 0);
    console.log("");
    console.log("~".repeat(process.stdout.columns! - 10));
    console.log("");
    console.log(chalk`    [File]: ${suite.file}`);
    console.log(chalk`  [Groups]: ${suite.testGroups.filter(e => e.pass).length.toString()} pass, ${suite.testGroups.length.toString()} total`);
    console.log(chalk`  [Result]: ${result}`);
    console.log(chalk` [Summary]: ${successCount.toString()} pass, ${(count - successCount).toString()} fail, ${count.toString()} total`);
    console.log(chalk` [Startup]: ${suite.startupTime.toString()}ms`)
    console.log(chalk`    [Time]: ${suite.time.toString()}ms`);
    console.log("");
  }
  public onTodo(_group: TestGroup, todo: string): void {
    console.log(chalk`    {yellow [Todo]:} ${todo}`);
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
      console.log(chalk`     {yellow [Log]:} Reference at address [${pointer}] [hex: 0x${hexPointer}] ${logValue.message}`);
    } else {
      console.log(chalk`     {yellow [Log]:} ${logValue.message}`);
    }

    // if there are bytes to show, create a logging representation of the bytes
    if (logValue.bytes.length > 0) {
      const value = createReferenceString(logValue.bytes, logValue.pointer, logValue.offset);
      console.log(chalk`            {blueBright ${value.split("\n").join("\n            ")}}`);
    }

    console.log(chalk`        {yellow ${logValue.stack.split("\n").join("\n        ")}}\n`);
  }
}
