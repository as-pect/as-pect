import { Reporter } from "./Reporter";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
import { TestSuite } from "../test/TestSuite";
import chalk from "chalk";
import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";

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

export class DefaultReporter extends Reporter {
  onStart(suite: TestSuite): void {
    console.log(chalk`     {yellow [Log]:} ${suite.filename}`);
    console.log("");
  }
  onGroupStart(group: TestGroup): void {
    console.log(chalk`[Describe]: ${group.name}`);
    console.log("");
  }
  onGroupFinish(group: TestGroup): void {
    const result = group.pass
      ? chalk`{green ✔ PASS}`
      : chalk`{red ✖ FAIL}`;

    console.log("");
    console.log(chalk`  [Result]: ${result}`);
    console.log(chalk`   [Tests]: ${group.successCount.toString()} pass, ${group.failCount.toString()} fail, ${group.totalCount.toString()} total`);
    console.log(chalk`    [Todo]: ${group.todoCount.toString()} tests`);
    console.log(chalk`    [Time]: ${group.time.toString()}ms`);
    console.log("");
  }
  onTestStart(_group: TestGroup, _test: TestResult): void {}
  onTestFinish(_group: TestGroup, test: TestResult): void {
    if (test.pass) {
      console.log(chalk` {green [Success]: ✔} ${test.testName}`);
    } else {
      console.log(chalk`    {red [Fail]: ✖} ${test.testName}`);
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
  }
  onFinish(suite: TestSuite): void {
    const result = suite.pass
      ? chalk`{green ✔ Pass}`
      : chalk`{red ✖ Fail}`;

    console.log("");
    console.log("~".repeat(process.stdout.columns! - 10));
    console.log(chalk`    [File]: ${suite.filename}`);
    console.log(chalk`  [Result]: ${result}`);
    console.log(chalk` [Summary]: ${suite.successCount.toString()} pass, ${suite.failCount.toString()} fail, ${suite.totalTests.toString()} total`);
    console.log(chalk`    [Todo]: ${suite.todoCount.toString()} test` + (suite.todoCount === 1 ? "s" : ""));
    console.log(chalk`    [Time]: ${suite.time.toString()}ms`);
    console.log("");
  }
  onTodo(_group: TestGroup, todo: string): void {
    console.log(chalk`    {yellow [Todo]:} ${todo}`);
  }
  onLog(logValue: LogValue): void {
    // create string representations of the pointer
    var pointer: string = logValue.pointer.toString();
    var hexPointer: string = logValue.pointer.toString(16);

    // log the log message
    if (logValue.pointer > 0) {
      console.log(chalk`     {yellow [Log]:} at address [${pointer}] [hex: 0x${hexPointer}] ${logValue.message}`);
      console.log("");
    } else {
      console.log(chalk`     {yellow [Log]:} ${logValue.message}`);
    }

    // if there are bytes to show, create a logging representation of the bytes
    if (logValue.bytes.length > 0) {
      const value = createReferenceString(logValue.bytes, logValue.pointer, logValue.offset);
      console.log(chalk`           {blueBright ${value.split("\n").join("\n           ")}}`);
    }

    console.log(chalk`       {yellow ${logValue.stack.split("\n").join("\n       ")}}\n`);
  }
}