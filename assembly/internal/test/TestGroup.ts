import { TestResult } from "./TestResult";

type Callback = () => void;

export class TestGroup {
  public name: string;
  public beforeAll: Callback[];
  public afterAll: Callback[];
  public beforeEach: Callback[];
  public afterEach: Callback[];
  public tests: TestResult[];
  public parent: TestGroup | null;

  public constructor(name: string = "", parent: TestGroup | null = null) {
    if (parent) {
      this.name = parent.name + " " + name;
      this.beforeAll = parent.beforeAll.slice(0);
      this.afterAll = parent.afterAll.slice(0);
      this.beforeEach = parent.beforeEach.slice(0);
      this.afterEach = parent.afterEach.slice(0);
      this.parent = parent;
    } else {
      this.name = name;
      this.beforeAll = new Array<Callback>(0);
      this.afterAll = new Array<Callback>(0);
      this.beforeEach = new Array<Callback>(0);
      this.afterEach = new Array<Callback>(0);
      this.tests = new Array<Callback>(0);
    }
  }
}