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
        return " ".repeat(ctx.indent + ctx.level * ctx.tab) + (ctx.numberColor(hostValue.value.toString()) + " " + ctx.classNameColor("as " + hostValue.typeName));
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
            if (ctx.level < 5) {
                // render expanded value, but trim the whitespace on the left side
                var valueString = formatters[formatterIndexFor(value.type, 0 /* Expanded */)](value, ctx)
                    .trimLeft();
                body += keyString + ": " + valueString + ",\n";
            }
            else {
                // render value
                var valueString = formatters[formatterIndexFor(value.type, 3 /* Value */)](value, ctx);
                body += keyString + ": " + valueString + ",\n";
            }
        }
        if (length > ctx.maxPropertyCount)
            body += "... +" + (length - ctx.maxPropertyCount) + " properties";
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
                body += valueString + ",\n";
            }
            if (length_1 > ctx.maxPropertyCount)
                body += "... +" + (length_1 - ctx.maxPropertyCount) + " values";
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoic3RyaW5naWZ5SG9zdFZhbHVlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vLi4vc3JjL3JlcG9ydGVyL3V0aWwvc3RyaW5naWZ5SG9zdFZhbHVlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUVBLGdEQUEwQjtJQUUxQjtRQVNFLG1DQUNTLE1BQWtCLEVBQ2xCLGdCQUE2QixFQUM3QixHQUFlO1lBRmYsdUJBQUEsRUFBQSxVQUFrQjtZQUNsQixpQ0FBQSxFQUFBLHFCQUE2QjtZQUM3QixvQkFBQSxFQUFBLE9BQWU7WUFGZixXQUFNLEdBQU4sTUFBTSxDQUFZO1lBQ2xCLHFCQUFnQixHQUFoQixnQkFBZ0IsQ0FBYTtZQUM3QixRQUFHLEdBQUgsR0FBRyxDQUFZO1lBWGpCLFVBQUssR0FBVyxDQUFDLENBQUM7WUFDbEIsb0JBQWUsR0FBWSxLQUFLLENBQUM7WUFFakMsaUJBQVksR0FBRyxVQUFDLEtBQWEsSUFBSyxPQUFBLGVBQUssa0ZBQUEsVUFBVyxFQUFLLEdBQUcsS0FBUixLQUFLLEdBQXJCLENBQXdCLENBQUM7WUFDM0QsZ0JBQVcsR0FBRyxVQUFDLEtBQWEsSUFBSyxPQUFBLGVBQUssZ0ZBQUEsUUFBUyxFQUFLLEdBQUcsS0FBUixLQUFLLEdBQW5CLENBQXNCLENBQUM7WUFDeEQsbUJBQWMsR0FBRyxVQUFDLEtBQWEsSUFBSyxPQUFBLGVBQUssaUZBQUEsU0FBVSxFQUFLLEdBQUcsS0FBUixLQUFLLEdBQXBCLENBQXVCLENBQUM7WUFDNUQsZ0JBQVcsR0FBRyxVQUFDLEtBQWEsSUFBSyxPQUFBLGVBQUssaUZBQUEsU0FBVSxFQUFLLEdBQUcsS0FBUixLQUFLLEdBQXBCLENBQXVCLENBQUM7UUFNN0QsQ0FBQztRQUNOLGdDQUFDO0lBQUQsQ0FBQyxBQWRELElBY0M7SUFFRCxTQUFnQixrQkFBa0IsQ0FBQyxTQUFvQixFQUFFLE1BQWM7UUFDckUsT0FBTyxVQUFVLENBQUMsaUJBQWlCLENBQUMs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