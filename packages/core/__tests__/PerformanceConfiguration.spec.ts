import { IPerformanceConfiguration } from "../src/util/IPerformanceConfiguration";
import { TestContext } from "../src/test/TestContext";
import { createPerformanceConfigurationModule } from "./setup/createPerformanceConfigurationModule";

let ctx: TestContext;

let start = new Promise<void>((resolve, reject) => {
  createPerformanceConfigurationModule({}, (err, result) => {
    if (err) {
      console.log(err);
      reject(err);
    } else {
      ctx = result!;
      resolve();
    }
  });
});

type PartialConfiguration = Partial<IPerformanceConfiguration>;

describe("Performance Configuration", () => {
  it("should have no warings if maxSamples configured correctly", () => {
    const performanceConfiguration: PartialConfiguration = {
      maxSamples: 1000,
    };
    const context: TestContext = new TestContext({ performanceConfiguration });
    expect(context.warnings).toHaveLength(0);
  });

  it("should have warnings if configured to run less than 0 max samples", () => {
    const performanceConfiguration: PartialConfiguration = {
      maxSamples: -1,
    };
    const context: TestContext = new TestContext({ performanceConfiguration });

    for (const warning of context.warnings) {
      expect(warning.type).toMatchSnapshot("type");
      expect(warning.message).toMatchSnapshot("message");
    }
  });

  it("should have warnings if configured to run less than allowed max samples", () => {
    const performanceConfiguration: PartialConfiguration = {
      maxSamples: 999999999999999,
    };
    const context: TestContext = new TestContext({ performanceConfiguration });
    for (const warning of context.warnings) {
      expect(warning.type).toMatchSnapshot("type");
      expect(warning.message).toMatchSnapshot("message");
    }
  });

  it("should have warnings if configured maxTestRuntime is too large", () => {
    const performanceConfiguration: PartialConfiguration = {
      maxTestRunTime: 999999999999999,
    };
    const context: TestContext = new TestContext({ performanceConfiguration });
    for (const warning of context.warnings) {
      expect(warning.type).toMatchSnapshot("type");
      expect(warning.message).toMatchSnapshot("message");
    }
  });

  it("should have warnings if configured maxTestRuntime is too negative", () => {
    const performanceConfiguration: PartialConfiguration = {
      maxTestRunTime: -1,
    };
    const context: TestContext = new TestContext({ performanceConfiguration });
    for (const warning of context.warnings) {
      expect(warning.type).toMatchSnapshot("type");
      expect(warning.message).toMatchSnapshot("message");
    }
  });

  it("should have not warnings if configured maxTestRuntime is configured correctly", () => {
    const performanceConfiguration: PartialConfiguration = {
      maxTestRunTime: 500,
    };
    const context: TestContext = new TestContext({ performanceConfiguration });
    expect(context.warnings).toHaveLength(0);
  });

  it("should have warnings if configured decimalPlaces is too large", () => {
    const performanceConfiguration: PartialConfiguration = {
      roundDecimalPlaces: 100,
    };
    const context: TestContext = new TestContext({ performanceConfiguration });
    for (const warning of context.warnings) {
      expect(warning.type).toMatchSnapshot("type");
      expect(warning.message).toMatchSnapshot("message");
    }
  });

  it("should have warnings if configured decimalPlaces is negative", () => {
    const performanceConfiguration: PartialConfiguration = {
      roundDecimalPlaces: -1,
    };
    const context: TestContext = new TestContext({ performanceConfiguration });
    for (const warning of context.warnings) {
      expect(warning.type).toMatchSnapshot("type");
      expect(warning.message).toMatchSnapshot("message");
    }
  });

  it("should have not warnings if configured decimalPlaces is configured correctly", () => {
    const performanceConfiguration: PartialConfiguration = {
      roundDecimalPlaces: 3,
    };
    const context: TestContext = new TestContext({ performanceConfiguration });
    expect(context.warnings).toHaveLength(0);
  });

  it("should catch performanceConfiguration warnings at runtime", async () => {
    await start;
    for (const warning of ctx.warnings) {
      expect(warning.type).toMatchSnapshot("type");
      expect(warning.message).toMatchSnapshot("message");
    }
  });
});
