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
            this.maxExpandLevel = 3;
            this.tab = 4;
        }
        return StringifyContext;
    }());
    function stringifyReflectedValue(reflectedValue, props) {
        var context = new StringifyContext();
        /* istanbul ignore next */
        if (props.keywordFormatter)
            context.keywordFormatter = props.keywordFormatter;
        /* istanbul ignore next */
        if (props.stringFormatter)
            context.stringFormatter = props.stringFormatter;
        /* istanbul ignore next */
        if (props.classNameFormatter)
            context.classNameFormatter = props.classNameFormatter;
        /* istanbul ignore next */
        if (props.numberFormatter)
            context.numberFormatter = props.numberFormatter;
        /* istanbul ignore next */
        if (typeof props.indent === "number")
            context.indent = props.indent;
        /* istanbul ignore next */
        if (typeof props.tab === "number")
            context.tab = props.tab;
        /* istanbul ignore next */
        if (typeof props.maxPropertyCount === "number")
            context.maxPropertyCount = props.maxPropertyCount;
        return formatters[formatterIndexFor(reflectedValue.type, 0 /* Expanded */)](reflectedValue, context);
    }
    exports.stringifyReflectedValue = stringifyReflectedValue;
    var formatters = [];
    /* istanbul ignore next */
    var emptyFormatter = function () { return ""; };
    for (var i = 0; i < 14 * 4; i++)
        formatters.push(emptyFormatter);
    var formatterIndexFor = function (valueType, type) { return valueType * 4 + type; };
    var falsyFormatter = function (reflectedValue) {
        return (reflectedValue.negated ? "Not " : "") + "Falsy";
    };
    formatters[formatterIndexFor(14 /* Falsy */, 0 /* Expanded */)] = falsyFormatter;
    var truthyFormatter = function (reflectedValue) {
        return (reflectedValue.negated ? "Not " : "") + "Truthy";
    };
    formatters[formatterIndexFor(13 /* Truthy */, 0 /* Expanded */)] = truthyFormatter;
    var finiteFormatter = function (reflectedValue) {
        return (reflectedValue.negated ? "Not " : "") + "Finite";
    };
    formatters[formatterIndexFor(12 /* Finite */, 0 /* Expanded */)] = finiteFormatter;
    function displayBooleanNoSpacing(reflectedValue, ctx) {
        return ctx.keywordFormatter(reflectedValue.value === 1 ? "true" : "false");
    }
    function displayBooleanWithSpacing(reflectedValue, ctx) {
        return (" ".repeat(ctx.indent + ctx.tab * ctx.level) +
            ctx.keywordFormatter(reflectedValue.value === 1 ? "true" : "false"));
    }
    // Booleans
    formatters[formatterIndexFor(9 /* Boolean */, 0 /* Expanded */)] = displayBooleanWithSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 1 /* Inline */)] = displayBooleanNoSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 2 /* Key */)] = displayBooleanWithSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 3 /* Value */)] = displayBooleanNoSpacing;
    function displayClassNoSpacing(reflectedValue, ctx) {
        return ctx.classNameFormatter("[" + reflectedValue.typeName + "]");
    }
    function displayNumberWithSpacing(reflectedValue, ctx) {
        var numericString = reflectedValue.value.toString();
        if (reflectedValue.type === 8 /* Float */ &&
            !/\.[0-9]/.test(numericString)) {
            numericString += ".0";
        }
        if (ctx.impliedTypeInfo ||
            reflectedValue.typeName === "i32" ||
            reflectedValue.typeName === "f64") {
            return (" ".repeat(ctx.indent + ctx.level * ctx.tab) +
                ctx.numberFormatter(numericString));
        }
        return (" ".repeat(ctx.indent + ctx.level * ctx.tab) +
            (ctx.numberFormatter(numericString) + " " + ctx.keywordFormatter("as") + " " + ctx.classNameFormatter(reflectedValue.typeName)));
    }
    function displayNumberNoSpacing(reflectedValue, ctx) {
        var numericString = reflectedValue.value.toString();
        if (reflectedValue.type === 8 /* Float */ &&
            !/\.[0-9]/.test(numericString)) {
            numericString += ".0";
        }
        if (ctx.impliedTypeInfo ||
            reflectedValue.typeName === "i32" ||
            reflectedValue.typeName === "f64") {
            return ctx.numberFormatter(numericString);
        }
        return ctx.numberFormatter(numericString) + " " + ctx.classNameFormatter("as " + reflectedValue.typeName);
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
    function displayStringNoSpacing(reflectedValue, ctx) {
        return ctx.stringFormatter("\"" + reflectedValue.value.toString().replace(/"/g, '\\"') + "\"");
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
    // Functions
    formatters[formatterIndexFor(6 /* Function */, 0 /* Expanded */)] = displayFunctionExpanded;
    formatters[formatterIndexFor(6 /* Function */, 1 /* Inline */)] = displayFuncNoNameNoPointer;
    formatters[formatterIndexFor(6 /* Function */, 2 /* Key */)] = displayFunctionExpanded;
    formatters[formatterIndexFor(6 /* Function */, 3 /* Value */)] = displayFunctionExpanded;
    function displayClassExpanded(hostValue, ctx) {
        var spacing = " ".repeat(ctx.level * ctx.tab + ctx.indent);
        if (ctx.seen.has(hostValue))
            return spacing + ctx.classNameFormatter("[Circular Reference]");
        var previousImpliedTypeInfo = ctx.impliedTypeInfo;
        ctx.impliedTypeInfo = false;
        if (hostValue.isNull) {
            if (previousImpliedTypeInfo) {
                return spacing + "null";
            }
            else {
                return "" + spacing + ctx.classNameFormatter("<" + hostValue.typeName + ">") + "null";
            }
        }
        ctx.seen.add(hostValue);
        var body = "\n";
        ctx.level += 1;
        var length = hostValue.keys.length;
        var displayCount = Math.min(length, ctx.maxPropertyCount);
        for (var i = 0; i < displayCount; i++) {
            var key = hostValue.keys[i];
            var keyString = formatters[formatterIndexFor(key.type, 2 /* Key */)](key, ctx);
            var value = hostValue.values[i];
            var valueString = ctx.level < ctx.maxExpandLevel
                ? // render expanded value, but trim the whitespace on the left side
                    formatters[formatterIndexFor(value.type, 0 /* Expanded */)](value, ctx).trimLeft()
                : // render value
                    formatters[formatterIndexFor(value.type, 1 /* Inline */)](value, ctx);
            if (i === displayCount - 1) {
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
        if (previousImpliedTypeInfo) {
            return spacing + "{" + body + spacing + "}";
        }
        else {
            return "" + spacing + ctx.classNameFormatter(hostValue.typeName) + " {" + body + spacing + "}";
        }
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
        if (ctx.level < ctx.maxExpandLevel && hostValue.type === 10 /* Array */) {
            // expanded only for arrays
            var body = "\n";
            ctx.level += 1;
            var length_1 = Math.min(hostValue.values.length, ctx.maxPropertyCount);
            for (var i = 0; i < length_1 && i < ctx.maxPropertyCount; i++) {
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
            if (length_1 >= ctx.maxPropertyCount)
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
    // Map
    formatters[formatterIndexFor(4 /* Map */, 0 /* Expanded */)] = displayClassExpanded;
    formatters[formatterIndexFor(4 /* Map */, 1 /* Inline */)] = displayClassNoSpacing;
    formatters[formatterIndexFor(4 /* Map */, 2 /* Key */)] = displayClassWithSpacing;
    formatters[formatterIndexFor(4 /* Map */, 3 /* Value */)] = displayClassExpanded;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoic3RyaW5naWZ5UmVmbGVjdGVkVmFsdWUuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdXRpbC9zdHJpbmdpZnlSZWZsZWN0ZWRWYWx1ZS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7OztJQUVBLGdEQUEwQjtJQUUxQjtRQUFBO1lBQ1MsVUFBSyxHQUFXLENBQUMsQ0FBQztZQUNsQixvQkFBZSxHQUFZLEtBQUssQ0FBQztZQUVqQyxTQUFJLEdBQTRCLElBQUksT0FBTyxFQUFrQixDQUFDO1lBRTlELHFCQUFnQixHQUE2QixlQUFLLENBQUMsTUFBTSxDQUFDO1lBQzFELG9CQUFlLEdBQTZCLGVBQUssQ0FBQyxJQUFJLENBQUM7WUFDdkQsdUJBQWtCLEdBQTZCLGVBQUssQ0FBQyxLQUFLLENBQUM7WUFDM0Qsb0JBQWUsR0FBNkIsZUFBSyxDQUFDLEtBQUssQ0FBQztZQUV4RCxXQUFNLEdBQVcsQ0FBQyxDQUFDO1lBQ25CLHFCQUFnQixHQUFXLEVBQUUsQ0FBQztZQUM5QixrQkFBYSxHQUFXLEVBQUUsQ0FBQztZQUMzQixtQkFBYyxHQUFXLENBQUMsQ0FBQztZQUMzQixRQUFHLEdBQVcsQ0FBQyxDQUFDO1FBQ3pCLENBQUM7UUFBRCx1QkFBQztJQUFELENBQUMsQUFoQkQsSUFnQkM7SUFjRCxTQUFnQix1QkFBdUIsQ0FDckMsY0FBOEIsRUFDOUIsS0FBNEM7UUFFNUMsSUFBTSxPQUFPLEdBQUcsSUFBSSxnQkFBZ0IsRUFBRSxDQUFDO1FBQ3ZDLDBCQUEwQjtRQUMxQixJQUFJLEtBQUssQ0FBQyxnQkFBZ0I7WUFBRSxPQUFPLENBQUMsZ0JBQWdCLEdBQUcsS0FBSyxDQUFDLGdCQUFnQixDQUFDO1FBQzlFLDBCQUEwQjtRQUMxQixJQUFJLEtBQUssQ0FBQyxlQUFlO1lBQUUsT0FBTyxDQUFDLGVBQWUsR0FBRyxLQUFLLENBQUMsZUFBZSxDQUFDO1FBQzNFLDBCQUEwQjtRQUMxQixJQUFJLEtBQUssQ0FBQyxrQkFB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