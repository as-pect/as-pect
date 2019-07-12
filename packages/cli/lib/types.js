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
    var fs_1 = require("fs");
    var path_1 = require("path");
    /**
     * @ignore
     *
     * This method creates a types file to the current testing directory located at
     * `./assembly/__tests__/` for the current project.
     */
    function types() {
        var assemblyFolder = path_1.join(process.cwd(), "assembly");
        var testFolder = path_1.join(assemblyFolder, "__tests__");
        var typesFileSource = require.resolve("@as-pect/core/types/as-pect.d.ts");
        var typesFile = path_1.join(testFolder, "as-pect.d.ts");
        console.log("");
        console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgWhite.black [Log]} Initializing types."], ["{bgWhite.black [Log]} Initializing types."]))));
        console.log("");
        // Create the assembly folder if it doesn't exist
        if (!fs_1.existsSync(assemblyFolder)) {
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"]))));
            fs_1.mkdirSync(assemblyFolder);
        }
        // Create the test folder if it doesn't exist
        if (!fs_1.existsSync(testFolder)) {
            console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"]))));
            fs_1.mkdirSync(testFolder);
        }
        // Always create the types file
        console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}"], ["{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}"]))));
        fs_1.createReadStream(typesFileSource, "utf-8").pipe(fs_1.createWriteStream(typesFile, "utf-8"));
    }
    exports.types = types;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoidHlwZXMuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi9zcmMvdHlwZXMudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQUEsZ0RBQTBCO0lBQzFCLHlCQUFnRjtJQUNoRiw2QkFBNEI7SUFFNUI7Ozs7O09BS0c7SUFDSCxTQUFnQixLQUFLO1FBQ25CLElBQU0sY0FBYyxHQUFHLFdBQUksQ0FBQyxPQUFPLENBQUMsR0FBRyxFQUFFLEVBQUUsVUFBVSxDQUFDLENBQUM7UUFDdkQsSUFBTSxVQUFVLEdBQUcsV0FBSSxDQUFDLGNBQWMsRUFBRSxXQUFXLENBQUMsQ0FBQztRQUNyRCxJQUFNLGVBQWUsR0FBRyxPQUFPLENBQUMsT0FBTyxDQUFDLGtDQUFrQyxDQUFDLENBQUM7UUFDNUUsSUFBTSxTQUFTLEdBQUcsV0FBSSxDQUFDLFVBQVUsRUFBRSxjQUFjLENBQUMsQ0FBQztRQUVuRCxPQUFPLENBQUMsR0FBRyxDQUFDLEVBQUUsQ0FBQyxDQUFDO1FBQ2hCLE9BQU8sQ0FBQyxHQUFHLENBQUMsZUFBSyw4R0FBQSwyQ0FBMkMsS0FBQyxDQUFDO1FBQzlELE9BQU8sQ0FBQyxHQUFHLENBQUMsRUFBRSxDQUFDLENBQUM7UUFDaEIsaURBQWlEO1FBQ2pELElBQUksQ0FBQyxlQUFVLENBQUMsY0FBYyxDQUFDLEVBQUU7WUFDL0IsT0FBTyxDQUFDLEdBQUcsQ0FDVCxlQUFLLGdJQUFBLDZEQUE2RCxLQUNuRSxDQUFDO1lBQ0YsY0FBUyxDQUFDLGNBQWMsQ0FBQyxDQUFDO1NBQzNCO1FBQ0QsNkNBQTZDO1FBQzdDLElBQUksQ0FBQyxlQUFVLENBQUMsVUFBVSxDQUFDLEVBQUU7WUFDM0IsT0FBTyxDQUFDLEdBQUcsQ0FDVCxlQUFLLDBJQUFBLHVFQUF1RSxLQUM3RSxDQUFDO1lBQ0YsY0FBUyxDQUFDLFVBQVUsQ0FBQyxDQUFDO1NBQ3ZCO1FBQ0QsK0JBQStCO1FBQy9CLE9BQU8sQ0FBQyxHQUFHLENBQ1QsZUFBSyxrSkFBQSwrRUFBK0UsS0FDckYsQ0FBQztRQUNGLHFCQUFnQixDQUFDLGVBQWUsRUFBRSxPQUFPLENBQUMsQ0FBQyxJQUFJLENBQzdDLHNCQUFpQixDQUFDLFNBQVMsRUFBRSxPQUFPLENBQUMsQ0FDdEMsQ0FBQztJQUNKLENBQUM7SUE5QkQsc0JBOEJDIn0=