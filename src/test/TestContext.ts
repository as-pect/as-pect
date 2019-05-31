import { IWritable } from "../reporter/IWriteable";
import { TestReporter } from "./TestReporter";
import { IPerformanceConfiguration } from "../util/IPerformanceConfiguration";
import { EmptyReporter } from "../reporter/EmptyReporter";
import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../util/IAspectExports";
import { TestGroup } from "./TestGroup";
import { IWarning } from "./IWarning";

export interface ITestContextParameters {
  reporter?: TestReporter;
  stdout?: IWritable;
  stderr?: IWritable;
  performanceConfiguration?: IPerformanceConfiguration;
  testRegex?: RegExp;
  groupRegex?: RegExp;
  fileName?: string;
}



export class TestContext {
  private wasm: (ASUtil & IAspectExports) | null = null;
  public reporter: TestReporter = new EmptyReporter();

  public time: number = 0;
  public pass: boolean = true;

  public errors: IWarning[] = [];
  // stdout emulation
  public stdoutChunks: string[] = [];
  public stdout: IWritable = typeof process !== "undefined"
    ? process.stdout
    : {
      write: (chunk: string) => this.stdoutChunks.push(chunk)
    };

  // stderr emulation
  public stderrChunks: string[] = [];
  public stderr: IWritable = typeof process !== "undefined"
    ? process.stderr
    : {
      write: (chunk: string) => this.stderrChunks.push(chunk)
    };

  public performanceConfiguration: IPerformanceConfiguration | null = null;
  public testRegex: RegExp = new RegExp("");
  public groupRegex: RegExp = new RegExp("");
  public fileName: string = "";

  public testGroups: TestGroup[] = [];

  constructor(props: ITestContextParameters) {
    /* istanbul ignore next */
    if (props) {
      /* istanbul ignore next */
      if (props.reporter) this.reporter = props.reporter;
      /* istanbul ignore next */
      if (props.stdout) this.stdout = props.stdout;
      /* istanbul ignore next */
      if (props.stderr) this.stderr = props.stderr;
      /* istanbul ignore next */
      if (props.performanceConfiguration) this.performanceConfiguration = props.performanceConfiguration;
      /* istanbul ignore next */
      if (props.testRegex) this.testRegex = props.testRegex;
      /* istanbul ignore next */
      if (props.groupRegex) this.groupRegex = props.groupRegex;
      /* istanbul ignore next */
      if (props.fileName) this.fileName = props.fileName;
    }
  }

  /**
   * This method creates a WebAssembly imports object with all the TestContext functions
   * bound to the TestContext.
   *
   * @param {any[]} imports - Every import item specified.
   */
  public createImports(...imports: any[]): any {
    const result = Object.assign({}, ...imports, {
      __aspect: {
        tryCall: this.tryCall.bind(this),
      },
    });
    result.env = result.env || {};
    const previousAbort = (result.env.abort) || (() => {});
    result.env.abort = (...args: any[]) => {
      previousAbort(...args);
      // @ts-ignore
      this.abort(...args);
    };
    return result;
  }


  public run(wasm: ASUtil & IAspectExports) {
    this.wasm = wasm;
    // setup performance values
    if (this.performanceConfiguration) {
      if (this.performanceConfiguration.hasOwnProperty("enabled")) {
        wasm.__set_performanceEnabled(this.performanceConfiguration.enabled ? 1 : 0);
      }
      if (this.performanceConfiguration.hasOwnProperty("maxSamples")) {
        wasm.__set_maxSamples(this.performanceConfiguration.maxSamples!);
      }
      if (this.performanceConfiguration.hasOwnProperty("maxTestRunTime")) {
        wasm.__set_maxTestRunTime(this.performanceConfiguration.maxTestRunTime!);
      }
      if (this.performanceConfiguration.hasOwnProperty("roundDecimalPlaces")) {
        wasm.__set_roundDecimalPlaces(this.performanceConfiguration.roundDecimalPlaces!);
      }
      if (this.performanceConfiguration.hasOwnProperty("reportAverage")) {
        wasm.__set_recordAverage(this.performanceConfiguration.reportAverage ? 1 : 0);
      }
      if (this.performanceConfiguration.hasOwnProperty("reportMedian")) {
        wasm.__set_recordMedian(this.performanceConfiguration.reportMedian ? 1 : 0);
      }
      if (this.performanceConfiguration.hasOwnProperty("reportStandardDeviation")) {
        wasm.__set_recordStdDev(this.performanceConfiguration.reportStandardDeviation ? 1 : 0);
      }
      if (this.performanceConfiguration.hasOwnProperty("reportMax")) {
        wasm.__set_recordMax(this.performanceConfiguration.reportMax ? 1 : 0);
      }
      if (this.performanceConfiguration.hasOwnProperty("reportMin")) {
        wasm.__set_recordMin(this.performanceConfiguration.reportMin ? 1 : 0);
      }
      if (this.performanceConfiguration.hasOwnProperty("reportVariance")) {
        wasm.__set_recordVar(this.performanceConfiguration.reportVariance ? 1 : 0);
      }
    }
    wasm.__run();
  }
  /**
   * This is a web assembly utility function that wraps a function call in a try catch block to
   * report success or failure.
   *
   * @param {number} pointer - The function pointer to call. It must accept no parameters and return
   * void.
   * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
   * returns 0.
   */
  private tryCall(pointer: number): 1 | 0 {
    if (pointer === -1) return 1;
    try {
      this.wasm!.__call(pointer)
    } catch (ex){
      return 0;
    }
    return 1;
  }
}
