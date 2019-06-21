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
        define(["require", "exports", "chalk", "path", "fs"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
    var path_1 = __importDefault(require("path"));
    var fs_1 = __importDefault(require("fs"));
    /**
     * This method initializes a new test project. It is opinionated and reflects the needs of 99% of
     * AssemblyScript developers following the standard way of creating a new AssemblyScript project.
     *
     * @param {string} assemblyFolder - The `./assembly/` folder for the current project.
     * @param {string} testFolder - The `./assembly/__tests__/` folder for the current project.
     * @param {string} typesFile - The types file location for the current project.
     * @param {string} typesFileSource - The types file source location for `as-pect`.
     */
    function init(assemblyFolder, testFolder, typesFile, typesFileSource) {
        console.log("");
        console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgWhite.black [Log]} Initializing test suite files."], ["{bgWhite.black [Log]} Initializing test suite files."]))));
        console.log("");
        // create the assembly folder if it doesn't exist
        if (!fs_1.default.existsSync(assemblyFolder)) {
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}"]))));
            fs_1.default.mkdirSync(assemblyFolder);
        }
        // Create the test folder if it doesn't exist
        if (!fs_1.default.existsSync(testFolder)) {
            console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"], ["{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}"]))));
            fs_1.default.mkdirSync(testFolder);
            // create the example file only if the __tests__ folder does not exist
            var exampleFile = path_1.default.join(testFolder, "example.spec.ts");
            var exampleFileSource = path_1.default.join(__dirname, "../../init/example.spec.ts");
            if (!fs_1.default.existsSync(exampleFile)) {
                console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/example.spec.ts}"], ["{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/example.spec.ts}"]))));
                fs_1.default.createReadStream(exampleFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(exampleFile, "utf-8"));
            }
        }
        // create the types file if it doesn't exist for typescript tooling users
        if (!fs_1.default.existsSync(typesFile)) {
            console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}"], ["{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}"]))));
            fs_1.default.createReadStream(typesFileSource, "utf-8")
                .pipe(fs_1.default.createWriteStream(typesFile, "utf-8"));
        }
        // create the default configuration file
        var configFile = path_1.default.join(process.cwd(), "as-pect.config.js");
        var configFileSource = path_1.default.join(__dirname, "../../init/as-pect.config.js");
        if (!fs_1.default.existsSync(configFile)) {
            console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow as-pect.config.js}"], ["{bgWhite.black [Log]} Creating file: {yellow as-pect.config.js}"]))));
            fs_1.default.createReadStream(configFileSource, "utf-8")
                .pipe(fs_1.default.createWriteStream(configFile, "utf-8"));
        }
    }
    exports.init = init;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5pdC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9jbGkvaW5pdC50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFBQSxnREFBMEI7SUFDMUIsOENBQXdCO0lBQ3hCLDBDQUFvQjtJQUVwQjs7Ozs7Ozs7T0FRRztJQUNILFNBQWdCLElBQUksQ0FBQyxjQUFzQixFQUFFLFVBQWtCLEVBQUUsU0FBaUIsRUFBRSxlQUF1QjtRQUN6RyxPQUFPLENBQUMsR0FBRyxDQUFDLEVBQUUsQ0FBQyxDQUFDO1FBQ2hCLE9BQU8sQ0FBQyxHQUFHLENBQUMsZUFBSyx5SEFBQSxzREFBc0QsS0FBQyxDQUFDO1FBQ3pFLE9BQU8sQ0FBQyxHQUFHLENBQUMsRUFBRSxDQUFDLENBQUM7UUFDaEIsaURBQWlEO1FBQ2pELElBQUksQ0FBQyxZQUFFLENBQUMsVUFBVSxDQUFDLGNBQWMsQ0FBQyxFQUFFO1lBQ2xDLE9BQU8sQ0FBQyxHQUFHLENBQUMsZUFBSyxnSUFBQSw2REFBNkQsS0FBQyxDQUFDO1lBQ2hGLFlBQUUsQ0FBQyxTQUFTLENBQUMsY0FBYyxDQUFDLENBQUM7U0FDOUI7UUFDRCw2Q0FBNkM7UUFDN0MsSUFBSSxDQUFDLFlBQUUsQ0FBQyxVQUFVLENBQUMsVUFBVSxDQUFDLEVBQUU7WUFDOUIsT0FBTyxDQUFDLEdBQUcsQ0FBQyxlQUFLLDBJQUFBLHVFQUF1RSxLQUFDLENBQUM7WUFDMUYsWUFBRSxDQUFDLFNBQVMsQ0FBQyxVQUFVLENBQUMsQ0FBQztZQUN6QixzRUFBc0U7WUFDdEUsSUFBTSxXQUFXLEdBQUcsY0FBSSxDQUFDLElBQUksQ0FBQyxVQUFVLEVBQUUsaUJBQWlCLENBQUMsQ0FBQztZQUM3RCxJQUFNLGlCQUFpQixHQUFHLGNBQUksQ0FBQyxJQUFJLENBQUMsU0FBUyxFQUFFLDRCQUE0QixDQUFDLENBQUM7WUFDN0UsSUFBSSxDQUFDLFlBQUUsQ0FBQyxVQUFVLENBQUMsV0FBVyxDQUFDLEVBQUU7Z0JBQy9CLE9BQU8sQ0FBQyxHQUFHLENBQUMsZUFBSyx1SkFBQSxvRkFBb0YsS0FBQyxDQUFDO2dCQUN2RyxZQUFFLENBQUMsZ0JBQWdCLENBQUMsaUJBQWlCLEVBQUUsT0FBTyxDQUFDO3FCQUM1QyxJQUFJLENBQUMsWUFBRSxDQUFDLGlCQUFpQixDQUFDLFdBQVcsRUFBRSxPQUFPLENBQUMsQ0FBQyxDQUFDO2FBQ3JEO1NBQ0Y7UUFDRCx5RUFBeUU7UUFDekUsSUFBSSxDQUFDLFlBQUUsQ0FBQyxVQUFVLENBQUMsU0FBUyxDQUFDLEVBQUU7WUFDN0IsT0FBTyxDQUFDLEdBQUcsQ0FBQyxlQUFLLGtKQUFBLCtFQUErRSxLQUFDLENBQUM7WUFDbEcsWUFBRSxDQUFDLGdCQUFnQixDQUFDLGVBQWUsRUFBRSxPQUFPLENBQUM7aUJBQzFDLElBQUksQ0FBQyxZQUFFLENBQUMsaUJBQWlCLENBQUMsU0FBUyxFQUFFLE9BQU8sQ0FBQyxDQUFDLENBQUM7U0FDbkQ7UUFDRCx3Q0FBd0M7UUFDeEMsSUFBTSxVQUFVLEdBQUcsY0FBSSxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsR0FBRyxFQUFFLEVBQUUsbUJBQW1CLENBQUMsQ0FBQztRQUNqRSxJQUFNLGdCQUFnQixHQUFHLGNBQUksQ0FBQyxJQUFJLENBQUMsU0FBUyxFQUFFLDhCQUE4QixDQUFDLENBQUM7UUFDOUUsSUFBSSxDQUFDLFlBQUUsQ0FBQyxVQUFVLENBQUMsVUFBVSxDQUFDLEVBQUU7WUFDOUIsT0FBTyxDQUFDLEdBQUcsQ0FBQyxlQUFLLG9JQUFBLGlFQUFpRSxLQUFDLENBQUM7WUFDcEYsWUFBRSxDQUFDLGdCQUFnQixDQUFDLGdCQUFnQixFQUFFLE9BQU8sQ0FBQztpQkFDM0MsSUFBSSxDQUFDLFlBQUUsQ0FBQyxpQkFBaUIsQ0FBQyxVQUFVLEVBQUUsT0FBTyxDQUFDLENBQUMsQ0FBQztTQUNwRDtJQUNILENBQUM7SUFwQ0Qsb0JBb0NDIn0=