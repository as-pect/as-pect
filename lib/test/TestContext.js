(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../reporter/EmptyReporter", "../util/ActualValue", "../util/LogValue"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var EmptyReporter_1 = require("../reporter/EmptyReporter");
    var ActualValue_1 = require("../util/ActualValue");
    var LogValue_1 = require("../util/LogValue");
    var wasmFilter = function (input) { return /wasm-function/i.test(input); };
    var TestContext = /** @class */ (function () {
        function TestContext(props) {
            this.reporter = new EmptyReporter_1.EmptyReporter();
            /* istanbul ignore next */
            this.stdout = process ? process.stdout : null;
            /* istanbul ignore next */
            this.stderr = process.stderr ? process.stderr : null;
            this.performanceConfiguration = {};
            this.testRegex = new RegExp("");
            this.groupRegex = new RegExp("");
            this.fileName = "";
            this.wasm = null;
            this.actual = null;
            this.expected = null;
            this.logTarget = {
                logs: [],
                stack: "",
                message: "",
            };
            if (props) {
                if (props.reporter)
                    this.reporter = props.reporter;
                if (props.stdout)
                    this.stdout = props.stdout;
                if (props.stderr)
                    this.stderr = props.stderr;
                if (props.performanceConfiguration)
                    this.performanceConfiguration = props.performanceConfiguration;
                if (props.testRegex)
                    this.testRegex = props.testRegex;
                if (props.groupRegex)
                    this.groupRegex = props.groupRegex;
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
                        clearExpected: this.clearExpected.bind(this),
                        debug: this.debug.bind(this),
                        tryCall: this.tryCall.bind(this),
                        logNull: this.logNull.bind(this),
                        logReference: this.logReference.bind(this),
                        logString: this.logString.bind(this),
                        logValue: this.logValue.bind(this),
                        reportActualNull: this.reportActualNull.bind(this),
                        reportExpectedNull: this.reportExpectedNull.bind(this),
                        reportActualValue: this.reportActualValue.bind(this),
                        reportExpectedValue: this.reportExpectedValue.bind(this),
                        reportActualReference: this.reportActualReference.bind(this),
                        reportExpectedReference: this.reportExpectedReference.bind(this),
                        reportActualString: this.reportActualString.bind(this),
                        reportExpectedString: this.reportExpectedString.bind(this),
                        reportExpectedTruthy: this.reportExpectedTruthy.bind(this),
                        reportExpectedFalsy: this.reportExpectedFalsy.bind(this),
                        reportExpectedFinite: this.reportExpectedFinite.bind(this),
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
        /**
         * This function reports an actual null value.
         */
        TestContext.prototype.reportActualNull = function () {
            var value = new ActualValue_1.ActualValue();
            value.message = "null";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.value = null;
            this.actual = value;
        };
        /**
         * This function reports an expected null value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedNull = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "null";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            value.value = null;
            this.expected = value;
        };
        /**
         * This function reports an actual numeric value.
         *
         * @param {number} numericValue - The value to be expected.
         */
        TestContext.prototype.reportActualValue = function (numericValue) {
            var value = new ActualValue_1.ActualValue();
            value.message = numericValue.toString();
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.value = numericValue;
            this.actual = value;
        };
        /**
         * This function reports an expected numeric value.
         *
         * @param {number} numericValue - The value to be expected
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedValue = function (numericValue, negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = numericValue.toString();
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            value.value = numericValue;
            this.expected = value;
        };
        /**
         * This function reports an actual reference value.
         *
         * @param {number} referencePointer - The actual reference pointer.
         * @param {number} offset - The size of the reference in bytes.
         */
        TestContext.prototype.reportActualReference = function (referencePointer, offset) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Reference Value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.pointer = referencePointer;
            value.offset = offset;
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
            value.value = referencePointer;
            this.actual = value;
        };
        /**
         * This function reports an expected reference value.
         *
         * @param {number} referencePointer - The expected reference pointer.
         * @param {number} offset - The size of the reference in bytes.
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedReference = function (referencePointer, offset, negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Reference Value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.pointer = referencePointer;
            value.offset = offset;
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
            value.negated = negated === 1;
            value.value = referencePointer;
            this.expected = value;
        };
        /**
         * This function reports an expected truthy value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedTruthy = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Truthy Value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an expected falsy value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedFalsy = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Falsy Value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an expected finite value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedFinite = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Finite Value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an actual string value.
         *
         * @param {number} stringPointer - A pointer that points to the actual string.
         */
        TestContext.prototype.reportActualString = function (stringPointer) {
            var value = new ActualValue_1.ActualValue();
            value.message = this.wasm.__getString(stringPointer);
            value.pointer = stringPointer;
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.value = stringPointer;
            this.actual = value;
        };
        /**
         * This function reports an expected string value.
         *
         * @param {number} stringPointer - A pointer that points to the expected string.
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedString = function (stringPointer, negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = this.wasm.__getString(stringPointer);
            value.pointer = stringPointer;
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            value.value = stringPointer;
            this.expected = value;
        };
        /**
         * This function overrides the provided AssemblyScript `env.abort()` function to catch abort
         * reasons.
         *
         * @param {number} reasonPointer - This points to the message value that causes the expectation to
         * fail.
         * @param {number} _fileNamePointer - The file name that reported the error. (Ignored)
         * @param {number} _line - The line that reported the error. (Ignored)
         * @param {number} _col - The column that reported the error. (Ignored)
         */
        TestContext.prototype.abort = function (reasonPointer, _fileNamePointer, _line, _col) {
            this.logTarget.message = this.wasm.__getString(reasonPointer);
        };
        /**
         * Gets a log stack trace.
         */
        TestContext.prototype.getLogStackTrace = function () {
            return new Error("Get stack trace.")
                .stack
                .toString()
                .split("\n")
                .slice(1)
                .filter(wasmFilter)
                .join("\n");
        };
        /**
         * Gets an error stack trace.
         */
        TestContext.prototype.getErrorStackTrace = function (ex) {
            var stackItems = ex.stack.toString().split("\n");
            return [stackItems[0]].concat(stackItems.slice(1).filter(wasmFilter)).join("\n");
        };
        /**
         * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
         */
        TestContext.prototype.debug = function () { debugger; };
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
                this.logTarget.stack = this.getErrorStackTrace(ex);
                return 0;
            }
            return 1;
        };
        /**
         * Log a null value to the reporter.
         */
        TestContext.prototype.logNull = function () {
            // create a new log value
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            // collect log metadata
            value.stack = this.getLogStackTrace();
            value.message = "null";
            value.target = target;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * This function is called after each expectation if the expectation passes. This prevents other
         * unreachable() conditions that throw errors to report actual and expected values too.
         */
        TestContext.prototype.clearExpected = function () {
            this.expected = null;
            this.actual = null;
            this.logTarget.stack = "";
        };
        /**
         * Log a reference to the reporter.
         *
         * @param {number} referencePointer - The pointer to the reference.
         * @param {number} offset - The offset of the reference.
         */
        TestContext.prototype.logReference = function (referencePointer, offset) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
            value.message = "Reference Type";
            value.offset = offset;
            value.pointer = referencePointer;
            value.stack = this.getLogStackTrace();
            value.target = target;
            value.value = referencePointer;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * This adds a logged string to the current test.
         *
         * @param {number} pointer - The pointer to the logged string reference.
         */
        TestContext.prototype.logString = function (pointer) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.message = this.wasm.__getString(pointer);
            value.offset = 0;
            value.pointer = pointer;
            value.stack = this.getLogStackTrace();
            value.target = target;
            value.value = pointer;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * Log a numevalueric value to the reporter.
         *
         * @param {number} value - The value to be logged.
         */
        TestContext.prototype.logValue = function (numericValue) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.stack = this.getLogStackTrace();
            value.message = "Value " + numericValue.toString();
            value.value = numericValue;
            value.target = target;
            // push the log value to the logs
            target.logs.push(value);
        };
        return TestContext;
    }());
    exports.TestContext = TestContext;
});
//# sourceMappingURL=TestContext.js.map