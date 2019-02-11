import { instantiateBuffer, ASUtil } from "assemblyscript/lib/loader";
import chalk from "chalk";
export function testLoader(buffer: Buffer, imports: any = {}): void {
  var testCallback: number = -1;
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
      console.log(chalk`{bold.white ASpect Test}`);
      console.log(chalk`Running test suite for {bold ${wasm!.getString(suiteName)}}:`);
    },
    reportSuccess(testName: number): void {
      console.log(chalk`- {bgGreenBright.black Success}: ${wasm!.getString(testName)}`);
    },
    reportFailure(testName: number): void {
      console.log(chalk`- {bgRedBright.white Failure}: ${wasm!.getString(testName)}`);
    },
    reportCallback(cb: number): void {
      testCallback = cb;
    },
  };
  var wasm: ASUtil | null = instantiateBuffer(buffer, imports as any);
  var func = wasm.getFunction(testCallback);
  func();
}