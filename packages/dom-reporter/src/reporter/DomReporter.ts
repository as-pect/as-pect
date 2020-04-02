import { IReporter, TestContext, TestNode } from '@as-pect/core';

export interface TestInfo { 
  ctx: TestContext;
  node: TestNode;
}

export type ExtractedTestInfo = 
  'fileName' 
  | 'pass' 
  | 'testCount' 
  | 'testRunCount' 
  | 'testPassCount' 
  | 'groupCount' 
  | 'groupPassCount'
  | 'groupRunCount'
  | 'todoCount'
  | 'errors'
  | 'warnings'
  | 'snapshotDiff';

export interface DomReporterData extends MessageEvent {
  data: [Pick<TestContext, ExtractedTestInfo>, TestNode | null];
}

function extractTestInfoFromContext({ 
  fileName, pass, testCount, testRunCount, testPassCount,
  groupCount, groupPassCount, groupRunCount, 
  todoCount, errors, warnings, snapshotDiff 
}: TestContext): Pick<TestContext, ExtractedTestInfo> {
  return { 
    fileName, pass, testCount, testRunCount, testPassCount,
    groupCount, groupPassCount, groupRunCount, 
    todoCount, errors, warnings, snapshotDiff };
}

export class DomReporter implements IReporter {
  constructor(private worker: Worker) {}

  onEnter(ctx: TestContext, node: TestNode): void {
    this.worker.postMessage([extractTestInfoFromContext(ctx), node]);
  }
  onExit(ctx: TestContext, node: TestNode): void {
    this.worker.postMessage([extractTestInfoFromContext(ctx), node]);
  }
  onFinish(ctx: TestContext): void {
    this.worker.postMessage([extractTestInfoFromContext(ctx), null]);
  }
}
