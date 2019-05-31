import { IWritable } from "../reporter/IWriteable";
import { TestReporter } from "./TestReporter";
import { IPerformanceConfiguration } from "../util/IPerformanceConfiguration";
import { EmptyReporter } from "../reporter/EmptyReporter";
import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../util/IAspectExports";

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

  run(wasm: ASUtil & IAspectExports) {
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
}
