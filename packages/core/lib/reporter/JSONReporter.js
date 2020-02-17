var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../test/TestReporter", "fs", "path", "./util/stringifyHostValue"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestReporter_1 = require("../test/TestReporter");
    var fs_1 = require("fs");
    var path_1 = require("path");
    var stringifyHostValue_1 = require("./util/stringifyHostValue");
    /**
     * This class reports all relevant test statistics to a JSON file located at
     * `{testLocation}.spec.json`.
     */
    var JSONReporter = /** @class */ (function (_super) {
        __extends(JSONReporter, _super);
        function JSONReporter(_options) {
            var _this = _super.call(this) || this;
            _this.file = null;
            _this.first = true;
            return _this;
        }
        JSONReporter.prototype.onStart = function (suite) {
            var extension = path_1.extname(suite.fileName);
            var dir = path_1.dirname(suite.fileName);
            var base = path_1.basename(suite.fileName, extension);
            var outPath = path_1.join(process.cwd(), dir, base + ".json");
            this.file = fs_1.createWriteStream(outPath, "utf8");
            this.file.write("[");
            this.first = true;
        };
        JSONReporter.prototype.onGroupStart = function () { };
        JSONReporter.prototype.onGroupFinish = function () { };
        JSONReporter.prototype.onFinish = function () {
            this.file.end("\n]");
        };
        JSONReporter.prototype.onTestStart = function () { };
        JSONReporter.prototype.onTestFinish = function (group, result) {
            this.file.write((this.first ? "\n" : ",\n") +
                JSON.stringify({
                    group: group.name,
                    name: result.name,
                    ran: result.ran,
                    pass: result.pass,
                    runtime: result.runTime,
                    message: result.message,
                    actual: result.actual ? stringifyHostValue_1.stringifyHostValue(result.actual, 0) : null,
                    expected: result.expected ? stringifyHostValue_1.stringifyHostValue(result.expected, 0) : null,
                    average: result.average,
                    median: result.median,
                    max: result.max,
                    min: result.min,
                    stdDev: result.stdDev,
                    variance: result.variance,
                }));
            this.first = false;
        };
        JSONReporter.prototype.onTodo = function (group, desc) {
            this.file.write((this.first ? "\n" : ",\n") +
                JSON.stringify({
                    group: group.name,
                    name: "TODO:" + desc,
                    ran: false,
                    pass: null,
                    runtime: 0,
                    message: "",
                    actual: null,
                    expected: null,
                    average: 0,
                    median: 0,
                    max: 0,
                    min: 0,
                    stdDev: 0,
                    variance: 0,
                }));
            this.first = false;
        };
        return JSONReporter;
    }(TestReporter_1.TestReporter));
    exports.default = JSONReporter;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiSlNPTlJlcG9ydGVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3JlcG9ydGVyL0pTT05SZXBvcnRlci50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFBQSxxREFBb0Q7SUFFcEQseUJBQW9EO0lBQ3BELDZCQUF3RDtJQUd4RCxnRUFBK0Q7SUFFL0Q7OztPQUdHO0lBQ0g7UUFBMEMsZ0NBQVk7UUFDcEQsc0JBQVksUUFBYztZQUExQixZQUNFLGlCQUFPLFNBQ1I7WUFFUyxVQUFJLEdBQXVCLElBQUksQ0FBQztZQUVsQyxXQUFLLEdBQVksSUFBSSxDQUFDOztRQUo5QixDQUFDO1FBS00sOEJBQU8sR0FBZCxVQUFlLEtBQWtCO1lBQy9CLElBQU0sU0FBUyxHQUFHLGNBQU8sQ0FBQyxLQUFLLENBQUMsUUFBUSxDQUFDLENBQUM7WUFDMUMsSUFBTSxHQUFHLEdBQUcsY0FBTyxDQUFDLEtBQUssQ0FBQyxRQUFRLENBQUMsQ0FBQztZQUNwQyxJQUFNLElBQUksR0FBRyxlQUFRLENBQUMsS0FBSyxDQUFDLFFBQVEsRUFBRSxTQUFTLENBQUMsQ0FBQztZQUNqRCxJQUFNLE9BQU8sR0FBRyxXQUFJLENBQUMsT0FBTyxDQUFDLEdBQUcsRUFBRSxFQUFFLEdBQUcsRUFBRSxJQUFJLEdBQUcsT0FBTyxDQUFDLENBQUM7WUFDekQsSUFBSSxDQUFDLElBQUksR0FBRyxzQkFBaUIsQ0FBQyxPQUFPLEVBQUUsTUFBTSxDQUFDLENBQUM7WUFDL0MsSUFBSSxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsR0FBRyxDQUFDLENBQUM7WUFDckIsSUFBSSxDQUFDLEtBQUssR0FBRyxJQUFJLENBQUM7UUFDcEIsQ0FBQztRQUVNLG1DQUFZLEdBQW5CLGNBQTZCLENBQUM7UUFDdkIsb0NBQWEsR0FBcEIsY0FBOEIsQ0FBQztRQUN4QiwrQkFBUSxHQUFmO1lBQ0UsSUFBSSxDQUFDLElBQUssQ0FBQyxHQUFHLENBQUMsS0FBSyxDQUFDLENBQUM7UUFDeEIsQ0FBQztRQUVNLGtDQUFXLEdBQWxCLGNBQXNCLENBQUM7UUFFaEIsbUNBQVksR0FBbkIsVUFBb0IsS0FBZ0IsRUFBRSxNQUFrQjtZQUN0RCxJQUFJLENBQUMsSUFBSyxDQUFDLEtBQUssQ0FDZCxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxDQUFDO2dCQUN6QixJQUFJLENBQUMsU0FBUyxDQUFDO29CQUNiLEtBQUssRUFBRSxLQUFLLENBQUMsSUFBSTtvQkFDakIsSUFBSSxFQUFFLE1BQU0sQ0FBQyxJQUFJO29CQUNqQixHQUFHLEVBQUUsTUFBTSxDQUFDLEdBQUc7b0JBQ2YsSUFBSSxFQUFFLE1BQU0sQ0FBQyxJQUFJO29CQUNqQixPQUFPLEVBQUUsTUFBTSxDQUFDLE9BQU87b0JBQ3ZCLE9BQU8sRUFBRSxNQUFNLENBQUMsT0FBTztvQkFDdkIsTUFBTSxFQUFFLE1BQU0sQ0FBQyxNQUFNLENBQUMsQ0FBQyxDQUFDLHVDQUFrQixDQUFDLE1BQU0sQ0FBQyxNQUFNLEVBQUUsQ0FBQyxDQUFDLENBQUMsQ0FBQyxDQUFDLElBQUk7b0JBQ25FLFFBQVEsRUFBRSxNQUFNLENBQUMsUUFBUSxDQUFDLENBQUMsQ0FBQyx1Q0FBa0IsQ0FBQyxNQUFNLENBQUMsUUFBUSxFQUFFLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxJQUFJO29CQUN6RSxPQUFPLEVBQUUsTUFBTSxDQUFDLE9BQU87b0JBQ3ZCLE1BQU0sRUFBRSxNQUFNLENBQUMsTUFBTTtvQkFDckIsR0FBRyxFQUFFLE1BQU0sQ0FBQyxHQUFHO29CQUNmLEdBQUcsRUFBRSxNQUFNLENBQUMsR0FBRztvQkFDZixNQUFNLEVBQUUsTUFBTSxDQUFDLE1BQU07b0JBQ3JCLFFBQVEsRUFBRSxNQUFNLENBQUMsUUFBUTtpQkFDMUIsQ0FBQyxDQUNMLENBQUM7WUFDRixJQUFJLENBQUMsS0FBSyxHQUFHLEtBQUssQ0FBQztRQUNyQixDQUFDO1FBRU0sNkJBQU0sR0FBYixVQUFjLEtBQWdCLEVBQUUsSUFBWTtZQUMxQyxJQUFJLENBQUMsSUFBSyxDQUFDLEtBQUssQ0FDZCxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsS0FBSyxDQUFDO2dCQUN6QixJQUFJLENBQUMsU0FBUyxDQUFDO29CQUNiLEtBQUssRUFBRSxLQUFLLENBQUMsSUFBSTtvQkFDakIsSUFBSSxFQUFFLE9BQU8sR0FBRyxJQUFJO29CQUNwQixHQUFHLEVBQUUsS0FBSztvQkFDVixJQUFJLEVBQUUsSUFBSTtvQkFDVixPQUFPLEVBQUUsQ0FBQztvQkFDVixPQUFPLEVBQUUsRUFBRTtvQkFDWCxNQUFNLEVBQUUsSUFBSTtvQkFDWixRQUFRLEVBQUUsSUFBSTtvQkFDZCxPQUFPLEVBQUUsQ0FBQztvQkFDVixNQUFNLEVBQUUsQ0FBQztvQkFDVCxHQUFHLEVBQUUsQ0FBQztvQkFDTixHQUFHLEVBQUUsQ0FBQztvQkFDTixNQUFNLEVBQUUsQ0FBQztvQkFDVCxRQUFRLEVBQUUsQ0FBQztpQkFDWixDQUFDLENBQ0wsQ0FBQztZQUNGLElBQUksQ0FBQyxLQUFLLEdBQUcsS0FBSyxDQUFDO1FBQ3JCLENBQUM7UUFDSCxtQkFBQztJQUFELENBQUMsQUF2RUQsQ0FBMEMsMkJBQVksR0F1RXJEIn0=