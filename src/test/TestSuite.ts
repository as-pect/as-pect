import { TestGroup } from "./TestGroup";

export class TestSuite {
  testGroups: TestGroup[] = [];
  totalTests: number = 0;
  successCount: number = 0;
  failCount: number = 0;
  todoCount: number = 0;
  filename: string = "";
  time: number = 0;
  pass: boolean = false;
}
