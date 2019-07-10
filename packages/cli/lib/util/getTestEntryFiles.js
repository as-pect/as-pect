var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "glob"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var glob_1 = __importDefault(require("glob"));
    /**
     * This method returns a `Set<string>` of entry files for the compiler to compile.
     *
     * @param {Options} cliOptions - The command line arguments.
     * @param {string[]} include - An array of globs provided by the configuration.
     * @param {RegExp[]} disclude - An array of RegExp provided by the configuration.
     */
    function getTestEntryFiles(cliOptions, include, disclude) {
        var testEntryFiles = new Set();
        var fileRegexArg = cliOptions.file;
        var fileRegex = new RegExp(fileRegexArg);
        // for each pattern to be included
        for (var _i = 0, include_1 = include; _i < include_1.length; _i++) {
            var pattern = include_1[_i];
            // push all the resulting files so that each file gets tested individually
            entry: for (var _a = 0, _b = glob_1.default.sync(pattern); _a < _b.length; _a++) {
                var entry = _b[_a];
                // test for discludes
                for (var _c = 0, disclude_1 = disclude; _c < disclude_1.length; _c++) {
                    var test_1 = disclude_1[_c];
                    if (test_1.test(entry))
                        continue entry;
                }
                // if the fileRegex matches the test, add it to the entry file Set
                if (fileRegex.test(entry))
                    testEntryFiles.add(entry);
            }
        }
        return testEntryFiles;
    }
    exports.getTestEntryFiles = getTestEntryFiles;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZ2V0VGVzdEVudHJ5RmlsZXMuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdXRpbC9nZXRUZXN0RW50cnlGaWxlcy50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7OztJQUFBLDhDQUF3QjtJQUd4Qjs7Ozs7O09BTUc7SUFDSCxTQUFnQixpQkFBaUIsQ0FDL0IsVUFBbUIsRUFDbkIsT0FBaUIsRUFDakIsUUFBa0I7UUFFbEIsSUFBTSxjQUFjLEdBQUcsSUFBSSxHQUFHLEVBQVUsQ0FBQztRQUN6QyxJQUFNLFlBQVksR0FBRyxVQUFVLENBQUMsSUFBSSxDQUFDO1FBQ3JDLElBQU0sU0FBUyxHQUFXLElBQUksTUFBTSxDQUFDLFlBQVksQ0FBQyxDQUFDO1FBQ25ELGtDQUFrQztRQUNsQyxLQUFzQixVQUFPLEVBQVAsbUJBQU8sRUFBUCxxQkFBTyxFQUFQLElBQU8sRUFBRTtZQUExQixJQUFNLE9BQU8sZ0JBQUE7WUFDaEIsMEVBQTBFO1lBQzFFLEtBQUssRUFBRSxLQUFvQixVQUFrQixFQUFsQixLQUFBLGNBQUksQ0FBQyxJQUFJLENBQUMsT0FBTyxDQUFDLEVBQWxCLGNBQWtCLEVBQWxCLElBQWtCLEVBQUU7Z0JBQW5DLElBQU0sS0FBSyxTQUFBO2dCQUNyQixxQkFBcUI7Z0JBQ3JCLEtBQW1CLFVBQVEsRUFBUixxQkFBUSxFQUFSLHNCQUFRLEVBQVIsSUFBUSxFQUFFO29CQUF4QixJQUFNLE1BQUksaUJBQUE7b0JBQ2IsSUFBSSxNQUFJLENBQUMsSUFBSSxDQUFDLEtBQUssQ0FBQzt3QkFBRSxTQUFTLEtBQUssQ0FBQztpQkFDdEM7Z0JBQ0Qsa0VBQWtFO2dCQUNsRSxJQUFJLFNBQVMsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDO29CQUFFLGNBQWMsQ0FBQyxHQUFHLENBQUMsS0FBSyxDQUFDLENBQUM7YUFDdEQ7U0FDRjtRQUVELE9BQU8sY0FBYyxDQUFDO0lBQ3hCLENBQUM7SUF0QkQsOENBc0JDIn0=