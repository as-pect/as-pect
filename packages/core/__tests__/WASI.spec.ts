import { TestContext } from "../src";
import { createWasiModule } from "./setup/createWasiModule";
import { VerboseReporterWrapper } from "./setup/VerboseReporterWrapper";
const reporter = new VerboseReporterWrapper();
let ctx: TestContext;

let start = new Promise<void>((resolve, reject) => {
  createWasiModule({}, reporter, (err, result) => {
    if (err) {
      console.log(err);
      reject(err);
    } else {
      ctx = result!;
      resolve();
    }
  });
});

beforeEach(() => start);

test("snapshots", () => {
  expect(ctx).toBeDefined();
  // expect(ctx.pass).toBeTruthy();
  for (const [name, values] of reporter.snapshots.entries()) {
    for (const value of values) {
      expect(value).toMatchSnapshot(name);
    }
  }
});
