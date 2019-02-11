import { instantiateBuffer, ASUtil } from "assemblyscript/lib/loader";
import chalk from "chalk";
const pkg = require('../package.json');

export function testLoader(buffer: Buffer, imports: any = {}): void {
  var testCallback: number = -1;
  var start = Date.now();
  var reason: string = "";

  console.log(chalk`{bold.bgWhite.black ${""
}    ___   _____                       __ 
   /   | / ___/      ____  ___  _____/ /_
  / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/
 / ___ |___/ /_____/ /_/ /  __/ /__/ /_  
/_/  |_/____/     / .___/\\___/\\___/\\__/  
                 /_/                     } ASpect Test suite runner {bgRedBright.white [${pkg.version}]}
`);

  imports.env = {
    abort(reasonPointer: number, _fileNamePointer: number, _c: number, _d: number): void {
      reason = wasm!.getString(reasonPointer);
    },
  };
  imports.__aspect = {
    tryCall(pointer: number): 1 | 0 {
      var func = wasm!.getFunction(pointer);
      try {
        func();
      } catch (ex){
        return 0;
      }
      return 1;
    },
    reportDescribe(suiteName: number): void {
      console.log("");
      console.log(chalk`Running test suite for {bold ${wasm!.getString(suiteName)}}:`);
    },
    reportSuccess(testName: number): void {
      console.log(chalk`  {bgGreenBright.black [Success]}: ${wasm!.getString(testName)}`);
    },
    reportFailure(testName: number): void {
      console.log(chalk`  {bgRedBright.white [Failure]}: ${wasm!.getString(testName)}`);
      console.log(chalk`    {bgWhite.black [Reason]}: ${reason}`);
    },
    reportCallback(cb: number): void {
      testCallback = cb;
    },
    reportStatistics(success: number, failed: number): void {
      var end = Date.now();
      console.log(``);
      console.log(``);
      console.log(`Test suite ${failed === 0 ?  chalk`{bgGreenBright.black PASS}` : chalk`{bgRedBright.white FAIL}`}`);
      console.log(`Tests:      ${success} passed, ${success + failed} total`)
      console.log(`Time:       ${end - start}ms`);
    }
  };
  var wasm: ASUtil | null = instantiateBuffer(buffer, imports as any);
  var func = wasm.getFunction(testCallback);
  func();
}