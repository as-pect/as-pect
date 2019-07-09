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
    var assemblyFolder = path_1.default.join(process.cwd(), "assembly");
    var testFolder = path_1.default.join(assemblyFolder, "__tests__");
    var typesFileSource = path_1.default.join(__dirname, "../../assembly/__tests__/as-pect.d.ts");
    var typesFile = path_1.default.join(testFolder, "as-pect.d.ts");
    /**
     * This method initializes a new test project. It is opinionated and reflects the needs of 99% of
     * AssemblyScript developers following the standard way of creating a new AssemblyScript project.
     */
    function init() {
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
                fs_1.default.createReadStream(exampleFileSource, "utf-8").pipe(fs_1.default.createWriteStream(exampleFile, "utf-8"));
            }
        }
        // create the types file if it doesn't exist for typescript tooling users
        if (!fs_1.default.existsSync(typesFile)) {
            console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}"], ["{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}"]))));
            fs_1.default.createReadStream(typesFileSource, "utf-8").pipe(fs_1.default.createWriteStream(typesFile, "utf-8"));
        }
        // create the default configuration file
        var configFile = path_1.default.join(process.cwd(), "as-pect.config.js");
        var configFileSource = path_1.default.join(__dirname, "../../init/as-pect.config.js");
        if (!fs_1.default.existsSync(configFile)) {
            console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgWhite.black [Log]} Creating file: {yellow as-pect.config.js}"], ["{bgWhite.black [Log]} Creating file: {yellow as-pect.config.js}"]))));
            fs_1.default.createReadStream(configFileSource, "utf-8").pipe(fs_1.default.createWriteStream(configFile, "utf-8"));
        }
    }
    exports.init = init;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5pdC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9jbGkvaW5pdC50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFBQSxnREFBMEI7SUFDMUIsOENBQXdCO0lBQ3hCLDBDQUFvQjtJQUVwQixJQUFNLGNBQWMsR0FBRyxjQUFJLENBQUMsSUFBSSxDQUFDLE9BQU8sQ0FBQyxHQUFHLEVBQUUsRUFBRSxVQUFVLENBQUMsQ0FBQztJQUM1RCxJQUFNLFVBQVUsR0FBRyxjQUFJLENBQUMsSUFBSSxDQUFDLGNBQWMsRUFBRSxXQUFXLENBQUMsQ0FBQztJQUMxRCxJQUFNLGVBQWUsR0FBRyxjQUFJLENBQUMsSUFBSSxDQUMvQixTQUFTLEVBQ1QsdUNBQXVDLENBQ3hDLENBQUM7SUFDRixJQUFNLFNBQVMsR0FBRyxjQUFJLENBQUMsSUFBSSxDQUFDLFVBQVUsRUFBRSxjQUFjLENBQUMsQ0FBQztJQUV4RDs7O09BR0c7SUFDSCxTQUFnQixJQUFJO1FBQ2xCLE9BQU8sQ0FBQyxHQUFHLENBQUMsRUFBRSxDQUFDLENBQUM7UUFDaEIsT0FBTyxDQUFDLEdBQUcsQ0FBQyxlQUFLLHlIQUFBLHNEQUFzRCxLQUFDLENBQUM7UUFDekUsT0FBTyxDQUFDLEdBQUcsQ0FBQyxFQUFFLENBQUMsQ0FBQztRQUNoQixpREFBaUQ7UUFDakQsSUFBSSxDQUFDLFlBQUUsQ0FBQyxVQUFVLENBQUMsY0FBYyxDQUFDLEVBQUU7WUFDbEMsT0FBTyxDQUFDLEdBQUcsQ0FDVCxlQUFLLGdJQUFBLDZEQUE2RCxLQUNuRSxDQUFDO1lBQ0YsWUFBRSxDQUFDLFNBQVMsQ0FBQyxjQUFjLENBQUMsQ0FBQztTQUM5QjtRQUNELDZDQUE2QztRQUM3QyxJQUFJLENBQUMsWUFBRSxDQUFDLFVBQVUsQ0FBQyxVQUFVLENBQUMsRUFBRTtZQUM5QixPQUFPLENBQUMsR0FBRyxDQUNULGVBQUssMElBQUEsdUVBQXVFLEtBQzdFLENBQUM7WUFDRixZQUFFLENBQUMsU0FBUyxDQUFDLFVBQVUsQ0FBQyxDQUFDO1lBQ3pCLHNFQUFzRTtZQUN0RSxJQUFNLFdBQVcsR0FBRyxjQUFJLENBQUMsSUFBSSxDQUFDLFVBQVUsRUFBRSxpQkFBaUIsQ0FBQyxDQUFDO1lBQzdELElBQU0saUJBQWlCLEdBQUcsY0FBSSxDQUFDLElBQUksQ0FDakMsU0FBUyxFQUNULDRCQUE0QixDQUM3QixDQUFDO1lBQ0YsSUFBSSxDQUFDLFlBQUUsQ0FBQyxVQUFVLENBQUMsV0FBVyxDQUFDLEVBQUU7Z0JBQy9CLE9BQU8sQ0FBQyxHQUFHLENBQ1QsZUFBSyx1SkFBQSxvRkFBb0YsS0FDMUYsQ0FBQztnQkFDRixZQUFFLENBQUMsZ0JBQWdCLENBQUMsaUJBQWlCLEVBQUUsT0FBTyxDQUFDLENBQUMsSUFBSSxDQUNsRCxZQUFFLENBQUMsaUJBQWlCLENBQUMsV0FBVyxFQUFFLE9BQU8sQ0FBQyxDQUMzQyxDQUFDO2FBQ0g7U0FDRjtRQUNELHlFQUF5RTtRQUN6RSxJQUFJLENBQUMsWUFBRSxDQUFDLFVBQVUsQ0FBQyxTQUFTLENBQUMsRUFBRTtZQUM3QixPQUFPLENBQUMsR0FBRyxDQUNULGVBQUssa0pBQUEsK0VBQStFLEtBQ3JGLENBQUM7WUFDRixZQUFFLENBQUMsZ0JBQWdCLENBQUMsZUFBZSxFQUFFLE9BQU8sQ0FBQyxDQUFDLElBQUksQ0FDaEQsWUFBRSxDQUFDLGlCQUFpQixDQUFDLFNBQVMsRUFBRSxPQUFPLENBQUMsQ0FDekMsQ0FBQztTQUNIO1FBQ0Qsd0NBQXdDO1FBQ3hDLElBQU0sVUFBVSxHQUFHLGNBQUksQ0FBQyxJQUFJLENBQUMsT0FBTyxDQUFDLEdBQUcsRUFBRSxFQUFFLG1CQUFtQixDQUFDLENBQUM7UUFDakUsSUFBTSxnQkFBZ0IsR0FBRyxjQUFJLENBQUMsSUFBSSxDQUFDLFNBQVMsRUFBRSw4QkFBOEIsQ0FBQyxDQUFDO1FBQzlFLElBQUksQ0FBQyxZQUFFLENBQUMsVUFBVSxDQUFDLFVBQVUsQ0FBQyxFQUFFO1lBQzlCLE9BQU8sQ0FBQyxHQUFHLENBQ1QsZUFBSyxvSUFBQSxpRUFBaUUsS0FDdkUsQ0FBQztZQUNGLFlBQUUsQ0FBQyxnQkFBZ0IsQ0FBQyxnQkFBZ0IsRUFBRSxPQUFPLENBQUMsQ0FBQyxJQUFJLENBQ2pELFlBQUUsQ0FBQyxpQkFBaUIsQ0FBQyxVQUFVLEVBQUUsT0FBTyxDQUFDLENBQzFDLENBQUM7U0FDSDtJQUNILENBQUM7SUFwREQsb0JBb0RDIn0=