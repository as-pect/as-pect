import { TestGroup } from "./TestGroup";

export class TestSuite {
  groups: TestGroup[] = [];
  total: number = 0;
  success: number = 0;
  fail: number = 0;
  filename: string = "";
  time: number = 0;
  passed: boolean = false;
}
