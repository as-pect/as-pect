import { createReporterModule } from "./setup/createReporterModule";
import { VerboseReporterWrapper } from "./setup/VerboseReporterWrapper";
const reporter = new VerboseReporterWrapper();

beforeAll(
  () =>
    new Promise<void>((resolve, reject) => {
      createReporterModule(
        "./assembly/jest-reporter-top-level-expect.ts",
        {},
        (err, _result) => {
          if (err) {
            console.log(err);
            reject(err);
          } else {
            resolve();
          }
        },
        reporter,
      );
    }),
);

test("snapshots", () => {
  for (const [name, values] of reporter.snapshots.entries()) {
    for (const value of values) {
      expect(value).toMatchSnapshot(name);
    }
  }
});
