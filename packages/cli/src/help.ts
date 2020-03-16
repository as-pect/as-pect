import chalk from "chalk";

/**
 * @ignore
 *
 * This method prints the help text.
 */
export function help() {
  console.log(chalk`
  {bold.blueBright SYNTAX}
    {bold.green asp} --init                          Create a test config, an assembly/__tests__ folder and exit.
    {bold.green asp} -i
    {bold.green asp} --init-wasi                     Create a test config for use with wasi, an assembly/__tests__ folder and exit.
    {bold.green asp} --config=as-pect.config.js      Use a specified configuration
    {bold.green asp} -c as-pect.config.js
    {bold.green asp} --version                       View the version.
    {bold.green asp} -v
    {bold.green asp} --help                          Show this help screen.
    {bold.green asp} -h
    {bold.green asp} --types                         Copy the types file to assembly/__tests__/as-pect.d.ts
    {bold.green asp} -t
    {bold.green asp} --nologo                        Suppress ASCII art from printing.
    {bold.green asp} --compiler                      Path to folder relative to project root which contains
                                        {italic.magenta folder}/dist/asc for the compiler and {italic.magenta folder}/lib/loader for loader. {yellow (Default: assemblyscript)}

  {bold.blueBright MODULE OPTIONS}
    {bold.green --memory-size=[integer]}              Initial size of imported memory in pages of 64kb. {yellow (Default: 10 pages)}
    {bold.green --memory-max=[integer]}               Set the maximum amount of memory pages the wasm test modules can use. {yellow (Default: -1)}

  {bold.blueBright TEST OPTIONS}
    {bold.green --file=[regex]}                       Run the tests of each file that matches this regex. {yellow (Default: /./)}
      {bold.green --files=[regex]}
      {bold.green -f=[regex]}

    {bold.green --group=[regex]}                      Run each describe block that matches this regex {yellow (Default: /(:?)/)}
      {bold.green --groups=[regex]}
      {bold.green -g=[regex]}

    {bold.green --test=[regex]}                       Run each test that matches this regex {yellow (Default: /(:?)/)}
      {bold.green --tests=[regex]}
      {bold.green -t=[regex]}

    {bold.green --output-binary}                      Create a (.wasm) file can contains all the tests to be run later.
      {bold.green -o}

    {bold.green --norun}                              Skip running tests and output the compiler files.
      {bold.green -n}

    {bold.green --nortrace}                           Skip rtrace reference counting calculations.
      {bold.green -nr}

    {bold.green asp --workers} 3                      Enable the experimental worker worklets {yellow (default: 0 {gray [disabled]})}
      {bold.green asp} -w

    {bold.green --update}                             Update the snapshots for each tested module.
      {bold.green asp} -u

  {bold.blueBright REPORTER OPTIONS}
    --summary                            Use the summary reporter. {yellow (This is the default if no reporter is specified.)}
    --verbose                            Use a more verbose reporter.
    --csv                                Use the csv reporter (output results to csv files.)
    --json                               Use the json reporter (output results to json files.)
    --reporter                           Define a custom reporter (path or module)
  `);
}
