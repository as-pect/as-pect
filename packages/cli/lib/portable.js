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
        define(["require", "exports", "chalk", "fs", "path"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
    var fs_1 = __importDefault(require("fs"));
    var path_1 = __importDefault(require("path"));
    var assemblyFolder = path_1.default.join(process.cwd(), "assembly");
    var testFolder = path_1.default.join(assemblyFolder, "__tests__");
    var typesFileSource = require.resolve("@as-pect/core/types/as-pect.portable.d.ts");
    var typesFile = path_1.default.join(testFolder, "as-pect.d.ts");
    /**
     * This method creates a portable types file to the current testing directory located at
     * `./assembly/__tests__/` for the current project.
     */
    function portable() {
        console.log("");
        console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgWhite.black [Log]} Initializing portable types."], ["{bgWhite.black [Log]} Initializing portable types."]))));
        console.log("");
        // Create the assembly folder if it doesn't exist
        if (!fs_1.default.existsSync(assemblyFolder)) {
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"]))));
            fs_1.default.mkdirSync(assemblyFolder);
        }
        // Create the test folder if it doesn't exist
        if (!fs_1.default.existsSync(testFolder)) {
            console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"]))));
            fs_1.default.mkdirSync(testFolder);
        }
        // Always create the types file
        console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}"], ["{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}"]))));
        fs_1.default.createReadStream(typesFileSource, "utf-8").pipe(fs_1.default.createWriteStream(typesFile, "utf-8"));
    }
    exports.portable = portable;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoicG9ydGFibGUuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi9zcmMvcG9ydGFibGUudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEsZ0RBQTBCO0lBQzFCLDBDQUFvQjtJQUNwQiw4Q0FBd0I7SUFFeEIsSUFBTSxjQUFjLEdBQUcsY0FBSSxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsR0FBRyxFQUFFLEVBQUUsVUFBVSxDQUFDLENBQUM7SUFDNUQsSUFBTSxVQUFVLEdBQUcsY0FBSSxDQUFDLElBQUksQ0FBQyxjQUFjLEVBQUUsV0FBVyxDQUFDLENBQUM7SUFDMUQsSUFBTSxlQUFlLEdBQUcsT0FBTyxDQUFDLE9BQU8sQ0FBQywyQ0FBMkMsQ0FBQyxDQUFDO0lBQ3JGLElBQU0sU0FBUyxHQUFHLGNBQUksQ0FBQyxJQUFJLENBQUMsVUFBVSxFQUFFLGNBQWMsQ0FBQyxDQUFDO0lBRXhEOzs7T0FHRztJQUNILFNBQWdCLFFBQVE7UUFDdEIsT0FBTyxDQUFDLEdBQUcsQ0FBQyxFQUFFLENBQUMsQ0FBQztRQUNoQixPQUFPLENBQUMsR0FBRyxDQUFDLGVBQUssdUhBQUEsb0RBQW9ELEtBQUMsQ0FBQztRQUN2RSxPQUFPLENBQUMsR0FBRyxDQUFDLEVBQUUsQ0FBQyxDQUFDO1FBQ2hCLGlEQUFpRDtRQUNqRCxJQUFJLENBQUMsWUFBRSxDQUFDLFVBQVUsQ0FBQyxjQUFjLENBQUMsRUFBRTtZQUNsQyxPQUFPLENBQUMsR0FBRyxDQUNULGVBQUssZ0lBQUEsNkRBQTZELEtBQ25FLENBQUM7WUFDRixZQUFFLENBQUMsU0FBUyxDQUFDLGNBQWMsQ0FBQyxDQUFDO1NBQzlCO1FBQ0QsNkNBQTZDO1FBQzdDLElBQUksQ0FBQyxZQUFFLENBQUMsVUFBVSxDQUFDLFVBQVUsQ0FBQyxFQUFFO1lBQzlCLE9BQU8sQ0FBQyxHQUFHLENBQ1QsZUFBSywwSUFBQSx1RUFBdUUsS0FDN0UsQ0FBQztZQUNGLFlBQUUsQ0FBQyxTQUFTLENBQUMsVUFBVSxDQUFDLENBQUM7U0FDMUI7UUFFRCwrQkFBK0I7UUFDL0IsT0FBTyxDQUFDLEdBQUcsQ0FDVCxlQUFLLGtKQUFBLCtFQUErRSxLQUNyRixDQUFDO1FBQ0YsWUFBRSxDQUFDLGdCQUFnQixDQUFDLGVBQWUsRUFBRSxPQUFPLENBQUMsQ0FBQyxJQUFJLENBQ2hELFlBQUUsQ0FBQyxpQkFBaUIsQ0FBQyxTQUFTLEVBQUUsT0FBTyxDQUFDLENBQ3pDLENBQUM7SUFDSixDQUFDO0lBMUJELDRCQTBCQyJ9