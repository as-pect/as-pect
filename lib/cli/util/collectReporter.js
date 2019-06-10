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
        define(["require", "exports", "../../reporter/DefaultTestReporter", "../../reporter/EmptyReporter", "../../reporter/SummaryTestReporter", "path", "../../reporter/CSVTestReporter", "../../reporter/JSONTestReporter", "querystring", "chalk"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var DefaultTestReporter_1 = require("../../reporter/DefaultTestReporter");
    var EmptyReporter_1 = require("../../reporter/EmptyReporter");
    var SummaryTestReporter_1 = require("../../reporter/SummaryTestReporter");
    var path_1 = __importDefault(require("path"));
    var CSVTestReporter_1 = require("../../reporter/CSVTestReporter");
    var JSONTestReporter_1 = require("../../reporter/JSONTestReporter");
    var querystring_1 = __importDefault(require("querystring"));
    var chalk_1 = __importDefault(require("chalk"));
    /**
     * This method inspects the command line arguments and returns the corresponding TestReporter.
     *
     * @param {IYargs} yargs - The command line arguments.
     */
    function collectReporter(yargs) {
        var reporterInput = yargs.argv.reporter || yargs.argv.r;
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
                    if (typeof reporterResult === "function") { // instantiate it if it's a default exported class
                        return new reporterResult(options);
                    }
                    if (typeof reporterResult.default === "function") {
                        return new reporterResult.default();
                    }
                    else {
                        return reporterResult.default || reporterResult;
                    }
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
        else if (targetReporter === "EmptyReporter") {
            return new EmptyReporter_1.EmptyReporter(options);
        }
        else if (targetReporter === "SummaryTestReporter") {
            console.log("Hit");
            return new SummaryTestReporter_1.SummaryTestReporter(options);
        }
        else if (targetReporter === "CSVTestReporter") {
            return new CSVTestReporter_1.CSVTestReporter(options);
        }
        else if (targetReporter === "JSONTestReporter") {
            return new JSONTestReporter_1.JSONTestReporter(options);
        }
        else {
            return new DefaultTestReporter_1.DefaultTestReporter(options);
        }
    }
    exports.collectReporter = collectReporter;
    var templateObject_1, templateObject_2;
});
//# sourceMappingURL=collectReporter.js.map