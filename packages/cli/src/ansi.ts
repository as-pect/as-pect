type AnsiCode = readonly [open: number, close: number];
export type AnsiFormatter = (value: unknown) => string;

const styleCodes = {
  black: [30, 39],
  red: [31, 39],
  green: [32, 39],
  yellow: [33, 39],
  bold: [1, 22],
  bgWhite: [47, 49],
  bgYellow: [43, 49],
  bgGreenBright: [102, 49],
} as const satisfies Record<string, AnsiCode>;

function colorsAreEnabled(): boolean {
  const forceColor = process.env.FORCE_COLOR;

  if (forceColor !== undefined && forceColor !== "" && forceColor !== "0") return true;
  if (forceColor === "0" || "NO_COLOR" in process.env) return false;

  return Boolean(process.stdout.isTTY && process.env.TERM !== "dumb");
}

function createFormatter(...codes: AnsiCode[]): AnsiFormatter {
  return (value: unknown): string => {
    let output = String(value);
    if (!colorsAreEnabled() || output.length === 0) return output;

    for (let i = codes.length - 1; i >= 0; i--) {
      const [open, close] = codes[i];
      const openSequence = `\u001B[${open}m`;
      const closeSequence = `\u001B[${close}m`;
      output = `${openSequence}${output.replaceAll(closeSequence, closeSequence + openSequence)}${closeSequence}`;
    }

    return output;
  };
}

export const ansi = {
  blackOnWhite: createFormatter(styleCodes.bgWhite, styleCodes.black),
  blackOnYellow: createFormatter(styleCodes.bgYellow, styleCodes.black),
  boldBlackOnBrightGreen: createFormatter(styleCodes.bgGreenBright, styleCodes.bold, styleCodes.black),
  boldBlackOnWhite: createFormatter(styleCodes.bgWhite, styleCodes.bold, styleCodes.black),
  green: createFormatter(styleCodes.green),
  red: createFormatter(styleCodes.red),
  yellow: createFormatter(styleCodes.yellow),
};
