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
     * @param {Options} yargs - The command line arguments.
     * @param {string[]} include - An array of globs provided by the configuration.
     * @param {RegExp[]} disclude - An array of RegExp provided by the configuration.
     */
    function getTestEntryFiles(yargs, include, disclude) {
        var testEntryFiles = new Set();
        var fileRegexArg = yargs.file;
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZ2V0VGVzdEVudHJ5RmlsZXMuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi9zcmMvY2xpL3V0aWwvZ2V0VGVzdEVudHJ5RmlsZXMudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7SUFBQSw4Q0FBd0I7SUFHeEI7Ozs7OztPQU1HO0lBQ0gsU0FBZ0IsaUJBQWlCLENBQy9CLEtBQWMsRUFDZCxPQUFpQixFQUNqQixRQUFrQjtRQUVsQixJQUFNLGNBQWMsR0FBRyxJQUFJLEdBQUcsRUFBVSxDQUFDO1FBQ3pDLElBQU0sWUFBWSxHQUFHLEtBQUssQ0FBQyxJQUFJLENBQUM7UUFDaEMsSUFBTSxTQUFTLEdBQVcsSUFBSSxNQUFNLENBQUMsWUFBWSxDQUFDLENBQUM7UUFDbkQsa0NBQWtDO1FBQ2xDLEtBQXNCLFVBQU8sRUFBUCxtQkFBTyxFQUFQLHFCQUFPLEVBQVAsSUFBTyxFQUFFO1lBQTFCLElBQU0sT0FBTyxnQkFBQTtZQUNoQiwwRUFBMEU7WUFDMUUsS0FBSyxFQUFFLEtBQW9CLFVBQWtCLEVBQWxCLEtBQUEsY0FBSSxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsRUFBbEIsY0FBa0IsRUFBbEIsSUFBa0IsRUFBRTtnQkFBbkMsSUFBTSxLQUFLLFNBQUE7Z0JBQ3JCLHFCQUFxQjtnQkFDckIsS0FBbUIsVUFBUSxFQUFSLHFCQUFRLEVBQVIsc0JBQVEsRUFBUixJQUFRLEVBQUU7b0JBQXhCLElBQU0sTUFBSSxpQkFBQTtvQkFDYixJQUFJLE1BQUksQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDO3dCQUFFLFNBQVMsS0FBSyxDQUFDO2lCQUN0QztnQkFDRCxrRUFBa0U7Z0JBQ2xFLElBQUksU0FBUyxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUM7b0JBQUUsY0FBYyxDQUFDLEdBQUcsQ0FBQyxLQUFLLENBQUMsQ0FBQzthQUN0RDtTQUNGO1FBRUQsT0FBTyxjQUFjLENBQUM7SUFDeEIsQ0FBQztJQXRCRCw4Q0FzQkMifQ==