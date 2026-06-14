import { ansi } from "../src/ansi.js";

const escape = "\u001B";

function withColorEnvironment(forceColor: string | undefined, callback: () => void): void {
  const originalForceColor = process.env.FORCE_COLOR;
  const originalNoColor = process.env.NO_COLOR;

  try {
    if (forceColor === undefined) {
      delete process.env.FORCE_COLOR;
    } else {
      process.env.FORCE_COLOR = forceColor;
    }
    delete process.env.NO_COLOR;
    callback();
  } finally {
    if (originalForceColor === undefined) {
      delete process.env.FORCE_COLOR;
    } else {
      process.env.FORCE_COLOR = originalForceColor;
    }

    if (originalNoColor === undefined) {
      delete process.env.NO_COLOR;
    } else {
      process.env.NO_COLOR = originalNoColor;
    }
  }
}

describe("CLI ANSI formatting", () => {
  it("formats labels with local ANSI codes when color is forced", () => {
    withColorEnvironment("1", () => {
      expect(ansi.blackOnWhite("[Log]")).toBe(`${escape}[47m${escape}[30m[Log]${escape}[39m${escape}[49m`);
      expect(ansi.boldBlackOnBrightGreen("[8.1.0]")).toBe(
        `${escape}[102m${escape}[1m${escape}[30m[8.1.0]${escape}[39m${escape}[22m${escape}[49m`,
      );
    });
  });

  it("leaves text plain when color is disabled", () => {
    withColorEnvironment("0", () => {
      expect(ansi.green("Coverage Report")).toBe("Coverage Report");
    });
  });
});
