(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../util/IPerformanceConfiguration", "../reporter/EmptyReporter", "./TestGroup", "./TestResult", "../util/timeDifference", "perf_hooks", "../util/ActualValue"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var IPerformanceConfiguration_1 = require("../util/IPerformanceConfiguration");
    var EmptyReporter_1 = require("../reporter/EmptyReporter");
    var TestGroup_1 = require("./TestGroup");
    var TestResult_1 = require("./TestResult");
    var timeDifference_1 = require("../util/timeDifference");
    var perf_hooks_1 = require("perf_hooks");
    var ActualValue_1 = require("../util/ActualValue");
    var wasmFilter = function (input) { return /wasm-function/i.test(input); };
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
            this.performanceConfiguration = IPerformanceConfiguration_1.createDefaultPerformanceConfiguration();
            this.testRegex = new RegExp("");
            this.groupRegex = new RegExp("");
            this.fileName = "";
            this.testGroups = [];
            this.currentGroup = null;
            this.currentTest = null;
            this.logTarget = null;
            this.traceMaps = new Map();
            this.stackTraceIndex = 0;
            this.startupTime = 0;
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
                    Object.assign(this.performanceConfiguration, props.performanceConfiguration);
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
                        testCanRun: this.testCanRun.bind(this),
                        groupCanRun: this.groupCanRun.bind(this),
                        testStart: this.testStart.bind(this),
                        testFail: this.testFail.bind(this),
                        testPass: this.testPass.bind(this),
                        groupStart: this.groupStart.bind(this),
                        reportTodo: this.reportTodo.bind(this),
                        groupEnd: this.groupEnd.bind(this),
                        now: this.now.bind(this),
                        getLogStackTrace: this.getLogStackTrace.bind(this),
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
            // start the timer
            var start = perf_hooks_1.performance.now();
            // initialize wasm property
            this.wasm = wasm;
            // setup performance values
            wasm.__set_performanceEnabled(this.performanceConfiguration.enabled ? 1 : 0);
            wasm.__set_maxSamples(this.performanceConfiguration.maxSamples);
            wasm.__set_maxTestRunTime(this.performanceConfiguration.maxTestRunTime);
            wasm.__set_roundDecimalPlaces(this.performanceConfiguration.roundDecimalPlaces);
            wasm.__set_recordAverage(this.performanceConfiguration.reportAverage ? 1 : 0);
            wasm.__set_recordMedian(this.performanceConfiguration.reportMedian ? 1 : 0);
            wasm.__set_recordStdDev(this.performanceConfiguration.reportStandardDeviation ? 1 : 0);
            wasm.__set_recordMax(this.performanceConfiguration.reportMax ? 1 : 0);
            wasm.__set_recordMin(this.performanceConfiguration.reportMin ? 1 : 0);
            wasm.__set_recordVar(this.performanceConfiguration.reportVariance ? 1 : 0);
            // initialize and perform test collection
            wasm.__init();
            this.startupTime = timeDifference_1.timeDifference(perf_hooks_1.performance.now(), start);
            // report startup
            this.reporter.onStart(this);
            // run the tests
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
                if (this.currentTest) {
                    this.currentTest.stack = this.getErrorStackTrace(ex);
                }
                else {
                    console.log(ex);
                }
            }
            return 1;
        };
        /**
         * This method checks to see if the provided string matches the test regular expression.
         *
         * @param {number} descriptionPointer - The pointer to the test's name.
         * @returns {1 | 0} - The return value is a bool in AssemblyScript.
         */
        TestContext.prototype.testCanRun = function (descriptionPointer) {
            return this.testRegex.test(this.wasm.__getString(descriptionPointer)) ? 1 : 0;
        };
        /**
         * This method checks to see if the provided string matches the group regular expression.
         *
         * @param {number} descriptionPointer - The pointer to the test's name.
         * @returns {1 | 0} - The return value is a bool in AssemblyScript.
         */
        TestContext.prototype.groupCanRun = function (descriptionPointer) {
            return this.groupRegex.test(this.wasm.__getString(descriptionPointer)) ? 1 : 0;
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
        TestContext.prototype.abort = function (reasonPointer, fileNamePointer, line, col) {
            if (this.currentTest) {
                this.currentTest.message = reasonPointer !== 0 ? this.wasm.__getString(reasonPointer) : "";
            }
            else {
                console.log(this.fileName);
                var reason = reasonPointer !== 0 ? this.wasm.__getString(reasonPointer) : "";
                var fileName = fileNamePointer !== 0 ? this.wasm.__getString(fileNamePointer) : "";
                console.log(reason);
                console.log(fileName + ":" + line + ":" + col);
            }
        };
        /**
         * Gets an error stack trace.
         */
        TestContext.prototype.getErrorStackTrace = function (ex) {
            var stackItems = ex.stack.toString().split("\n");
            return [stackItems[0]].concat(stackItems.slice(1).filter(wasmFilter)).join("\n");
        };
        /**
         * Starts the next group and starts the timer.
         *
         * @param {number} descriptionPointer - The pointer to the name of the group.
         */
        TestContext.prototype.groupStart = function (descriptionPointer) {
            var group = new TestGroup_1.TestGroup();
            group.name = descriptionPointer !== 0
                ? this.wasm.__getString(descriptionPointer)
                : "";
            group.start = perf_hooks_1.performance.now();
            this.currentGroup = group;
            this.logTarget = group;
            this.reporter.onGroupStart(group);
            this.testGroups.push(group);
        };
        /**
         * Starts a new test.
         *
         * @param {number} descriptionPointer - The pointer to the test description.
         */
        TestContext.prototype.testStart = function (descriptionPointer) {
            var test = new TestResult_1.TestResult();
            test.name = descriptionPointer === 0
                ? ""
                : this.wasm.__getString(descriptionPointer);
            this.logTarget = test;
            this.currentTest = test;
            this.currentGroup.tests.push(test);
            this.reporter.onTestStart(this.currentGroup, test);
        };
        /**
         * Reports a todo.
         *
         * @param {number} descriptionPointer - A pointer to the todo description.
         */
        TestContext.prototype.reportTodo = function (descriptionPointer) {
            var description = descriptionPointer !== 0
                ? this.wasm.__getString(descriptionPointer)
                : "";
            this.currentGroup.todos.push(description);
            this.reporter.onTodo(this.currentGroup, description);
        };
        /**
         * This method is linked to web assembly, and will be called when a group has ended. It also
         * stops the timer and calculated the runtime for the group.
         */
        TestContext.prototype.groupEnd = function (pass) {
            var group = this.currentGroup;
            group.end = perf_hooks_1.performance.now();
            group.time = timeDifference_1.timeDifference(group.end, group.start);
            group.pass = !!pass;
            this.reporter.onGroupFinish(group);
            this.currentGroup = null;
            this.logTarget = null;
        };
        /**
         * This linked function returns the current time.
         */
        TestContext.prototype.now = function () {
            return perf_hooks_1.performance.now();
        };
        TestContext.prototype.testFail = function (actualType, actualValue, actualReference, actualOffset, actualStack, expectedType, expectedValue, expectedReference, expectedOffset, expectedStack, negated) {
            var test = this.currentTest;
            test.pass = false;
            test.negated = (negated === 1);
            test.actual = new ActualValue_1.ActualValue(this.wasm, actualType, actualValue, actualReference, actualOffset, this.traceMaps.get(actualStack), 0);
            test.expected = new ActualValue_1.ActualValue(this.wasm, expectedType, expectedValue, expectedReference, expectedOffset, this.traceMaps.get(expectedStack), negated);
            this.reporter.onTestFinish(this.currentGroup, test);
        };
        TestContext.prototype.testPass = function (times, performanceEnabled, roundDecimalPlaces, recordAverage, recordMedian, recordMax, recordMin, recordStdDev, recordVariance, negated) {
            var test = this.currentTest;
            test.times = this.wasm.__getArray(times);
            test.negated = (negated === 1);
            test.pass = true;
            if (performanceEnabled === 1) {
                test.performance = true;
                test.decimalPlaces = roundDecimalPlaces;
                if (recordAverage === 1)
                    test.calculateAverage();
                if (recordMedian === 1)
                    test.calculateMedian();
                if (recordMax === 1)
                    test.calculateMax();
                if (recordMin === 1)
                    test.calculateMin();
                if (recordVariance === 1)
                    test.calculateVariance();
                if (recordStdDev === 1)
                    test.calculateStandardDeviation();
            }
            this.reporter.onTestFinish(this.currentGroup, test);
        };
        /**
         * This method creates a stack trace, filters the relevant functions, then returns an index to
         * the stack trace. Since this value is only read outside of Web Assembly when generating host
         * objects, this prevents the need for strings to be passed into and out of Web Assembly.
         */
        TestContext.prototype.getLogStackTrace = function () {
            var trace = new Error("Stack Trace")
                .stack
                .split("\n")
                .filter(wasmFilter)
                .join("\n");
            var nextID = this.stackTraceIndex + 1;
            this.stackTraceIndex = nextID;
            this.traceMaps.set(nextID, trace);
            return nextID;
        };
        return TestContext;
    }());
    exports.TestContext = TestContext;
});
//# sourceMappingURL=TestContext.js.map