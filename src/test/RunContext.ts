import { ASUtil } from "assemblyscript/lib/loader";
import { TestReporter } from "./TestReporter";

/**
 * This class is a test runner helper class that contains a set of useful properties
 * to help reduce run function size.
 */
export class RunContext {
  public start = 0;
  public end = 0;
  public groupstart = 0;
  public groupend = 0;
  public teststart = 0;
  public testend = 0;
  public passed = true;
  public endGroup = false;

  constructor(public wasm: ASUtil, public reporter: TestReporter) {}
}
