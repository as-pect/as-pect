import { ansi } from "../src/util/ansi.js";

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

describe("core ANSI formatting", () => {
  it("formats reporter text with local ANSI codes when color is forced", () => {
    withColorEnvironment("1", () => {
      expect(ansi.boldGreen("✔ PASS")).toBe(`${escape}[1m${escape}[32m✔ PASS${escape}[39m${escape}[22m`);
      expect(ansi.yellow("[Log]")).toBe(`${escape}[33m[Log]${escape}[39m`);
    });
  });

  it("leaves reflected value strings plain when color is disabled", () => {
    withColorEnvironment("0", () => {
      expect(ansi.cyan('"value"')).toBe('"value"');
    });
  });
});
