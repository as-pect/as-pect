import chalk from "chalk";



export function printAsciiArt(version: string): void {
  console.log(chalk`{bold.bgWhite.black ${""
  }       ___   _____                       __    
      /   | / ___/      ____  ___  _____/ /_   
     / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/   
    / ___ |___/ /_____/ /_/ /  __/ /__/ /_     
   /_/  |_/____/     / .___/\\___/\\___/\\__/     
                    /_/                        }

⚡AS-pect⚡ Test suite runner {bgGreenBright.black [${version}]}
`);
}
