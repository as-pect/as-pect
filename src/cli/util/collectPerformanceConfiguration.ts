import { IYargs } from "./IYargs";
import { IPerformanceConfiguration } from "../../util/IPerformanceConfiguration";

/**
 * This method collects the performance configuration values byref.
 *
 * @param {IYargs} yargs - The command line arguments
 * @param {IPerformanceConfiguration} performanceConfiguration - The effective performance configuration.
 */
export function collectPerformanceConfiguration(yargs: IYargs, performanceConfiguration: IPerformanceConfiguration) {
  if (yargs.argv.hasOwnProperty("performance"))
    performanceConfiguration.enabled = yargs.argv.performance !== "false";
  // gather all the flags
  if (yargs.argv.hasOwnProperty("maxSamples"))
    performanceConfiguration.maxSamples = parseFloat(yargs.argv.maxSamples.toString());
  if (yargs.argv.hasOwnProperty("maxTestRunTime"))
    performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
  if (yargs.argv.hasOwnProperty("maxTestRunTime"))
    performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
  if (yargs.argv.hasOwnProperty("roundDecimalPlaces"))
    performanceConfiguration.roundDecimalPlaces = parseFloat(yargs.argv.roundDecimalPlaces.toString());
  if (yargs.argv.hasOwnProperty("reportMedian"))
    performanceConfiguration.reportMedian = yargs.argv.reportMedian !== "false";
  if (yargs.argv.hasOwnProperty("reportAverage"))
    performanceConfiguration.reportAverage = yargs.argv.reportAverage !== "false";
  if (yargs.argv.hasOwnProperty("reportStandardDeviation"))
    performanceConfiguration.reportStandardDeviation = yargs.argv.reportStandardDeviation !== "false";
  if (yargs.argv.hasOwnProperty("reportMax"))
    performanceConfiguration.reportMax = yargs.argv.reportMax !== "false";
  if (yargs.argv.hasOwnProperty("reportMin"))
    performanceConfiguration.reportMin = yargs.argv.reportMin !== "false";
  if (yargs.argv.hasOwnProperty("reportVariance"))
    performanceConfiguration.reportVariance = yargs.argv.reportVariance !== "false";
}
