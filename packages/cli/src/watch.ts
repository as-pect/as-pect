import { Options } from "./util/CommandLineArg";
import chokidar from 'chokidar';

/**
 * @ignore
 * Idential to run, but will restart on file changes
 *
 * @param {Options} cliOptions - The command line arguments.
 * @param {string[]} compilerArgs - The `asc` compiler arguments.
 */
export function watch(cliOptions: Options, compilerArgs: string[]): void {
  const run = require("./run").run;
  //@ts-ignore temporary hack to catch exit
  process.exit = ()=>{}
  chokidar.watch('**/*.ts',{
    ignoreInitial:true
  }).on('all',()=>{
    //TODO kill prev process?
    console.clear()
    run(cliOptions, compilerArgs)
  })
  console.clear()
  run(cliOptions, compilerArgs)
}
