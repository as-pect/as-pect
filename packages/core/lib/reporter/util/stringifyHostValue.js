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
        define(["require", "exports", "chalk"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
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
            this.seen = new WeakSet();
            this.keywordColor = function (input) { return chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{yellow ", "}"], ["{yellow ", "}"])), input); };
            this.stringColor = function (input) { return chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{cyan ", "}"], ["{cyan ", "}"])), input); };
            this.classNameColor = function (input) { return chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{green ", "}"], ["{green ", "}"])), input); };
            this.numberColor = function (input) { return chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{white ", "}"], ["{white ", "}"])), input); };
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
        var numericString = hostValue.value.toString();
        if (hostValue.type === 8 /* Float */ && !(/\.[0-9]/.test(numericString))) {
            numericString += ".0";
        }
        if (ctx.impliedTypeInfo || hostValue.typeName === "i32" || hostValue.typeName === "f64") {
            return " ".repeat(ctx.indent + ctx.level * ctx.tab) + ctx.numberColor(numericString);
        }
        return " ".repeat(ctx.indent + ctx.level * ctx.tab) + (ctx.numberColor(numericString) + " " + ctx.keywordColor("as") + " " + ctx.classNameColor(hostValue.typeName));
    }
    function displayNumberNoSpacing(hostValue, ctx) {
        var numericString = hostValue.value.toString();
        if (hostValue.type === 8 /* Float */ && !(/\.[0-9]/.test(numericString))) {
            numericString += ".0";
        }
        if (ctx.impliedTypeInfo || hostValue.typeName === "i32" || hostValue.typeName === "f64") {
            return ctx.numberColor(numericString);
        }
        return ctx.numberColor(numericString) + " " + ctx.classNameColor("as " + hostValue.typeName);
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
        if (ctx.seen.has(hostValue))
            return spacing + ctx.classNameColor("[Circular Reference]");
        ctx.impliedTypeInfo = false;
        var previousImpliedTypeInfo = ctx.impliedTypeInfo;
        if (hostValue.isNull) {
            if (previousImpliedTypeInfo)
                return spacing + "null";
            return "" + spacing + ctx.classNameColor("<" + hostValue.typeName + ">") + "null";
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
        ctx.seen.delete(hostValue);
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
        if (ctx.seen.has(hostValue))
            return spacing + ctx.classNameColor("[Circular Reference]");
        ctx.seen.add(hostValue);
        var previousImpliedTypeInfo = ctx.impliedTypeInfo;
        ctx.impliedTypeInfo = true;
        if (ctx.level < 5 && hostValue.type === 10 /* Array */) { // expanded only for arrays
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
            ctx.seen.delete(hostValue);
            if (previousImpliedTypeInfo)
                return spacing + "[" + body + spacing + "]";
            return "" + spacing + ctx.classNameColor("" + hostValue.typeName) + " [" + body + spacing + "]";
        }
        else { // inline
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
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoic3RyaW5naWZ5SG9zdFZhbHVlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vLi4vc3JjL3JlcG9ydGVyL3V0aWwvc3RyaW5naWZ5SG9zdFZhbHVlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUVBLGdEQUEwQjtJQUUxQjtRQVdFLG1DQUNTLE1BQWtCLEVBQ2xCLGdCQUE2QixFQUM3QixHQUFlO1lBRmYsdUJBQUEsRUFBQSxVQUFrQjtZQUNsQixpQ0FBQSxFQUFBLHFCQUE2QjtZQUM3QixvQkFBQSxFQUFBLE9BQWU7WUFGZixXQUFNLEdBQU4sTUFBTSxDQUFZO1lBQ2xCLHFCQUFnQixHQUFoQixnQkFBZ0IsQ0FBYTtZQUM3QixRQUFHLEdBQUgsR0FBRyxDQUFZO1lBYmpCLFVBQUssR0FBVyxDQUFDLENBQUM7WUFDbEIsb0JBQWUsR0FBWSxLQUFLLENBQUM7WUFFakMsU0FBSSxHQUF1QixJQUFJLE9BQU8sRUFBYSxDQUFDO1lBRXBELGlCQUFZLEdBQUcsVUFBQyxLQUFhLElBQUssT0FBQSxlQUFLLGtGQUFBLFVBQVcsRUFBSyxHQUFHLEtBQVIsS0FBSyxHQUFyQixDQUF3QixDQUFDO1lBQzNELGdCQUFXLEdBQUcsVUFBQyxLQUFhLElBQUssT0FBQSxlQUFLLGdGQUFBLFFBQVMsRUFBSyxHQUFHLEtBQVIsS0FBSyxHQUFuQixDQUFzQixDQUFDO1lBQ3hELG1CQUFjLEdBQUcsVUFBQyxLQUFhLElBQUssT0FBQSxlQUFLLGlGQUFBLFNBQVUsRUFBSyxHQUFHLEtBQVIsS0FBSyxHQUFwQixDQUF1QixDQUFDO1lBQzVELGdCQUFXLEdBQUcsVUFBQyxLQUFhLElBQUssT0FBQSxlQUFLLGlGQUFBLFNBQVUsRUFBSyxHQUFHLEtBQVIsS0FBSyxHQUFwQixDQUF1QixDQUFDO1FBTTdELENBQUM7UUFDTixnQ0FBQztJQUFELENBQUMsQUFoQkQsSUFnQkM7SUFFRCxTQUFnQixrQkFBa0IsQ0FBQyxTQUFvQixFQUFF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