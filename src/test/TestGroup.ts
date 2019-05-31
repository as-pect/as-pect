import { LogValue } from "../util/LogValue";
import { ILogTarget } from "../util/ILogTarget";
import { TestResult } from "./TestResult";

/**
 * This test group class is designed with a data oriented layout in mind. Each test property is
 * represented by an array.
 */
export class TestGroup implements ILogTarget {
  public tests: TestResult[] = [];
  public todos: string[] = [];
  public logs: LogValue[] = [];
  public name: string = "";
  public pass: boolean = true;
  public reason: string = "";
  public time: number = 0;
  public start: number = 0;
  public end: number = 0;
}