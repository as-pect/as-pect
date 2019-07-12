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
    /**
     * @ignore
     * Capitalize a word.
     *
     * @param {string} word - The word to be capitalized.
     */
    function capitalize(word) {
        return word[0].toLocaleUpperCase() + word.substring(1);
    }
    exports.capitalize = capitalize;
    /**
     * @ignore
     * CamelCase a single string. Usually used with `dash-cased` words.
     *
     * @param {string} str - The string to be camelCased.
     * @param {string} from - The string seperator.
     */
    function toCamelCase(str, from) {
        if (from === void 0) { from = "-"; }
        return str
            .split(from)
            .map(function (word, idx) { return (idx > 0 ? capitalize(word) : word); })
            .join("");
    }
    exports.toCamelCase = toCamelCase;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoic3RyaW5ncy5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy91dGlsL3N0cmluZ3MudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBQTs7Ozs7T0FLRztJQUNILFNBQWdCLFVBQVUsQ0FBQyxJQUFZO1FBQ3JDLE9BQU8sSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFDLGlCQUFpQixFQUFFLEdBQUcsSUFBSSxDQUFDLFNBQVMsQ0FBQyxDQUFDLENBQUMsQ0FBQztJQUN6RCxDQUFDO0lBRkQsZ0NBRUM7SUFFRDs7Ozs7O09BTUc7SUFDSCxTQUFnQixXQUFXLENBQUMsR0FBVyxFQUFFLElBQWtCO1FBQWxCLHFCQUFBLEVBQUEsVUFBa0I7UUFDekQsT0FBTyxHQUFHO2FBQ1AsS0FBSyxDQUFDLElBQUksQ0FBQzthQUNYLEdBQUcsQ0FBQyxVQUFDLElBQUksRUFBRSxHQUFHLElBQUssT0FBQSxDQUFDLEdBQUcsR0FBRyxDQUFDLENBQUMsQ0FBQyxDQUFDLFVBQVUsQ0FBQyxJQUFJLENBQUMsQ0FBQyxDQUFDLENBQUMsSUFBSSxDQUFDLEVBQW5DLENBQW1DLENBQUM7YUFDdkQsSUFBSSxDQUFDLEVBQUUsQ0FBQyxDQUFDO0lBQ2QsQ0FBQztJQUxELGtDQUtDIn0=