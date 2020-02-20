"use strict";
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
var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __spreadArrays = (this && this.__spreadArrays) || function () {
    for (var s = 0, i = 0, il = arguments.length; i < il; i++) s += arguments[i].length;
    for (var r = Array(s), k = 0, i = 0; i < il; i++)
        for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++)
            r[k] = a[j];
    return r;
};
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
define("test/IWarning", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
});
define("util/stringifyHostValue", ["require", "exports", "chalk"], function (require, exports, chalk_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_1 = __importDefault(chalk_1);
    var StringifyContext = /** @class */ (function () {
        function StringifyContext() {
            this.level = 0;
            this.impliedTypeInfo = false;
            this.seen = new WeakSet();
            this.keywordFormatter = chalk_1.default.yellow;
            this.stringFormatter = chalk_1.default.cyan;
            this.classNameFormatter = chalk_1.default.green;
            this.numberFormatter = chalk_1.default.white;
            this.indent = 0;
            this.maxPropertyCount = 50;
            this.maxLineLength = 80;
            this.tab = 4;
        }
        return StringifyContext;
    }());
    function stringifyHostValue(hostValue, props) {
        var _a, _b, _c, _d, _e, _f, _g;
        var context = new StringifyContext();
        context.keywordFormatter = (_a = props.keywordFormatter, (_a !== null && _a !== void 0 ? _a : context.keywordFormatter));
        context.stringFormatter = (_b = props.stringFormatter, (_b !== null && _b !== void 0 ? _b : context.stringFormatter));
        context.classNameFormatter = (_c = props.classNameFormatter, (_c !== null && _c !== void 0 ? _c : context.classNameFormatter));
        context.numberFormatter = (_d = props.numberFormatter, (_d !== null && _d !== void 0 ? _d : context.numberFormatter));
        context.indent = (_e = props.indent, (_e !== null && _e !== void 0 ? _e : context.indent));
        context.tab = (_f = props.tab, (_f !== null && _f !== void 0 ? _f : context.tab));
        context.maxPropertyCount = (_g = props.maxPropertyCount, (_g !== null && _g !== void 0 ? _g : context.maxPropertyCount));
        return formatters[formatterIndexFor(hostValue.type, 0 /* Expanded */)](hostValue, context);
    }
    exports.stringifyHostValue = stringifyHostValue;
    var formatters = [];
    var emptyFormatter = function () { return ""; };
    for (var i = 0; i < 14 * 4; i++)
        formatters.push(emptyFormatter);
    var formatterIndexFor = function (valueType, type) { return valueType * 4 + type; };
    var falsyFormatter = function (hostValue) {
        return (hostValue.negated ? "Not " : "") + "Falsy";
    };
    formatters[formatterIndexFor(14 /* Falsy */, 0 /* Expanded */)] = falsyFormatter;
    var truthyFormatter = function (hostValue) {
        return (hostValue.negated ? "Not " : "") + "Truthy";
    };
    formatters[formatterIndexFor(13 /* Truthy */, 0 /* Expanded */)] = truthyFormatter;
    var finiteFormatter = function (hostValue) {
        return (hostValue.negated ? "Not " : "") + "Finite";
    };
    formatters[formatterIndexFor(12 /* Finite */, 0 /* Expanded */)] = finiteFormatter;
    function displayBooleanNoSpacing(hostValue, ctx) {
        return ctx.keywordFormatter(hostValue.value === 1 ? "true" : "false");
    }
    function displayBooleanWithSpacing(hostValue, ctx) {
        return (" ".repeat(ctx.indent + ctx.tab * ctx.level) +
            ctx.keywordFormatter(hostValue.value === 1 ? "true" : "false"));
    }
    // Booleans
    formatters[formatterIndexFor(9 /* Boolean */, 0 /* Expanded */)] = displayBooleanWithSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 1 /* Inline */)] = displayBooleanNoSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 2 /* Key */)] = displayBooleanWithSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 3 /* Value */)] = displayBooleanNoSpacing;
    function displayClassNoSpacing(hostValue, ctx) {
        return ctx.classNameFormatter("[" + hostValue.typeName + "]");
    }
    function displayNumberWithSpacing(hostValue, ctx) {
        var numericString = hostValue.value.toString();
        if (hostValue.type === 8 /* Float */ &&
            !/\.[0-9]/.test(numericString)) {
            numericString += ".0";
        }
        if (ctx.impliedTypeInfo ||
            hostValue.typeName === "i32" ||
            hostValue.typeName === "f64") {
            return (" ".repeat(ctx.indent + ctx.level * ctx.tab) +
                ctx.numberFormatter(numericString));
        }
        return (" ".repeat(ctx.indent + ctx.level * ctx.tab) +
            (ctx.numberFormatter(numericString) + " " + ctx.keywordFormatter("as") + " " + ctx.classNameFormatter(hostValue.typeName)));
    }
    function displayNumberNoSpacing(hostValue, ctx) {
        var numericString = hostValue.value.toString();
        if (hostValue.type === 8 /* Float */ &&
            !/\.[0-9]/.test(numericString)) {
            numericString += ".0";
        }
        if (ctx.impliedTypeInfo ||
            hostValue.typeName === "i32" ||
            hostValue.typeName === "f64") {
            return ctx.numberFormatter(numericString);
        }
        return ctx.numberFormatter(numericString) + " " + ctx.classNameFormatter("as " + hostValue.typeName);
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
        return ctx.stringFormatter("\"" + hostValue.value.toString().replace(/"/g, '\\"') + "\"");
    }
    function displayStringWithSpacing(hostValue, ctx) {
        return (" ".repeat(ctx.indent + ctx.level * ctx.tab) +
            ctx.stringFormatter("\"" + hostValue.value.toString().replace(/"/g, '\\"') + "\""));
    }
    function displayNoQuoteStringWithSpacing(hostValue, ctx) {
        return (" ".repeat(ctx.indent + ctx.level * ctx.tab) +
            ctx.stringFormatter("" + hostValue.value.toString().replace(/"/g, '\\"')));
    }
    // Strings
    formatters[formatterIndexFor(2 /* String */, 0 /* Expanded */)] = displayStringWithSpacing;
    formatters[formatterIndexFor(2 /* String */, 1 /* Inline */)] = displayStringNoSpacing;
    formatters[formatterIndexFor(2 /* String */, 2 /* Key */)] = displayNoQuoteStringWithSpacing;
    formatters[formatterIndexFor(2 /* String */, 3 /* Value */)] = displayStringNoSpacing;
    function displayFunctionExpanded(hostValue, ctx) {
        return (" ".repeat(ctx.indent + ctx.level * ctx.tab) +
            ctx.classNameFormatter("[Function " + hostValue.pointer + ": " + hostValue.value.toString() + "]"));
    }
    var displayFuncNoNameNoPointer = function (_, ctx) {
        return ctx.classNameFormatter("[Function]");
    };
    function displayFunctionKey(_, ctx) {
        return (" ".repeat(ctx.indent + ctx.level * ctx.tab) +
            ctx.classNameFormatter("[Function]"));
    }
    function displayFunctionValue(hostValue, ctx) {
        return ctx.classNameFormatter("[Function " + hostValue.pointer + ": " + hostValue.value.toString() + "]");
    }
    // Functions
    formatters[formatterIndexFor(6 /* Function */, 0 /* Expanded */)] = displayFunctionExpanded;
    formatters[formatterIndexFor(6 /* Function */, 1 /* Inline */)] = displayFuncNoNameNoPointer;
    formatters[formatterIndexFor(6 /* Function */, 2 /* Key */)] = displayFunctionKey;
    formatters[formatterIndexFor(6 /* Function */, 3 /* Value */)] = displayFunctionValue;
    function displayClassExpanded(hostValue, ctx) {
        var spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
        if (ctx.seen.has(hostValue))
            return spacing + ctx.classNameFormatter("[Circular Reference]");
        ctx.impliedTypeInfo = false;
        var previousImpliedTypeInfo = ctx.impliedTypeInfo;
        if (hostValue.isNull) {
            if (previousImpliedTypeInfo)
                return spacing + "null";
            return "" + spacing + ctx.classNameFormatter("<" + hostValue.typeName + ">") + "null";
        }
        ctx.seen.add(hostValue);
        var body = "\n";
        ctx.level += 1;
        var length = Math.min(hostValue.keys.length, ctx.maxPropertyCount);
        for (var i = 0; i < length; i++) {
            var key = hostValue.keys[i];
            var keyString = formatters[formatterIndexFor(key.type, 2 /* Key */)](key, ctx);
            var value = hostValue.values[i];
            var valueString = ctx.level < 5
                ? // render expanded value, but trim the whitespace on the left side
                    formatters[formatterIndexFor(value.type, 0 /* Expanded */)](value, ctx).trimLeft()
                : // render value
                    formatters[formatterIndexFor(value.type, 3 /* Value */)](value, ctx);
            if (i === length - 1) {
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
        ctx.seen.delete(hostValue);
        if (previousImpliedTypeInfo)
            return spacing + "{" + body + spacing + "}";
        return "" + spacing + ctx.classNameFormatter(hostValue.typeName) + " {" + body + spacing + "}";
    }
    function displayClassWithSpacing(hostValue, ctx) {
        return "" + " ".repeat(ctx.level * ctx.tab + ctx.indent) + ctx.classNameFormatter("[" + hostValue.typeName + "]");
    }
    // Classes
    formatters[formatterIndexFor(1 /* Class */, 0 /* Expanded */)] = displayClassExpanded;
    formatters[formatterIndexFor(1 /* Class */, 1 /* Inline */)] = displayClassNoSpacing;
    formatters[formatterIndexFor(1 /* Class */, 2 /* Key */)] = displayClassWithSpacing;
    formatters[formatterIndexFor(1 /* Class */, 3 /* Value */)] = displayClassExpanded;
    function displayArrayExpanded(hostValue, ctx) {
        var spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
        if (ctx.seen.has(hostValue))
            return spacing + ctx.classNameFormatter("[Circular Reference]");
        ctx.seen.add(hostValue);
        var previousImpliedTypeInfo = ctx.impliedTypeInfo;
        ctx.impliedTypeInfo = true;
        if (ctx.level < 5 && hostValue.type === 10 /* Array */) {
            // expanded only for arrays
            var body = "\n";
            ctx.level += 1;
            var length_1 = Math.min(hostValue.values.length, ctx.maxPropertyCount);
            for (var i = 0; i < length_1; i++) {
                var value = hostValue.values[i];
                // render expanded value, but trim the whitespace on the left side
                var valueString = formatters[formatterIndexFor(value.type, 0 /* Expanded */)](value, ctx);
                if (i === length_1 - 1) {
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
            ctx.seen.delete(hostValue);
            if (previousImpliedTypeInfo)
                return spacing + "[" + body + spacing + "]";
            return "" + spacing + ctx.classNameFormatter("" + hostValue.typeName) + " [" + body + spacing + "]";
        }
        else {
            // inline
            var body = spacing;
            if (!previousImpliedTypeInfo)
                body += ctx.classNameFormatter(hostValue.typeName) + " ";
            body += "[";
            var i = 0;
            var length_2 = hostValue.values.length;
            for (; i < length_2; i++) {
                var value = hostValue.values[i];
                var result = formatters[formatterIndexFor(value.type, 1 /* Inline */)](value, ctx) + ", ";
                if (body.length > ctx.maxLineLength) {
                    break;
                }
                body += result;
            }
            if (length_2 - i > 0)
                body += "... +" + (length_2 - i) + " items";
            body += "]";
            ctx.impliedTypeInfo = previousImpliedTypeInfo;
            ctx.seen.delete(hostValue);
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
});
define("util/HostValue", ["require", "exports", "util/stringifyHostValue"], function (require, exports, stringifyHostValue_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * A JavaScript object that represents a reflected value from the as-pect testing
     * module.
     */
    var HostValue = /** @class */ (function () {
        function HostValue() {
            /** An indicator if the reflected object was managed by the runtime. */
            this.isManaged = false;
            /** An indicator if the reflected object was null. */
            this.isNull = false;
            /** A set of keys for Maps or Classes in the reflected object. */
            this.keys = null;
            /** Used to indicate if an expected assertion value was negated. */
            this.negated = false;
            /** An indicator wether the reflected object was in a nullable context. */
            this.nullable = false;
            /** The size of the heap allocation for a given class. */
            this.offset = 0;
            /** The pointer to the value in the module. */
            this.pointer = 0;
            /** An indicator if a number was signed. */
            this.signed = false;
            /** The size of an array, or the byte size of a number. */
            this.size = 0;
            /** A stack trace for the given value. */
            this.stack = "";
            /** The host value type. */
            this.type = 0 /* None */;
            /** The runtime class id for the reflected host value. */
            this.typeId = 0;
            /** The name of the class for a given reflected host value. */
            this.typeName = null;
            /** A string or number representing the host value. */
            this.value = 0;
            /** A set of values that are contained in a given reflected Set, Map, or Class object. */
            this.values = null;
        }
        /**
         * Stringify the HostValue with custom formatting.
         *
         * @param {Partial<StringifyHostValueProps>} props - The stringify configuration
         */
        HostValue.prototype.stringify = function (props) {
            if (props === void 0) { props = {}; }
            return stringifyHostValue_1.stringifyHostValue(this, props);
        };
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
define("reporter/VerboseReporter", ["require", "exports", "test/TestReporter"], function (require, exports, TestReporter_1) {
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
                this.stdout.write(chalk(templateObject_1 || (templateObject_1 = __makeTemplateObject(["[Describe]: ", "\n\n"], ["[Describe]: ", "\\n\\n"])), group.name));
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
                    : chalk(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                        "}"])), (test.rtraceDelta > 0 ? "+" : "-") +
                        test.rtraceDelta.toString());
                this.stdout.write(test.negated
                    ? chalk(templateObject_3 || (templateObject_3 = __makeTemplateObject([" {green  [Throws]: \u2714} ", " ", "\n"], [" {green  [Throws]: \u2714} ", " ", "\\n"])), test.name, rtraceDelta) : chalk(templateObject_4 || (templateObject_4 = __makeTemplateObject([" {green [Success]: \u2714} ", " ", "\n"], [" {green [Success]: \u2714} ", " ", "\\n"])), test.name, rtraceDelta));
            }
            else {
                this.stdout.write(chalk(templateObject_5 || (templateObject_5 = __makeTemplateObject(["    {red [Fail]: \u2716} ", "\n"], ["    {red [Fail]: \u2716} ", "\\n"])), test.name));
                if (!test.negated) {
                    this.stdout.write("  [Actual]: " + test.actual.stringify({ indent: 2 }) + "\n[Expected]: " + test.expected.stringify({ indent: 2 }) + "\n");
                }
                if (test.message) {
                    this.stdout.write(chalk(templateObject_6 || (templateObject_6 = __makeTemplateObject([" [Message]: {yellow ", "}\n"], [" [Message]: {yellow ", "}\\n"])), test.message));
                }
                if (test.stack) {
                    this.stdout.write("   [Stack]: " + test.stack.split("\n").join("\n           ") + "\n");
                }
            }
            /** If performance mode was enabled for this test, report the statistics. */
            if (test.performance) {
                this.stdout.write(chalk(templateObject_7 || (templateObject_7 = __makeTemplateObject([" {yellow [Samples]}: ", " runs\n"], [" {yellow [Samples]}: ", " runs\\n"])), test.times.length.toString()));
                if (test.hasAverage) {
                    this.stdout.write(chalk(templateObject_8 || (templateObject_8 = __makeTemplateObject(["    {yellow [Mean]}: ", "ms\n"], ["    {yellow [Mean]}: ", "ms\\n"])), test.average.toString()));
                }
                if (test.hasMedian) {
                    this.stdout.write(chalk(templateObject_9 || (templateObject_9 = __makeTemplateObject(["  {yellow [Median]}: ", "ms\n"], ["  {yellow [Median]}: ", "ms\\n"])), test.median.toString()));
                }
                if (test.hasVariance) {
                    this.stdout.write(chalk(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{yellow [Variance]}: ", "ms\n"], ["{yellow [Variance]}: ", "ms\\n"])), test.variance.toString()));
                }
                if (test.hasStdDev) {
                    this.stdout.write(chalk(templateObject_11 || (templateObject_11 = __makeTemplateObject(["  {yellow [StdDev]}: ", "ms\n"], ["  {yellow [StdDev]}: ", "ms\\n"])), test.stdDev.toString()));
                }
                if (test.hasMax) {
                    this.stdout.write(chalk(templateObject_12 || (templateObject_12 = __makeTemplateObject(["     {yellow [Max]}: ", "ms\n"], ["     {yellow [Max]}: ", "ms\\n"])), test.max.toString()));
                }
                if (test.hasMin) {
                    this.stdout.write(chalk(templateObject_13 || (templateObject_13 = __makeTemplateObject(["     {yellow [Min]}: ", "ms\n"], ["     {yellow [Min]}: ", "ms\\n"])), test.min.toString()));
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
            var result = suite.pass ? chalk(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk(templateObject_15 || (templateObject_15 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
            var count = suite.testGroups
                .map(function (e) { return e.tests.length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var successCount = suite.testGroups
                .map(function (e) { return e.tests.filter(function (f) { return f.pass; }).length; })
                .reduce(function (a, b) { return a + b; }, 0);
            var fail = count === successCount
                ? "0 fail"
                : chalk(templateObject_16 || (templateObject_16 = __makeTemplateObject(["{red ", " fail}"], ["{red ", " fail}"])), (count - successCount).toString());
            var rtcount = suite.allocationCount - suite.freeCount;
            var rtraceDelta = rtcount === 0
                ? ""
                : chalk(templateObject_17 || (templateObject_17 = __makeTemplateObject(["{yellow RTrace: ", "}"], ["{yellow RTrace: ",
                    "}"])), (rtcount > 0 ? "+" : "-") +
                    rtcount.toString());
            for (var _i = 0, _a = suite.warnings; _i < _a.length; _i++) {
                var warning = _a[_i];
                this.stdout.write(chalk(templateObject_18 || (templateObject_18 = __makeTemplateObject(["\n{yellow  [Warning]}: ", " ", ""], ["\\n{yellow  [Warning]}: ", " ", ""])), warning.type, warning.message));
                this.stdout.write(chalk(templateObject_19 || (templateObject_19 = __makeTemplateObject(["\n{yellow    [Stack]}: {yellow ", "}\n"], ["\\n{yellow    [Stack]}: {yellow ",
                    "}\\n"])), warning.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            for (var _b = 0, _c = suite.errors; _b < _c.length; _b++) {
                var error = _c[_b];
                this.stdout.write(chalk(templateObject_20 || (templateObject_20 = __makeTemplateObject(["\n{red    [Error]}: ", " ", ""], ["\\n{red    [Error]}: ", " ", ""])), error.type, error.message));
                this.stdout.write(chalk(templateObject_21 || (templateObject_21 = __makeTemplateObject(["\n{red    [Stack]}: {yellow ", "}\n"], ["\\n{red    [Stack]}: {yellow ",
                    "}\\n"])), error.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            this.stdout.write(chalk(templateObject_22 || (templateObject_22 = __makeTemplateObject(["", "\n\n    [File]: ", " ", "\n  [Groups]: {green ", " pass}, ", " total\n  [Result]: ", "\n [Summary]: {green ", " pass},  ", ", ", " total\n [Startup]: ", "ms\n    [Time]: ", "ms\n\n"], ["",
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
            this.stdout.write(chalk(templateObject_23 || (templateObject_23 = __makeTemplateObject(["    {yellow [Todo]:} ", "\n"], ["    {yellow [Todo]:} ", "\\n"])), todo));
        };
        /**
         * A custom logger function for the default reporter that writes the log values using `console.log()`
         *
         * @param {HostValue} logValue - A value to be logged to the console
         */
        VerboseReporter.prototype.onLog = function (logValue) {
            var chalk = require("chalk");
            var output = logValue.stringify({ indent: 12 }).trimLeft();
            this.stdout.write(chalk(templateObject_24 || (templateObject_24 = __makeTemplateObject(["     {yellow [Log]:} ", "\n"], ["     {yellow [Log]:} ", "\\n"])), output));
            this.stdout.write(chalk(templateObject_25 || (templateObject_25 = __makeTemplateObject(["   {yellow [Stack]:} ", "\n"], ["   {yellow [Stack]:} ",
                "\\n"])), logValue.stack
                .trimLeft()
                .split("\n")
                .join("\n             ")));
        };
        return VerboseReporter;
    }(TestReporter_1.TestReporter));
    exports.default = VerboseReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25;
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
                        attachStackTraceToHostValue: this.attachStackTraceToHostValue.bind(this),
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
        hasValues, // bool
        isManaged) {
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
            hostValue.isManaged = isManaged === 1;
            if (hostTypeValue === 7 /* Integer */ ||
                hostTypeValue === 9 /* Boolean */) {
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
                    message: "Cannot push HostValue of id " + valueID + " to HostValue " + hostValueID + ". HostValue id out of bounds.",
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
                    message: "Cannot push HostValue of id " + valueID + " to HostValue " + hostValueID + ". HostValue id out of bounds.",
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
                    message: "Cannot push HostValue of id " + valueID + " to HostValue " + hostValueID + ". HostValue was not initialized with a values array.",
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
                    message: "Cannot push HostValue of id " + keyId + " to HostValue " + hostValueID + ". HostValue id out of bounds.",
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
                    message: "Cannot push HostValue of id " + keyId + " to HostValue " + hostValueID + ". HostValue key id out of bounds.",
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
                    message: "Cannot push HostValue of id " + keyId + " to HostValue " + hostValueID + ". HostValue was not initialized with a keys array.",
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
            var expected = (this.expected = new HostValue_1.HostValue());
            expected.negated = negated === 1;
            expected.type = 13 /* Truthy */;
        };
        /**
         * Report an expected truthy value, and if it's negated.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedFalsy = function (negated) {
            var expected = (this.expected = new HostValue_1.HostValue());
            expected.negated = negated === 1;
            expected.type = 14 /* Falsy */;
        };
        /**
         * Report an expected finite value, and if it's negated.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedFinite = function (negated) {
            var expected = (this.expected = new HostValue_1.HostValue());
            expected.negated = negated === 1;
            expected.type = 12 /* Finite */;
        };
        /**
         * Attaches a stack trace to the given hostValue by it's id.
         *
         * @param {number} hostValueID - The given host value.
         */
        TestCollector.prototype.attachStackTraceToHostValue = function (hostValueID) {
            /* istanbul ignore next */
            if (hostValueID >= this.hostValueCache.length || hostValueID < 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Cannot push a stack trace to HostValue " + hostValueID + ". HostValue id out of bounds.",
                    stackTrace: this.getLogStackTrace(),
                    type: "HostValue",
                });
                /* istanbul ignore next */
                return;
            }
            this.hostValueCache[hostValueID].stack = this.getLogStackTrace();
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
define("reporter/CSVReporter", ["require", "exports", "test/TestReporter", "csv-stringify", "fs", "path"], function (require, exports, TestReporter_3, csv_stringify_1, fs_1, path_1) {
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
                result.actual ? result.actual.stringify({ indent: 0 }) : "",
                result.expected ? result.expected.stringify({ indent: 0 }) : "",
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
define("reporter/JSONReporter", ["require", "exports", "test/TestReporter", "fs", "path"], function (require, exports, TestReporter_5, fs_2, path_2) {
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
                    actual: result.actual ? result.actual.stringify({ indent: 0 }) : null,
                    expected: result.expected
                        ? result.expected.stringify({ indent: 0 })
                        : null,
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
define("reporter/SummaryReporter", ["require", "exports", "test/TestReporter"], function (require, exports, TestReporter_6) {
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
                suite.stdout.write(chalk(templateObject_26 || (templateObject_26 = __makeTemplateObject(["{green.bold \u2714 ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\n"], ["{green.bold \u2714 ",
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
                suite.stdout.write(chalk(templateObject_27 || (templateObject_27 = __makeTemplateObject(["{red.bold \u274C ", "} Pass: ", " / ", " Todo: ", " Time: ", "ms\n"], ["{red.bold \u274C ",
                    "} Pass: ", " / ", " Todo: ", " Time: ", "ms\\n"])), suite.fileName, passCount.toString(), total.toString(), todos.toString(), suite.time.toString()));
                /** If the group failed, report that the group failed. */
                for (var _k = 0, _l = suite.testGroups; _k < _l.length; _k++) {
                    var group = _l[_k];
                    if (group.pass)
                        continue;
                    suite.stdout.write(chalk(templateObject_28 || (templateObject_28 = __makeTemplateObject(["  {red Failed:} ", "\n"], ["  {red Failed:} ", "\\n"])), group.name));
                    /** Display the reason if there is one. */
                    if (group.reason)
                        suite.stdout.write(chalk(templateObject_29 || (templateObject_29 = __makeTemplateObject(["    {yellow Reason:} ", ""], ["    {yellow Reason:} ", ""])), group.reason));
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
                        suite.stdout.write(chalk(templateObject_30 || (templateObject_30 = __makeTemplateObject(["    {red.bold \u274C ", "} - ", "\n"], ["    {red.bold \u274C ", "} - ", "\\n"])), test_2.name, test_2.message));
                        if (test_2.expected !== null)
                            suite.stdout.write(chalk(templateObject_31 || (templateObject_31 = __makeTemplateObject(["      {green.bold [Expected]:} ", "\n"], ["      {green.bold [Expected]:} ",
                                "\\n"])), test_2.expected
                                .stringify({ indent: 2 })
                                .trimLeft()));
                        if (test_2.actual !== null)
                            suite.stdout.write(chalk(templateObject_32 || (templateObject_32 = __makeTemplateObject(["      {red.bold [Actual]  :} ", "\n"], ["      {red.bold [Actual]  :} ",
                                "\\n"])), test_2.actual
                                .stringify({ indent: 2 })
                                .trimLeft()));
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
                this.stdout.write(chalk(templateObject_33 || (templateObject_33 = __makeTemplateObject(["{yellow  [Warning]}: ", " ", "\n"], ["{yellow  [Warning]}: ", " ", "\\n"])), warning.type, warning.message));
                this.stdout.write(chalk(templateObject_34 || (templateObject_34 = __makeTemplateObject(["{yellow    [Stack]}: {yellow ", "}\n\n"], ["{yellow    [Stack]}: {yellow ",
                    "}\\n\\n"])), warning.stackTrace
                    .split("\n")
                    .join("\n           ")));
            }
            for (var _v = 0, _w = suite.errors; _v < _w.length; _v++) {
                var error = _w[_v];
                this.stdout.write(chalk(templateObject_35 || (templateObject_35 = __makeTemplateObject(["{red    [Error]}: ", " ", "\n"], ["{red    [Error]}: ", " ", "\\n"])), error.type, error.message));
                this.stdout.write(chalk(templateObject_36 || (templateObject_36 = __makeTemplateObject(["{red    [Stack]}: {yellow ", "}\n\n"], ["{red    [Stack]}: {yellow ",
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
            var output = logValue.stringify({ indent: 12 }).trimLeft();
            this.stdout.write(chalk(templateObject_37 || (templateObject_37 = __makeTemplateObject(["     {yellow [Log]:} ", "\n"], ["     {yellow [Log]:} ", "\\n"])), output));
        };
        return SummaryReporter;
    }(TestReporter_6.TestReporter));
    exports.default = SummaryReporter;
    var templateObject_26, templateObject_27, templateObject_28, templateObject_29, templateObject_30, templateObject_31, templateObject_32, templateObject_33, templateObject_34, templateObject_35, templateObject_36, templateObject_37;
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
//@ts-ignore
var path = require("path");
//@ts-ignore
var assemblyscriptPath = Object.getOwnPropertyNames(require.cache).filter(function (s) { return s.endsWith("assemblyscript.js"); })[0];
var transformerPath;
if (assemblyscriptPath) {
    var splitPath = assemblyscriptPath.split(path.sep).slice(0, -2);
    transformerPath = splitPath.concat(["cli", "transform"]).join(path.sep);
}
else {
    assemblyscriptPath = require.resolve("assemblyscript");
    transformerPath = require.resolve("assemblyscript/cli/transform");
}
//@ts-ignore
module.exports.Transform = require(transformerPath).Transform;
module.exports = __assign(__assign({}, module.exports), require(assemblyscriptPath));
define("transform/createGenericTypeParameter", ["require", "exports", "./assemblyscript"], function (require, exports, assemblyscript_1) {
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
define("transform/createAddHostValueKeyValuePairsMember", ["require", "exports", "./assemblyscript", "transform/createGenericTypeParameter"], function (require, exports, assemblyscript_2, createGenericTypeParameter_1) {
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
        ], assemblyscript_2.TypeNode.createNamedType(assemblyscript_2.TypeNode.createSimpleTypeName("void", range), [], false, range), null, false, range), createAddHostValueKeyValuePairsFunctionBody(classDeclaration), null, assemblyscript_2.CommonFlags.PUBLIC |
            assemblyscript_2.CommonFlags.INSTANCE |
            (classDeclaration.isGeneric ? assemblyscript_2.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createAddHostValueKeyValuePairsMember = createAddHostValueKeyValuePairsMember;
    function createAddHostValueKeyValuePairsFunctionBody(classDeclaration) {
        var body = new Array();
        var range = classDeclaration.name.range;
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            // if it's an instance member, and it isn't marked private or protected
            if (member.is(assemblyscript_2.CommonFlags.INSTANCE) &&
                !member.is(assemblyscript_2.CommonFlags.PRIVATE | assemblyscript_2.CommonFlags.PROTECTED)) {
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
define("transform/createStrictEqualsMember", ["require", "exports", "./assemblyscript", "transform/createGenericTypeParameter"], function (require, exports, assemblyscript_3, createGenericTypeParameter_2) {
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
        return assemblyscript_3.TypeNode.createMethodDeclaration(assemblyscript_3.TypeNode.createIdentifierExpression("__aspectStrictEquals", range), [
            assemblyscript_3.TypeNode.createTypeParameter(assemblyscript_3.TypeNode.createIdentifierExpression("T", range), null, null, range),
        ], assemblyscript_3.TypeNode.createFunctionType([
            // ref: T,
            createDefaultParameter("ref", createGenericTypeParameter_2.createGenericTypeParameter("T", range), range),
            // stack: usize[]
            createDefaultParameter("stack", createUsizeArrayType(range), range),
            // cache: usize[]
            createDefaultParameter("cache", createUsizeArrayType(range), range),
        ], 
        // : bool
        createSimpleNamedType("bool", range), null, false, range), createStrictEqualsFunctionBody(classDeclaration), null, assemblyscript_3.CommonFlags.PUBLIC |
            assemblyscript_3.CommonFlags.INSTANCE |
            assemblyscript_3.CommonFlags.GENERIC |
            (classDeclaration.isGeneric ? assemblyscript_3.CommonFlags.GENERIC_CONTEXT : 0), range);
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
            if (member.is(assemblyscript_3.CommonFlags.INSTANCE) &&
                !member.is(assemblyscript_3.CommonFlags.PRIVATE | assemblyscript_3.CommonFlags.PROTECTED)) {
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
define("transform/emptyTransformer", ["require", "exports", "./assemblyscript"], function (require, exports, assemblyscript_4) {
    "use strict";
    return /** @class */ (function (_super) {
        __extends(AspectTransform, _super);
        function AspectTransform() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        AspectTransform.prototype.afterParse = function (_) { };
        return AspectTransform;
    }(assemblyscript_4.Transform));
});
define("transform/index", ["require", "exports", "./assemblyscript", "transform/createStrictEqualsMember", "transform/createAddHostValueKeyValuePairsMember"], function (require, exports, assemblyscript_5, createStrictEqualsMember_1, createAddHostValueKeyValuePairsMember_1) {
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
                    if (statement.kind === assemblyscript_5.NodeKind.CLASSDECLARATION) {
                        // cast and create a strictEquals function
                        var classDeclaration = statement;
                        classDeclaration.members.push(createStrictEqualsMember_1.createStrictEqualsMember(classDeclaration));
                        classDeclaration.members.push(createAddHostValueKeyValuePairsMember_1.createAddHostValueKeyValuePairsMember(classDeclaration));
                    }
                }
            }
        };
        return AspectTransform;
    }(assemblyscript_5.Transform));
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYXMtcGVjdC5jb3JlLmFtZC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uL3NyYy90cmFuc2Zvcm0vYXNzZW1ibHlzY3JpcHQuanMiLCIuLi9zcmMvdGVzdC9JV2FybmluZy50cyIsIi4uL3NyYy91dGlsL3N0cmluZ2lmeUhvc3RWYWx1ZS50cyIsIi4uL3NyYy91dGlsL0hvc3RWYWx1ZS50cyIsIi4uL3NyYy91dGlsL0lMb2dUYXJnZXQudHMiLCIuLi9zcmMvdGVzdC9QZXJmb3JtYW5jZUxpbWl0cy50cyIsIi4uL3NyYy9tYXRoL21lYW4udHMiLCIuLi9zcmMvbWF0aC9yb3VuZC50cyIsIi4uL3NyYy9tYXRoL21lZGlhbi50cyIsIi4uL3NyYy9tYXRoL3ZhcmlhbmNlLnRzIiwiLi4vc3JjL3Rlc3QvVGVzdFJlc3VsdC50cyIsIi4uL3NyYy90ZXN0L1Rlc3RHcm91cC50cyIsIi4uL3NyYy91dGlsL0lXcml0ZWFibGUudHMiLCIuLi9zcmMvcmVwb3J0ZXIvVmVyYm9zZVJlcG9ydGVyLnRzIiwiLi4vc3JjL3V0aWwvdGltZURpZmZlcmVuY2UudHMiLCIuLi9zcmMvdXRpbC9JQXNwZWN0RXhwb3J0cy50cyIsIi4uL3NyYy91dGlsL0lQZXJmb3JtYW5jZUNvbmZpZ3VyYXRpb24udHMiLCIuLi9zcmMvdXRpbC93YXNtVG9vbHMudHMiLCIuLi9zcmMvdGVzdC9UZXN0Q29sbGVjdG9yLnRzIiwiLi4vc3JjL3Rlc3QvVGVzdENvbnRleHQudHMiLCIuLi9zcmMvdGVzdC9UZXN0UmVwb3J0ZXIudHMiLCIuLi9zcmMvcmVwb3J0ZXIvQ29tYmluYXRpb25SZXBvcnRlci50cyIsIi4uL3NyYy9yZXBvcnRlci9DU1ZSZXBvcnRlci50cyIsIi4uL3NyYy9yZXBvcnRlci9FbXB0eVJlcG9ydGVyLnRzIiwiLi4vc3JjL3JlcG9ydGVyL0pTT05SZXBvcnRlci50cyIsIi4uL3NyYy9yZXBvcnRlci9TdW1tYXJ5UmVwb3J0ZXIudHMiLCIuLi9zcmMvaW5kZXgudHMiLCIuLi9zcmMvdHJhbnNmb3JtL2NyZWF0ZUdlbmVyaWNUeXBlUGFyYW1ldGVyLnRzIiwiLi4vc3JjL3RyYW5zZm9ybS9jcmVhdGVBZGRIb3N0VmFsdWVLZXlWYWx1ZVBhaXJzTWVtYmVyLnRzIiwiLi4vc3JjL3RyYW5zZm9ybS9jcmVhdGVTdHJpY3RFcXVhbHNNZW1iZXIudHMiLCIuLi9zcmMvdHJhbnNmb3JtL2VtcHR5VHJhbnNmb3JtZXIudHMiLCIuLi9zcmMvdHJhbnNmb3JtL2luZGV4LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lFSUE7UUFBQTtZQUNTLFVBQUssR0FBVyxDQUFDLENBQUM7WUFDbEIsb0JBQWUsR0FBWSxLQUFLLENBQUM7WUFFakMsU0FBSSxHQUF1QixJQUFJLE9BQU8sRUFBYSxDQUFDO1lBRXBELHFCQUFnQixHQUE2QixlQUFLLENBQUMsTUFBTSxDQUFDO1lBQzFELG9CQUFlLEdBQTZCLGVBQUssQ0FBQyxJQUFJLENBQUM7WUFDdkQsdUJBQWtCLEdBQTZCLGVBQUssQ0FBQyxLQUFLLENBQUM7WUFDM0Qsb0JBQWUsR0FBNkIsZUFBSyxDQUFDLEtBQUssQ0FBQztZQUV4RCxXQUFNLEdBQVcsQ0FBQyxDQUFDO1lBQ25CLHFCQUFnQixHQUFXLEVBQUUsQ0FBQztZQUM5QixrQkFBYSxHQUFXLEVBQUUsQ0FBQztZQUMzQixRQUFHLEdBQVcsQ0FBQyxDQUFDO1FBQ3pCLENBQUM7UUFBRCx1QkFBQztJQUFELENBQUMsQUFmRCxJQWVDO0lBYUQsU0FBZ0Isa0JBQWtCLENBQ2hDLFNBQW9CLEVBQ3BCLEtBQXVDOztRQUV2QyxJQUFNLE9BQU8sR0FBRyxJQUFJLGdCQUFnQixFQUFFLENBQUM7UUFDdkMsT0FBTyxDQUFDLGdCQUFnQixTQUFHLEtBQUssQ0FBQyxnQkFBZ0IsdUNBQUksT0FBTyxDQUFDLGdCQUFnQixFQUFBLENBQUM7UUFDOUUsT0FBTyxDQUFDLGVBQWUsU0FBRyxLQUFLLENBQUMsZUFBZSx1Q0FB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