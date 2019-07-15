(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./mean"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var mean_1 = require("./mean");
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoidmFyaWFuY2UuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvbWF0aC92YXJpYW5jZS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7OztJQUFBLCtCQUE4QjtJQUU5Qjs7Ozs7O09BTUc7SUFDSCxTQUFnQixRQUFRLENBQUMsS0FBZTtRQUN0QyxJQUFNLE9BQU8sR0FBRyxXQUFJLENBQUMsS0FBSyxDQUFDLENBQUM7UUFDNUIsSUFBTSxLQUFLLEdBQUcsS0FBSyxDQUFDLE1BQU0sQ0FBQztRQUUzQixJQUFNLFdBQVcsR0FBYSxFQUFFLENBQUM7UUFFakMsS0FBSyxJQUFJLENBQUMsR0FBRyxDQUFDLEVBQUUsQ0FBQyxHQUFHLEtBQUssRUFBRSxDQUFDLEVBQUUsRUFBRTtZQUM5QixJQUFJLFVBQVUsR0FBRyxLQUFLLENBQUMsQ0FBQyxDQUFDLEdBQUcsT0FBTyxDQUFDO1lBQ3BDLFdBQVcsQ0FBQyxJQUFJLENBQUMsVUFBVSxHQUFHLFVBQVUsQ0FBQyxDQUFDO1NBQzNDO1FBRUQsK0VBQStFO1FBQy9FLElBQUksTUFBTSxHQUFHLENBQUMsQ0FBQztRQUNmLEtBQUssSUFBSSxDQUFDLEdBQUcsQ0FBQyxFQUFFLENBQUMsR0FBRyxLQUFLLEVBQUUsQ0FBQyxFQUFFLEVBQUU7WUFDOUIsTUFBTSxJQUFJLFdBQVcsQ0FBQyxDQUFDLENBQUMsQ0FBQztTQUMxQjtRQUVELE9BQU8sTUFBTSxHQUFHLENBQUMsS0FBSyxHQUFHLENBQUMsQ0FBQyxDQUFDO0lBQzlCLENBQUM7SUFsQkQsNEJBa0JDIn0=