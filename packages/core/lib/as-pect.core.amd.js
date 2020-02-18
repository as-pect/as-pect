var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __spreadArrays = (this && this.__spreadArrays) || function () {
    for (var s = 0, i = 0, il = arguments.length; i < il; i++) s += arguments[i].length;
    for (var r = Array(s), k = 0, i = 0; i < il; i++)
        for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++)
            r[k] = a[j];
    return r;
};
define("test/IWarning", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
});
define("util/HostValue", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var HostValue = /** @class */ (function () {
        function HostValue() {
            this.type = 0 /* None */;
            this.typeName = null;
            this.pointer = 0;
            this.typeId = 0;
            this.keys = null;
            this.values = null;
            this.offset = 0;
            this.value = 0;
            this.isNull = false;
            this.nullable = false;
            this.size = 0;
            this.signed = false;
            this.stack = "";
            this.negated = false;
        }
        return HostValue;
    }());
    exports.HostValue = HostValue;
});
define("util/ILogTarget", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
});
define("test/PerformanceLimits", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
});
define("math/mean", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * @ignore
     * This method calculates the average of the input set of numbers.
     *
     * @param {number[]} input - The set of numbers to be averaged.
     */
    function mean(input) {
        if (input.length === 0)
            return 0;
        var sum = 0;
        for (var i = 0; i < input.length; i++) {
            sum += input[i];
        }
        return sum / input.length;
    }
    exports.mean = mean;
});
define("math/round", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * @ignore
     * This method rounds a number value to a number of decimal places.
     *
     * @param {number} input - The number to be rounded.
     * @param {number} places - The number of decimal places used for rounding.
     */
    function round(input, places) {
        var factor = Math.pow(10, places);
        return Math.round(input * factor) / factor;
    }
    exports.round = round;
});
define("math/median", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * @ignore
     * This method calculates the median of the input set of numbers.
     *
     * @param {number[]} input - The set of numbers used to calculate the median.
     */
    function median(input) {
        var mid = Math.ceil(input.length * 0.5);
        input.sort(function (a, b) { return a - b; });
        return input.length & 1 ? input[mid] : (input[mid] + input[mid + 1]) * 0.5;
    }
    exports.median = median;
});
define("math/variance", ["require", "exports", "math/mean"], function (require, exports, mean_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * @ignore
     * This method calculates the statistical variance between the average of the set of numbers
     * and each number provided in the set. This is useful for calculating the standard deviation.
     *
     * @param {number[]} input - The set of numbers used to calculate the variance.
     */
    function variance(input) {
        var average = mean_1.mean(input);
        var count = input.length;
        var differences = [];
        for (var i = 0; i < count; i++) {
            var difference = input[i] - average;
            differences.push(difference * difference);
        }
        /** Biased mean of the differences, returns sum(differences) / (length + 1). */
        var result = 0;
        for (var i = 0; i < count; i++) {
            result += differences[i];
        }
        return result / (count + 1);
    }
    exports.variance = variance;
});
define("test/TestResult", ["require", "exports", "math/mean", "math/round", "math/median", "math/variance"], function (require, exports, mean_2, round_1, median_1, variance_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This is the data class that contains all the data about each `test()` or `it()` function defined
     * in the `AssemblyScript` module.
     */
    var TestResult = /** @class */ (function () {
        function TestResult() {
            /** This is the test function pointer. */
            this.functionPointer = -1;
            /** The actual test's name or description. */
            this.name = "";
            /** The indicator to see if the test passed. */
            this.pass = false;
            /** The indicated to see if a test actually ran. */
            this.ran = false;
            /** The time in milliseconds indicating how long the test ran for each run. */
            this.times = [];
            /** The reported actual value description. */
            this.actual = null;
            /** The reported expected value description. */
            this.expected = null;
            /** If the test failed, this is the message describing why the test failed. */
            this.message = "";
            /** A set of strings logged by the test itself. */
            this.logs = [];
            /** The generated stack trace if the test errored. */
            this.stack = null;
            /** This value is set to true if the test is expected to throw. */
            this.negated = false;
            /** This value indicates if performance statistics were collected for this test. */
            this.performance = false;
            /** This value indicates the maximum number of samples to collect. */
            this.maxSamples = 10000 /* MaxSamples */;
            /** This value indicates the maximum test runtime. */
            this.maxRuntime = 5000 /* MaxTestRuntime */;
            /** The number of decimal places used for rounding. */
            this.decimalPlaces = 0 /* MinimumDecimalPlaces */;
            /** This value indicates if an average should be calculated */
            this.calculateAverageValue = false;
            /** This value indicates if an average was calculated. */
            this.hasAverage = false;
            /** This is the average (mean) value. */
            this.average = 0;
            /** This value indicates if a max value should be calculated. */
            this.calculateMaxValue = false;
            /** This value indicates if a max was calculated. */
            this.hasMax = false;
            /** This is the max time. */
            this.max = 0;
            /** This value indicates if a median value should be calculated. */
            this.calculateMedianValue = false;
            /** This value indicates if a median value was calculated. */
            this.hasMedian = false;
            /** This is the calculated median time. */
            this.median = 0;
            /** This value indicated if a min value should be calculated. */
            this.calculateMinValue = false;
            /** This value indicates if a min value was calculated. */
            this.hasMin = false;
            /** This is the calculated min time. */
            this.min = 0;
            /** This value indicates if a standard deviation value should be calculated. */
            this.calculateStandardDeviationValue = false;
            /** This value indicates if a standard deviation value was calculated. */
            this.hasStdDev = false;
            /** This is the calculated standard deviation of the times collected. */
            this.stdDev = 0;
            /** This value indicates if the variance should be calculated. */
            this.calculateVarianceValue = false;
            /** A boolean indicating if the variance was calcluated. */
            this.hasVariance = false;
            /** The raw variance calculation before rounding was applied. */
            this.rawVariance = 0;
            /** This value indicates the calculated variance used for standard deviation calculations. */
            this.variance = 0;
            /** This is the timestamp for when the test started in milliseconds. */
            this.start = 0;
            /** This is the timestamp for when the test ended in milliseconds. */
            this.end = 0;
            /** This is the run time for the test in milliseconds. */
            this.runTime = 0;
            /**
             * If the test group did not error, this is the number of allocations that occurred durring the
             * the test's exection.
             */
            this.allocationCount = 0;
            /**
             * If the test group did not error, this is the number of deallocations that occurred durring the
             * the test's exection.
             */
            this.freeCount = 0;
            /**
             * If the test group did not error, this is the number of block decrements that occurred during
             * the test's exection.
             */
            this.decrementCount = 0;
            /**
             * If the test group did not error, this is the number of block increments that occurred during
             * the test's exection.
             */
            this.incrementCount = 0;
            /**
             * If the test did not error, this is the number of block increments that occurred during
             * the test's exection.
             */
            this.reallocationCount = 0;
            /**
             * This is the number of allocations currently on the heap when the `TestResult` execution starts.
             */
            this.rtraceStart = 0;
            /**
             * If the test group completed, this is the number of allocations currently on the heap when the
             * `TestResult` execution ends.
             */
            this.rtraceEnd = 0;
            /**
             * If the test group completed, this is the delta number of allocations that occured during the
             * `TestResult` execution.
             */
            this.rtraceDelta = 0;
            /**
             * A set of errors that were reported for this test.
             */
            this.errors = [];
            /**
             * A set of warnings that were reported for this test.
             */
            this.warnings = [];
        }
        /**
         * Caclculate the average value of the collected times.
         */
        TestResult.prototype.calculateAverage = function () {
            this.hasAverage = true;
            this.average = round_1.round(mean_2.mean(this.times), this.decimalPlaces);
        };
        /**
         * Calculate the max time of the collected times.
         */
        TestResult.prototype.calculateMax = function () {
            this.hasMax = true;
            this.max = Math.max.apply(Math, this.times);
        };
        /**
         * Calculate the median value of the collected times.
         */
        TestResult.prototype.calculateMedian = function () {
            this.hasMedian = true;
            this.median = round_1.round(median_1.median(this.times), this.decimalPlaces);
        };
        /**
         * Calculate the min value of the collected times.
         */
        TestResult.prototype.calculateMin = function () {
            this.hasMin = true;
            this.min = Math.min.apply(Math, this.times);
        };
        /**
         * Calculate the standard deviation of the collected times.
         */
        TestResult.prototype.calculateStandardDeviation = function () {
            if (!this.hasVariance) {
                this.calculateVariance();
            }
            this.hasStdDev = true;
            this.stdDev = round_1.round(Math.sqrt(this.rawVariance), this.decimalPlaces);
        };
        /**
         * Calculate the variance.
         */
        TestResult.prototype.calculateVariance = function () {
            if (this.hasVariance)
                return;
            this.hasVariance = true;
            this.rawVariance = variance_1.variance(this.times); // biased calculation
            this.variance = round_1.round(this.rawVariance, this.decimalPlaces);
        };
        return TestResult;
    }());
    exports.TestResult = TestResult;
});
define("test/TestGroup", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This test group class is designed with a data oriented layout in mind. Each test property is
     * represented by an array.
     */
    var TestGroup = /** @class */ (function () {
        function TestGroup() {
            /**
             * This is the set of function pointers that will be called before each test.
             */
            this.beforeEachPointers = [];
            /**
             * This is the set of function pointers that will be called after each test.
             */
            this.afterEachPointers = [];
            /**
             * This is the set of function pointers that will be called before each describe block.
             */
            this.beforeAllPointers = [];
            /**
             * This is the set of function pointers that will be called after each describe block.
             */
            this.afterAllPointers = [];
            /**
             * This is the list of tests that the `TestContext` ran for this group.
             */
            this.tests = [];
            /**
             * This is a list of "todos" that were collected for this group.
             */
            this.todos = [];
            /**
             * This is the set of log values that were collected before and after the tests ran.
             */
            this.logs = [];
            /**
             * This is the name of the test.
             */
            this.name = "";
            /**
             * This is a value indicating if the group's tests passed successfully.
             */
            this.pass = true;
            /**
             * This is the reason that the group's tests did not pass.
             */
            this.reason = "";
            /**
             * This is how long the group ran in ms.
             */
            this.time = 0;
            /**
             * A value indicating if this test group should run.
             */
            this.willRun = true;
            /**
             * The group start time.
             */
            this.start = 0;
            /**
             * The group end time.
             */
            this.end = 0;
            /**
             * If the test group did not error, this is the number of allocations that occurred durring the
             * the group's exection.
             */
            this.allocationCount = 0;
            /**
             * If the test group did not error, this is the number of deallocations that occurred durring the
             * the group's exection.
             */
            this.freeCount = 0;
            /**
             * If the test group did not error, this is the number of block decrements that occurred during
             * the group's exection.
             */
            this.decrementCount = 0;
            /**
             * If the test group did not error, this is the number of block increments that occurred during
             * the group's exection.
             */
            this.incrementCount = 0;
            /**
             * If the test group did not error, this is the number of block reallocations that occurred during
             * the group's exection.
             */
            this.reallocationCount = 0;
            /**
             * This is the number of allocations currently on the heap when the `TestGroup` execution starts.
             */
            this.rtraceStart = 0;
            /**
             * If the test group completed, this is the number of allocations currently on the heap when the
             * `TestGroup` execution ends.
             */
            this.rtraceEnd = 0;
            /**
             * If the test group completed, this is the delta number of allocations that occured during the
             * `TestGroup` execution.
             */
            this.rtraceDelta = 0;
            /**
             * The parent describe context that contains callbacks that also apply to this context.
             */
            this.parent = null;
            this.children = [];
            this.errors = [];
            /**
             * A set of warnings that were reported for this test.
             */
            this.warnings = [];
        }
        /**
         * This method creates a new TestGroup that contains a reference to all of the current flow
         * functions of this `TestGroup`.
         */
        TestGroup.prototype.fork = function () {
            var forked = new TestGroup();
            forked.parent = this;
            this.children.push(forked);
            return forked;
        };
        return TestGroup;
    }());
    exports.TestGroup = TestGroup;
});
define("util/IWriteable", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
});
define("reporter/util/stringifyHostValue", ["require", "exports", "chalk"], function (require, exports, chalk_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_1 = __importDefault(chalk_1);
    var StringifyHostValueContext = /** @class */ (function () {
        function StringifyHostValueContext(indent, maxPropertyCount, tab) {
            if (indent === void 0) { indent = 0; }
            if (maxPropertyCount === void 0) { maxPropertyCount = 50; }
            if (tab === void 0) { tab = 4; }
            this.indent = indent;
            this.maxPropertyCount = maxPropertyCount;
            this.tab = tab;
            this.level = 0;
            this.impliedTypeInfo = false;
            this.keywordColor = function (input) { return chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{yellow ", "}"], ["{yellow ", "}"])), input); };
            this.stringColor = function (input) { return chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{cyan ", "}"], ["{cyan ", "}"])), input); };
            this.classNameColor = function (input) { return chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{white ", "}"], ["{white ", "}"])), input); };
            this.numberColor = function (input) { return chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{green ", "}"], ["{green ", "}"])), input); };
        }
        return StringifyHostValueContext;
    }());
    function stringifyHostValue(hostValue, indent) {
        return formatters[formatterIndexFor(hostValue.type, 0 /* Expanded */)](hostValue, new StringifyHostValueContext(indent));
    }
    exports.stringifyHostValue = stringifyHostValue;
    var formatters = [];
    var emptyFormatter = function () { return ""; };
    for (var i = 0; i < 14 * 4; i++)
        formatters.push(emptyFormatter);
    var formatterIndexFor = function (valueType, type) { return valueType * 4 + type; };
    var falsyFormatter = function (hostValue) { return (hostValue.negated ? "Not " : "") + "Falsy"; };
    formatters[formatterIndexFor(14 /* Falsy */, 0 /* Expanded */)] = falsyFormatter;
    var truthyFormatter = function (hostValue) { return (hostValue.negated ? "Not " : "") + "Truthy"; };
    formatters[formatterIndexFor(13 /* Truthy */, 0 /* Expanded */)] = truthyFormatter;
    var finiteFormatter = function (hostValue) { return (hostValue.negated ? "Not " : "") + "Finite"; };
    formatters[formatterIndexFor(12 /* Finite */, 0 /* Expanded */)] = finiteFormatter;
    function displayBooleanNoSpacing(hostValue, ctx) {
        return ctx.keywordColor(hostValue.value === 1 ? "true" : "false");
    }
    function displayBooleanWithSpacing(hostValue, ctx) {
        return " ".repeat(ctx.indent + ctx.tab * ctx.level) + ctx.keywordColor(hostValue.value === 1 ? "true" : "false");
    }
    // Booleans
    formatters[formatterIndexFor(9 /* Boolean */, 0 /* Expanded */)] = displayBooleanWithSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 1 /* Inline */)] = displayBooleanNoSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 2 /* Key */)] = displayBooleanWithSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 3 /* Value */)] = displayBooleanNoSpacing;
    function displayClassNoSpacing(hostValue, ctx) {
        return ctx.classNameColor("[" + hostValue.typeName + "]");
    }
    function displayNumberWithSpacing(hostValue, ctx) {
        if (ctx.impliedTypeInfo || hostValue.typeName === "i32" || hostValue.typeName === "f64") {
            return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.numberColor(hostValue.value.toString());
        }
        return " ".repeat(ctx.indent + ctx.level * ctx.tab) + (ctx.numberColor(hostValue.value.toString()) + " " + ctx.keywordColor("as") + " " + ctx.classNameColor(hostValue.typeName));
    }
    function displayNumberNoSpacing(hostValue, ctx) {
        if (ctx.impliedTypeInfo || hostValue.typeName === "i32" || hostValue.typeName === "f64") {
            return ctx.numberColor(hostValue.value.toString());
        }
        return ctx.numberColor(hostValue.value.toString()) + " " + ctx.classNameColor("as " + hostValue.typeName);
    }
    // Floats
    formatters[formatterIndexFor(8 /* Float */, 0 /* Expanded */)] = displayNumberWithSpacing;
    formatters[formatterIndexFor(8 /* Float */, 1 /* Inline */)] = displayNumberNoSpacing;
    formatters[formatterIndexFor(8 /* Float */, 2 /* Key */)] = displayNumberWithSpacing;
    formatters[formatterIndexFor(8 /* Float */, 3 /* Value */)] = displayNumberNoSpacing;
    // Integers
    formatters[formatterIndexFor(7 /* Integer */, 0 /* Expanded */)] = displayNumberWithSpacing;
    formatters[formatterIndexFor(7 /* Integer */, 1 /* Inline */)] = displayNumberNoSpacing;
    formatters[formatterIndexFor(7 /* Integer */, 2 /* Key */)] = displayNumberWithSpacing;
    formatters[formatterIndexFor(7 /* Integer */, 3 /* Value */)] = displayNumberNoSpacing;
    function displayStringNoSpacing(hostValue, ctx) {
        return ctx.stringColor("\"" + hostValue.value.toString().replace(/"/g, '\\"') + "\"");
    }
    function displayStringWithSpacing(hostValue, ctx) {
        return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.stringColor("\"" + hostValue.value.toString().replace(/"/g, '\\"') + "\"");
    }
    function displayNoQuoteStringWithSpacing(hostValue, ctx) {
        return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.stringColor("" + hostValue.value.toString().replace(/"/g, '\\"'));
    }
    // Strings
    formatters[formatterIndexFor(2 /* String */, 0 /* Expanded */)] = displayStringWithSpacing;
    formatters[formatterIndexFor(2 /* String */, 1 /* Inline */)] = displayStringNoSpacing;
    formatters[formatterIndexFor(2 /* String */, 2 /* Key */)] = displayNoQuoteStringWithSpacing;
    formatters[formatterIndexFor(2 /* String */, 3 /* Value */)] = displayStringNoSpacing;
    function displayFunctionExpanded(hostValue, ctx) {
        return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.classNameColor("[Function " + hostValue.pointer + ": " + hostValue.value.toString() + "]");
    }
    var displayFuncNoNameNoPointer = function (_, ctx) { return ctx.classNameColor("[Function]"); };
    function displayFunctionKey(_, ctx) {
        return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.classNameColor("[Function]");
    }
    function displayFunctionValue(hostValue, ctx) {
        return ctx.classNameColor("[Function " + hostValue.pointer + ": " + hostValue.value.toString() + "]");
    }
    // Functions
    formatters[formatterIndexFor(6 /* Function */, 0 /* Expanded */)] = displayFunctionExpanded;
    formatters[formatterIndexFor(6 /* Function */, 1 /* Inline */)] = displayFuncNoNameNoPointer;
    formatters[formatterIndexFor(6 /* Function */, 2 /* Key */)] = displayFunctionKey;
    formatters[formatterIndexFor(6 /* Function */, 3 /* Value */)] = displayFunctionValue;
    function displayClassExpanded(hostValue, ctx) {
        var spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
        var previousImpliedTypeInfo = ctx.impliedTypeInfo;
        ctx.impliedTypeInfo = false;
        if (hostValue.isNull) {
            if (previousImpliedTypeInfo)
                return spacing + "null";
            return "" + spacing + ctx.classNameColor("<" + hostValue.typeName + ">") + " null";
        }
        var body = "\n";
        ctx.level += 1;
        var length = Math.min(hostValue.keys.length, ctx.maxPropertyCount);
        for (var i = 0; i < length; i++) {
            var key = hostValue.keys[i];
            var keyString = formatters[formatterIndexFor(key.type, 2 /* Key */)](key, ctx);
            var value = hostValue.values[i];
            var valueString = ctx.level < 5
                // render expanded value, but trim the whitespace on the left side
                ? formatters[formatterIndexFor(value.type, 0 /* Expanded */)](value, ctx)
                    .trimLeft()
                // render value
                : formatters[formatterIndexFor(value.type, 3 /* Value */)](value, ctx);
            if (i === (length - 1)) {
                // remove last trailing comma
                body += keyString + ": " + valueString + "\n";
            }
            else {
                body += keyString + ": " + valueString + ",\n";
            }
        }
        if (length > ctx.maxPropertyCount)
            body += spacing + "... +" + (length - ctx.maxPropertyCount) + " properties";
        ctx.level -= 1;
        ctx.impliedTypeInfo = previousImpliedTypeInfo;
        if (previousImpliedTypeInfo)
            return spacing + "{" + body + spacing + "}";
        return "" + spacing + ctx.classNameColor("" + hostValue.typeName) + " {" + body + spacing + "}";
    }
    function displayClassWithSpacing(hostValue, ctx) {
        return "" + " ".repeat(ctx.level * ctx.tab + ctx.indent) + ctx.classNameColor("[" + hostValue.typeName + "]");
    }
    // Classes
    formatters[formatterIndexFor(1 /* Class */, 0 /* Expanded */)] = displayClassExpanded;
    formatters[formatterIndexFor(1 /* Class */, 1 /* Inline */)] = displayClassNoSpacing;
    formatters[formatterIndexFor(1 /* Class */, 2 /* Key */)] = displayClassWithSpacing;
    formatters[formatterIndexFor(1 /* Class */, 3 /* Value */)] = displayClassExpanded;
    function displayArrayExpanded(hostValue, ctx) {
        var spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
        var previousImpliedTypeInfo = ctx.impliedTypeInfo;
        ctx.impliedTypeInfo = true;
        if (ctx.level < 5 && hostValue.type === 10 /* Array */) {
            var body = "\n";
            ctx.level += 1;
            var length_1 = Math.min(hostValue.values.length, ctx.maxPropertyCount);
            for (var i = 0; i < length_1; i++) {
                var value = hostValue.values[i];
                // render expanded value, but trim the whitespace on the left side
                var valueString = formatters[formatterIndexFor(value.type, 0 /* Expanded */)](value, ctx);
                if (i === (length_1 - 1)) {
                    // remove trailing comma
                    body += valueString + "\n";
                }
                else {
                    body += valueString + ",\n";
                }
            }
            if (length_1 > ctx.maxPropertyCount)
                body += spacing + "... +" + (length_1 - ctx.maxPropertyCount) + " values";
            ctx.level -= 1;
            ctx.impliedTypeInfo = previousImpliedTypeInfo;
            if (previousImpliedTypeInfo)
                return spacing + "[" + body + spacing + "]";
            return "" + spacing + ctx.classNameColor("" + hostValue.typeName) + " [" + body + spacing + "]";
        }
        else {
            var body = spacing;
            if (!previousImpliedTypeInfo)
                body += ctx.classNameColor(hostValue.typeName) + " ";
            body += "[";
            var i = 0;
            var length_2 = hostValue.values.length;
            for (; i < length_2; i++) {
                var value = hostValue.values[i];
                var result = formatters[formatterIndexFor(value.type, 1 /* Inline */)](value, ctx) + ", ";
                if (body.length > 80) {
                    break;
                }
                body += result;
            }
            if ((length_2 - i) > 0)
                body += "... +" + (length_2 - i) + " items";
            body += "]";
            ctx.impliedTypeInfo = previousImpliedTypeInfo;
            // render value
            return body;
        }
    }
    // Array
    formatters[formatterIndexFor(10 /* Array */, 0 /* Expanded */)] = displayArrayExpanded;
    formatters[formatterIndexFor(10 /* Array */, 1 /* Inline */)] = displayArrayExpanded;
    formatters[formatterIndexFor(10 /* Array */, 2 /* Key */)] = displayClassWithSpacing;
    formatters[formatterIndexFor(10 /* Array */, 3 /* Value */)] = displayArrayExpanded;
    // ArrayBuffer
    formatters[formatterIndexFor(3 /* ArrayBuffer */, 0 /* Expanded */)] = displayArrayExpanded;
    formatters[formatterIndexFor(3 /* ArrayBuffer */, 1 /* Inline */)] = displayArrayExpanded;
    formatters[formatterIndexFor(3 /* ArrayBuffer */, 2 /* Key */)] = displayClassWithSpacing;
    formatters[formatterIndexFor(3 /* ArrayBuffer */, 3 /* Value */)] = displayArrayExpanded;
    // TypedArray
    formatters[formatterIndexFor(11 /* TypedArray */, 0 /* Expanded */)] = displayArrayExpanded;
    formatters[formatterIndexFor(11 /* TypedArray */, 1 /* Inline */)] = displayArrayExpanded;
    formatters[formatterIndexFor(11 /* TypedArray */, 2 /* Key */)] = displayClassWithSpacing;
    formatters[formatterIndexFor(11 /* TypedArray */, 3 /* Value */)] = displayArrayExpanded;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4;
});
define("reporter/VerboseReporter", ["require", "exports", "test/TestReporter", "reporter/util/stringifyHostValue"], function (require, exports, TestReporter_1, stringifyHostValue_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This weakmap is used to keep track of which logs have already been printed, and from what index.
     */
    var groupLogIndex = new WeakMap();
    /**
     * This is the default test reporter class for the `asp` command line application. It will pipe
     * all relevant details about each tests to the `stdout` WriteStream.
     */
    var VerboseReporter = /** @class */ (function (_super) {
        __extends(VerboseReporter, _super);
        function VerboseReporter(_options) {
            var _this = _super.call(this) || this;
            _this.stdout = null;
            return _this;
        }
        /**
         * This method reports a starting TestContext. This method can be called many times, but may
         * be instantiated once
         *
         * @param {TestContext} suite - The test context being started.
         */
        VerboseReporter.prototype.onStart = function (suite) {
            this.stdout = suite.stdout || process.stdout;
        };
        /**
         * This method reports a TestGroup is starting.
         *
         * @param {TestGroup} group - The started test group.
         */
        VerboseReporter.prototype.onGroupStart = function (group) {
            if (group.tests.length === 0)
                return;
            var chalk = require("chalk");
            if (group.name)
                this.stdout.write(chalk(templateObject_5 || (templateObject_5 = __makeTemplateObject(["[Describe]: ", "\n\n"], ["[Describe]: ", "\\n\\n"])), group.name));
            for (var _i = 0, _a = group.logs; _i < _a.length; _i++) {
                var logValue = _a[_i];
                this.onLog(logValue);
            }
            groupLogIndex.set(group, group.logs.length);
        };
        /**
         * This method reports a completed TestGroup.
         *
         * @param {TestGroup} group - The finished TestGroup.
         */
        VerboseReporter.prototype.onGroupFinish = function (group) {
            if (group.tests.length === 0)
                return;
            this.stdout.write("\n");
        };
        /** This method is a stub for onTestStart(). */
        VerboseReporter.prototype.onTestStart = function (_group, _test) { };
        /**
         * This method reports a completed test.
         *
         * @param {TestGroup} _group - The TestGroup that the TestResult belongs to.
         * @param {TestResult} test - The finished TestResult
         */
        VerboseReporter.prototype.onTestFinish = function (_group, test) {
            var chalk = require("chalk");
            if (test.pass) {
                var rtraceDelta = test.rtraceDelta === 0
                    ? ""
                    : chalk(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                        "}"])), (test.rtraceDelta > 0 ? "+" : "-") +
                        test.rtraceDelta.toString());
                this.stdout.write(test.negated
                    ? chalk(templateObject_7 || (templateObject_7 = __makeTemplateObject([" {green  [Throws]: \u2714} ", " ", "\n"], [" {green  [Throws]: \u2714} ", " ", "\\n"])), test.name, rtraceDelta) : chalk(templateObject_8 || (templateObject_8 = __makeTemplateObject([" {green [Success]: \u2714} ", " ", "\n"], [" {green [Success]: \u2714} ", " ", "\\n"])), test.name, rtraceDelta));
            }
            else {
                this.stdout.write(chalk(templateObject_9 || (templateObject_9 = __makeTemplateObject(["    {red [Fail]: \u2716} ", "\n"], ["    {red [Fail]: \u2716} ", "\\n"])), test.name));
                if (!test.negated) {
                    this.stdout.write("  [Actual]: " + stringifyHostValue_1.stringifyHostValue(test.actual, 2) + "\n[Expected]: " + stringifyHostValue_1.stringifyHostValue(test.expected, 2) + "\n");
                }
                if (test.message) {
                    this.stdout.write(chalk(templateObject_10 || (templateObject_10 = __makeTemplateObject([" [Message]: {yellow ", "}\n"], [" [Message]: {yellow ", "}\\n"])), test.message));
                }
                if (test.stack) {
                    this.stdout.write("   [Stack]: " + test.stack.split("\n").join("\n           ") + "\n");
                }
            }
            /** If performance mode was enabled for this test, report the statistics. */
            if (test.performance) {
                this.stdout.write(chalk(templateObject_11 || (templateObject_11 = __makeTemplateObject([" {yellow [Samples]}: ", " runs\n"], [" {yellow [Samples]}: ", " runs\\n"])), test.times.length.toString()));
                if (test.hasAverage) {
                    this.stdout.write(chalk(templateObject_12 || (templateObject_12 = __makeTemplateObject(["    {yellow [Mean]}: ", "ms\n"], ["    {yellow [Mean]}: ", "ms\\n"])), test.average.toString()));
                }
                if (test.hasMedian) {
                    this.stdout.write(chalk(templateObject_13 || (templateObject_13 = __makeTemplateObject(["  {yellow [Median]}: ", "ms\n"], ["  {yellow [Median]}: ", "ms\\n"])), test.median.toString()));
                }
                if (test.hasVariance) {
                    this.stdout.write(chalk(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{yellow [Variance]}: ", "ms\n"], ["{yellow [Variance]}: ", "ms\\n"])), test.variance.toString()));
                }
                if (test.hasStdDev) {
                    this.stdout.write(chalk(templateObject_15 || (templateObject_15 = __makeTemplateObject(["  {yellow [StdDev]}: ", "ms\n"], ["  {yellow [StdDev]}: ", "ms\\n"])), test.stdDev.toString()));
                }
                if (test.hasMax) {
                    this.stdout.write(chalk(templateObject_16 || (templateObject_16 = __makeTemplateObject(["     {yellow [Max]}: ", "ms\n"], ["     {yellow [Max]}: ", "ms\\n"])), test.max.toString()));
                }
                if (test.hasMin) {
                    this.stdout.write(chalk(templateObject_17 || (templateObject_17 = __makeTemplateObject(["     {yellow [Min]}: ", "ms\n"], ["     {yellow [Min]}: ", "ms\\n"])), test.min.toString()));
                }
            }
            else {
                /** Log the values to stdout if this was a typical test. */
                for (var _i = 0, _a = test.logs; _i < _a.length; _i++) {
                    var logValue = _a[_i];
                    this.onLog(logValue);
                }
            }
        };
        /**
         * This method reports that a TestContext has finished.
         *
         * @param {TestContext} suite - The finished test context.
         */
        VerboseReporter.prototype.onFinish = function (suite) {
            if (suite.testGroups.length === 0)
                return;
            var chalk = require("chalk");
            var result = suite.pass ? chalk(templateObject_18 || (templateObject_18 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk(templateObject_19 || (templateObject_19 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
            var count = suite.testGroups
                .map(function (e) { return e.tests.length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var successCount = suite.testGroups
                .map(function (e) { return e.tests.filter(function (f) { return f.pass; }).length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var fail = count === successCount
                ? "0 fail"
                : chalk(templateObject_20 || (templateObject_20 = __makeTemplateObject(["{red ", " fail}"], ["{red ", " fail}"])), (count - successCount).toString());
            var rtcount = suite.allocationCount - suite.freeCount;
            var rtraceDelta = rtcount === 0
                ? ""
                : chalk(templateObject_21 || (templateObject_21 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                    "}"])), (rtcount > 0 ? "+" : "-") +
                    rtcount.toString());
            for (var _i = 0, _a = suite.warnings; _i < _a.length; _i++) {
                var warning = _a[_i];
                this.stdout.write(chalk(templateObject_22 || (templateObject_22 = __makeTemplateObject(["\n{yellow  [Warning]}: ", " ", ""], ["\\n{yellow  [Warning]}: ", " ", ""])), warning.type, warning.message));
                this.stdout.write(chalk(templateObject_23 || (templateObject_23 = __makeTemplateObject(["\n{yellow    [Stack]}: {yellow ", "}\n"], ["\\n{yellow    [Stack]}: {yellow ",
                    "}\\n"])), warning.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            for (var _b = 0, _c = suite.errors; _b < _c.length; _b++) {
                var error = _c[_b];
                this.stdout.write(chalk(templateObject_24 || (templateObject_24 = __makeTemplateObject(["\n{red    [Error]}: ", " ", ""], ["\\n{red    [Error]}: ", " ", ""])), error.type, error.message));
                this.stdout.write(chalk(templateObject_25 || (templateObject_25 = __makeTemplateObject(["\n{red    [Stack]}: {yellow ", "}\n"], ["\\n{red    [Stack]}: {yellow ",
                    "}\\n"])), error.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            this.stdout.write(chalk(templateObject_26 || (templateObject_26 = __makeTemplateObject(["", "\n\n    [File]: ", " ", "\n  [Groups]: {green ", " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n\n"], ["",
                "\n\n    [File]: ", " ", "\n  [Groups]: {green ",
                " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\\n\\n"])), process.stdout.columns
                ? "~".repeat(Math.max(process.stdout.columns - 10, 10))
                : "~".repeat(80), suite.fileName, rtraceDelta, suite.testGroups
                .filter(function (e) { return e.pass; })
                .length.toString(), suite.testGroups.length.toString(), result, successCount.toString(), fail, count.toString(), suite.startupTime.toString(), suite.time.toString()));
        };
        /**
         * This method reports a todo to stdout.
         *
         * @param {TestGroup} _group - The test group the todo belongs to.
         * @param {string} todo - The todo.
         */
        VerboseReporter.prototype.onTodo = function (_group, todo) {
            var chalk = require("chalk");
            this.stdout.write(chalk(templateObject_27 || (templateObject_27 = __makeTemplateObject(["    {yellow [Todo]:} ", "\n"], ["    {yellow [Todo]:} ", "\\n"])), todo));
        };
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {HostValue} logValue - A value to be logged to the console
         */
        VerboseReporter.prototype.onLog = function (logValue) {
            var chalk = require("chalk");
            var output = stringifyHostValue_1.stringifyHostValue(logValue, 12).trimLeft();
            this.stdout.write(chalk(templateObject_28 || (templateObject_28 = __makeTemplateObject(["     {yellow [Log]:} ", "\n"], ["     {yellow [Log]:} ", "\\n"])), output));
            this.stdout.write(chalk(templateObject_29 || (templateObject_29 = __makeTemplateObject(["   {yellow [Stack]:} ", "\n"], ["   {yellow [Stack]:} ",
                "\\n"])), logValue.stack.split("\n")
                .join("\n             ")).trimLeft());
        };
        return VerboseReporter;
    }(TestReporter_1.TestReporter));
    exports.default = VerboseReporter;
    var templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28, templateObject_29;
});
define("util/timeDifference", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * @ignore
     * This method calculates the start and end time difference, rounding off to the nearest thousandth
     * of a millisecond.
     *
     * @param {number} end - The end time.
     * @param {number} start - The start time.
     * @returns {number} - The difference of the two times rounded to the nearest three decimal places.
     */
    exports.timeDifference = function (end, start) {
        return Math.round((end - start) * 1000) / 1000;
    };
});
define("util/IAspectExports", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
});
define("util/IPerformanceConfiguration", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /** This method creates a default performance configuration. */
    function createDefaultPerformanceConfiguration() {
        return {
            /** Enable performance statistics gathering for each test. */
            enabled: false,
            /** Set the maximum number of samples to run for each test. */
            maxSamples: 10000,
            /** Set the maximum test run time in milliseconds. */
            maxTestRunTime: 2000,
            /** Set the number of decimal places to round to. */
            roundDecimalPlaces: 3,
            /** Report the median time in the default reporter. */
            reportMedian: true,
            /** Report the average time in milliseconds. */
            reportAverage: true,
            /** Report the standard deviation. */
            reportStandardDeviation: false,
            /** Report the maximum run time in milliseconds. */
            reportMax: false,
            /** Report the minimum run time in milliseconds. */
            reportMin: false,
            /** Report the variance/ */
            reportVariance: false,
        };
    }
    exports.createDefaultPerformanceConfiguration = createDefaultPerformanceConfiguration;
});
define("util/wasmTools", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * A Buffer for reading wasm sections.
     */
    var WasmBuffer = /** @class */ (function () {
        function WasmBuffer(u8array) {
            this.u8array = u8array;
            /** Current offset in the buffer. */
            this.off = 0;
        }
        /** Read 128LEB unsigned integers. */
        WasmBuffer.prototype.readVaruint = function (off) {
            if (off === void 0) { off = this.off; }
            var val = 0;
            var shl = 0;
            var byt;
            var pos = off;
            do {
                byt = this.u8array[pos++];
                val |= (byt & 0x7f) << shl;
                if (!(byt & 0x80))
                    break;
                shl += 7;
            } while (true);
            this.off = pos;
            return val;
        };
        /**
         * Read a UTF8 string from the buffer either at the current offset or one passed in.
         * Updates the offset of the buffer.
         */
        WasmBuffer.prototype.readString = function (off) {
            if (off === void 0) { off = this.off; }
            var name_len = this.readVaruint(off);
            this.off += name_len;
            //@ts-ignore
            return String.fromCharCodes(this.u8array.slice(this.off - name_len, this.off));
        };
        /** Read a string at an offset without changing the buffere's offset. */
        WasmBuffer.prototype.peekString = function (off) {
            var old_off = this.off;
            var str = this.readString(off);
            this.off = old_off;
            return str;
        };
        return WasmBuffer;
    }());
    exports.WasmBuffer = WasmBuffer;
    /**
     * Utility class for reading the name sections of a wasm binary.
     * See https://github.com/WebAssembly/design/blob/master/BinaryEncoding.md#name-section
     */
    var NameSection = /** @class */ (function () {
        function NameSection(contents) {
            /** map of indexs to UTF8 pointers. */
            this.funcNames = new Map();
            var mod = new WebAssembly.Module(contents);
            var section = WebAssembly.Module.customSections(mod, "name")[0];
            this.section = new WasmBuffer(new Uint8Array(section));
            this.parseSection();
        }
        NameSection.prototype.fromIndex = function (i) {
            var ptr = this.funcNames.get(i);
            if (!ptr)
                return "Function " + i;
            return this.section.peekString(ptr);
        };
        /** Parses */
        NameSection.prototype.parseSection = function () {
            var off = this.off;
            var kind = this.readVaruint();
            if (kind != 1) {
                this.off = off;
                return;
            }
            var end = this.readVaruint() + this.off;
            var count = this.readVaruint();
            var numRead = 0;
            while (numRead < count && this.off < end) {
                var index = this.readVaruint();
                this.funcNames.set(index, this.off);
                var len = this.readVaruint();
                this.off += len;
                numRead++;
            }
        };
        Object.defineProperty(NameSection.prototype, "off", {
            /** Current offset */
            get: function () {
                return this.section.off;
            },
            /** Update offset */
            set: function (o) {
                this.section.off = o;
            },
            enumerable: true,
            configurable: true
        });
        /** Reads a 128LEB  unsigned integer and updates the offset. */
        NameSection.prototype.readVaruint = function (off) {
            if (off === void 0) { off = this.off; }
            return this.section.readVaruint(off);
        };
        return NameSection;
    }());
    exports.NameSection = NameSection;
});
define("test/TestCollector", ["require", "exports", "test/TestGroup", "util/IPerformanceConfiguration", "test/TestResult", "long", "util/wasmTools", "util/HostValue"], function (require, exports, TestGroup_1, IPerformanceConfiguration_1, TestResult_1, long_1, wasmTools_1, HostValue_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    long_1 = __importDefault(long_1);
    /**
     * @ignore
     * This function is a filter for stack trace lines.
     *
     * @param {string} input - The stack trace line.
     */
    var wasmFilter = function (input) { return /wasm-function/i.test(input); };
    /**
     * @ignore
     * This is an internal class that is responsible for collecting all the tests in a test binary.
     */
    var TestCollector = /** @class */ (function () {
        function TestCollector(props) {
            this.wasm = null;
            this.nameSection = null;
            // test group values
            this.groupStack = [new TestGroup_1.TestGroup()];
            /** A collection of `TestGroup` objects that ran tests after `testContext.run(wasm)` was called. */
            this.testGroups = [];
            /** The root `TestGroup` object. */
            this.topLevelGroup = null;
            this.logTarget = this.groupStack[0];
            /** A set of errors that were collected during the testing process. */
            this.errors = [];
            /** A set of warnings that were collected during the testing process. */
            this.warnings = [];
            /** The name of the AssemblyScript test file. */
            this.fileName = "";
            // test state machine values
            this.stack = "";
            this.message = "";
            this.actual = null;
            this.expected = null;
            // partial performance configuration
            this.performanceConfiguration = IPerformanceConfiguration_1.createDefaultPerformanceConfiguration();
            /**
             * This value is used to detect if an `expect()` function call was used outside of a test
             * function. If a reportExpected or reportActual function is called before the `context.run()`
             * method is called, it should prevent the `run()` method from running the tests and report a
             * failure.
             */
            this.ready = false;
            /**
             * These are the test and group filters for the binary. They must be provided before collection
             * begins.
             */
            this.testRegex = new RegExp("");
            this.groupRegex = new RegExp("");
            /**
             * RTrace is a funciton that helps with debugging reference counting and can be used to find
             * leaks. If it is enabled, it will be included automatically by the bootstrap in the
             * assemblyscript imports.
             */
            this.rtraceEnabled = true;
            /**
             * A collection of host values used to help cache and aid in the creation
             * of nested host values.
             */
            this.hostValueCache = [];
            // This map collects the starting values for the labels created by `RTrace.start()`
            this.rtraceLabels = new Map();
            /**
             * This is the current number of net allocations that occurred during `TestContext` execution.
             */
            this.allocationCount = 0;
            /**
             * This is the current number of net allocations that occured during `TestGroup` execution.
             */
            this.groupAllocationCount = 0;
            /**
             * This is the current number of net allocations that occured during `TestResult` execution.
             */
            this.testAllocationCount = 0;
            /**
             * This is the current number of net dellocations that occurred during `TestContext` execution.
             */
            this.freeCount = 0;
            /**
             * This is the current number of net allocations that occured during `TestGroup` execution.
             */
            this.groupFreeCount = 0;
            /**
             * This is the current number of net allocations that occured during `TestGroup` execution.
             */
            this.testFreeCount = 0;
            /**
             * This is the current number of net increments that occurred during `TestContext` execution.
             */
            this.incrementCount = 0;
            /**
             * This is the current number of net increments that occurred during `TestGroup` execution.
             */
            this.groupIncrementCount = 0;
            /**
             * This is the current number of net increments that occurred during `TestResult` execution.
             */
            this.testIncrementCount = 0;
            /**
             * This is the current number of net decrements that occurred during `TestContext` execution.
             */
            this.decrementCount = 0;
            /**
             * This is the current number of net decrements that occurred during `TestGroup` execution.
             */
            this.groupDecrementCount = 0;
            /**
             * This is the current number of net decrements that occurred during `TestResult` execution.
             */
            this.testDecrementCount = 0;
            /**
             * This is the current number of net reallocations during the `TestContext` execution.
             */
            this.reallocationCount = 0;
            /**
             * This is the current number of net reallocations during the `TestGroup` execution.
             */
            this.groupReallocationCount = 0;
            /**
             * This is the current number of net reallocations during the `TestResult` execution.
             */
            this.testReallocationCount = 0;
            /**
             * This map is responsible for keeping track of which blocks are currently allocated by their id.
             */
            this.blocks = new Map();
            /**
             * This set contains all the blocks currently allocated for the current test.
             */
            this.testBlocks = new Set();
            /**
             * This set contains all the blocks currently allocated for the current group.
             */
            this.groupBlocks = new Set();
            /* istanbul ignore next */
            if (props) {
                /* istanbul ignore next */
                if (props.fileName)
                    this.fileName = props.fileName;
                /* istanbul ignore next */
                if (props.testRegex)
                    this.testRegex = props.testRegex;
                /* istanbul ignore next */
                if (props.groupRegex)
                    this.groupRegex = props.groupRegex;
                /* istanbul ignore next */
                if (props.performanceConfiguration)
                    this.performanceConfiguration = props.performanceConfiguration;
                if (this.performanceConfiguration.maxSamples != null) {
                    if (this.performanceConfiguration.maxSamples >
                        10000 /* MaxSamples */) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: maxSamples exceeds " +
                                10000 /* MaxSamples */,
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                    if (this.performanceConfiguration.maxSamples < 0) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: maxSamples less than 0.",
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                }
                if (this.performanceConfiguration.maxTestRunTime != null) {
                    if (this.performanceConfiguration.maxTestRunTime >
                        5000 /* MaxTestRuntime */) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: maxTestRunTime exceeds " +
                                5000 /* MaxTestRuntime */,
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                    if (this.performanceConfiguration.maxTestRunTime < 0) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: maxTestRunTime less than 0.",
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                }
                if (this.performanceConfiguration.roundDecimalPlaces != null) {
                    if (this.performanceConfiguration.roundDecimalPlaces >
                        8 /* MaximumDecimalPlaces */) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: roundDecimalPlaces exceeds " +
                                8 /* MaximumDecimalPlaces */,
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                    if (this.performanceConfiguration.roundDecimalPlaces <
                        0 /* MinimumDecimalPlaces */) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: roundDecimalPlaces less than " +
                                0 /* MinimumDecimalPlaces */,
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                }
                /* istanbul ignore next */
                if (props.nortrace)
                    this.rtraceEnabled = false;
                /* istanbul ignore next */
                if (props.binary)
                    this.nameSection = new wasmTools_1.NameSection(props.binary);
            }
        }
        /**
         * Call this method to start the `__main()` method provided by the `as-pect` exports to start the
         * process of test collection.
         */
        TestCollector.prototype.collectTests = function () {
            var _a;
            // reset the performance values first, then collect the tests by calling `__main()`
            this.resetPerformanceValues();
            /**
             * In version >0.8.1 of assemblyscript, there was a __start function refactor that helped
             * conform assemblyscript to the wasi standard. The following line is used for backwards
             * compatibility to older versions of assemblyscript. Coverage is ignored because one branch
             * is impossible to test using assemblyscript latest.
             */
            /* istanbul ignore next */
            var startFunc = (_a = this.wasm.__start, (_a !== null && _a !== void 0 ? _a : this.wasm._start));
            startFunc();
            this.wasm.__ready();
            var topLevelGroup = this.groupStack[0];
            topLevelGroup.willRun = this.groupRegex.test(topLevelGroup.name);
            this.reportEndDescribe();
            this.topLevelGroup = topLevelGroup;
            /* istanbul ignore next */
            if (!topLevelGroup || this.groupStack.length > 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Invalid TestContext state after test collection.",
                    stackTrace: this.getLogStackTrace(),
                    type: "InvalidTestContextState",
                });
            }
        };
        /**
         * This method creates a WebAssembly imports object with all the TestContext functions
         * bound to the TestContext.
         *
         * @param {any[]} imports - Every import item specified.
         */
        TestCollector.prototype.createImports = function () {
            var _this = this;
            var imports = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                imports[_i] = arguments[_i];
            }
            var result = Object.assign.apply(Object, __spreadArrays([{}], imports, [// get all the user defined imports
                {
                    __aspect: {
                        clearActual: this.clearActual.bind(this),
                        clearExpected: this.clearExpected.bind(this),
                        createHostValue: this.createHostValue.bind(this),
                        debug: this.debug.bind(this),
                        endRTrace: this.endRTrace.bind(this),
                        getRTraceAllocations: this.getRTraceAllocations.bind(this),
                        getRTraceBlocks: this.getRTraceBlocks.bind(this),
                        getRTraceCount: this.getRTraceCount.bind(this),
                        getRTraceDecrements: this.getRTraceDecrements.bind(this),
                        getRTraceFrees: this.getRTraceFrees.bind(this),
                        getRTraceGroupAllocations: this.getRTraceGroupAllocations.bind(this),
                        getRTraceGroupBlocks: this.getRTraceGroupBlocks.bind(this),
                        getRTraceGroupDecrements: this.getRTraceGroupDecrements.bind(this),
                        getRTraceGroupFrees: this.getRTraceGroupFrees.bind(this),
                        getRTraceGroupIncrements: this.getRTraceGroupIncrements.bind(this),
                        getRTraceGroupReallocs: this.getRTraceGroupReallocs.bind(this),
                        getRTraceIncrements: this.getRTraceIncrements.bind(this),
                        getRTraceReallocs: this.getRTraceReallocs.bind(this),
                        getRTraceTestAllocations: this.getRTraceTestAllocations.bind(this),
                        getRTraceTestBlocks: this.getRTraceTestBlocks.bind(this),
                        getRTraceTestDecrements: this.getRTraceTestDecrements.bind(this),
                        getRTraceTestFrees: this.getRTraceTestFrees.bind(this),
                        getRTraceTestIncrements: this.getRTraceTestIncrements.bind(this),
                        getRTraceTestReallocs: this.getRTraceTestReallocs.bind(this),
                        logHostValue: this.logHostValue.bind(this),
                        maxSamples: this.maxSamples.bind(this),
                        maxTestRunTime: this.maxTestRunTime.bind(this),
                        performanceEnabled: this.performanceEnabled.bind(this),
                        pushHostObjectKey: this.pushHostObjectKey.bind(this),
                        pushHostObjectValue: this.pushHostObjectValue.bind(this),
                        reportActualHostValue: this.reportActualHostValue.bind(this),
                        reportAfterAll: this.reportAfterAll.bind(this),
                        reportAfterEach: this.reportAfterEach.bind(this),
                        reportAverage: this.reportAverage.bind(this),
                        reportBeforeAll: this.reportBeforeAll.bind(this),
                        reportBeforeEach: this.reportBeforeEach.bind(this),
                        reportDescribe: this.reportDescribe.bind(this),
                        reportEndDescribe: this.reportEndDescribe.bind(this),
                        reportExpectedHostValue: this.reportExpectedHostValue.bind(this),
                        reportExpectedFalsy: this.reportExpectedFalsy.bind(this),
                        reportExpectedFinite: this.reportExpectedFinite.bind(this),
                        reportExpectedTruthy: this.reportExpectedTruthy.bind(this),
                        reportInvalidExpectCall: this.reportInvalidExpectCall.bind(this),
                        reportMax: this.reportMax.bind(this),
                        reportMedian: this.reportMedian.bind(this),
                        reportMin: this.reportMin.bind(this),
                        reportNegatedTest: this.reportNegatedTest.bind(this),
                        reportStdDev: this.reportStdDev.bind(this),
                        reportTest: this.reportTest.bind(this),
                        reportTodo: this.reportTodo.bind(this),
                        reportVariance: this.reportVariance.bind(this),
                        roundDecimalPlaces: this.roundDecimalPlaces.bind(this),
                        startRTrace: this.startRTrace.bind(this),
                        tryCall: this.tryCall.bind(this),
                    },
                }]));
            /** If RTrace is enabled, add it to the imports. */
            if (this.rtraceEnabled)
                result.rtrace = {
                    onalloc: this.onalloc.bind(this),
                    onfree: this.onfree.bind(this),
                    onincrement: this.onincrement.bind(this),
                    ondecrement: this.ondecrement.bind(this),
                    onrealloc: this.onrealloc.bind(this),
                };
            /** add an env object */
            result.env = result.env || {};
            /** Override the abort function */
            var previousAbort = result.env.abort || (function () { });
            result.env.abort = function () {
                var args = [];
                for (var _i = 0; _i < arguments.length; _i++) {
                    args[_i] = arguments[_i];
                }
                previousAbort.apply(void 0, args);
                // @ts-ignore
                _this.abort.apply(_this, args);
            };
            /** Override trace completely. */
            result.env.trace = this.trace.bind(this);
            return result;
        };
        /**
         * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
         */
        /* istanbul ignore next */
        TestCollector.prototype.debug = function () {
            /* istanbul ignore next */
            debugger;
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
        TestCollector.prototype.tryCall = function (pointer) {
            /** This is a safety net conditional, no reason to test it. */
            /* istanbul ignore next */
            if (pointer < 0)
                return 1;
            try {
                this.wasm.__call(pointer);
            }
            catch (ex) {
                this.stack = this.getErrorStackTrace(ex);
                return 0;
            }
            return 1;
        };
        /**
         * This web assembly linked function creates a test group. It's called when the test suite calls
         * the describe("test", callback) function from within AssemblyScript. It receives a pointer to
         * the description of the tests, forks the top level test group, pushes the suiteName to a list,
         * then pushes the forked group to the top of the test context stack.
         *
         * @param {number} suiteNamePointer
         */
        TestCollector.prototype.reportDescribe = function (suiteNamePointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            var nextGroup = group.fork();
            nextGroup.name =
                group.name +
                    this.getString(suiteNamePointer, "No describe() name provided.");
            nextGroup.willRun = this.groupRegex.test(nextGroup.name);
            this.groupStack.push(nextGroup);
            this.logTarget = nextGroup;
        };
        /**
         * This web assembly linked function finishes a test group. It's called when the test suite calls
         * the describe("test", callback) function from within AssemblyScript. It pops the current
         * test group from the test context stack and pushes it to the final test group list.
         */
        TestCollector.prototype.reportEndDescribe = function () {
            var next = this.groupStack.pop();
            var testCount = next.tests.length;
            /**
             * If a describe finishes first, it happens BEFORE other describes. This means
             * inner describe blocks run at lower priority than outer describe blocks. It also should be
             * pushed if it willRun.
             */
            if (next.willRun && testCount > 0) {
                this.testGroups.unshift(next);
            }
            this.logTarget = this.groupStack[this.groupStack.length - 1];
        };
        /**
         * This web assembly linked function sets the group's "beforeEach" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test.
         */
        TestCollector.prototype.reportBeforeEach = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.beforeEachPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function adds the group's "beforeAll" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test in the
         * current context.
         */
        TestCollector.prototype.reportBeforeAll = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.beforeAllPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function sets the group's "afterEach" callback pointer.
         *
         * @param {number} callbackPointer - The callback that should run before each test group.
         */
        TestCollector.prototype.reportAfterEach = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.afterEachPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function adds the group's "afterAll" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test in the
         * current context.
         */
        TestCollector.prototype.reportAfterAll = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.afterAllPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function creates a test from the callback and the testNamePointer in
         * the current group. It assumes that the group has already been created with the describe
         * function. It is called when `it("description", callback)` or `test("description", callback)`
         * is called.
         *
         * @param {number} testNamePointer - The test's name pointer.
         * @param {number} callback - The test's function.
         */
        TestCollector.prototype.reportTest = function (testNamePointer, callback) {
            var group = this.groupStack[this.groupStack.length - 1];
            /* istanbul ignore next */
            if (!group.willRun)
                return;
            var name = this.getString(testNamePointer, "No test() name provided.");
            /* istanbul ignore next */
            if (!this.testRegex.test(name))
                return;
            var test = new TestResult_1.TestResult();
            test.functionPointer = callback;
            test.name = name;
            test.message = "";
            test.negated = false;
            test.performance = this.performanceEnabledValue || false;
            if (test.performance) {
                test.maxSamples = !isFinite(this.maxSamplesValue)
                    ? 10000 /* MaxSamples */
                    : Math.min(this.maxSamplesValue, 10000 /* MaxSamples */);
                test.maxRuntime = !isFinite(this.maxTestRunTimeValue)
                    ? 5000 /* MaxTestRuntime */
                    : Math.min(this.maxTestRunTimeValue, 5000 /* MaxTestRuntime */);
                test.decimalPlaces = !isFinite(this.roundDecimalPlacesValue)
                    ? 3
                    : Math.max(Math.round(this.roundDecimalPlacesValue), 0 /* MinimumDecimalPlaces */);
                if (test.decimalPlaces > 8 /* MaximumDecimalPlaces */) {
                    test.decimalPlaces = 8 /* MaximumDecimalPlaces */;
                }
                test.calculateAverageValue = this.recordAverageValue || false;
                test.calculateMedianValue = this.recordMedianValue || false;
                test.calculateStandardDeviationValue = this.recordStdDevValue || false;
                test.calculateMaxValue = this.recordMaxValue || false;
                test.calculateMinValue = this.recordMinValue || false;
                test.calculateVarianceValue = this.recordVariance || false;
            }
            group.tests.push(test);
            this.resetPerformanceValues();
        };
        /**
         * This web assembly linked function is responsible for reporting tests that are expected
         * to fail. This is useful for verifying that specific application states will throw.
         *
         * @param {number} testNamePointer - The test's name pointer.
         * @param {number} callback - The test's function.
         * @param {number} message - The message associated with this test if it does not throw.
         */
        TestCollector.prototype.reportNegatedTest = function (testNamePointer, callback, message) {
            var group = this.groupStack[this.groupStack.length - 1];
            /* istanbul ignore next */
            if (!group.willRun)
                return;
            var name = this.getString(testNamePointer, "No test() name provided.");
            /* istanbul ignore next */
            if (!this.testRegex.test(name))
                return;
            var test = new TestResult_1.TestResult();
            test.functionPointer = callback;
            test.name = name;
            test.message = this.getString(message, "");
            test.negated = true;
            test.performance = this.performanceEnabledValue || false;
            /* istanbul ignore next */
            if (test.performance) {
                /* istanbul ignore next */
                test.maxSamples = !isFinite(this.maxSamplesValue)
                    ? 10000 /* MaxSamples */
                    : Math.min(this.maxSamplesValue, 10000 /* MaxSamples */);
                /* istanbul ignore next */
                test.maxRuntime = !isFinite(this.maxTestRunTimeValue)
                    ? 5000 /* MaxTestRuntime */
                    : Math.min(this.maxTestRunTimeValue, 5000 /* MaxTestRuntime */);
                /* istanbul ignore next */
                test.decimalPlaces = !isFinite(this.roundDecimalPlacesValue)
                    ? 3
                    : Math.max(Math.round(this.roundDecimalPlacesValue), 0 /* MinimumDecimalPlaces */);
                /* istanbul ignore next */
                test.calculateAverageValue = this.recordAverageValue || false;
                /* istanbul ignore next */
                test.calculateMedianValue = this.recordMedianValue || false;
                /* istanbul ignore next */
                test.calculateStandardDeviationValue = this.recordStdDevValue || false;
                /* istanbul ignore next */
                test.calculateMaxValue = this.recordMaxValue || false;
                /* istanbul ignore next */
                test.calculateMinValue = this.recordMaxValue || false;
                /* istanbul ignore next */
                test.calculateVarianceValue = this.recordVariance || false;
            }
            group.tests.push(test);
            this.resetPerformanceValues();
        };
        /**
         * This function reports a single "todo" item in a test suite.
         *
         * @param {number} todoPointer - The todo description string pointer.
         */
        TestCollector.prototype.reportTodo = function (todoPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.todos.push(this.getString(todoPointer, "No todo() value provided."));
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
        TestCollector.prototype.abort = function (reasonPointer, _fileNamePointer, _line, _col) {
            this.message = this.getString(reasonPointer, "No assertion message provided.");
        };
        /**
         * This web assembly linked function modifies the state machine to enable
         * performance for the following test.
         *
         * @param {1 | 0} value - A value indicating if performance should be enabled.
         */
        TestCollector.prototype.performanceEnabled = function (value) {
            this.performanceEnabledValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to set the maximum number of
         * samples for the following test.
         *
         * @param {number} value - The maximum number of samples to collect for the following test.
         */
        TestCollector.prototype.maxSamples = function (value) {
            if (value > 10000 /* MaxSamples */) {
                this.pushWarning({
                    message: "Invalid Performance Configuration: maxSamples exceeds " +
                        10000 /* MaxSamples */,
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            if (value < 0) {
                this.pushWarning({
                    message: "Invalid Performance Configuration: maxSamples less than 0.",
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            this.maxSamplesValue = value;
        };
        /**
         * This web assembly linked function modifies the state machine to set the maximum amount of
         * time to run the following test in milliseconds
         *
         * @param {number} value - The maximum number of milliseconds to run the following test.
         */
        TestCollector.prototype.maxTestRunTime = function (value) {
            if (value > 5000 /* MaxTestRuntime */) {
                this.pushWarning({
                    message: "Invalid Performance Configuration: maxTestRunTime exceeds " +
                        5000 /* MaxTestRuntime */,
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            if (value < 0) {
                this.pushWarning({
                    message: "Invalid Performance Configuration: maxTestRunTime less than 0.",
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            this.maxTestRunTimeValue = value;
        };
        /**
         * This web assembly linked function modifies the state machine to set the number of decimal places
         * to round all the statistics to.
         *
         * @param {number} value - The number of decimal places to round to.
         */
        TestCollector.prototype.roundDecimalPlaces = function (value) {
            if (value > 8 /* MaximumDecimalPlaces */) {
                /* istanbul ignore next */
                this.pushWarning({
                    message: "Invalid Performance Configuration: roundDecimalPlaces exceeds " +
                        8 /* MaximumDecimalPlaces */,
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            if (value < 0 /* MinimumDecimalPlaces */) {
                /* istanbul ignore next */
                this.pushWarning({
                    message: "Invalid Performance Configuration: roundDecimalPlaces less than " +
                        0 /* MinimumDecimalPlaces */,
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            this.roundDecimalPlacesValue = value;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * an average run time.
         *
         * @param {1 | 0} value - A boolean indicating if the average should be reported.
         */
        TestCollector.prototype.reportAverage = function (value) {
            this.recordAverageValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * an median run time.
         *
         * @param {1 | 0} value - A boolean indicating if the median should be reported.
         */
        TestCollector.prototype.reportMedian = function (value) {
            this.recordMedianValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * a standard deviation calculation on the run times.
         *
         * @param {1 | 0} value - A boolean indicating if the standard deviation should be reported.
         */
        TestCollector.prototype.reportStdDev = function (value) {
            this.recordStdDevValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the maximum run time for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the max should be reported.
         */
        TestCollector.prototype.reportMax = function (value) {
            this.recordMaxValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the minimum run time for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the min should be reported.
         */
        TestCollector.prototype.reportMin = function (value) {
            this.recordMinValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the variance of the run times for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the min should be reported.
         */
        TestCollector.prototype.reportVariance = function (value) {
            this.recordVariance = value === 1;
        };
        /**
         * This method reports to the TestContext that an expect function call was used outside of the
         * intended test functions.
         */
        TestCollector.prototype.reportInvalidExpectCall = function () {
            this.pushError({
                type: "InvalidExpectCall",
                message: "An expect() function call was used outside of a test function in " + this.fileName + ".",
                stackTrace: this.getLogStackTrace(),
            });
        };
        /**
         * Gets an error stack trace.
         */
        TestCollector.prototype.getErrorStackTrace = function (ex) {
            var stackItems = ex.stack.toString().split("\n");
            return __spreadArrays([stackItems[0]], stackItems.slice(1).filter(wasmFilter)).join("\n");
        };
        /**
         * Reset all the performance values to the configured values.
         */
        TestCollector.prototype.resetPerformanceValues = function () {
            this.performanceEnabledValue = this.performanceConfiguration.enabled;
            this.maxSamplesValue = this.performanceConfiguration.maxSamples;
            this.maxTestRunTimeValue = this.performanceConfiguration.maxTestRunTime;
            this.roundDecimalPlacesValue = this.performanceConfiguration.roundDecimalPlaces;
            this.recordAverageValue = this.performanceConfiguration.reportAverage;
            this.recordMedianValue = this.performanceConfiguration.reportMedian;
            this.recordStdDevValue = this.performanceConfiguration.reportStandardDeviation;
            this.recordMaxValue = this.performanceConfiguration.reportMax;
            this.recordMinValue = this.performanceConfiguration.reportMin;
            this.recordVariance = this.performanceConfiguration.reportVariance;
        };
        /**
         * Gets a log stack trace.
         */
        TestCollector.prototype.getLogStackTrace = function () {
            return new Error("Get stack trace.")
                .stack.toString()
                .split("\n")
                .slice(1)
                .filter(wasmFilter)
                .join("\n");
        };
        /**
         * This method returns the current rtrace count.
         */
        TestCollector.prototype.getRTraceCount = function () {
            return this.blocks.size;
        };
        /**
         * This method starts a new rtrace count label.
         *
         * @param {number} label - The RTrace label.
         */
        TestCollector.prototype.startRTrace = function (label) {
            this.rtraceLabels.set(label, this.blocks.size);
        };
        /**
         * This method ends an RTrace label and returns the difference between the current and the
         * starting reference counts.
         *
         * @param {number} label - The RTrace label.
         * @returns {number}
         */
        TestCollector.prototype.endRTrace = function (label) {
            var result = this.blocks.size - this.rtraceLabels.get(label);
            this.rtraceLabels.delete(label);
            return result;
        };
        /**
         * This method is called when a memory block is allocated on the heap.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        TestCollector.prototype.onalloc = function (block) {
            this.allocationCount += 1;
            this.groupAllocationCount += 1;
            this.testAllocationCount += 1;
            /**
             * This is impossible to test but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (this.blocks.has(block)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "A duplicate allocation has occurred at block: " + block.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Allocation Error",
                });
            }
            else {
                this.blocks.set(block, 0);
            }
            this.testBlocks.add(block);
            this.groupBlocks.add(block);
        };
        /**
         * This method is called when a memory block is deallocated from the heap.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        TestCollector.prototype.onfree = function (block) {
            this.freeCount += 1;
            this.groupFreeCount += 1;
            this.testFreeCount += 1;
            /**
             * This is impossible to test, but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (!this.blocks.has(block)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "An orphaned dellocation has occurred at block: " + block.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Orphaned Deallocation Error",
                });
            }
            else {
                this.blocks.delete(block);
            }
            this.testBlocks.delete(block);
            this.groupBlocks.delete(block);
        };
        /**
         * This method is called when a memory block reference count is incremented.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        TestCollector.prototype.onincrement = function (block) {
            this.incrementCount += 1;
            this.groupIncrementCount += 1;
            this.testIncrementCount += 1;
            /**
             * This is impossible to test, but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (!this.blocks.has(block)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "An orphaned increment has occurred at block: " + block.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Orphaned Increment Error",
                });
            }
            else {
                var count = this.blocks.get(block);
                this.blocks.set(block, count + 1);
            }
        };
        /**
         * This method is called when a memory block reference count is decremented.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        TestCollector.prototype.ondecrement = function (block) {
            this.decrementCount += 1;
            this.groupDecrementCount += 1;
            this.testDecrementCount += 1;
            /**
             * This is impossible to test, but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (!this.blocks.has(block)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "An orphaned decrement has occurred at block: " + block.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Orphaned Decrement Error",
                });
            }
            else {
                var count = this.blocks.get(block);
                this.blocks.set(block, count - 1);
            }
        };
        TestCollector.prototype.onrealloc = function (oldBlock, newBlock) {
            this.reallocationCount += 1;
            this.groupReallocationCount += 1;
            this.testReallocationCount += 1;
            /**
             * This is impossible to test, but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (!this.blocks.has(oldBlock)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "An orphaned realloc has occurred at old block: " +
                        oldBlock.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Orphaned Reallocation Error (old)",
                });
            }
            else {
                /* istanbul ignore next */
                if (!this.blocks.has(newBlock)) {
                    /* istanbul ignore next */
                    this.pushError({
                        message: "An orphaned realloc has occurred at new block: " +
                            newBlock.toString(),
                        stackTrace: this.getLogStackTrace(),
                        type: "Orphaned Reallocation Error (new)",
                    });
                }
                else {
                    /* istanbul ignore next */
                    var newRc = this.blocks.get(newBlock);
                    /* istanbul ignore next */
                    if (newRc != 0) {
                        /* istanbul ignore next */
                        this.pushError({
                            message: "An invalid realloc error has occurred from " + oldBlock + " to " + newBlock + ".",
                            stackTrace: this.getLogStackTrace(),
                            type: "Invalid Reallocation Error",
                        });
                    }
                    else {
                        var oldRc = this.blocks.get(oldBlock);
                        this.blocks.set(newBlock, oldRc);
                    }
                }
            }
        };
        /**
         * This method reports an error to the current logTarget and the `TestContext`.
         *
         * @param {IWarning} error - The error being reported.
         */
        TestCollector.prototype.pushError = function (error) {
            this.errors.push(error);
            /**
             * All the tests will always have a log target set. There is no reason to test this branch.
             */
            /* istanbul ignore next */
            if (this.logTarget)
                this.logTarget.errors.push(error);
        };
        TestCollector.prototype.pushWarning = function (warning) {
            this.warnings.push(warning);
            /* istanbul ignore next */
            if (this.logTarget)
                this.logTarget.warnings.push(warning);
        };
        /**
         * This linked method gets all the RTrace increments for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceIncrements = function () {
            return this.incrementCount;
        };
        /**
         * This linked method gets all the RTrace decrements for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceDecrements = function () {
            return this.decrementCount;
        };
        /**
         * This linked method gets all the RTrace increments for the current group up until this point.
         */
        TestCollector.prototype.getRTraceGroupIncrements = function () {
            return this.groupIncrementCount;
        };
        /**
         * This linked method gets all the RTrace decrements for the current group up until this point.
         */
        TestCollector.prototype.getRTraceGroupDecrements = function () {
            return this.groupDecrementCount;
        };
        /**
         * This linked method gets all the RTrace increments for the current test up until this point.
         */
        TestCollector.prototype.getRTraceTestIncrements = function () {
            return this.testIncrementCount;
        };
        /**
         * This linked method gets all the RTrace decrements for the current test up until this point.
         */
        TestCollector.prototype.getRTraceTestDecrements = function () {
            return this.testDecrementCount;
        };
        /**
         * This linked method gets all the RTrace allocations for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceAllocations = function () {
            return this.allocationCount;
        };
        /**
         * This linked method gets all the RTrace frees for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceFrees = function () {
            return this.freeCount;
        };
        /**
         * This linked method gets all the RTrace increments for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceGroupAllocations = function () {
            return this.groupAllocationCount;
        };
        /**
         * This linked method gets all the RTrace frees for the current group up until this point.
         */
        TestCollector.prototype.getRTraceGroupFrees = function () {
            return this.groupFreeCount;
        };
        /**
         * This linked method gets all the RTrace allocations for the current test up until this point.
         */
        TestCollector.prototype.getRTraceTestAllocations = function () {
            return this.testAllocationCount;
        };
        /**
         * This linked method gets all the RTrace allocations for the current test up until this point.
         */
        TestCollector.prototype.getRTraceTestFrees = function () {
            return this.testFreeCount;
        };
        /**
         * This linked method gets all the RTrace reallocations for the current TestContext.
         */
        TestCollector.prototype.getRTraceReallocs = function () {
            return this.reallocationCount;
        };
        /**
         * This linked method gets all the RTrace reallocations for the current TestGroup.
         */
        TestCollector.prototype.getRTraceGroupReallocs = function () {
            return this.groupReallocationCount;
        };
        /**
         * This linked method gets all the RTrace reallocations for the current TestResult.
         */
        TestCollector.prototype.getRTraceTestReallocs = function () {
            return this.testReallocationCount;
        };
        /**
         * This linked method gets all the current RTrace allocations and adds them to an array.
         */
        TestCollector.prototype.getRTraceBlocks = function () {
            return this.wasm.__allocArray(this.wasm.__getUsizeArrayId(), Array.from(this.blocks.keys()));
        };
        /**
         * This linked method gets all the current RTrace allocations for the current group.
         */
        TestCollector.prototype.getRTraceGroupBlocks = function () {
            return this.wasm.__allocArray(this.wasm.__getUsizeArrayId(), Array.from(this.groupBlocks));
        };
        /**
         * This linked method gets all the current RTrace allocations for the current test.
         */
        TestCollector.prototype.getRTraceTestBlocks = function () {
            return this.wasm.__allocArray(this.wasm.__getUsizeArrayId(), Array.from(this.testBlocks));
        };
        /**
         * Gets a string from the wasm module, unless the module string is null. Otherwise it returns
         * a default value.
         */
        TestCollector.prototype.getString = function (pointer, defaultValue) {
            return pointer === 0 ? defaultValue : this.wasm.__getString(pointer);
        };
        /**
         * An override implementation of the AssemblyScript trace function.
         *
         * @param {number} strPointer - The trace string.
         * @param {number} count - The number of arguments to be traced.
         * @param {number[]} args - The traced arguments.
         */
        TestCollector.prototype.trace = function (strPointer, count) {
            var args = [];
            for (var _i = 2; _i < arguments.length; _i++) {
                args[_i - 2] = arguments[_i];
            }
            var hostValue = new HostValue_1.HostValue();
            hostValue.pointer = strPointer;
            hostValue.stack = this.getLogStackTrace();
            hostValue.typeName = "trace";
            hostValue.type = 2 /* String */;
            hostValue.value = "trace: " + this.getString(strPointer, "") + " " + args
                .slice(0, count)
                .join(", ");
            // push the log value to the logs
            this.logTarget.logs.push(hostValue);
        };
        /**
         * Retrieve the function name of a given web assembly function.
         *
         * @param {number} index - The function index
         */
        TestCollector.prototype.funcName = function (index) {
            /* istanbul ignore next */
            if (this.nameSection)
                return this.nameSection.fromIndex(parseInt(this.wasm.table.get(index).name));
            /* istanbul ignore next */
            return "";
        };
        TestCollector.prototype.createHostValue = function (isNull, hasKeys, nullable, offset, // offsetof<T>("propName")
        pointer, // changetype<usize>(this) | 0
        signed, // isSigned<T>()
        size, // sizeof<T>()
        hostTypeValue, typeId, // idof<T>()
        typeName, // nameof<T>()
        value, // usize | Box<T>
        hasValues) {
            var hostValue = new HostValue_1.HostValue();
            hostValue.isNull = isNull === 1;
            hostValue.keys = hasKeys ? [] : null;
            hostValue.nullable = nullable === 1;
            hostValue.offset = offset;
            hostValue.pointer = pointer;
            hostValue.signed = signed === 1;
            hostValue.size = size;
            hostValue.type = hostTypeValue;
            hostValue.typeId = typeId;
            hostValue.typeName = this.getString(typeName, "");
            hostValue.values = hasValues ? [] : null;
            hostValue.stack = this.getLogStackTrace();
            if (hostTypeValue === 7 /* Integer */ || hostTypeValue === 9 /* Boolean */) {
                hostValue.value = this.getInteger(value, size, signed === 1);
                // get long
            }
            else if (hostTypeValue === 2 /* String */) {
                hostValue.value = this.getString(value, "");
            }
            else if (hostTypeValue === 8 /* Float */) {
                hostValue.value = this.getFloat(value, size);
            }
            else if (hostTypeValue === 6 /* Function */) {
                hostValue.value = this.funcName(value);
            }
            else {
                hostValue.value = value;
            }
            return this.hostValueCache.push(hostValue) - 1;
        };
        /**
         * Get a boxed integer of a given kind at a pointer location.
         *
         * @param {number} pointer - The pointer location of the number
         * @param {number} size - The size of the integer in bytes
         * @param {boolean} signed - If the number is signed
         */
        TestCollector.prototype.getInteger = function (pointer, size, signed) {
            var buffer = this.wasm.memory.buffer;
            /* istanbul ignore next */
            if (pointer + size >= buffer.byteLength) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot obtain " + (signed ? "" : "un") + "signed integer value at pointer " + pointer + " of size " + size + ": index out of bounds",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return 0;
            }
            switch (size) {
                case 1:
                    if (signed) {
                        return new Int8Array(buffer)[pointer];
                    }
                    else {
                        return new Uint8Array(buffer)[pointer];
                    }
                case 2:
                    if (signed) {
                        return new Int16Array(buffer)[pointer >>> 1];
                    }
                    else {
                        return new Uint16Array(buffer)[pointer >>> 1];
                    }
                case 4:
                    if (signed) {
                        return new Int32Array(buffer)[pointer >>> 2];
                    }
                    else {
                        return new Uint32Array(buffer)[pointer >>> 2];
                    }
                case 8:
                    var long = new long_1.default.fromBytesLE(new Uint8Array(buffer, pointer, 8), !signed);
                    return long.toString();
                /* istanbul ignore next */
                default:
                    /* istanbul ignore next */
                    this.errors.push({
                        message: "Cannot obtain an " + (signed ? "" : "un") + "signed integer at " + pointer + " of size " + size,
                        stackTrace: this.getLogStackTrace(),
                        type: "HostValue",
                    });
                    /* istanbul ignore next */
                    return 0;
            }
        };
        /**
         * Get a boxed float of a given kind at a pointer location.
         *
         * @param {number} pointer - The pointer location of the number
         * @param {number} size - The size of the float in bytes.
         */
        TestCollector.prototype.getFloat = function (pointer, size) {
            var buffer = this.wasm.memory.buffer;
            /* istanbul ignore next */
            if (pointer + size >= buffer.byteLength) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot obtain a float value at pointer " + pointer + " of size " + size + ": index out of bounds",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return 0;
            }
            switch (size) {
                case 4:
                    return new Float32Array(buffer)[pointer >>> 2];
                case 8:
                    return new Float64Array(buffer)[pointer >>> 3];
                /* istanbul ignore next */
                default:
                    // sanity checks
                    /* istanbul ignore next */
                    this.errors.push({
                        message: "Cannot obtain a float at " + pointer + " of size " + size,
                        stackTrace: this.getLogStackTrace(),
                        type: "HostValue",
                    });
                    /* istanbul ignore next */
                    return 0;
            }
        };
        /**
         * Log a host value.
         *
         * @param {number} id - The HostValue id
         */
        TestCollector.prototype.logHostValue = function (id) {
            /* istanbul ignore next */
            if (id >= this.hostValueCache.length || id < 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot log HostValue of id " + id + ". Index out of bounds.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            this.logTarget.logs.push(this.hostValueCache[id]);
        };
        /**
         * Report an actual host value.
         *
         * @param {number} id - The HostValue id
         */
        TestCollector.prototype.reportActualHostValue = function (id) {
            // ignored lines are santiy checks for error reporting
            /* istanbul ignore next */
            if (id >= this.hostValueCache.length || id < 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot report actual HostValue of id " + id + ". Index out of bounds.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            this.actual = this.hostValueCache[id];
        };
        /**
         * Report an expected host value.
         *
         * @param {number} id - The HostValue id
         */
        TestCollector.prototype.reportExpectedHostValue = function (id, negated) {
            // ignored lines are error reporting for sanity checks
            /* istanbul ignore next */
            if (id >= this.hostValueCache.length || id < 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot report expected HostValue of id " + id + ". Index out of bounds.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            this.expected = this.hostValueCache[id];
            this.expected.negated = !!negated;
        };
        /**
         * Push a host value to a given host value.
         *
         * @param {number} hostValueID - The target host value parent.
         * @param {number} valueID - The target host value to be pushed.
         */
        TestCollector.prototype.pushHostObjectValue = function (hostValueID, valueID) {
            // each ignored line for test coverage is error reporting for sanity checks
            /* istanbul ignore next */
            if (hostValueID >= this.hostValueCache.length || hostValueID < 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot push HostValue of id " + valueID + " to HostValue " + hostValueID + ". HostObject id out of bounds.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            /* istanbul ignore next */
            if (valueID >= this.hostValueCache.length || valueID < 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot push HostValue of id " + valueID + " to HostValue " + hostValueID + ". HostObject value id out of bounds.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            var hostValue = this.hostValueCache[hostValueID];
            var value = this.hostValueCache[valueID];
            /* istanbul ignore next */
            if (!hostValue.values) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot push HostValue of id " + valueID + " to HostValue " + hostValueID + ". HostObject was not initialized with a values array.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            hostValue.values.push(value);
        };
        /**
         * Push a host value key to a given host value.
         *
         * @param {number} hostValueID - The target host value parent.
         * @param {number} keyId - The target host value key to be pushed.
         */
        TestCollector.prototype.pushHostObjectKey = function (hostValueID, keyId) {
            // every ignored line for test coverage in this function are sanity checks
            /* istanbul ignore next */
            if (hostValueID >= this.hostValueCache.length || hostValueID < 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot push HostValue of id " + keyId + " to HostValue " + hostValueID + ". HostObject id out of bounds.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            /* istanbul ignore next */
            if (keyId >= this.hostValueCache.length || keyId < 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot push HostValue of id " + keyId + " to HostValue " + hostValueID + ". HostObject key id out of bounds.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            var hostValue = this.hostValueCache[hostValueID];
            var key = this.hostValueCache[keyId];
            // this is a failsafe if a keys[] does not exist on the HostValue
            /* istanbul ignore next */
            if (!hostValue.keys) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot push HostValue of id " + keyId + " to HostValue " + hostValueID + ". HostObject was not initialized with a keys array.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            hostValue.keys.push(key);
        };
        /**
         * Clear the expected value.
         */
        TestCollector.prototype.clearExpected = function () {
            this.expected = null;
        };
        /**
         * Clear the actual value.
         */
        TestCollector.prototype.clearActual = function () {
            this.actual = null;
        };
        /**
         * Report an expected truthy value, and if it's negated.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedTruthy = function (negated) {
            var expected = this.expected = new HostValue_1.HostValue();
            expected.negated = negated === 1;
            expected.type = 13 /* Truthy */;
        };
        /**
         * Report an expected truthy value, and if it's negated.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedFalsy = function (negated) {
            var expected = this.expected = new HostValue_1.HostValue();
            expected.negated = negated === 1;
            expected.type = 14 /* Falsy */;
        };
        /**
         * Report an expected finite value, and if it's negated.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedFinite = function (negated) {
            var expected = this.expected = new HostValue_1.HostValue();
            expected.negated = negated === 1;
            expected.type = 12 /* Finite */;
        };
        return TestCollector;
    }());
    exports.TestCollector = TestCollector;
});
define("test/TestContext", ["require", "exports", "reporter/VerboseReporter", "perf_hooks", "util/timeDifference", "test/TestCollector"], function (require, exports, VerboseReporter_1, perf_hooks_1, timeDifference_1, TestCollector_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    VerboseReporter_1 = __importDefault(VerboseReporter_1);
    var TestContext = /** @class */ (function (_super) {
        __extends(TestContext, _super);
        function TestContext(props) {
            var _this = _super.call(this, props) || this;
            _this.time = 0;
            _this.pass = true;
            _this.startupTime = 0;
            _this.reporter = new VerboseReporter_1.default({});
            /* istanbul ignore next */
            _this.stdout = typeof process !== "undefined" ? process.stdout : null;
            /* istanbul ignore next */
            _this.stderr = typeof process !== "undefined" ? process.stderr : null;
            _this.endGroup = false;
            /* istanbul ignore next */
            if (props) {
                /* istanbul ignore next */
                if (props.reporter)
                    _this.reporter = props.reporter;
                /* istanbul ignore next */
                if (props.stdout)
                    _this.stdout = props.stdout;
                /* istanbul ignore next */
                if (props.stderr)
                    _this.stderr = props.stderr;
            }
            return _this;
        }
        /**
         * Run the tests on the wasm module.
         */
        TestContext.prototype.run = function (wasm) {
            // set wasm immediately
            this.wasm = wasm;
            // start the timer
            var start = perf_hooks_1.performance.now();
            try {
                // start the module up
                _super.prototype.collectTests.call(this);
                if (!this.rtraceEnabled) {
                    wasm.__disableRTrace();
                }
                // calculate startuptime
                this.startupTime = timeDifference_1.timeDifference(perf_hooks_1.performance.now(), start);
            }
            catch (ex) {
                /** This skipped line is related to the message coalescing, which is just a fallback. */
                /* istanbul ignore next */
                this.pushError({
                    message: "TestCollectionError: " + (this.message || ex.message),
                    stackTrace: this.getErrorStackTrace(ex),
                    type: "TestCollectionError",
                });
            }
            if (this.errors.length > 0)
                return;
            // start the test suite
            this.reporter.onStart(this);
            this.runGroup(this.topLevelGroup);
            var end = perf_hooks_1.performance.now();
            this.time = timeDifference_1.timeDifference(end, start);
            this.reporter.onFinish(this);
        };
        TestContext.prototype.runGroup = function (group) {
            if (!group.willRun) {
                /* istanbul ignore next */
                for (var _i = 0, _a = group.children; _i < _a.length; _i++) {
                    var child = _a[_i];
                    /* istanbul ignore next */
                    this.runGroup(child);
                    /* istanbul ignore next */
                    if (this.endGroup)
                        return;
                }
            }
            this.endGroup = false;
            if (this.rtraceEnabled) {
                // reset all the reference counting properties
                this.groupAllocationCount = 0;
                this.groupFreeCount = 0;
                this.groupDecrementCount = 0;
                this.groupIncrementCount = 0;
                this.groupReallocationCount = 0;
                group.rtraceStart = this.blocks.size;
                this.groupBlocks.clear();
            }
            // set the group starttime
            group.start = perf_hooks_1.performance.now();
            // set the log target
            this.logTarget = group;
            // for each beforeAllCallback
            this.runBeforeAll(group);
            // report the group as started, and log all the beforeAll logs outside the describe block
            this.reporter.onGroupStart(group);
            if (this.endGroup)
                return;
            for (var _b = 0, _c = group.tests; _b < _c.length; _b++) {
                var result = _c[_b];
                this.runTest(group, result);
                if (this.endGroup)
                    return;
                this.reporter.onTestFinish(group, result);
                this.logTarget = group;
            }
            // run the children
            for (var _d = 0, _e = group.children; _d < _e.length; _d++) {
                var child = _e[_d];
                this.runGroup(child);
            }
            // for each afterAllCallback
            this.runAfterAll(group);
            if (this.endGroup) {
                this.pass = false;
                group.pass = false;
                group.reason = "Test suite " + group.name + " failed because of an afterAll() callback occurred.";
                return;
            }
            if (this.rtraceEnabled) {
                // calculate reference counts for the group
                group.allocationCount = this.groupAllocationCount;
                group.freeCount = this.groupFreeCount;
                group.decrementCount = this.groupDecrementCount;
                group.incrementCount = this.groupIncrementCount;
                group.reallocationCount = this.groupReallocationCount;
                group.rtraceEnd = this.blocks.size;
                group.rtraceDelta = group.rtraceEnd - group.rtraceStart;
            }
            // finish the group
            group.end = perf_hooks_1.performance.now();
            group.time = timeDifference_1.timeDifference(group.end, group.start);
            this.reporter.onGroupFinish(group);
        };
        /**
         * Run a given test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current run group.
         * @param {number} testIndex - The current test index.
         */
        TestContext.prototype.runTest = function (group, result) {
            // set the log target
            this.logTarget = result;
            this.reporter.onTestStart(group, result);
            result.ran = true;
            if (this.rtraceEnabled) {
                // reset all the reference counting properties
                this.testAllocationCount = 0;
                this.testFreeCount = 0;
                this.testDecrementCount = 0;
                this.testIncrementCount = 0;
                this.testReallocationCount = 0;
                result.rtraceStart = this.blocks.size;
                this.testBlocks.clear();
            }
            result.start = perf_hooks_1.performance.now();
            // If performance is enabled, use the performance values, otherwise, just run once.
            if (result.performance) {
                // we must ignore the log values to increase performance execution speed
                this.wasm.__ignoreLogs(1);
                var runCount = 0;
                var testStartTime = perf_hooks_1.performance.now();
                var currentTestRunTime = 0;
                // run the test loop
                while (true) {
                    // always run at least once
                    this.runBeforeEach(group, result);
                    /**
                     * Especially because the performance functions are run repeatedly, if an error occurs, assume the
                     * worst and skip the test group. These functions definitely are assumed to be safe by the test context.
                     */
                    if (this.endGroup) {
                        this.wasm.__ignoreLogs(0);
                        this.wasm.__collect();
                        return;
                    }
                    this.runTestCall(group, result);
                    this.runAfterEach(group, result);
                    // check to see if the afterEach functions errored (see above)
                    if (this.endGroup) {
                        this.wasm.__ignoreLogs(0);
                        this.wasm.__collect();
                        return;
                    }
                    currentTestRunTime = perf_hooks_1.performance.now() - testStartTime; // calculate how long the current test has run
                    runCount += 1; // increase the run count
                    if (runCount >= result.maxSamples) {
                        this.wasm.__ignoreLogs(0);
                        break; // if we have reached the max sample count
                    }
                    if (currentTestRunTime >= result.maxRuntime) {
                        this.wasm.__ignoreLogs(0);
                        break; // weve collected enough samples and the test is over
                    }
                }
                this.wasm.__ignoreLogs(0);
                if (result.calculateAverageValue)
                    result.calculateAverage();
                if (result.calculateMaxValue)
                    result.calculateMax();
                if (result.calculateMedianValue)
                    result.calculateMedian();
                if (result.calculateMinValue)
                    result.calculateMin();
                if (result.calculateVarianceValue)
                    result.calculateVariance();
                if (result.calculateStandardDeviationValue)
                    result.calculateStandardDeviation();
            }
            else {
                this.runBeforeEach(group, result);
                if (this.endGroup)
                    return;
                this.runTestCall(group, result);
                this.runAfterEach(group, result);
                if (this.endGroup)
                    return;
            }
            if (this.rtraceEnabled) {
                // calculate reference counts for the test
                result.allocationCount = this.testAllocationCount;
                result.freeCount = this.testFreeCount;
                result.decrementCount = this.testDecrementCount;
                result.incrementCount = this.testIncrementCount;
                result.reallocationCount = this.testReallocationCount;
                result.rtraceEnd = this.blocks.size;
                result.rtraceDelta = result.rtraceEnd - result.rtraceStart;
            }
            /**
             * In the chance that some kind of memory error occurs as a result of executing the test,
             * this should end the test unsuccesfully. Since most errors that end with some kind of
             * runtime error using `unreachable()`, it's impossible to test this branch meaningfully.
             * This if statement is ignored because it's a failsafe in case some kind of error occurs
             * that doesn't cause an unreachable state.
             */
            /* istanbul ignore next */
            if (result.errors.length > 0) {
                this.pass = false;
                result.pass = false;
            }
            result.end = perf_hooks_1.performance.now();
            result.runTime = timeDifference_1.timeDifference(result.end, result.start);
        };
        /**
         * Run the current test once and collect statistics.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         * @param {number} testIndex - The current test index.
         */
        TestContext.prototype.runTestCall = function (group, result) {
            var start = perf_hooks_1.performance.now();
            var testCallResult = this.tryCall(result.functionPointer);
            var end = perf_hooks_1.performance.now();
            result.times.push(timeDifference_1.timeDifference(end, start));
            result.pass = result.negated ? testCallResult === 0 : testCallResult === 1;
            if (!result.pass) {
                this.pass = false;
                group.pass = false;
                // if it's not negated then set the message, the actual, expected, and stack values
                if (!result.negated) {
                    result.actual = this.actual;
                    result.expected = this.expected;
                    result.message = this.message;
                    result.stack = this.stack;
                }
            }
            if (testCallResult === 0) {
                this.wasm.__collect();
            }
            // always clear the values
            this.message = "";
            this.actual = null;
            this.expected = null;
            this.stack = "";
        };
        /**
         * Run the afterEach callbacks before running the test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         */
        TestContext.prototype.runAfterEach = function (group, result) {
            if (group.parent)
                this.runAfterEach(group.parent, result);
            // for each afterEach callback function pointer
            for (var _i = 0, _a = group.afterEachPointers; _i < _a.length; _i++) {
                var afterEachCallback = _a[_i];
                var afterEachResult = this.tryCall(afterEachCallback);
                // if afterEach fails
                if (afterEachResult === 0) {
                    this.wasm.__collect();
                    this.endGroup = true;
                    group.end = result.end = perf_hooks_1.performance.now();
                    group.pass = false;
                    this.pass = false;
                    group.reason = "Test suite " + group.name + " failed because an error occurred in an afterEach() callback.";
                    result.pass = false;
                    group.time = timeDifference_1.timeDifference(group.end, group.start);
                    this.reporter.onTestFinish(group, result);
                    this.reporter.onGroupFinish(group);
                    return;
                }
            }
        };
        /**
         * Run the beforeEach callbacks before running the test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         */
        TestContext.prototype.runBeforeEach = function (group, result) {
            if (group.parent)
                this.runBeforeEach(group.parent, result);
            // for each beforeEach callback function pointer
            for (var _i = 0, _a = group.beforeEachPointers; _i < _a.length; _i++) {
                var beforeEachCallback = _a[_i];
                var beforeEachResult = this.tryCall(beforeEachCallback);
                // if beforeEach fails
                if (beforeEachResult === 0) {
                    this.wasm.__collect();
                    result.end = group.end = perf_hooks_1.performance.now();
                    this.pass = false;
                    group.pass = false;
                    group.reason = "Test suite " + group.name + " failed because an error occurred in a beforeEach() callback.";
                    result.pass = false;
                    group.time = timeDifference_1.timeDifference(group.end, group.start);
                    this.reporter.onTestFinish(group, result);
                    this.reporter.onGroupFinish(group);
                    this.endGroup = true;
                    return;
                }
            }
        };
        /**
         * Run the beforeAll callbacks with the given runContext and group. This
         * method only calls the current group's beforeAll callbacks.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         */
        TestContext.prototype.runAfterAll = function (group) {
            for (var _i = 0, _a = group.afterAllPointers; _i < _a.length; _i++) {
                var afterAllCallback = _a[_i];
                // call each afterAll callback
                var afterAllResult = this.tryCall(afterAllCallback);
                // if the test fails
                if (afterAllResult === 0) {
                    group.end = perf_hooks_1.performance.now();
                    this.pass = false;
                    group.pass = false;
                    group.reason = "Test suite " + group.name + " failed because an error occurred in an afterAll() callback.";
                    this.pass = false;
                    group.time = timeDifference_1.timeDifference(group.end, group.start);
                    this.reporter.onGroupFinish(group);
                    this.endGroup = true;
                    return;
                }
            }
        };
        /**
         * Run the beforeAll callbacks with the given runContext and group. This
         * method only calls the current group's beforeAll callbacks.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         */
        TestContext.prototype.runBeforeAll = function (group) {
            for (var _i = 0, _a = group.beforeAllPointers; _i < _a.length; _i++) {
                var beforeAllCallback = _a[_i];
                // call each beforeAll callback
                var beforeAllResult = this.tryCall(beforeAllCallback);
                // if the test fails
                if (beforeAllResult === 0) {
                    group.end = perf_hooks_1.performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + group.name + " failed because an error occurred in a beforeAll() callback.";
                    this.pass = false;
                    group.time = timeDifference_1.timeDifference(group.end, group.start);
                    this.endGroup = true;
                    return;
                }
            }
        };
        return TestContext;
    }(TestCollector_1.TestCollector));
    exports.TestContext = TestContext;
});
define("test/TestReporter", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This is the abstract shape of a `TestReporter`. It can be extended to create a `TestReporter`.
     */
    var TestReporter = /** @class */ (function () {
        function TestReporter() {
        }
        return TestReporter;
    }());
    exports.TestReporter = TestReporter;
});
define("reporter/CombinationReporter", ["require", "exports", "test/TestReporter"], function (require, exports, TestReporter_2) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This reporter is used to combine a set of reporters into a single reporter object. It uses
     * forEach() to call each reporter's function when each method is called.
     */
    var CombinationReporter = /** @class */ (function (_super) {
        __extends(CombinationReporter, _super);
        function CombinationReporter(reporters) {
            var _this = _super.call(this) || this;
            _this.reporters = reporters;
            return _this;
        }
        CombinationReporter.prototype.onFinish = function (suite) {
            this.reporters.forEach(function (e) { return e.onFinish(suite); });
        };
        CombinationReporter.prototype.onGroupFinish = function (group) {
            this.reporters.forEach(function (e) { return e.onGroupFinish(group); });
        };
        CombinationReporter.prototype.onGroupStart = function (group) {
            this.reporters.forEach(function (e) { return e.onGroupStart(group); });
        };
        CombinationReporter.prototype.onStart = function (suite) {
            this.reporters.forEach(function (e) { return e.onStart(suite); });
        };
        CombinationReporter.prototype.onTestStart = function (group, result) {
            this.reporters.forEach(function (e) { return e.onTestStart(group, result); });
        };
        CombinationReporter.prototype.onTestFinish = function (group, result) {
            this.reporters.forEach(function (e) { return e.onTestFinish(group, result); });
        };
        CombinationReporter.prototype.onTodo = function (group, todo) {
            this.reporters.forEach(function (e) { return e.onTodo(group, todo); });
        };
        return CombinationReporter;
    }(TestReporter_2.TestReporter));
    exports.default = CombinationReporter;
});
define("reporter/CSVReporter", ["require", "exports", "test/TestReporter", "csv-stringify", "fs", "path", "reporter/util/stringifyHostValue"], function (require, exports, TestReporter_3, csv_stringify_1, fs_1, path_1, stringifyHostValue_2) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    csv_stringify_1 = __importDefault(csv_stringify_1);
    /**
     * @ignore
     * This is a list of all the columns in the exported csv file.
     */
    var csvColumns = [
        "Group",
        "Name",
        "Ran",
        "Pass",
        "Runtime",
        "Message",
        "Actual",
        "Expected",
        "Average",
        "Median",
        "Max",
        "Min",
        "StdDev",
        "Variance",
    ];
    /**
     * This class is responsible for creating a csv file located at {testName}.spec.csv. It will
     * contain a set of tests with relevant pass and fail information.
     */
    var CSVReporter = /** @class */ (function (_super) {
        __extends(CSVReporter, _super);
        function CSVReporter(_options) {
            var _this = _super.call(this) || this;
            _this.output = null;
            _this.fileName = null;
            return _this;
        }
        CSVReporter.prototype.onStart = function (suite) {
            this.output = csv_stringify_1.default({ columns: csvColumns });
            var extension = path_1.extname(suite.fileName);
            var dir = path_1.dirname(suite.fileName);
            var base = path_1.basename(suite.fileName, extension);
            var outPath = path_1.join(process.cwd(), dir, base + ".csv");
            this.fileName = fs_1.createWriteStream(outPath, "utf8");
            this.output.pipe(this.fileName);
            this.output.write(csvColumns);
        };
        CSVReporter.prototype.onGroupStart = function () { };
        CSVReporter.prototype.onGroupFinish = function () { };
        CSVReporter.prototype.onFinish = function () {
            this.output.end();
        };
        CSVReporter.prototype.onTestStart = function () { };
        CSVReporter.prototype.onTestFinish = function (group, result) {
            this.output.write([
                group.name,
                result.ran ? "RAN" : "NOT RUN",
                result.name,
                result.pass ? "PASS" : "FAIL",
                result.runTime.toString(),
                result.message,
                result.actual ? stringifyHostValue_2.stringifyHostValue(result.actual, 0) : "",
                result.expected ? stringifyHostValue_2.stringifyHostValue(result.expected, 0) : "",
                result.hasAverage ? result.average.toString() : "",
                result.hasMedian ? result.median.toString() : "",
                result.hasMax ? result.max.toString() : "",
                result.hasMin ? result.min.toString() : "",
                result.hasStdDev ? result.stdDev.toString() : "",
                result.hasVariance ? result.variance.toString() : "",
            ]);
        };
        CSVReporter.prototype.onTodo = function (group, desc) {
            this.output.write([
                group.name,
                "TODO",
                desc,
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
            ]);
        };
        return CSVReporter;
    }(TestReporter_3.TestReporter));
    exports.default = CSVReporter;
});
define("reporter/EmptyReporter", ["require", "exports", "test/TestReporter"], function (require, exports, TestReporter_4) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This class can be used as a stub reporter to interface with the `TestContext` in the browser.
     * It will not report any information about the tests.
     */
    var EmptyReporter = /** @class */ (function (_super) {
        __extends(EmptyReporter, _super);
        function EmptyReporter(_options) {
            return _super.call(this) || this;
        }
        EmptyReporter.prototype.onFinish = function () { };
        EmptyReporter.prototype.onGroupFinish = function () { };
        EmptyReporter.prototype.onGroupStart = function () { };
        EmptyReporter.prototype.onStart = function () { };
        EmptyReporter.prototype.onTestFinish = function () { };
        EmptyReporter.prototype.onTestStart = function () { };
        EmptyReporter.prototype.onTodo = function () { };
        return EmptyReporter;
    }(TestReporter_4.TestReporter));
    exports.default = EmptyReporter;
});
define("reporter/JSONReporter", ["require", "exports", "test/TestReporter", "fs", "path", "reporter/util/stringifyHostValue"], function (require, exports, TestReporter_5, fs_2, path_2, stringifyHostValue_3) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This class reports all relevant test statistics to a JSON file located at
     * `{testLocation}.spec.json`.
     */
    var JSONReporter = /** @class */ (function (_super) {
        __extends(JSONReporter, _super);
        function JSONReporter(_options) {
            var _this = _super.call(this) || this;
            _this.file = null;
            _this.first = true;
            return _this;
        }
        JSONReporter.prototype.onStart = function (suite) {
            var extension = path_2.extname(suite.fileName);
            var dir = path_2.dirname(suite.fileName);
            var base = path_2.basename(suite.fileName, extension);
            var outPath = path_2.join(process.cwd(), dir, base + ".json");
            this.file = fs_2.createWriteStream(outPath, "utf8");
            this.file.write("[");
            this.first = true;
        };
        JSONReporter.prototype.onGroupStart = function () { };
        JSONReporter.prototype.onGroupFinish = function () { };
        JSONReporter.prototype.onFinish = function () {
            this.file.end("\n]");
        };
        JSONReporter.prototype.onTestStart = function () { };
        JSONReporter.prototype.onTestFinish = function (group, result) {
            this.file.write((this.first ? "\n" : ",\n") +
                JSON.stringify({
                    group: group.name,
                    name: result.name,
                    ran: result.ran,
                    pass: result.pass,
                    runtime: result.runTime,
                    message: result.message,
                    actual: result.actual ? stringifyHostValue_3.stringifyHostValue(result.actual, 0) : null,
                    expected: result.expected ? stringifyHostValue_3.stringifyHostValue(result.expected, 0) : null,
                    average: result.average,
                    median: result.median,
                    max: result.max,
                    min: result.min,
                    stdDev: result.stdDev,
                    variance: result.variance,
                }));
            this.first = false;
        };
        JSONReporter.prototype.onTodo = function (group, desc) {
            this.file.write((this.first ? "\n" : ",\n") +
                JSON.stringify({
                    group: group.name,
                    name: "TODO:" + desc,
                    ran: false,
                    pass: null,
                    runtime: 0,
                    message: "",
                    actual: null,
                    expected: null,
                    average: 0,
                    median: 0,
                    max: 0,
                    min: 0,
                    stdDev: 0,
                    variance: 0,
                }));
            this.first = false;
        };
        return JSONReporter;
    }(TestReporter_5.TestReporter));
    exports.default = JSONReporter;
});
define("reporter/SummaryReporter", ["require", "exports", "test/TestReporter", "reporter/util/stringifyHostValue"], function (require, exports, TestReporter_6, stringifyHostValue_4) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This test reporter should be used when logging output and test validation only needs happen on
     * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
     * process.
     */
    var SummaryReporter = /** @class */ (function (_super) {
        __extends(SummaryReporter, _super);
        function SummaryReporter(options) {
            var _this = _super.call(this) || this;
            _this.enableLogging = true;
            _this.stdout = null;
            if (options) {
                // can be "false" from cli
                if (!options.enableLogging || options.enableLogging === "false")
                    _this.enableLogging = false;
            }
            return _this;
        }
        SummaryReporter.prototype.onStart = function () { };
        SummaryReporter.prototype.onGroupStart = function () { };
        SummaryReporter.prototype.onGroupFinish = function () { };
        SummaryReporter.prototype.onTestStart = function () { };
        SummaryReporter.prototype.onTestFinish = function () { };
        SummaryReporter.prototype.onTodo = function () { };
        /**
         * This method reports a test context is finished running.
         *
         * @param {TestContext} suite - The finished test suite.
         */
        SummaryReporter.prototype.onFinish = function (suite) {
            var _a, _b;
            var chalk = require("chalk");
            this.stdout = suite.stdout;
            // TODO: Figure out a better way to flatten this array.
            var tests = (_a = []).concat.apply(_a, suite.testGroups.map(function (e) { return e.tests; }));
            var todos = (_b = []).concat.apply(_b, suite.testGroups.map(function (e) { return e.todos; })).length;
            var total = tests.length;
            var passCount = tests.reduce(function (left, right) { return (right.pass ? left + 1 : left); }, 0);
            var groupPassCount = suite.testGroups.reduce(function (num, group) { return (group.pass ? 1 : 0) + num; }, 0);
            /** Report if all the groups passed. */
            if (passCount === total && suite.testGroups.length === groupPassCount) {
                suite.stdout.write(chalk(templateObject_30 || (templateObject_30 = __makeTemplateObject(["{green.bold \u2714 ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\n"], ["{green.bold \u2714 ",
                    "} Pass: ", " / ", " Todo: ", " Time: ", "ms\\n"])), suite.fileName, passCount.toString(), total.toString(), todos.toString(), suite.time.toString()));
                /** If logging is enabled, log all the values. */
                if (this.enableLogging) {
                    for (var _i = 0, _c = suite.testGroups; _i < _c.length; _i++) {
                        var group = _c[_i];
                        for (var _d = 0, _e = group.logs; _d < _e.length; _d++) {
                            var log = _e[_d];
                            this.onLog(log);
                        }
                        for (var _f = 0, _g = group.tests; _f < _g.length; _f++) {
                            var test_1 = _g[_f];
                            for (var _h = 0, _j = test_1.logs; _h < _j.length; _h++) {
                                var log = _j[_h];
                                this.onLog(log);
                            }
                        }
                    }
                }
            }
            else {
                suite.stdout.write(chalk(templateObject_31 || (templateObject_31 = __makeTemplateObject(["{red.bold \u274C ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\n"], ["{red.bold \u274C ",
                    "} Pass: ", " / ", " Todo: ", " Time: ", "ms\\n"])), suite.fileName, passCount.toString(), total.toString(), todos.toString(), suite.time.toString()));
                /** If the group failed, report that the group failed. */
                for (var _k = 0, _l = suite.testGroups; _k < _l.length; _k++) {
                    var group = _l[_k];
                    if (group.pass)
                        continue;
                    suite.stdout.write(chalk(templateObject_32 || (templateObject_32 = __makeTemplateObject(["  {red Failed:} ", "\n"], ["  {red Failed:} ", "\\n"])), group.name));
                    /** Display the reason if there is one. */
                    if (group.reason)
                        suite.stdout.write(chalk(templateObject_33 || (templateObject_33 = __makeTemplateObject(["    {yellow Reason:} ", ""], ["    {yellow Reason:} ", ""])), group.reason));
                    /** Log each log item in the failed group. */
                    if (this.enableLogging) {
                        for (var _m = 0, _o = group.logs; _m < _o.length; _m++) {
                            var log = _o[_m];
                            this.onLog(log);
                        }
                    }
                    inner: for (var _p = 0, _q = group.tests; _p < _q.length; _p++) {
                        var test_2 = _q[_p];
                        if (test_2.pass)
                            continue inner;
                        suite.stdout.write(chalk(templateObject_34 || (templateObject_34 = __makeTemplateObject(["    {red.bold \u274C ", "} - ", "\n"], ["    {red.bold \u274C ", "} - ", "\\n"])), test_2.name, test_2.message));
                        if (test_2.expected !== null)
                            suite.stdout.write(chalk(templateObject_35 || (templateObject_35 = __makeTemplateObject(["      {green.bold [Expected]:} ", "\n"], ["      {green.bold [Expected]:} ", "\\n"])), stringifyHostValue_4.stringifyHostValue(test_2.expected, 2).trimLeft()));
                        if (test_2.actual !== null)
                            suite.stdout.write(chalk(templateObject_36 || (templateObject_36 = __makeTemplateObject(["      {red.bold [Actual]  :} ", "\n"], ["      {red.bold [Actual]  :} ", "\\n"])), stringifyHostValue_4.stringifyHostValue(test_2.actual, 2).trimLeft()));
                        if (this.enableLogging) {
                            for (var _r = 0, _s = test_2.logs; _r < _s.length; _r++) {
                                var log = _s[_r];
                                this.onLog(log);
                            }
                        }
                    }
                }
            }
            for (var _t = 0, _u = suite.warnings; _t < _u.length; _t++) {
                var warning = _u[_t];
                this.stdout.write(chalk(templateObject_37 || (templateObject_37 = __makeTemplateObject(["{yellow  [Warning]}: ", " ", "\n"], ["{yellow  [Warning]}: ", " ", "\\n"])), warning.type, warning.message));
                this.stdout.write(chalk(templateObject_38 || (templateObject_38 = __makeTemplateObject(["{yellow    [Stack]}: {yellow ", "}\n\n"], ["{yellow    [Stack]}: {yellow ",
                    "}\\n\\n"])), warning.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            for (var _v = 0, _w = suite.errors; _v < _w.length; _v++) {
                var error = _w[_v];
                this.stdout.write(chalk(templateObject_39 || (templateObject_39 = __makeTemplateObject(["{red    [Error]}: ", " ", "\n"], ["{red    [Error]}: ", " ", "\\n"])), error.type, error.message));
                this.stdout.write(chalk(templateObject_40 || (templateObject_40 = __makeTemplateObject(["{red    [Stack]}: {yellow ", "}\n\n"], ["{red    [Stack]}: {yellow ",
                    "}\\n\\n"])), error.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
        };
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {HostValue} logValue - A value to be logged to the console
         */
        SummaryReporter.prototype.onLog = function (logValue) {
            var chalk = require("chalk");
            var output = stringifyHostValue_4.stringifyHostValue(logValue, 12).trimLeft();
            this.stdout.write(chalk(templateObject_41 || (templateObject_41 = __makeTemplateObject(["     {yellow [Log]:} ", "\n"], ["     {yellow [Log]:} ", "\\n"])), output));
        };
        return SummaryReporter;
    }(TestReporter_6.TestReporter));
    exports.default = SummaryReporter;
    var templateObject_30, templateObject_31, templateObject_32, templateObject_33, templateObject_34, templateObject_35, templateObject_36, templateObject_37, templateObject_38, templateObject_39, templateObject_40, templateObject_41;
});
define("index", ["require", "exports", "reporter/CombinationReporter", "reporter/CSVReporter", "reporter/EmptyReporter", "reporter/JSONReporter", "reporter/SummaryReporter", "reporter/VerboseReporter", "test/TestContext", "test/TestGroup", "test/TestReporter", "test/TestResult", "util/IPerformanceConfiguration", "util/HostValue"], function (require, exports, CombinationReporter_1, CSVReporter_1, EmptyReporter_1, JSONReporter_1, SummaryReporter_1, VerboseReporter_2, TestContext_1, TestGroup_2, TestReporter_7, TestResult_2, IPerformanceConfiguration_2, HostValue_2) {
    "use strict";
    function __export(m) {
        for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
    }
    Object.defineProperty(exports, "__esModule", { value: true });
    CombinationReporter_1 = __importDefault(CombinationReporter_1);
    CSVReporter_1 = __importDefault(CSVReporter_1);
    EmptyReporter_1 = __importDefault(EmptyReporter_1);
    JSONReporter_1 = __importDefault(JSONReporter_1);
    SummaryReporter_1 = __importDefault(SummaryReporter_1);
    VerboseReporter_2 = __importDefault(VerboseReporter_2);
    exports.CombinationReporter = CombinationReporter_1.default;
    exports.CSVReporter = CSVReporter_1.default;
    exports.EmptyReporter = EmptyReporter_1.default;
    exports.JSONReporter = JSONReporter_1.default;
    exports.SummaryReporter = SummaryReporter_1.default;
    exports.VerboseReporter = VerboseReporter_2.default;
    __export(TestContext_1);
    __export(TestGroup_2);
    __export(TestReporter_7);
    __export(TestResult_2);
    __export(IPerformanceConfiguration_2);
    __export(HostValue_2);
});
define("transform/createGenericTypeParameter", ["require", "exports", "assemblyscript"], function (require, exports, assemblyscript_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This method makes a generic named parameter.
     *
     * @param {string} name - The name of the type.
     * @param {Range} range - The range given for the type parameter.
     */
    function createGenericTypeParameter(name, range) {
        return assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName(name, range), null, false, range);
    }
    exports.createGenericTypeParameter = createGenericTypeParameter;
});
define("transform/createAddHostValueKeyValuePairsMember", ["require", "exports", "assemblyscript", "transform/createGenericTypeParameter"], function (require, exports, assemblyscript_2, createGenericTypeParameter_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    function createAddHostValueKeyValuePairsMember(classDeclaration) {
        var range = classDeclaration.name.range;
        // __aspectAddHostValueKeyValuePairs(hostObject: i32, seen: Map<usize, i32>): void
        return assemblyscript_2.TypeNode.createMethodDeclaration(assemblyscript_2.TypeNode.createIdentifierExpression("__aspectAddHostValueKeyValuePairs", range), null, assemblyscript_2.TypeNode.createFunctionType([
            // hostObject: i32
            assemblyscript_2.TypeNode.createParameter(assemblyscript_2.TypeNode.createIdentifierExpression("hostObject", range), createGenericTypeParameter_1.createGenericTypeParameter("i32", range), null, assemblyscript_2.ParameterKind.DEFAULT, range),
            // seen: Map<usize, i32>
            assemblyscript_2.TypeNode.createParameter(assemblyscript_2.TypeNode.createIdentifierExpression("seen", range), assemblyscript_2.TypeNode.createNamedType(assemblyscript_2.TypeNode.createSimpleTypeName("Map", range), [
                createGenericTypeParameter_1.createGenericTypeParameter("usize", range),
                createGenericTypeParameter_1.createGenericTypeParameter("i32", range),
            ], false, range), null, assemblyscript_2.ParameterKind.DEFAULT, range),
        ], assemblyscript_2.TypeNode.createNamedType(assemblyscript_2.TypeNode.createSimpleTypeName("void", range), [], false, range), null, false, range), createAddHostValueKeyValuePairsFunctionBody(classDeclaration), null, assemblyscript_2.CommonFlags.PUBLIC | assemblyscript_2.CommonFlags.INSTANCE | (classDeclaration.isGeneric ? assemblyscript_2.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createAddHostValueKeyValuePairsMember = createAddHostValueKeyValuePairsMember;
    function createAddHostValueKeyValuePairsFunctionBody(classDeclaration) {
        var body = new Array();
        var range = classDeclaration.name.range;
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            // if it's an instance member, and it isn't marked private or protected
            if (member.is(assemblyscript_2.CommonFlags.INSTANCE) && !member.is(assemblyscript_2.CommonFlags.PRIVATE | assemblyscript_2.CommonFlags.PROTECTED)) {
                switch (member.kind) {
                    // field declarations automatically get added
                    case assemblyscript_2.NodeKind.FIELDDECLARATION: {
                        var fieldDeclaration = member;
                        body.push(createPushHostObjectKeyStatement(member.name.text, fieldDeclaration.range));
                        body.push(createPushHostObjectValueStatement(member.name.text, fieldDeclaration.range));
                        break;
                    }
                    // function declarations can be getters, check the get flag
                    case assemblyscript_2.NodeKind.FUNCTIONDECLARATION: {
                        if (member.is(assemblyscript_2.CommonFlags.GET)) {
                            var functionDeclaration = member;
                            body.push(createPushHostObjectKeyStatement(functionDeclaration.name.text, functionDeclaration.range));
                            body.push(createPushHostObjectValueStatement(functionDeclaration.name.text, functionDeclaration.range));
                        }
                        break;
                    }
                }
            }
        }
        return assemblyscript_2.TypeNode.createBlockStatement(body, range);
    }
    // __aspectPushHostObjectKey
    function createPushHostObjectKeyStatement(name, range) {
        // __aspectPushHostObjectKey(hostObject, Reflect.toHostValue("propertyName", seen));
        return assemblyscript_2.TypeNode.createExpressionStatement(assemblyscript_2.TypeNode.createCallExpression(assemblyscript_2.TypeNode.createIdentifierExpression("__aspectPushHostObjectKey", range), null, [
            // hostObject
            assemblyscript_2.TypeNode.createIdentifierExpression("hostObject", range),
            // Reflect.toHostValue("propertyName", seen)
            assemblyscript_2.TypeNode.createCallExpression(
            // Reflect.toHostValue
            assemblyscript_2.TypeNode.createPropertyAccessExpression(assemblyscript_2.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_2.TypeNode.createIdentifierExpression("toHostValue", range), range), null, [
                assemblyscript_2.TypeNode.createStringLiteralExpression(name, range),
                assemblyscript_2.TypeNode.createIdentifierExpression("seen", range),
            ], range),
        ], range));
    }
    function createPushHostObjectValueStatement(name, range) {
        // __aspectPushHostObjectValue(hostObject, Reflect.toHostValue(this.propertyName, seen));
        return assemblyscript_2.TypeNode.createExpressionStatement(
        // __aspectPushHostObjectValue(hostObject, Reflect.toHostValue(this.propertyName, seen))
        assemblyscript_2.TypeNode.createCallExpression(
        // __aspectPushHostObjectValue
        assemblyscript_2.TypeNode.createIdentifierExpression("__aspectPushHostObjectValue", range), null, [
            // hostObject
            assemblyscript_2.TypeNode.createIdentifierExpression("hostObject", range),
            // Reflect.toHostValue(this.propertyName, seen))
            assemblyscript_2.TypeNode.createCallExpression(
            // Reflect.toHostValue
            assemblyscript_2.TypeNode.createPropertyAccessExpression(assemblyscript_2.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_2.TypeNode.createIdentifierExpression("toHostValue", range), range), null, [
                //this.propertyName
                assemblyscript_2.TypeNode.createPropertyAccessExpression(assemblyscript_2.TypeNode.createThisExpression(range), assemblyscript_2.TypeNode.createIdentifierExpression(name, range), range),
                // seen
                assemblyscript_2.TypeNode.createIdentifierExpression("seen", range),
            ], range),
        ], range));
    }
});
define("transform/createStrictEqualsMember", ["require", "exports", "assemblyscript", "transform/createGenericTypeParameter"], function (require, exports, assemblyscript_3, createGenericTypeParameter_2) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * This method creates a single FunctionDeclaration that allows Reflect.equals
     * to validate normal class member values.
     *
     * @param {ClassDeclaration} classDeclaration - The class that requires a new function.
     */
    function createStrictEqualsMember(classDeclaration) {
        var range = classDeclaration.name.range;
        // __aspectStrictEquals(ref: T, stackA: usize[], stackB: usize[]): bool
        return assemblyscript_3.TypeNode.createMethodDeclaration(assemblyscript_3.TypeNode.createIdentifierExpression("__aspectStrictEquals", range), [assemblyscript_3.TypeNode.createTypeParameter(assemblyscript_3.TypeNode.createIdentifierExpression("T", range), null, null, range)], assemblyscript_3.TypeNode.createFunctionType([
            // ref: T,
            createDefaultParameter("ref", createGenericTypeParameter_2.createGenericTypeParameter("T", range), range),
            // stack: usize[]
            createDefaultParameter("stack", createUsizeArrayType(range), range),
            // cache: usize[]
            createDefaultParameter("cache", createUsizeArrayType(range), range),
        ], 
        // : bool
        createSimpleNamedType("bool", range), null, false, range), createStrictEqualsFunctionBody(classDeclaration), null, assemblyscript_3.CommonFlags.PUBLIC | assemblyscript_3.CommonFlags.INSTANCE | assemblyscript_3.CommonFlags.GENERIC | (classDeclaration.isGeneric ? assemblyscript_3.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createStrictEqualsMember = createStrictEqualsMember;
    /**
     * This method creates a simple name type with the given name and source range.
     *
     * @param {string} name - The name of the type.
     * @param {Range} range - The given source range.
     */
    function createSimpleNamedType(name, range) {
        return assemblyscript_3.TypeNode.createNamedType(assemblyscript_3.TypeNode.createSimpleTypeName(name, range), null, false, range);
    }
    /**
     * This method creates an Array<usize> type with the given range.
     *
     * @param {Range} range - The source range.
     */
    function createUsizeArrayType(range) {
        return assemblyscript_3.TypeNode.createNamedType(assemblyscript_3.TypeNode.createSimpleTypeName("Array", range), [
            assemblyscript_3.TypeNode.createNamedType(assemblyscript_3.TypeNode.createSimpleTypeName("usize", range), null, false, range),
        ], false, range);
    }
    /**
     * This method creates the entire function body for __aspectStrictEquals.
     *
     * @param {ClassDeclaration} classDeclaration - The class declaration.
     */
    function createStrictEqualsFunctionBody(classDeclaration) {
        var body = new Array();
        var range = classDeclaration.name.range;
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            // if it's an instance member, and it isn't marked private or protected
            if (member.is(assemblyscript_3.CommonFlags.INSTANCE) && !member.is(assemblyscript_3.CommonFlags.PRIVATE | assemblyscript_3.CommonFlags.PROTECTED)) {
                switch (member.kind) {
                    // field declarations automatically get added
                    case assemblyscript_3.NodeKind.FIELDDECLARATION: {
                        var fieldDeclaration = member;
                        body.push(createStrictEqualsIfCheck(member.name.text, fieldDeclaration.range));
                        break;
                    }
                    // function declarations can be getters, check the get flag
                    case assemblyscript_3.NodeKind.FUNCTIONDECLARATION: {
                        if (member.is(assemblyscript_3.CommonFlags.GET)) {
                            var functionDeclaration = member;
                            body.push(createStrictEqualsIfCheck(functionDeclaration.name.text, functionDeclaration.range));
                        }
                        break;
                    }
                }
            }
        }
        // return true;
        body.push(assemblyscript_3.TypeNode.createReturnStatement(assemblyscript_3.TypeNode.createTrueExpression(range), range));
        return assemblyscript_3.TypeNode.createBlockStatement(body, range);
    }
    /**
     * This function generates a single IfStatement with a nested ReturnStatement
     * to validate a nested property on a given class.
     *
     * @param {string} name - The name of the property.
     * @param {Range} range - The source range for the given property.
     */
    function createStrictEqualsIfCheck(name, range) {
        // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH) return false;
        return assemblyscript_3.TypeNode.createIfStatement(
        // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH
        assemblyscript_3.TypeNode.createBinaryExpression(assemblyscript_3.Token.EQUALS_EQUALS_EQUALS, 
        // Reflect.equals(this.prop, ref.prop, stack, cache)
        assemblyscript_3.TypeNode.createCallExpression(
        // Reflect.equals
        createPropertyAccess("Reflect", "equals", range), null, // types can be inferred by the compiler!
        // arguments
        [
            // this.prop
            assemblyscript_3.TypeNode.createPropertyAccessExpression(assemblyscript_3.TypeNode.createThisExpression(range), assemblyscript_3.TypeNode.createIdentifierExpression(name, range), range),
            // ref.prop
            createPropertyAccess("ref", name, range),
            // stack
            assemblyscript_3.TypeNode.createIdentifierExpression("stack", range),
            // cache
            assemblyscript_3.TypeNode.createIdentifierExpression("cache", range),
        ], range), createPropertyAccess("Reflect", "FAILED_MATCH", range), range), 
        // return false;
        assemblyscript_3.TypeNode.createReturnStatement(assemblyscript_3.TypeNode.createFalseExpression(range), range), null, range);
    }
    /**
     * Create a simple default parameter with a name and a type.
     *
     * @param {string} name - The name of the parameter.
     * @param {TypeNode} typeNode - The type of the parameter.
     * @param {Range} range - The source range of the parameter.
     */
    function createDefaultParameter(name, typeNode, range) {
        return assemblyscript_3.TypeNode.createParameter(assemblyscript_3.TypeNode.createIdentifierExpression(name, range), typeNode, null, assemblyscript_3.ParameterKind.DEFAULT, range);
    }
    /**
     * This method creates a single property access and passes the given range to the AST.
     *
     * @param {string} root - The name of the identifier representing the root.
     * @param {string} property - The name of the identifier representing the property.
     * @param {Range} range - The range of the property access.
     */
    function createPropertyAccess(root, property, range) {
        // root.property
        return assemblyscript_3.TypeNode.createPropertyAccessExpression(assemblyscript_3.TypeNode.createIdentifierExpression(root, range), assemblyscript_3.TypeNode.createIdentifierExpression(property, range), range);
    }
});
define("transform/index", ["require", "exports", "assemblyscript/cli/transform", "assemblyscript", "transform/createStrictEqualsMember", "transform/createAddHostValueKeyValuePairsMember"], function (require, exports, transform_1, assemblyscript_4, createStrictEqualsMember_1, createAddHostValueKeyValuePairsMember_1) {
    "use strict";
    return /** @class */ (function (_super) {
        __extends(AspectTransform, _super);
        function AspectTransform() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        /**
         * This method results in a pure AST transform that inserts a strictEquals member
         * into each ClassDeclaration.
         *
         * @param {Parser} parser - The AssemblyScript parser.
         */
        AspectTransform.prototype.afterParse = function (parser) {
            // for each program source
            for (var _i = 0, _a = parser.program.sources; _i < _a.length; _i++) {
                var source = _a[_i];
                // for each statement in the source
                for (var _b = 0, _c = source.statements; _b < _c.length; _b++) {
                    var statement = _c[_b];
                    // find each class declaration
                    if (statement.kind === assemblyscript_4.NodeKind.CLASSDECLARATION) {
                        // cast and create a strictEquals function
                        var classDeclaration = statement;
                        classDeclaration.members.push(createStrictEqualsMember_1.createStrictEqualsMember(classDeclaration));
                        classDeclaration.members.push(createAddHostValueKeyValuePairsMember_1.createAddHostValueKeyValuePairsMember(classDeclaration));
                    }
                }
            }
        };
        return AspectTransform;
    }(transform_1.Transform));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYXMtcGVjdC5jb3JlLmFtZC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uL3NyYy90ZXN0L0lXYXJuaW5nLnRzIiwiLi4vc3JjL3V0aWwvSG9zdFZhbHVlLnRzIiwiLi4vc3JjL3V0aWwvSUxvZ1RhcmdldC50cyIsIi4uL3NyYy90ZXN0L1BlcmZvcm1hbmNlTGltaXRzLnRzIiwiLi4vc3JjL21hdGgvbWVhbi50cyIsIi4uL3NyYy9tYXRoL3JvdW5kLnRzIiwiLi4vc3JjL21hdGgvbWVkaWFuLnRzIiwiLi4vc3JjL21hdGgvdmFyaWFuY2UudHMiLCIuLi9zcmMvdGVzdC9UZXN0UmVzdWx0LnRzIiwiLi4vc3JjL3Rlc3QvVGVzdEdyb3VwLnRzIiwiLi4vc3JjL3V0aWwvSVdyaXRlYWJsZS50cyIsIi4uL3NyYy9yZXBvcnRlci91dGlsL3N0cmluZ2lmeUhvc3RWYWx1ZS50cyIsIi4uL3NyYy9yZXBvcnRlci9WZXJib3NlUmVwb3J0ZXIudHMiLCIuLi9zcmMvdXRpbC90aW1lRGlmZmVyZW5jZS50cyIsIi4uL3NyYy91dGlsL0lBc3BlY3RFeHBvcnRzLnRzIiwiLi4vc3JjL3V0aWwvSVBlcmZvcm1hbmNlQ29uZmlndXJhdGlvbi50cyIsIi4uL3NyYy91dGlsL3dhc21Ub29scy50cyIsIi4uL3NyYy90ZXN0L1Rlc3RDb2xsZWN0b3IudHMiLCIuLi9zcmMvdGVzdC9UZXN0Q29udGV4dC50cyIsIi4uL3NyYy90ZXN0L1Rlc3RSZXBvcnRlci50cyIsIi4uL3NyYy9yZXBvcnRlci9Db21iaW5hdGlvblJlcG9ydGVyLnRzIiwiLi4vc3JjL3JlcG9ydGVyL0NTVlJlcG9ydGVyLnRzIiwiLi4vc3JjL3JlcG9ydGVyL0VtcHR5UmVwb3J0ZXIudHMiLCIuLi9zcmMvcmVwb3J0ZXIvSlNPTlJlcG9ydGVyLnRzIiwiLi4vc3JjL3JlcG9ydGVyL1N1bW1hcnlSZXBvcnRlci50cyIsIi4uL3NyYy9pbmRleC50cyIsIi4uL3NyYy90cmFuc2Zvcm0vY3JlYXRlR2VuZXJpY1R5cGVQYXJhbWV0ZXIudHMiLCIuLi9zcmMvdHJhbnNmb3JtL2NyZWF0ZUFkZEhvc3RWYWx1ZUtleVZhbHVlUGFpcnNNZW1iZXIudHMiLCIuLi9zcmMvdHJhbnNmb3JtL2NyZWF0ZVN0cmljdEVxdWFsc01lbWJlci50cyIsIi4uL3NyYy90cmFuc2Zvcm0vaW5kZXgudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQ0VBO1FBQUE7WUFDRSxTQUFJLGdCQUFxQztZQUN6QyxhQUFRLEdBQWtCLElBQUksQ0FBQztZQUMvQixZQUFPLEdBQVcsQ0FBQyxDQUFDO1lBQ3BCLFdBQU0sR0FBVyxDQUFDLENBQUM7WUFDbkIsU0FBSSxHQUF1QixJQUFJLENBQUM7WUFDaEMsV0FBTSxHQUF1QixJQUFJLENBQUM7WUFDbEMsV0FBTSxHQUFXLENBQUMsQ0FBQztZQUNuQixVQUFLLEdBQW9CLENBQUMsQ0FBQztZQUMzQixXQUFNLEdBQVksS0FBSyxDQUFDO1lBQ3hCLGFBQVEsR0FBWSxLQUFLLENBQUM7WUFDMUIsU0FBSSxHQUFXLENBQUMsQ0FBQztZQUNqQixXQUFNLEdBQVksS0FBSyxDQUFDO1lBQ3hCLFVBQUssR0FBVyxFQUFFLENBQUM7WUFDbkIsWUFBTyxHQUFZLEtBQUssQ0FBQztRQUMzQixDQUFDO1FBQUQsZ0JBQUM7SUFBRCxDQUFDLEFBZkQsSUFlQztJQWZZLDhCQUFTOzs7Ozs7Ozs7Ozs7O0lHRnRCOzs7OztPQUtHO0lBQ0gsU0FBZ0IsSUFBSSxDQUFDLEtBQWU7UUFDbEMsSUFBSSxLQUFLLENBQUMsTUFBTSxLQUFLLENBQUM7WUFBRSxPQUFPLENBQUMsQ0FBQztRQUNqQyxJQUFJLEdBQUcsR0FBRyxDQUFDLENBQUM7UUFDWixLQUFLLElBQUksQ0FBQyxHQUFHLENBQUMsRUFBRSxDQUFDLEdBQUcsS0FBSyxDQUFDLE1BQU0sRUFBRSxDQUFDLEVBQUUsRUFBRTtZQUNyQyxHQUFHLElBQUksS0FBSyxDQUFDLENBQUMsQ0FBQyxDQUFDO1NBQ2pCO1FB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QUFDLEdBQUcsQ0FBQyxDQUFDLENBQUMsS0FBSyxDQUFDLENBQUMsQ0FBQyxTQUFTO2dCQUM5QixNQUFNLENBQUMsSUFBSTtnQkFDWCxNQUFNLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsQ0FBQyxDQUFDLE1BQU07Z0JBQzdCLE1BQU0sQ0FBQyxPQUFPLENBQUMsUUFBUSxFQUFFO2dCQUN6QixNQUFNLENBQUMsT0FBTztnQkFDZCxNQUFNLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyx1Q0FBa0IsQ0FBQyxNQUFNLENBQUMsTUFBTSxFQUFFLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxFQUFFO2dCQUN6RCxNQUFNLENBQUMsUUFBUSxDQUFDLENBQUMsQ0FBQyx1Q0FBa0IsQ0FBQyxNQUFNLENBQUMsUUFBUSxFQUFFLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxFQUFFO2dCQUM3RCxNQUFNLENBQUMsVUFBVSxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsT0FBTyxDQUFDLFFBQVEsRUFBRSxDQUFDLENBQUMsQ0FBQyxFQUFFO2dCQUNsRCxNQUFNLENBQUMsU0FBUyxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsTUFBTSxDQUFDLFFBQVEsRUFBRSxDQUFDLENBQUMsQ0FBQyxFQUFFO2dCQUNoRCxNQUFNLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsR0FBRyxDQUFDLFFBQVEsRUFBRSxDQUFDLENBQUMsQ0FBQyxFQUFFO2dCQUMxQyxNQUFNLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsR0FBRyxDQUFDLFFBQVEsRUFBRSxDQUFDLENBQUMsQ0FBQyxFQUFFO2dCQUMxQyxNQUFNLENBQUMsU0FBUyxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsTUFBTSxDQUFDLFFBQVEsRUFBRSxDQUFDLENBQUMsQ0FBQyxFQUFFO2dCQUNoRCxNQUFNLENBQUMsV0FBVyxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsUUFBUSxDQUFDLFFBQVEsRUFBRSxDQUFDLENBQUMs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