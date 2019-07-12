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
    {bold.green asp} --config=as-pect.config.js      Use a specified configuration
    {bold.green asp} -c as-pect.config.js
    {bold.green asp} --version                       View the version.
    {bold.green asp} -v
    {bold.green asp} --help                          Show this help screen.
    {bold.green asp} -h
    {bold.green asp} --types                         Copy the types file to assembly/__tests__/as-pect.d.ts
    {bold.green asp} -t
    {bold.green asp} --compiler                      Path to folder relative to project root which contains
                                        {italic.magenta folder}/dist/asc for the compiler and {italic.magenta folder}/lib/loader for loader. {yellow (Default: assemblyscript)}

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

    {bold.green asp} --workers 3                      Enable the experimental worker worklets {yellow (default: 0 {gray [disabled]})}
      {bold.green asp} -w

  {bold.blueBright REPORTER OPTIONS}
    --summary                            Use the summary reporter. {yellow (This is the default if no reporter is specified.)}
    --verbose                            Use a more verbose reporter.
    --csv                                Use the csv reporter (output results to csv files.)
    --json                               Use the json reporter (output results to json files.)
    --reporter                           Define a custom reporter (path or module)

  {bold.blueBright PERFORMANCE OPTIONS}
    {bold.green --performance}                        Enable performance statistics for {bold every} test. {yellow (Default: false)}
    {bold.green --max-samples=[number]}               Set the maximum number of samples to run for each test. {yellow (Default: 10000 samples)}
    {bold.green --max-test-run-time=[number]}         Set the maximum test run time in milliseconds. {yellow (Default: 2000ms)}
    {bold.green --round-decimal-places=[number]}      Set the number of decimal places to round to. {yellow (Default: 3)}
    {bold.green --report-median(=false)?}             Enable/Disable reporting of the median time. {yellow (Default: true)}
    {bold.green --report-average(=false)?}            Enable/Disable reporting of the average time. {yellow (Default: true)}
    {bold.green --report-standard-deviation(=false)?} Enable/Disable reporting of the standard deviation. {yellow (Default: false)}
    {bold.green --report-max(=false)?}                Enable/Disable reporting of the largest run time. {yellow (Default: false)}
    {bold.green --report-min(=false)?}                Enable/Disable reporting of the smallest run time. {yellow (Default: false)}
    {bold.green --report-variance(=false)?}           Enable/Disable reporting of the variance. {yellow (Default: false)}
  `);
}
