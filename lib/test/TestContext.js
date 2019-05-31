(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../reporter/EmptyReporter"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var EmptyReporter_1 = require("../reporter/EmptyReporter");
    var TestContext = /** @class */ (function () {
        function TestContext(props) {
            var _this = this;
            this.wasm = null;
            this.reporter = new EmptyReporter_1.EmptyReporter();
            this.time = 0;
            this.pass = true;
            this.errors = [];
            // stdout emulation
            this.stdoutChunks = [];
            this.stdout = typeof process !== "undefined"
                ? process.stdout
                : {
                    write: function (chunk) { return _this.stdoutChunks.push(chunk); }
                };
            // stderr emulation
            this.stderrChunks = [];
            this.stderr = typeof process !== "undefined"
                ? process.stderr
                : {
                    write: function (chunk) { return _this.stderrChunks.push(chunk); }
                };
            this.performanceConfiguration = null;
            this.testRegex = new RegExp("");
            this.groupRegex = new RegExp("");
            this.fileName = "";
            this.testGroups = [];
            /* istanbul ignore next */
            if (props) {
                /* istanbul ignore next */
                if (props.reporter)
                    this.reporter = props.reporter;
                /* istanbul ignore next */
                if (props.stdout)
                    this.stdout = props.stdout;
                /* istanbul ignore next */
                if (props.stderr)
                    this.stderr = props.stderr;
                /* istanbul ignore next */
                if (props.performanceConfiguration)
                    this.performanceConfiguration = props.performanceConfiguration;
                /* istanbul ignore next */
                if (props.testRegex)
                    this.testRegex = props.testRegex;
                /* istanbul ignore next */
                if (props.groupRegex)
                    this.groupRegex = props.groupRegex;
                /* istanbul ignore next */
                if (props.fileName)
                    this.fileName = props.fileName;
            }
        }
        /**
         * This method creates a WebAssembly imports object with all the TestContext functions
         * bound to the TestContext.
         *
         * @param {any[]} imports - Every import item specified.
         */
        TestContext.prototype.createImports = function () {
            var _this = this;
            var imports = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                imports[_i] = arguments[_i];
            }
            var result = Object.assign.apply(Object, [{}].concat(imports, [{
                    __aspect: {
                        tryCall: this.tryCall.bind(this),
                    },
                }]));
            result.env = result.env || {};
            var previousAbort = (result.env.abort) || (function () { });
            result.env.abort = function () {
                var args = [];
                for (var _i = 0; _i < arguments.length; _i++) {
                    args[_i] = arguments[_i];
                }
                previousAbort.apply(void 0, args);
                // @ts-ignore
                _this.abort.apply(_this, args);
            };
            return result;
        };
        TestContext.prototype.run = function (wasm) {
            this.wasm = wasm;
            // setup performance values
            if (this.performanceConfiguration) {
                if (this.performanceConfiguration.hasOwnProperty("enabled")) {
                    wasm.__set_performanceEnabled(this.performanceConfiguration.enabled ? 1 : 0);
                }
                if (this.performanceConfiguration.hasOwnProperty("maxSamples")) {
                    wasm.__set_maxSamples(this.performanceConfiguration.maxSamples);
                }
                if (this.performanceConfiguration.hasOwnProperty("maxTestRunTime")) {
                    wasm.__set_maxTestRunTime(this.performanceConfiguration.maxTestRunTime);
                }
                if (this.performanceConfiguration.hasOwnProperty("roundDecimalPlaces")) {
                    wasm.__set_roundDecimalPlaces(this.performanceConfiguration.roundDecimalPlaces);
                }
                if (this.performanceConfiguration.hasOwnProperty("reportAverage")) {
                    wasm.__set_recordAverage(this.performanceConfiguration.reportAverage ? 1 : 0);
                }
                if (this.performanceConfiguration.hasOwnProperty("reportMedian")) {
                    wasm.__set_recordMedian(this.performanceConfiguration.reportMedian ? 1 : 0);
                }
                if (this.performanceConfiguration.hasOwnProperty("reportStandardDeviation")) {
                    wasm.__set_recordStdDev(this.performanceConfiguration.reportStandardDeviation ? 1 : 0);
                }
                if (this.performanceConfiguration.hasOwnProperty("reportMax")) {
                    wasm.__set_recordMax(this.performanceConfiguration.reportMax ? 1 : 0);
                }
                if (this.performanceConfiguration.hasOwnProperty("reportMin")) {
                    wasm.__set_recordMin(this.performanceConfiguration.reportMin ? 1 : 0);
                }
                if (this.performanceConfiguration.hasOwnProperty("reportVariance")) {
                    wasm.__set_recordVar(this.performanceConfiguration.reportVariance ? 1 : 0);
                }
            }
            wasm.__run();
        };
        /**
         * This is a web assembly utility function that wraps a function call in a try catch block to
         * report success or failure.
         *
         * @param {number} pointer - The function pointer to call. It must accept no parameters and return
         * void.
         * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
         * returns 0.
         */
        TestContext.prototype.tryCall = function (pointer) {
            if (pointer === -1)
                return 1;
            try {
                this.wasm.__call(pointer);
            }
            catch (ex) {
                return 0;
            }
            return 1;
        };
        return TestContext;
    }());
    exports.TestContext = TestContext;
});
//# sourceMappingURL=TestContext.js.map