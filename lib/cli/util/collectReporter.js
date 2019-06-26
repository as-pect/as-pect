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
        define(["require", "exports", "querystring", "chalk", "../../reporter/SummaryReporter", "../../reporter/CombinationReporter"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var querystring_1 = __importDefault(require("querystring"));
    var chalk_1 = __importDefault(require("chalk"));
    var SummaryReporter_1 = __importDefault(require("../../reporter/SummaryReporter"));
    var CombinationReporter_1 = __importDefault(require("../../reporter/CombinationReporter"));
    /**
     * This method inspects the command line arguments and returns the corresponding TestReporter.
     *
     * @param {Options} yargs - The command line arguments.
     */
    function collectReporter(yargs) {
        var reporters = [];
        if (yargs.csv) {
            var CSVReporter = require("../../reporter/CSVReporter").default;
            if (typeof yargs.csv === "string") {
                var options = querystring_1.default.parse(yargs.csv || "");
                reporters.push(new CSVReporter(options));
            }
            else {
                reporters.push(new CSVReporter());
            }
            process.stdout.write(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgWhite.black [Log]} Using CSVReporter\n"], ["{bgWhite.black [Log]} Using CSVReporter\\n"]))));
        }
        if (yargs.json) {
            var JSONReporter = require("../../reporter/JSONReporter").default;
            if (typeof yargs.json === "string") {
                var options = querystring_1.default.parse(yargs.json || "");
                reporters.push(new JSONReporter(options));
            }
            else {
                reporters.push(new JSONReporter());
            }
            process.stdout.write(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgWhite.black [Log]} Using JSONReporter\n"], ["{bgWhite.black [Log]} Using JSONReporter\\n"]))));
        }
        if (yargs.summary) {
            var SummaryReporter_2 = require("../../reporter/SummaryReporter").default;
            if (typeof yargs.summary === "string") {
                var options = querystring_1.default.parse(yargs.summary || "");
                reporters.push(new SummaryReporter_2(options));
            }
            else {
                reporters.push(new SummaryReporter_2());
            }
            process.stdout.write(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} Using SummaryReporter\n"], ["{bgWhite.black [Log]} Using SummaryReporter\\n"]))));
        }
        if (yargs.verbose) {
            var VerboseReporter = require("../../reporter/VerboseReporter").default;
            if (typeof yargs.verbose === "string") {
                var options = querystring_1.default.parse(yargs.verbose || "");
                reporters.push(new VerboseReporter(options));
            }
            else {
                reporters.push(new VerboseReporter());
            }
            process.stdout.write(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgWhite.black [Log]} Using VerboseReporter\n"], ["{bgWhite.black [Log]} Using VerboseReporter\\n"]))));
        }
        if (yargs.reporter) {
            var url = require("url").parse(yargs.reporter);
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
            process.stdout.write(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{bgWhite.black [Log]} Using SummaryReporter\n"], ["{bgWhite.black [Log]} Using SummaryReporter\\n"]))));
            return new SummaryReporter_1.default({
                enableLogging: true,
            });
        }
        else {
            return new CombinationReporter_1.default(reporters);
        }
    }
    exports.collectReporter = collectReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY29sbGVjdFJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vLi4vc3JjL2NsaS91dGlsL2NvbGxlY3RSZXBvcnRlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFFQSw0REFBc0M7SUFDdEMsZ0RBQTBCO0lBQzFCLG1GQUE2RDtJQUM3RCwyRkFBcUU7SUFHckU7Ozs7T0FJRztJQUNILFNBQWdCLGVBQWUsQ0FBQyxLQUFjO1FBQzVDLElBQU0sU0FBUyxHQUFtQixFQUFFLENBQUM7UUFFckMsSUFBSSxLQUFLLENBQUMsR0FBRyxFQUFFO1lBQ2IsSUFBTSxXQUFXLEdBQUcsT0FBTyxDQUFDLDRCQUE0QixDQUFDLENBQUMsT0FBTyxDQUFDO1lBQ2xFLElBQUksT0FBTyxLQUFLLENBQUMsR0FBRyxLQUFLLFFBQVEsRUFBRTtnQkFDakMsSUFBTSxPQUFPLEdBQUcscUJBQVcsQ0FBQyxLQUFLLENBQUMsS0FBSyxDQUFDLEdBQUcsSUFBSSxFQUFFLENBQUMsQ0FBQztnQkFDbkQsU0FBUyxDQUFDLElBQUksQ0FBQyxJQUFJLFdBQVcsQ0FBQyxPQUFPLENBQUMsQ0FBQyxDQUFDO2FBQzFDO2lCQUFNO2dCQUNMLFNBQVMsQ0FBQyxJQUFJLENBQUMsSUFBSSxXQUFXLEVBQUUsQ0FBQyxDQUFDO2FBQ25DO1lBQ0QsT0FBTyxDQUFDLE1BQU0sQ0FBQyxLQUFLLENBQUMsZUFBSyw4R0FBQSw0Q0FBMkMsS0FBQyxDQUFDO1NBQ3hFO1FBRUQsSUFBSSxLQUFLLENBQUMsSUFBSSxFQUFFO1lBQ2QsSUFBTSxZQUFZLEdBQUcsT0FBTyxDQUFDLDZCQUE2QixDQUFDLENBQUMsT0FBTyxDQUFDO1lBQ3BFLElBQUksT0FBTyxLQUFLLENBQUMsSUFBSSxLQUFLLFFBQVEsRUFBRTtnQkFDbEMsSUFBTSxPQUFPLEdBQUcscUJBQVcsQ0FBQyxLQUFLLENBQUMsS0FBSyxDQUFDLElBQUksSUFBSSxFQUFFLENBQUMsQ0FBQztn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