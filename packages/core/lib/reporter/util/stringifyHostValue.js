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
        function StringifyHostValueContext(indent, maxPropertyCount) {
            if (indent === void 0) { indent = 0; }
            if (maxPropertyCount === void 0) { maxPropertyCount = 50; }
            this.indent = indent;
            this.maxPropertyCount = maxPropertyCount;
            this.level = 0;
            this.stringColor = function (input) { return chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{cyan ", "}"], ["{cyan ", "}"])), input); };
            this.classNameColor = function (input) { return chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{white ", "}"], ["{white ", "}"])), input); };
            this.numberColor = function (input) { return chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{green ", "}"], ["{green ", "}"])), input); };
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
    // Booleans
    formatters[formatterIndexFor(9 /* Boolean */, 0 /* Expanded */)] = displayNoQuoteStringWithSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 1 /* Inline */)] = displayNoQuoteStringWithSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 2 /* Key */)] = displayNoQuoteStringWithSpacing;
    formatters[formatterIndexFor(9 /* Boolean */, 3 /* Value */)] = displayNoQuoteStringWithSpacing;
    function displayClassNoSpacing(hostValue, ctx) {
        return ctx.classNameColor("[" + hostValue.typeName + "]");
    }
    function displayNumberWithSpacing(hostValue, ctx) {
        return " ".repeat(ctx.indent + ctx.level * 2) + ("" + ctx.classNameColor("<" + hostValue.typeName + ">") + ctx.numberColor(hostValue.value.toString()));
    }
    function displayNumberNoSpacing(hostValue, ctx) {
        return "" + ctx.classNameColor("<" + hostValue.typeName + ">") + ctx.numberColor(hostValue.value.toString());
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
        return " ".repeat(ctx.indent + ctx.level * 2) + ctx.stringColor("\"" + hostValue.value.toString().replace(/"/g, '\\"') + "\"");
    }
    function displayNoQuoteStringWithSpacing(hostValue, ctx) {
        return " ".repeat(ctx.indent + ctx.level * 2) + ctx.stringColor("" + hostValue.value.toString().replace(/"/g, '\\"'));
    }
    // Strings
    formatters[formatterIndexFor(2 /* String */, 0 /* Expanded */)] = displayStringWithSpacing;
    formatters[formatterIndexFor(2 /* String */, 1 /* Inline */)] = displayStringNoSpacing;
    formatters[formatterIndexFor(2 /* String */, 2 /* Key */)] = displayNoQuoteStringWithSpacing;
    formatters[formatterIndexFor(2 /* String */, 3 /* Value */)] = displayStringNoSpacing;
    function displayFunctionExpanded(hostValue, ctx) {
        return " ".repeat(ctx.indent + ctx.level * 2) + ctx.classNameColor("[Function " + hostValue.pointer + ": " + hostValue.value.toString() + "]");
    }
    var displayFuncNoNameNoPointer = function (_, ctx) { return ctx.classNameColor("[Function]"); };
    function displayFunctionKey(_, ctx) {
        return " ".repeat(ctx.indent + ctx.level * 2) + ctx.classNameColor("[Function]");
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
        var spacing = " ".repeat(ctx.level * 2 + ctx.indent);
        if (hostValue.isNull) {
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
            body += "+" + (length - ctx.maxPropertyCount) + " properties";
        ctx.level -= 1;
        return "" + spacing + ctx.classNameColor("<" + hostValue.typeName + ">") + " {" + body + spacing + "}";
    }
    function displayClassWithSpacing(hostValue, ctx) {
        return "" + " ".repeat(ctx.level * 2 + ctx.indent) + ctx.classNameColor("[" + hostValue.typeName + "]");
    }
    // Classes
    formatters[formatterIndexFor(1 /* Class */, 0 /* Expanded */)] = displayClassExpanded;
    formatters[formatterIndexFor(1 /* Class */, 1 /* Inline */)] = displayClassNoSpacing;
    formatters[formatterIndexFor(1 /* Class */, 2 /* Key */)] = displayClassWithSpacing;
    formatters[formatterIndexFor(1 /* Class */, 3 /* Value */)] = displayClassExpanded;
    function displayArrayExpanded(hostValue, ctx) {
        var spacing = " ".repeat(ctx.level * 2 + ctx.indent);
        if (ctx.level < 5) {
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
                body += " +" + (length_1 - ctx.maxPropertyCount) + " values";
            ctx.level -= 1;
            return "" + spacing + ctx.classNameColor("<" + hostValue.typeName + ">") + " [" + body + spacing + "]";
        }
        else {
            var body = "" + spacing + ctx.classNameColor("<" + hostValue.typeName + ">") + " [";
            var i = 0;
            var length_2 = hostValue.values.length;
            for (; i < length_2; i++) {
                var value = hostValue.values[i];
                var result = formatters[formatterIndexFor(value.type, 1 /* Inline */)](value, ctx) + ", ";
                if (result.length > 80) {
                    break;
                }
                body = result;
            }
            body += "+" + (length_2 - i) + " items]";
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
    var templateObject_1, templateObject_2, templateObject_3;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoic3RyaW5naWZ5SG9zdFZhbHVlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vLi4vc3JjL3JlcG9ydGVyL3V0aWwvc3RyaW5naWZ5SG9zdFZhbHVlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUVBLGdEQUEwQjtJQUUxQjtRQU9FLG1DQUNTLE1BQWtCLEVBQ2xCLGdCQUE2QjtZQUQ3Qix1QkFBQSxFQUFBLFVBQWtCO1lBQ2xCLGlDQUFBLEVBQUEscUJBQTZCO1lBRDdCLFdBQU0sR0FBTixNQUFNLENBQVk7WUFDbEIscUJBQWdCLEdBQWhCLGdCQUFnQixDQUFhO1lBUi9CLFVBQUssR0FBVyxDQUFDLENBQUM7WUFFbEIsZ0JBQVcsR0FBRyxVQUFDLEtBQWEsSUFBSyxPQUFBLGVBQUssZ0ZBQUEsUUFBUyxFQUFLLEdBQUcsS0FBUixLQUFLLEdBQW5CLENBQXNCLENBQUM7WUFDeEQsbUJBQWMsR0FBRyxVQUFDLEtBQWEsSUFBSyxPQUFBLGVBQUssaUZBQUEsU0FBVSxFQUFLLEdBQUcsS0FBUixLQUFLLEdBQXBCLENBQXVCLENBQUM7WUFDNUQsZ0JBQVcsR0FBRyxVQUFDLEtBQWEsSUFBSyxPQUFBLGVBQUssaUZBQUEsU0FBVSxFQUFLLEdBQUcsS0FBUixLQUFLLEdBQXBCLENBQXVCLENBQUM7UUFLN0QsQ0FBQztRQUNOLGdDQUFDO0lBQUQsQ0FBQyxBQVhELElBV0M7SUFFRCxTQUFnQixrQkFBa0IsQ0FBQyxTQUFvQixFQUFFLE1BQWM7UUFDckUsT0FBTyxVQUFVLENBQUMsaUJBQWlCLENBQUMsU0FBUyxDQUFDLElBQUksbUJBQStCLENBQUMsQ0FDaEYsU0FBUyxFQUNULElBQUkseUJBQXlCLENBQUMsTUFBTSxDQUFDLENBQ3RDLENBQUM7SUFDSixDQUFDO0lBTEQsZ0RBS0M7SUFZRCxJQUFNLFVBQVUsR0FBNEIsRUFBRSxDQUFDO0lBQy9DLElBQU0sY0FBYyxHQUFHLGNBQU0sT0FBQSxFQUFFLEVBQUYsQ0FBRSxDQUFDO0lBQ2hDLEtBQUssSUFBSSxDQUFDLEdBQUcsQ0FBQyxFQUFFLENBQUMsR0FBRyxFQUFFLEdBQUcsQ0FBQyxFQUFFLENBQUMsRUFBRTtRQUFFLFVBQVUsQ0FBQyxJQUFJLENBQUMsY0FBYyxDQUFDLENBQUM7SUFFakUsSUFBTSxpQkFBaUIsR0FBRyxVQUFDLFNBQXdCLEVBQUUsSUFBeUIsSUFBSyxPQUFBLFNBQVMsR0FBRyxDQUFDLEdBQUcsSUFBSSxFQUFwQixDQUFvQixDQUFDO0lBRXhHLElBQU0sY0FBYyxHQUFHLFVBQUMsU0FBb0IsSUFBSyxPQUFBLENBQUcsU0FBUyxDQUFDLE9BQU8sQ0FBQyxDQUFDLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyxFQUFFLFdBQU8sRUFBekMsQ0FBeUMsQ0FBQztJQUMzRixVQUFVLENBQUMsaUJBQWlCLGtDQUFtRCxDQUFDLEdBQUcsY0FBYyxDQUFDO0lBRWxHLElBQU0sZUFBZSxHQUFHLFVBQUMsU0FBb0IsSUFBSyxPQUFBLENBQUcsU0FBUyxDQUFDLE9BQU8sQ0FBQyxDQUFDLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyxFQUFFLFlBQVEsRUFBMUMsQ0FBMEMsQ0FBQztJQUM3RixVQUFVLENBQUMsaUJBQWlCLG1DQUFvRCxDQUFDLEdBQUcsZUFBZSxDQUFDO0lBRXBHLElBQU0sZUFBZSxHQUFHLFVBQUMsU0FBb0IsSUFBSyxPQUFBLENBQUcsU0FBUyxDQUFDLE9BQU8sQ0FBQyxDQUFDLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyxFQUFFLFlBQVEsRUFBMUMsQ0FBMEMsQ0FBQztJQUM3RixVQUFVLENBQUMsaUJBQWlCLG1DQUFvRCxDQUFDLEdBQUcsZUFBZSxDQUFDO0lBRXBHLFdBQVc7SUFDWCxVQUFVLENBQUMsaUJBQWlCLG1DQUFxRCxDQUFDLEdBQUcsK0JBQStCLENBQUM7SUFDckgsVUFBVSxDQUFDLGlCQUFpQixpQ0FBbUQsQ0FBQyxHQUFHLCtCQUErQixDQUFDO0lBQ25ILFVBQVUsQ0FBQyxpQkFBaUIsOEJBQWdELENBQUMsR0FBRywrQkFBK0IsQ0FBQztJQUNoSCxVQUFVLENBQUMsaUJBQWlCLGdDQUFrRCxDQUFDLEdBQUcsK0JBQStCLENBQUM7SUFFbEgsU0FBUyxxQkFBcUIsQ0FBQyxTQUFvQixFQUFFLEdBQThCO1FBQ2pGLE9BQU8sR0FBRyxDQUFDLGNBQWMsQ0FBQyxNQUFJLFNBQVMsQ0FBQyxRQUFRLE1BQUcsQ0FBQyxDQUFDO0lBQ3ZELENBQUM7SUFFRCxTQUFTLHdCQUF3QixDQUFDLFNBQW9CLEVBQUUsR0FBOEI7UUFDcEYsT0FBTyxHQUFHLENBQUMsTUFBTSxDQUFDLEdBQUcsQ0FBQyxNQUFNLEdBQUcsR0FBRyxDQUFDLEtBQUssR0FBRyxDQUFDLENBQUMsSUFBRyxLQUFHLEdBQUcsQ0FBQyxjQUFjLENBQUMsTUFBSSxTQUFTLENBQUMsUUFBUSxNQUFHLENBQUMsR0FBRyxHQUFHLENBQUMsV0FBVyxDQUFDLFNBQVMsQ0FBQyxLQUFLLENBQUMsUUFBUSxFQUFFLENBQUcsQ0FBQSxDQUFDO0lBQ25KLENBQUM7SUFFRCxTQUFTLHNCQUFzQixDQUFDLFNBQW9CLEVBQUUsR0FBOEI7UUFDbEYsT0FBTyxLQUFHLEdBQUcsQ0FBQyxjQUFjLENBQUMsTUFBSSxTQUFTLENBQUMsUUFBUSxNQUFHLENBQUMsR0FBRyxHQUFHLENBQUMsV0FBVyxDQUFDLFNBQVMsQ0FBQyxLQUFLLENBQUMsUUFBUSxFQUFFLENBQUcsQ0FBQztJQUMxRyxDQUFDO0lBRUQsU0FBUztJQUNULFVBQVUsQ0FBQyxpQkFBaUIsaUNBQW1ELENBQUMsR0FBRyx3QkFBd0IsQ0FBQztJQUM1RyxVQUFVLENBQUMsaUJBQWlCLCtCQUFpRCxDQUFDLEdBQUcsc0JBQXNCLENBQUM7SUFDeEcsVUFBVSxDQUFDLGlCQUFpQiw0QkFBOEMsQ0FBQyxHQUFHLHdCQUF3QixDQUFDO0lBQ3ZHLFVBQVUsQ0FBQyxpQkFBaUIsOEJBQWdELENBQUMsR0FBRyxzQkFBc0IsQ0FBQztJQUV2RyxXQUFXO0lBQ1gsVUFBVSxDQUFDLGlCQUFpQixtQ0FBcUQsQ0FBQyxHQUFHLHdCQUF3QixDQUFDO0lBQzlHLFVBQVUsQ0FBQyxpQkFBaUIsaUNBQW1ELENBQUMsR0FBRyxzQkFBc0IsQ0FBQztJQUMxRyxVQUFVLENBQUMsaUJBQWlCLDhCQUFnRCxDQUFDLEdBQUcsd0JBQXdCLENBQUM7SUFDekcsVUFBVSxDQUFDLGlCQUFpQixnQ0FBa0QsQ0FBQyxHQUFHLHNCQUFzQixDQUFDO0lBRXpHLFNBQVMsc0JBQXNCLENBQUMsU0FBb0IsRUFBRSxHQUE4QjtRQUNsRixPQUFPLEdBQUcsQ0FBQyxXQUFXLENBQUMsT0FBSSxTQUFTLENBQUMsS0FBSyxDQUFDLFFBQVEsRUFBRSxDQUFDLE9BQU8sQ0FBQyxJQUFJLEVBQUUsS0FBSyxDQUFDLE9BQUcsQ0FBQyxDQUFDO0lBQ2pGLENBQUM7SUFFRCxTQUFTLHdCQUF3QixDQUFDLFNBQW9CLEVBQUUsR0FBOEI7UUFDcEYsT0FBTyxHQUFHLENBQUMsTUFBTSxDQUFDLEdBQUcsQ0FBQyxNQUFNLEdBQUcsR0FBRyxDQUFDLEtBQUssR0FBRyxDQUFDLENBQUMsR0FBRyxHQUFHLENBQUMsV0FBVyxDQUFDLE9BQUksU0FBUyxDQUFDLEtBQUssQ0FBQyxRQUFRLEVBQUUsQ0FBQyxPQUFPLENBQUMsSUFBSSxFQUFFLEtBQUssQ0FBQyxPQUFHLENBQUMsQ0FBQztJQUMxSCxDQUFDO0lBRUQsU0FBUywrQkFBK0IsQ0FBQyxTQUFvQixFQUFFLEdBQThCO1FBQzNGLE9BQU8sR0FBRyxDQUFDLE1BQU0sQ0FBQyxHQUFHLENBQUMsTUFBTSxHQUFHLEdBQUcsQ0FBQyxLQUFLLEdBQUcsQ0FBQyxDQUFDLEdBQUcsR0FBRyxDQUFDLFdBQVcsQ0FBQyxLQUFHLFNBQVMsQ0FBQyxLQUFLLENBQUMsUUFBUSxFQUFFLENBQUMsT0FBTyxDQUFDLElBQUksRUFBRSxLQUFLLENBQUcsQ0FBQyxDQUFDO0lBQ3hILENBQUM7SUFFRCxVQUFVO0lBQ1YsVUFBVSxDQUFDLGlCQUFpQixrQ0FBb0QsQ0FBQyxHQUFHLHdCQUF3QixDQUFDO0lBQzdHLFVBQVUsQ0FBQyxpQkFBaUIsZ0NBQWtELENBQUMsR0FBRyxzQkFBc0IsQ0FBQztJQUN6RyxVQUFVLENBQUMsaUJBQWlCLDZCQUErQyxDQUFDLEdBQUcsK0JBQStCLENBQUM7SUFDL0csVUFBVSxDQUFDLGlCQUFpQiwrQkFBaUQsQ0FBQyxHQUFHLHNCQUFzQixDQUFDO0lBRXhHLFNBQVMsdUJBQXVCLENBQUMsU0FBb0IsRUFBRSxHQUE4QjtRQUNuRixPQUFPLEdBQUcsQ0FBQyxNQUFNLENBQUMsR0FBRyxDQUFDLE1BQU0sR0FBRyxHQUFHLENBQUMsS0FBSyxHQUFHLENBQUMsQ0FBQyxHQUFHLEdBQUcsQ0FBQyxjQUFjLENBQUMsZUFBYSxTQUFTLENBQUMsT0FBTyxVQUFLLFNBQVMsQ0FBQyxLQUFLLENBQUMsUUFBUSxFQUFFLE1BQUcsQ0FBQyxDQUFDO0lBQ3ZJLENBQUM7SUFFRCxJQUFNLDBCQUEwQixHQUFHLFVBQUMsQ0FBWSxFQUFFLEdBQThCLElBQUssT0FBQSxHQUFHLENBQUMsY0FBYyxDQUFDLFlBQVksQ0FBQyxFQUFoQyxDQUFnQyxDQUFDO0lBRXRILFNBQVMsa0JBQWtCLENBQUMsQ0FBWSxFQUFFLEdBQThCO1FBQ3RFLE9BQU8sR0FBRyxDQUFDLE1BQU0sQ0FBQyxHQUFHLENBQUMsTUFBTSxHQUFHLEdBQUcsQ0FBQyxLQUFLLEdBQUcsQ0FBQyxDQUFDLEdBQUcsR0FBRyxDQUFDLGNBQWMsQ0FBQyxZQUFZLENBQUMsQ0FBQztJQUNuRixDQUFDO0lBRUQsU0FBUyxvQkFBb0IsQ0FBQyxTQUFvQixFQUFFLEdBQThCO1FBQ2hGLE9BQU8sR0FBRyxDQUFDLGNBQWMsQ0FBQyxlQUFhLFNBQVMsQ0FBQyxPQUFPLFVBQUssU0FBUyxDQUFDLEtBQUssQ0FBQyxRQUFRLEVBQUUsTUFBRyxDQUFDLENBQUM7SUFDOUYsQ0FBQztJQUdELFlBQVk7SUFDWixVQUFVLENBQUMsaUJBQWlCLG9DQUFzRCxDQUFDLEdBQUcsdUJBQXVCLENBQUM7SUFDOUcsVUFBVSxDQUFDLGlCQUFpQixrQ0FBb0QsQ0FBQyxHQUFHLDBCQUEwQixDQUFDO0lBQy9HLFVBQVUsQ0FBQyxpQkFBaUIsK0JBQWlELENBQUMsR0FBRyxrQkFBa0IsQ0FBQztJQUNwRyxVQUFVLENBQUMsaUJBQWlCLGlDQUFtRCxDQUFDLEdBQUcsb0JBQW9CLENBQUM7SUFFeEcsU0FBUyxvQkFBb0IsQ0FBQyxTQUFvQixFQUFFLEdBQThCO1FBQ2hGLElBQU0sT0FBTyxHQUFHLEdBQUcsQ0FBQyxNQUFNLENBQUMsR0FBRyxDQUFDLEtBQUssR0FBRyxDQUFDLEdBQUcsR0FBRyxDQUFDLE1BQU0sQ0FBQyxDQUFDO1FBQ3ZELElBQUksU0FBUyxDQUFDLE1BQU0sRUFBRTtZQUNwQixPQUFPLEtBQUcsT0FBTyxHQUFHLEdBQUcsQ0FBQyxjQUFjLENBQUMsTUFBSSxTQUFTLENBQUMsUUFBUSxNQUFHLENBQUMsVUFBTyxDQUFDO1NBQzFFO1FBRUQsSUFBSSxJQUFJLEdBQUcsSUFBSSxDQUFDO1FBQ2hCLEdBQUcsQ0FBQyxLQUFLLElBQUksQ0FBQyxDQUFDO1FBQ2YsSUFBTSxNQUFNLEdBQUcsSUFBSSxDQUFDLEdBQUcsQ0FBQyxTQUFTLENBQUMsSUFBSyxDQUFDLE1BQU0sRUFBRSxHQUFHLENBQUMsZ0JBQWdCLENBQUMsQ0FBQztRQUN0RSxLQUFLLElBQUksQ0FBQyxHQUFHLENBQUMsRUFBRSxDQUFDLEdBQUcsTUFBTSxFQUFFLENBQUMsRUFBRSxFQUFFO1lBQy9CLElBQU0sR0FBRyxHQUFHLFNBQVMsQ0FBQyxJQUFLLENBQUMsQ0FBQyxDQUFDLENBQUM7WUFDL0IsSUFBTSxTQUFTLEdBQUcsVUFBVSxDQUFDLGlCQUFpQixDQUFDLEdBQUcsQ0FBQyxJQUFJLGNBQTBCLENBQUMsQ0FBQyxHQUFHLEVBQUUsR0FBRyxDQUFDLENBQUM7WUFDN0YsSUFBTSxLQUFLLEdBQUcsU0FBUyxDQUFDLE1BQU8sQ0FBQyxDQUFDLENBQUMsQ0FBQztZQUVuQyxJQUFJLEdBQUcsQ0FBQyxLQUFLLEdBQUcsQ0FBQyxFQUFFO2dCQUNqQixrRUFBa0U7Z0JBQ2xFLElBQU0sV0FBVyxHQUFHLFVBQVUsQ0FBQyxpQkFBaUIsQ0FBQyxLQUFLLENBQUMsSUFBSSxtQkFBK0IsQ0FBQyxDQUFDLEtBQUssRUFBRSxHQUFHLENBQUM7cUJBQ3BHLFFBQVEsRUFBRSxDQUFDO2dCQUNkLElBQUksSUFBTyxTQUFTLFVBQUssV0FBVyxRQUFLLENBQUE7YUFDMUM7aUJBQU07Z0JBQ0wsZUFBZTtnQkFDZixJQUFNLFdBQVcsR0FBRyxVQUFVLENBQUMsaUJBQWlCLENBQUMsS0FBSyxDQUFDLElBQUksZ0JBQTRCLENBQUMsQ0FBQyxLQUFLLEVBQUUsR0FBRyxDQUFDLENBQUM7Z0JBQ3JHLElBQUksSUFBTyxTQUFTLFVBQUssV0FBVyxRQUFLLENBQUE7YUFDMUM7U0FDRjtRQUVELElBQUksTUFBTSxHQUFHLEdBQUcsQ0FBQyxnQkFBZ0I7WUFBRSxJQUFJLElBQUksT0FBSSxNQUFNLEdBQUcsR0FBRyxDQUFDLGdCQUFnQixpQkFBYSxDQUFDO1FBQzFGLEdBQUcsQ0FBQyxLQUFLLElBQUksQ0FBQyxDQUFDO1FBQ2YsT0FBTyxLQUFHLE9BQU8sR0FBRyxHQUFHLENBQUMsY0FBYyxDQUFDLE1BQUksU0FBUyxDQUFDLFFBQVEsTUFBRyxDQUFDLFVBQUssSUFBSSxHQUFHLE9BQU8sTUFBRyxDQUFDO0lBQzFGLENBQUM7SUFFRCxTQUFTLHVCQUF1QixDQUFDLFNBQW9CLEVBQUUsR0FBOEI7UUFDbkYsT0FBTyxLQUFHLEdBQUcsQ0FBQyxNQUFNLENBQUMsR0FBRyxDQUFDLEtBQUssR0FBRyxDQUFDLEdBQUcsR0FBRyxDQUFDLE1BQU0sQ0FBQyxHQUFHLEdBQUcsQ0FBQyxjQUFjLENBQUMsTUFBSSxTQUFTLENBQUMsUUFBUSxNQUFHLENBQUcsQ0FBQztJQUNyRyxDQUFDO0lBRUQsVUFBVTtJQUNWLFVBQVUsQ0FBQyxpQkFBaUIsaUNBQW1ELENBQUMsR0FBRyxvQkFBb0IsQ0FBQztJQUN4RyxVQUFVLENBQUMsaUJBQWlCLCtCQUFpRCxDQUFDLEdBQUcscUJBQXFCLENBQUM7SUFDdkcsVUFBVSxDQUFDLGlCQUFpQiw0QkFBOEMsQ0FBQyxHQUFHLHVCQUF1QixDQUFDO0lBQ3RHLFVBQVUsQ0FBQyxpQkFBaUIsOEJBQWdELENBQUMsR0FBRyxvQkFBb0IsQ0FBQztJQUVyRyxTQUFTLG9CQUFvQixDQUFDLFNBQW9CLEVBQUUsR0FBOEI7UUFDaEYsSUFBTSxPQUFPLEdBQUcsR0FBRyxDQUFDLE1BQU0sQ0FBQyxHQUFHLENBQUMsS0FBSyxHQUFHLENBQUMsR0FBRyxHQUFHLENBQUMsTUFBTSxDQUFDLENBQUM7UUFDdkQsSUFBSSxHQUFHLENBQUMsS0FBSyxHQUFHLENBQUMsRUFBRTtZQUNqQixJQUFJLElBQUksR0FBRyxJQUFJLENBQUM7WUFDaEIsR0FBRyxDQUFDLEtBQUssSUFBSSxDQUFDLENBQUM7WUFDZixJQUFNLFFBQU0sR0FBRyxJQUFJLENBQUMsR0FBRyxDQUFDLFNBQVMsQ0FBQyxNQUFPLENBQUMsTUFBTSxFQUFFLEdBQUcsQ0FBQyxnQkFBZ0IsQ0FBQyxDQUFDO1lBQ3hFLEtBQUssSUFBSSxDQUFDLEdBQUcsQ0FBQyxFQUFFLENBQUMsR0FBRyxRQUFNLEVBQUUsQ0FBQyxFQUFFLEVBQUU7Z0JBQy9CLElBQU0sS0FBSyxHQUFHLFNBQVMsQ0FBQyxNQUFPLENBQUMsQ0FBQyxDQUFDLENBQUM7Z0JBRW5DLGtFQUFrRTtnQkFDbEUsSUFBTSxXQUFXLEdBQUcsVUFBVSxDQUFDLGlCQUFpQixDQUFDLEtBQUssQ0FBQyxJQUFJLG1CQUErQixDQUFDLENBQUMsS0FBSyxFQUFFLEdBQUcsQ0FBQyxDQUFDO2dCQUN4RyxJQUFJLElBQU8sV0FBVyxRQUFLLENBQUE7YUFDNUI7WUFDRCxJQUFJLFFBQU0sR0FBRyxHQUFHLENBQUMsZ0JBQWdCO2dCQUFFLElBQUksSUFBSSxRQUFLLFFBQU0sR0FBRyxHQUFHLENBQUMsZ0JBQWdCLGFBQVMsQ0FBQztZQUN2RixHQUFHLENBQUMsS0FBSyxJQUFJLENBQUMsQ0FBQztZQUNmLE9BQU8sS0FBRyxPQUFPLEdBQUcsR0FBRyxDQUFDLGNBQWMsQ0FBQyxNQUFJLFNBQVMsQ0FBQyxRQUFRLE1BQUcsQ0FBQyxVQUFLLElBQUksR0FBRyxPQUFPLE1BQUcsQ0FBQztTQUN6RjthQUFNO1lBQ0wsSUFBSSxJQUFJLEdBQUcsS0FBRyxPQUFPLEdBQUcsR0FBRyxDQUFDLGNBQWMsQ0FBQyxNQUFJLFNBQVMsQ0FBQyxRQUFRLE1BQUcsQ0FBQyxPQUFJLENBQUM7WUFDMUUsSUFBSSxDQUFDLEdBQUcsQ0FBQyxDQUFDO1lBQ1YsSUFBSSxRQUFNLEdBQUcsU0FBUyxDQUFDLE1BQU8sQ0FBQyxNQUFNLENBQUM7WUFDdEMsT0FBTyxDQUFDLEdBQUcsUUFBTSxFQUFFLENBQUMsRUFBRSxFQUFFO2dCQUN0QixJQUFJLEtBQUssR0FBRyxTQUFTLENBQUMsTUFBTyxDQUFDLENBQUMsQ0FBQyxDQUFDO2dCQUNqQyxJQUFNLE1BQU0sR0FBRyxVQUFVLENBQUMsaUJBQWlCLENBQUMsS0FBSyxDQUFDLElBQUksaUJBQTZCLENBQUMsQ0FBQyxLQUFLLEVBQUUsR0FBRyxDQUFDLEdBQUcsSUFBSSxDQUFDO2dCQUN4RyxJQUFJLE1BQU0sQ0FBQyxNQUFNLEdBQUcsRUFBRSxFQUFFO29CQUN0QixNQUFNO2lCQUNQO2dCQUNELElBQUksR0FBRyxNQUFNLENBQUM7YUFDZjtZQUVELElBQUksSUFBSSxPQUFJLFFBQU0sR0FBRyxDQUFDLGFBQVMsQ0FBQztZQUVoQyxlQUFlO1lBQ2YsT0FBTyxJQUFJLENBQUM7U0FDYjtJQUNILENBQUM7SUFFRCxRQUFRO0lBQ1IsVUFBVSxDQUFDLGlCQUFpQixrQ0FBbUQsQ0FBQyxHQUFHLG9CQUFvQixDQUFDO0lBQ3hHLFVBQVUsQ0FBQyxpQkFBaUIsZ0NBQWlELENBQUMsR0FBRyxvQkFBb0IsQ0FBQztJQUN0RyxVQUFVLENBQUMsaUJBQWlCLDZCQUE4QyxDQUFDLEdBQUcsdUJBQXVCLENBQUM7SUFDdEcsVUFBVSxDQUFDLGlCQUFpQiwrQkFBZ0QsQ0FBQyxHQUFHLG9CQUFvQixDQUFDO0lBRXJHLGNBQWM7SUFDZCxVQUFVLENBQUMsaUJBQWlCLHVDQUF5RCxDQUFDLEdBQUcsb0JBQW9CLENBQUM7SUFDOUcsVUFBVSxDQUFDLGlCQUFpQixxQ0FBdUQsQ0FBQyxHQUFHLG9CQUFvQixDQUFDO0lBQzVHLFVBQVUsQ0FBQyxpQkFBaUIsa0NBQW9ELENBQUMsR0FBRyx1QkFBdUIsQ0FBQztJQUM1RyxVQUFVLENBQUMsaUJBQWlCLG9DQUFzRCxDQUFDLEdBQUcsb0JBQW9CLENBQUM7SUFFM0csYUFBYTtJQUNiLFVBQVUsQ0FBQyxpQkFBaUIsdUNBQXdELENBQUMsR0FBRyxvQkFBb0IsQ0FBQztJQUM3RyxVQUFVLENBQUMsaUJBQWlCLHFDQUFzRCxDQUFDLEdBQUcsb0JBQW9CLENBQUM7SUFDM0csVUFBVSxDQUFDLGlCQUFpQixrQ0FBbUQsQ0FBQyxHQUFHLHVCQUF1QixDQUFDO0lBQzNHLFVBQVUsQ0FBQyxpQkFBaUIsb0NBQXFELENBQUMsR0FBRyxvQkFBb0IsQ0FBQyJ9