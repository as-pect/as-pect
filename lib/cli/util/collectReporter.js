var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../../reporter/DefaultTestReporter", "../../reporter/EmptyReporter", "../../reporter/SummaryTestReporter", "path"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var DefaultTestReporter_1 = require("../../reporter/DefaultTestReporter");
    var EmptyReporter_1 = require("../../reporter/EmptyReporter");
    var SummaryTestReporter_1 = require("../../reporter/SummaryTestReporter");
    var path_1 = __importDefault(require("path"));
    function collectReporter(yargs) {
        var targetReporter = yargs.argv.reporter || yargs.argv.r;
        // get relative reporters
        if (targetReporter.startsWith(".")) {
            try {
                var result = require(path_1.default.join(process.cwd(), targetReporter));
                // if something is returned
                if (result) {
                    if (typeof result === "function") { // instantiate it if it's a default exported class
                        return new result();
                    }
                    if (typeof result.default === "function") {
                        return new result.default();
                    }
                    else {
                        return result.default || result;
                    }
                }
                else {
                    return new DefaultTestReporter_1.DefaultTestReporter();
                }
            }
            catch (ex) {
                console.error("Cannot find target reporter at", path_1.default.join(process.cwd(), targetReporter));
                console.error(ex);
                process.exit(1);
                // @ts-ignore: the process has exited
                return null;
            }
        }
        else if (targetReporter === "EmptyReporter") {
            return new EmptyReporter_1.EmptyReporter();
        }
        else if (targetReporter === "SummaryTestReporter") {
            return new SummaryTestReporter_1.SummaryTestReporter();
        }
        else {
            return new DefaultTestReporter_1.DefaultTestReporter();
        }
    }
    exports.collectReporter = collectReporter;
});
//# sourceMappingURL=collectReporter.js.map