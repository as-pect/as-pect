var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../../reporter/DefaultTestReporter", "path", "querystring", "chalk"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var DefaultTestReporter_1 = require("../../reporter/DefaultTestReporter");
    var path_1 = __importDefault(require("path"));
    var querystring_1 = __importDefault(require("querystring"));
    var chalk_1 = __importDefault(require("chalk"));
    /**
     * This method inspects the command line arguments and returns the corresponding TestReporter.
     *
     * @param {Options} yargs - The command line arguments.
     */
    function collectReporter(yargs) {
        var reporterInput = yargs.reporter;
        var result = /([a-z\.]+)(?:\?(.*))?/i.exec(reporterInput);
        var targetReporter = result ? result[1] : "";
        var options = querystring_1.default.parse(result ? result[2] || "" : "");
        // get relative reporters
        if (targetReporter.startsWith(".")) {
            try {
                var reporterPath = path_1.default.join(process.cwd(), targetReporter);
                var reporterResult = require(reporterPath);
                // if something is returned
                if (reporterResult) {
                    // instantiate it if it's a default exported class
                    if (typeof reporterResult === "function") {
                        return new reporterResult(options);
                    }
                    // export default class
                    if (typeof reporterResult.default === "function") {
                        return new reporterResult.default(options);
                    }
                    // export default new Reporter()
                    return reporterResult.default || reporterResult;
                }
                else {
                    console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgBlack.yellow [Warning]} Cannot find reporter at {yellow ", "}, defaulting to DefaultTestReporter."], ["{bgBlack.yellow [Warning]} Cannot find reporter at {yellow ", "}, defaulting to DefaultTestReporter."])), reporterPath));
                    return new DefaultTestReporter_1.DefaultTestReporter(options);
                }
            }
            catch (ex) {
                console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgBlack.yellow [Error]} An error occured while trying to resolve a reporter at {yellow ", "}."], ["{bgBlack.yellow [Error]} An error occured while trying to resolve a reporter at {yellow ", "}."])), targetReporter));
                console.error(ex);
                process.exit(1);
                // @ts-ignore: the process has exited
                return null;
            }
        }
        else {
            try {
                var Reporter = require(path_1.default.join(__dirname, "..", "..", "reporter", targetReporter))[targetReporter];
                return new Reporter(options);
            }
            catch (ex) {
                console.error(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgBlack.yellow [Warning]} Cannot find {yellow ", "}, defaulting to DefaultTestReporter."], ["{bgBlack.yellow [Warning]} Cannot find {yellow ", "}, defaulting to DefaultTestReporter."])), targetReporter));
                return new DefaultTestReporter_1.DefaultTestReporter(options);
            }
        }
    }
    exports.collectReporter = collectReporter;
    var templateObject_1, templateObject_2, templateObject_3;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY29sbGVjdFJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vLi4vc3JjL2NsaS91dGlsL2NvbGxlY3RSZXBvcnRlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFDQSwwRUFBeUU7SUFFekUsOENBQXdCO0lBQ3hCLDREQUFzQztJQUN0QyxnREFBMEI7SUFFMUI7Ozs7T0FJRztJQUNILFNBQWdCLGVBQWUsQ0FBQyxLQUFjO1FBQzVDLElBQU0sYUFBYSxHQUFXLEtBQUssQ0FBQyxRQUFRLENBQUM7UUFDN0MsSUFBTSxNQUFNLEdBQUcsd0JBQXdCLENBQUMsSUFBSSxDQUFDLGFBQWEsQ0FBQyxDQUFDO1FBQzVELElBQU0sY0FBYyxHQUFHLE1BQU0sQ0FBQyxDQUFDLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxFQUFFLENBQUM7UUFFL0MsSUFBTSxPQUFPLEdBQUcscUJBQVcsQ0FBQyxLQUFLLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsQ0FBQyxDQUFDLElBQUksRUFBRSxDQUFDLENBQUMsQ0FBQyxFQUFFLENBQUMsQ0FBQztRQUVqRSx5QkFBeUI7UUFDekIsSUFBSSxjQUFjLENBQUMsVUFBVSxDQUFDLEdBQUcsQ0FBQyxFQUFFO1lBQ2xDLElBQUk7Z0JBQ0YsSUFBTSxZQUFZLEdBQUcsY0FBSSxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsR0FBRyxFQUFFLEVBQUUsY0FBYyxDQUFDLENBQUM7Z0JBQzlELElBQU0sY0FBYyxHQUFHLE9BQU8sQ0FBQyxZQUFZLENBQUMsQ0FBQztnQkFFN0MsMkJBQTJCO2dCQUMzQixJQUFJLGNBQWMsRUFBRTtvQkFDbEIsa0RBQWtEO29CQUNsRCxJQUFJLE9BQU8sY0FBYyxLQUFLLFVBQVUsRUFBRTt3QkFDeEMsT0FBTyxJQUFJLGNBQWMsQ0FBQyxPQUFPLENBQUMsQ0FBQztxQkFDcEM7b0JBQ0QsdUJBQXVCO29CQUN2QixJQUFJLE9BQU8sY0FBYyxDQUFDLE9BQU8sS0FBSyxVQUFVLEVBQUU7d0JBQ2hELE9BQU8sSUFBSSxjQUFjLENBQUMsT0FBTyxDQUFDLE9BQU8sQ0FBQyxDQUFDO3FCQUM1QztvQkFDRCxnQ0FBZ0M7b0JBQ2hDLE9BQU8sY0FBYyxDQUFDLE9BQU8sSUFBSSxjQUFjLENBQUM7aUJBQ2pEO3FCQUNJO29CQUNILE9BQU8sQ0FBQyxHQUFHLENBQUMsZUFBSyx5S0FBQSw2REFBOEQsRUFBWSx1Q0FBdUMsS0FBbkQsWUFBWSxFQUF3QyxDQUFDO29CQUNwSSxPQUFPLElBQUkseUNBQW1CLENBQUMsT0FBTyxDQUFDLENBQUM7aUJBQ3pDO2FBQ0Y7WUFBQyxPQUFPLEVBQUUsRUFBRTtnQkFDWCxPQUFPLENBQUMsR0FBRyxDQUFDLGVBQUssbUtBQUEsMEZBQTJGLEVBQWMsSUFBSSxLQUFsQixjQUFjLEVBQUssQ0FBQztnQkFDaEksT0FBTyxDQUFDLEtBQUssQ0FBQyxFQUFFLENBQUMsQ0FBQztnQkFDbEIsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsQ0FBQztnQkFDaEIscUNBQXFDO2dCQUNyQyxPQUFPLElBQUksQ0FBQzthQUNiO1NBQ0Y7YUFBTTtZQUNMLElBQUk7Z0JBQ0YsSUFBSSxRQUFRLEdBQUcsT0FBTyxDQUFDLGNBQUksQ0FBQyxJQUFJLENBQUMsU0FBUyxFQUFFLElBQUksRUFBRSxJQUFJLEVBQUUsVUFBVSxFQUFFLGNBQWMsQ0FBQyxDQUFDLENBQUMsY0FBYyxDQUFDLENBQUM7Z0JBQ3JHLE9BQU8sSUFBSSxRQUFRLENBQUMsT0FBTyxDQUFpQixDQUFDO2FBQzlDO1lBQUMsT0FBTyxFQUFFLEVBQUU7Z0JBQ1gsT0FBTyxDQUFDLEtBQUssQ0FBQyxlQUFLLDZKQUFBLGlEQUFrRCxFQUFjLHVDQUF1QyxLQUFyRCxjQUFjLEVBQXdDLENBQUE7Z0JBQzNILE9BQU8sSUFBSSx5Q0FBbUIsQ0FBQyxPQUFPLENBQUMsQ0FBQzthQUN6QztTQUNGO0lBRUgsQ0FBQztJQS9DRCwwQ0ErQ0MifQ==