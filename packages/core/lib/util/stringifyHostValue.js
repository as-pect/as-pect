var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "chalk"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoic3RyaW5naWZ5SG9zdFZhbHVlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3V0aWwvc3RyaW5naWZ5SG9zdFZhbHVlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7O0lBRUEsZ0RBQTBCO0lBRTFCO1FBQUE7WUFDUyxVQUFLLEdBQVcsQ0FBQyxDQUFDO1lBQ2xCLG9CQUFlLEdBQVksS0FBSyxDQUFDO1lBRWpDLFNBQUksR0FBdUIsSUFBSSxPQUFPLEVBQWEsQ0FBQztZQUVwRCxxQkFBZ0IsR0FBNkIsZUFBSyxDQUFDLE1BQU0sQ0FBQztZQUMxRCxvQkFBZSxHQUE2QixlQUFLLENBQUMsSUFBSSxDQUFDO1lBQ3ZELHVCQUFrQixHQUE2QixlQUFLLENBQUMsS0FBSyxDQUFDO1lBQzNELG9CQUFlLEdBQTZCLGVBQUssQ0FBQyxLQUFLLENBQUM7WUFFeEQsV0FBTSxHQUFXLENBQUMsQ0FBQztZQUNuQixxQkFBZ0IsR0FBVyxFQUFFLENBQUM7WUFDOUIsa0JBQWEsR0FBVyxFQUFFLENBQUM7WUFDM0IsUUFBRyxHQUFXLENBQUMsQ0FBQztRQUN6QixDQUFDO1FBQUQsdUJBQUM7SUFBRCxDQUFDLEFBZkQsSUFlQztJQWFELFNBQWdCLGtCQUFrQixDQUNoQyxTQUFvQixFQUNwQixLQUF1Qzs7UUFFdkMsSUFBTSxPQUFPLEdBQUcsSUFBSSxnQkFBZ0IsRUFBRSxDQUFDO1FBQ3ZDLE9BQU8sQ0FBQyxnQkFBZ0IsU0FBRyxLQUFLLENBQUMsZ0JBQWdCLHVDQUFJLE9BQU8sQ0FBQyxnQkFBZ0IsRUFBQSxDQUFDO1FBQzlFLE9BQU8sQ0FBQyxlQUFlLFNBQUcsS0FBSyxDQUFDLGVBQWUsdUNBQUksT0FBTyxDQUFDLGVBQWUsRUFBQSxDQUFDO1FBQzNFLE9BQU8sQ0FBQyxrQkFBa0IsU0FDeEIsS0FBSyxDQUFDLGtCQUFrQix1Q0FBSSxPQUFPLENBQUMsa0JBQWtCLEVBQUEsQ0FBQztRQUN6RCxPQUFPLENBQUMsZUFBZSxT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