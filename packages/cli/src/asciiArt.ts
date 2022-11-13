import chalk from "chalk-template";

/**
 * @ignore
 *
 * This method prints the ascii art.
 * @param {string} version - The cli version
 */
export function printAsciiArt(): void {
  console.log(chalk`{bold.bgWhite.black ${""}       ___   _____                       __    
      /   | / ___/      ____  ___  _____/ /_   
     / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/   
    / ___ |___/ /_____/ /_/ /  __/ /__/ /_     
   /_/  |_/____/     / .___/\\___/\\___/\\__/     
                    /_/                        }
`);
}
