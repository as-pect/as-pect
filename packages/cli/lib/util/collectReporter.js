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
     * @ignore
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY29sbGVjdFJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3V0aWwvY29sbGVjdFJlcG9ydGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUFBLHNDQUFtRjtJQUVuRiw0REFBc0M7SUFDdEMsZ0RBQTBCO0lBRTFCOzs7OztPQUtHO0lBQ0gsU0FBZ0IsZUFBZSxDQUFDLFVBQW1CO1FBQ2pELElBQU0sU0FBUyxHQUFtQixFQUFFLENBQUM7UUFFckMsSUFBSSxVQUFVLENBQUMsR0FBRyxFQUFFO1lBQ2xCLElBQU0sV0FBVyxHQUFHLE9BQU8sQ0FBQyxlQUFlLENBQUMsQ0FBQyxXQUFXLENBQUM7WUFDekQsSUFBSSxPQUFPLFVBQVUsQ0FBQyxHQUFHLEtBQUssUUFBUSxFQUFFO2dCQUN0QyxJQUFNLE9BQU8sR0FBRyxxQkFBVyxDQUFDLEtBQUssQ0FBQyxVQUFVLENBQUMsR0FBRyxJQUFJLEVBQUUsQ0FBQyxDQUFDO2dCQUN4RCxTQUFTLENBQUMsSUFBSSxDQUFDLElBQUksV0FBVyxDQUFDLE9BQU8sQ0FBQyxDQUFDLENBQUM7YUFDMUM7aUJBQU07Z0JBQ0wsU0FBUyxDQUFDLElBQUksQ0FBQyxJQUFJLFdBQVcsRUFBRSxDQUFDLENBQUM7YUFDbkM7WUFDRCxPQUFPLENBQUMsTUFBTSxDQUFDLEtBQUssQ0FDbEIsZUFBSyx1SEFBQSxxREFBb0QsS0FDMUQsQ0FBQztTQUNIO1FBRUQsSUFBSSxVQUFVLENBQUMsSUFBSSxFQUFFO1lBQ25CLElBQU0sWUFBWSxHQUFHLE9BQU8sQ0FBQyxlQUFlLENBQUMsQ0FBQyxZQUFZLENBQUM7WUFDM0QsSUFBSSxPQUFPLFVBQVUsQ0FBQyxJQUFJLEtBQUssUUFBUSxFQUFFO2dCQUN2QyxJQUFNLE9BQU8sR0FBRyxxQkFBVyxDQUFDLEtBQUssQ0FBQyxVQUFVLENBQUMsSUFBSSxJQUFJLEVBQUUsQ0FBQyxDQUFDO2dCQUN6RCxTQUFTLENBQUMsSUFB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