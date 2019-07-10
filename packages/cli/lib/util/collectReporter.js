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
        define(["require", "exports", "@as-pect/core", "querystring", "chalk"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var core_1 = require("@as-pect/core");
    var querystring_1 = __importDefault(require("querystring"));
    var chalk_1 = __importDefault(require("chalk"));
    /**
     * This method inspects the command line arguments and returns the corresponding TestReporter.
     *
     * @param {Options} cliOptions - The command line arguments.
     */
    function collectReporter(cliOptions) {
        var reporters = [];
        if (cliOptions.csv) {
            var CSVReporter = require("@as-pect/core").CSVReporter;
            if (typeof cliOptions.csv === "string") {
                var options = querystring_1.default.parse(cliOptions.csv || "");
                reporters.push(new CSVReporter(options));
            }
            else {
                reporters.push(new CSVReporter());
            }
            process.stdout.write(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow CSVReporter}\n"], ["{bgWhite.black [Log]} Using {yellow CSVReporter}\\n"]))));
        }
        if (cliOptions.json) {
            var JSONReporter = require("@as-pect/core").JSONReporter;
            if (typeof cliOptions.json === "string") {
                var options = querystring_1.default.parse(cliOptions.json || "");
                reporters.push(new JSONReporter(options));
            }
            else {
                reporters.push(new JSONReporter());
            }
            process.stdout.write(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow JSONReporter}\n"], ["{bgWhite.black [Log]} Using {yellow JSONReporter}\\n"]))));
        }
        if (cliOptions.summary) {
            var SummaryReporter_1 = require("@as-pect/core").SummaryReporter;
            if (typeof cliOptions.summary === "string") {
                var options = querystring_1.default.parse(cliOptions.summary || "");
                reporters.push(new SummaryReporter_1(options));
            }
            else {
                reporters.push(new SummaryReporter_1());
            }
            process.stdout.write(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow SummaryReporter}\n"], ["{bgWhite.black [Log]} Using {yellow SummaryReporter}\\n"]))));
        }
        if (cliOptions.verbose) {
            var VerboseReporter = require("@as-pect/core").VerboseReporter;
            if (typeof cliOptions.verbose === "string") {
                var options = querystring_1.default.parse(cliOptions.verbose || "");
                reporters.push(new VerboseReporter(options));
            }
            else {
                reporters.push(new VerboseReporter());
            }
            process.stdout.write(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow VerboseReporter}\n"], ["{bgWhite.black [Log]} Using {yellow VerboseReporter}\\n"]))));
        }
        if (cliOptions.reporter) {
            var url = require("url").parse(cliOptions.reporter);
            try {
                var reporterValue = require(url.pathname);
                var Reporter = reporterValue.default || reporterValue;
                var options = require("querystring").parse(url.query);
                if (typeof Reporter === "function") {
                    reporters.push(new Reporter(options));
                }
                else {
                    reporters.push(Reporter);
                }
            }
            catch (ex) {
                console.error(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{red [Error]} Cannot find a reporter at {yellow ", "}"], ["{red [Error]} Cannot find a reporter at {yellow ", "}"])), url.pathname));
                console.error(ex);
                process.exit(1);
            }
            process.stdout.write(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgWhite.black [Log]} Using custom reporter at: {yellow ", "}\n"], ["{bgWhite.black [Log]} Using custom reporter at: {yellow ", "}\\n"])), url.pathname));
        }
        if (reporters.length === 0) {
            process.stdout.write(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{bgWhite.black [Log]} Using {yellow SummaryReporter}\n"], ["{bgWhite.black [Log]} Using {yellow SummaryReporter}\\n"]))));
            return new core_1.SummaryReporter({
                enableLogging: true,
            });
        }
        else {
            return new core_1.CombinationReporter(reporters);
        }
    }
    exports.collectReporter = collectReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY29sbGVjdFJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3V0aWwvY29sbGVjdFJlcG9ydGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUFBLHNDQUFtRjtJQUVuRiw0REFBc0M7SUFDdEMsZ0RBQTBCO0lBRTFCOzs7O09BSUc7SUFDSCxTQUFnQixlQUFlLENBQUMsVUFBbUI7UUFDakQsSUFBTSxTQUFTLEdBQW1CLEVBQUUsQ0FBQztRQUVyQyxJQUFJLFVBQVUsQ0FBQyxHQUFHLEVBQUU7WUFDbEIsSUFBTSxXQUFXLEdBQUcsT0FBTyxDQUFDLGVBQWUsQ0FBQyxDQUFDLFdBQVcsQ0FBQztZQUN6RCxJQUFJLE9BQU8sVUFBVSxDQUFDLEdBQUcsS0FBSyxRQUFRLEVBQUU7Z0JBQ3RDLElBQU0sT0FBTyxHQUFHLHFCQUFXLENBQUMsS0FBSyxDQUFDLFVBQVUsQ0FBQyxHQUFHLElBQUksRUFBRSxDQUFDLENBQUM7Z0JBQ3hELFNBQVMsQ0FBQyxJQUFJLENBQUMsSUFBSSxXQUFXLENBQUMsT0FBTyxDQUFDLENBQUMsQ0FBQzthQUMxQztpQkFBTTtnQkFDTCxTQUFTLENBQUMsSUFBSSxDQUFDLElBQUksV0FBVyxFQUFFLENBQUMsQ0FBQzthQUNuQztZQUNELE9BQU8sQ0FBQyxNQUFNLENBQUMsS0FBSyxDQUNsQixlQUFLLHVIQUFBLHFEQUFvRCxLQUMxRCxDQUFDO1NBQ0g7UUFFRCxJQUFJLFVBQVUsQ0FBQyxJQUFJLEVBQUU7WUFDbkIsSUFBTSxZQUFZLEdBQUcsT0FBTyxDQUFDLGVBQWUsQ0FBQyxDQUFDLFlBQVksQ0FBQztZQUMzRCxJQUFJLE9BQU8sVUFBVSxDQUFDLElBQUksS0FBSyxRQUFRLEVBQUU7Z0JBQ3ZDLElBQU0sT0FBTyxHQUFHLHFCQUFXLENBQUMsS0FBSyxDQUFDLFVBQVUsQ0FBQyxJQUFJLElBQUksRUFBRSxDQUFDLENBQUM7Z0JBQ3pELFNBQVMsQ0FBQyxJQUFJ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