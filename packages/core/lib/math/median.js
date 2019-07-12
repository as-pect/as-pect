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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoibWVkaWFuLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL21hdGgvbWVkaWFuLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBQUE7Ozs7O09BS0c7SUFDSCxTQUFnQixNQUFNLENBQUMsS0FBZTtRQUNwQyxJQUFNLEdBQUcsR0FBRyxJQUFJLENBQUMsSUFBSSxDQUFDLEtBQUssQ0FBQyxNQUFNLEdBQUcsR0FBRyxDQUFDLENBQUM7UUFDMUMsS0FBSyxDQUFDLElBQUksQ0FBQyxVQUFDLENBQUMsRUFBRSxDQUFDLElBQUssT0FBQSxDQUFDLEdBQUcsQ0FBQyxFQUFMLENBQUssQ0FBQyxDQUFDO1FBQzVCLE9BQU8sS0FBSyxDQUFDLE1BQU0sR0FBRyxDQUFDLENBQUMsQ0FBQyxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxLQUFLLENBQUMsR0FBRyxDQUFDLEdBQUcsS0FBSyxDQUFDLEdBQUcsR0FBRyxDQUFDLENBQUMsQ0FBQyxHQUFHLEdBQUcsQ0FBQztJQUM3RSxDQUFDO0lBSkQsd0JBSUMifQ==