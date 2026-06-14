import { ansi } from "./ansi.js";

/**
 * @ignore
 *
 * This method prints the ascii art.
 * @param {string} version - The cli version
 */
export function printAsciiArt(): void {
  const asciiArtLines: readonly (readonly [line: string, width: number])[] = [
    ["       ___   _____                       __", 47],
    ["      /   | / ___/      ____  ___  _____/ /_", 47],
    ["     / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/", 51],
    ["    / ___ |___/ /_____/ /_/ /  __/ /__/ /_", 47],
    ["   /_/  |_/____/     / .___/\\___/\\___/\\__/", 50],
    ["                    /_/", 47],
  ];

  console.log(ansi.boldBlackOnWhite(asciiArtLines.map(([line, width]) => line.padEnd(width)).join("\n")));
}
