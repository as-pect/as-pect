(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var StringifyHostValueContext = /** @class */ (function () {
        function StringifyHostValueContext(indent) {
            this.indent = indent;
            this.level = 0;
        }
        return StringifyHostValueContext;
    }());
    function stringifyHostValue(hostValue, indent) {
        return traverseHostValue(hostValue, new StringifyHostValueContext(indent));
    }
    exports.stringifyHostValue = stringifyHostValue;
    function traverseHostValue(hostValue, ctx) {
        switch (hostValue.type) {
            case 2 /* String */: {
                return "" + " ".repeat(ctx.indent + 2 * ctx.level) + (hostValue.negated ? "Not " : "") + "\"" + hostValue.value.toString().replace(/"/g, "\\\"") + "\"";
            }
            case 14 /* Falsy */: {
                return "" + " ".repeat(ctx.indent + 2 * ctx.level) + (hostValue.negated ? "Not " : "") + "Falsy";
            }
            case 13 /* Truthy */: {
                return "" + " ".repeat(ctx.indent + 2 * ctx.level) + (hostValue.negated ? "Not " : "") + "Truthy";
            }
            case 12 /* Finite */: {
                return "" + " ".repeat(ctx.indent + 2 * ctx.level) + (hostValue.negated ? "Not " : "") + "Finite";
            }
            case 7 /* Integer */:
            case 8 /* Float */: {
                return "" + " ".repeat(ctx.indent + 2 * ctx.level) + (hostValue.negated ? "Not " : "") + "<" + hostValue.typeName + ">" + hostValue.value;
            }
        }
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoic3RyaW5naWZ5SG9zdFZhbHVlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vLi4vc3JjL3JlcG9ydGVyL3V0aWwvc3RyaW5naWZ5SG9zdFZhbHVlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBR0E7UUFFRSxtQ0FDUyxNQUFjO1lBQWQsV0FBTSxHQUFOLE1BQU0sQ0FBUTtZQUZoQixVQUFLLEdBQVcsQ0FBQyxDQUFDO1FBR3RCLENBQUM7UUFDTixnQ0FBQztJQUFELENBQUMsQUFMRCxJQUtDO0lBRUQsU0FBZ0Isa0JBQWtCLENBQUMsU0FBb0IsRUFBRSxNQUFjO1FBQ3JFLE9BQU8saUJBQWlCLENBQUMsU0FBUyxFQUFFLElBQUkseUJBQXlCLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQztJQUM3RSxDQUFDO0lBRkQsZ0RBRUM7SUFFRCxTQUFTLGlCQUFpQixDQUFDLFNBQW9CLEVBQUUsR0FBOEI7UUFDN0UsUUFBUSxTQUFTLENBQUMsSUFBSSxFQUFFO1lBQ3RCLG1CQUF5QixDQUFDLENBQUM7Z0JBQ3pCLE9BQU8sS0FBRyxHQUFHLENBQUMsTUFBTSxDQUFDLEdBQUcsQ0FBQyxNQUFNLEdBQUcsQ0FBQyxHQUFHLEdBQUcsQ0FBQyxLQUFLLENBQUMsSUFBRyxTQUFTLENBQUMsT0FBTyxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsQ0FBQyxDQUFDLEVBQUUsV0FBSSxTQUFTLENBQUMsS0FBSyxDQUFDLFFBQVEsRUFBRSxDQUFDLE9BQU8sQ0FBQyxJQUFJLEVBQUUsTUFBTSxDQUFDLE9BQUcsQ0FBQzthQUMzSTtZQUNELG1CQUF3QixDQUFDLENBQUM7Z0JBQ3hCLE9BQU8sS0FBRyxHQUFHLENBQUMsTUFBTSxDQUFDLEdBQUcsQ0FBQyxNQUFNLEdBQUcsQ0FBQyxHQUFHLEdBQUcsQ0FBQyxLQUFLLENBQUMsSUFBRyxTQUFTLENBQUMsT0FBTyxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsQ0FBQyxDQUFDLEVBQUUsV0FBTyxDQUFDO2FBQzNGO1lBQ0Qsb0JBQXlCLENBQUMsQ0FBQztnQkFDekIsT0FBTyxLQUFHLEdBQUcsQ0FBQyxNQUFNLENBQUMsR0FBRyxDQUFDLE1BQU0sR0FBRyxDQUFDLEdBQUcsR0FBRyxDQUFDLEtBQUssQ0FBQyxJQUFHLFNBQVMsQ0FBQyxPQUFPLENBQUMsQ0FBQyxDQUFDLE1BQU0sQ0FBQyxDQUFDLENBQUMsRUFBRSxZQUFRLENBQUM7YUFDNUY7WUFDRCxvQkFBeUIsQ0FBQyxDQUFDO2dCQUN6QixPQUFPLEtBQUcsR0FBRyxDQUFDLE1BQU0sQ0FBQyxHQUFHLENBQUMsTUFBTSxHQUFHLENBQUMsR0FBRyxHQUFHLENBQUMsS0FBSyxDQUFDLElBQUcsU0FBUyxDQUFDLE9BQU8sQ0FBQyxDQUFDLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyxFQUFFLFlBQVEsQ0FBQzthQUM1RjtZQUNELHFCQUEyQjtZQUMzQixrQkFBd0IsQ0FBQyxDQUFDO2dCQUN4QixPQUFPLEtBQUcsR0FBRyxDQUFDLE1BQU0sQ0FBQyxHQUFHLENBQUMsTUFBTSxHQUFHLENBQUMsR0FBRyxHQUFHLENBQUMsS0FBSyxDQUFDLElBQUcsU0FBUyxDQUFDLE9BQU8sQ0FBQyxDQUFDLENBQUMsTUFBTSxDQUFDLENBQUMsQ0FBQyxFQUFFLFVBQUksU0FBUyxDQUFDLFFBQVEsU0FBSSxTQUFTLENBQUMsS0FBTyxDQUFDO2FBQy9IO1NBQ0Y7SUFDSCxDQUFDIn0=