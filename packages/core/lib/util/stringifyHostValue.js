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
            this.keywordColor = chalk_1.default.yellow;
            this.stringColor = chalk_1.default.cyan;
            this.classNameColor = chalk_1.default.green;
            this.numberColor = chalk_1.default.white;
            this.indent = 0;
            this.maxPropertyCount = 50;
            this.tab = 4;
        }
        return StringifyContext;
    }());
    function stringifyHostValue(hostValue, props) {
        var _a, _b, _c, _d, _e, _f, _g;
        var context = new StringifyContext();
        context.keywordColor = (_a = props.keywordColor, (_a !== null && _a !== void 0 ? _a : context.keywordColor));
        context.stringColor = (_b = props.stringColor, (_b !== null && _b !== void 0 ? _b : context.stringColor));
        context.classNameColor = (_c = props.classNameColor, (_c !== null && _c !== void 0 ? _c : context.classNameColor));
        context.numberColor = (_d = props.numberColor, (_d !== null && _d !== void 0 ? _d : context.numberColor));
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
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoic3RyaW5naWZ5SG9zdFZhbHVlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3V0aWwvc3RyaW5naWZ5SG9zdFZhbHVlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7O0lBRUEsZ0RBQTBCO0lBRTFCO1FBY0U7WUFiTyxVQUFLLEdBQVcsQ0FBQyxDQUFDO1lBQ2xCLG9CQUFlLEdBQVksS0FBSyxDQUFDO1lBRWpDLFNBQUksR0FBdUIsSUFBSSxPQUFPLEVBQWEsQ0FBQztZQUVwRCxpQkFBWSxHQUE2QixlQUFLLENBQUMsTUFBTSxDQUFDO1lBQ3RELGdCQUFXLEdBQTZCLGVBQUssQ0FBQyxJQUFJLENBQUM7WUFDbkQsbUJBQWMsR0FBNkIsZUFBSyxDQUFDLEtBQUssQ0FBQztZQUN2RCxnQkFBVyxHQUE2QixlQUFLLENBQUMsS0FBSyxDQUFDO1lBRXBELFdBQU0sR0FBVyxDQUFDLENBQUM7WUFDbkIscUJBQWdCLEdBQVcsRUFBRSxDQUFDO1lBQzlCLFFBQUcsR0FBVyxDQUFDLENBQUM7UUFDRCxDQUFDO1FBQ3pCLHVCQUFDO0lBQUQsQ0FBQyxBQWZELElBZUM7SUFZRCxTQUFnQixrQkFBa0IsQ0FBQyxTQUFvQixFQUFFLEtBQXVDOztRQUM5RixJQUFNLE9BQU8sR0FBRyxJQUFJLGdCQUFnQixFQUFFLENBQUM7UUFDdkMsT0FBTyxDQUFDLFlBQVksU0FBRyxLQUFLLENBQUMsWUFBWSx1Q0FBSSxPQUFPLENBQUMsWUFBWSxFQUFBLENBQUM7UUFDbEUsT0FBTyxDQUFDLFdBQVcsU0FBRyxLQUFLLENBQUMsV0FBVyx1Q0FBSSxPQUFPLENBQUMsV0FBVyxFQUFBLENBQUM7UUFDL0QsT0FBTyxDQUFDLGNBQWMsU0FBRyxLQUFLLENBQUMsY0FBYyx1Q0FBSSxPQUFPLENBQUMsY0FBYyxFQUFBLENBQUM7UUFDeEUsT0FBTyxDQUFDLFdBQVcsU0FBRyxLQUFLLENBQUMsV0FBVyx1Q0FBSSxPQUFPLENBQUMsV0FBVyxFQUFB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