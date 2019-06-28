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
        define(["require", "exports", "worker_threads", "chalk", "path", "fs", "../util/writeFile"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var worker_threads_1 = require("worker_threads");
    var chalk_1 = __importDefault(require("chalk"));
    var path_1 = __importDefault(require("path"));
    var fs_1 = __importDefault(require("fs"));
    var writeFile_1 = require("../util/writeFile");
    var asc;
    try {
        /** Collect the assemblyscript module path. */
        var assemblyScriptFolder = worker_threads_1.workerData.compiler.startsWith(".")
            ? path_1.default.join(process.cwd(), worker_threads_1.workerData.compiler)
            : worker_threads_1.workerData.compiler;
        /** Next, obtain the compiler, and assert it has a main function. */
        asc = require(path_1.default.join(assemblyScriptFolder, "dist", "asc"));
        if (!asc) {
            throw new Error(worker_threads_1.workerData.compiler + "/dist/asc has no exports.");
        }
        if (!asc.main) {
            throw new Error(worker_threads_1.workerData.compiler + "/dist/asc does not export a main() function.");
        }
    }
    catch (ex) {
        console.error(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), worker_threads_1.workerData.compiler));
        console.error(ex);
        worker_threads_1.parentPort.postMessage({
            type: "Error",
            props: {
                error: {
                    message: ex.message,
                    name: ex.name,
                    stack: ex.stack,
                },
                binary: null,
                file: null,
            },
        });
    }
    var fileMap = new Map();
    var folderMap = new Map();
    function run(command) {
        var binary;
        var filePromises = [];
        asc.main(command.props.args, {
            stdout: process.stdout,
            stderr: process.stderr,
            listFiles: function (dirname, baseDir) {
                var folder = path_1.default.join(baseDir, dirname);
                if (folderMap.has(folder)) {
                    return folderMap.get(folder);
                }
                try {
                    var results = fs_1.default.readdirSync(folder).filter(function (file) { return /^(?!.*\.d\.ts$).*\.ts$/.test(file); });
                    folderMap.set(folder, results);
                    return results;
                }
                catch (e) {
                    return [];
                }
            },
            readFile: function (filename, baseDir) {
                var fileName = path_1.default.join(baseDir, filename);
                if (fileMap.has(fileName)) {
                    return fileMap.get(fileName);
                }
                try {
                    var contents = fs_1.default.readFileSync(fileName, { encoding: "utf8" });
                    fileMap.set(fileName, contents);
                    return contents;
                }
                catch (e) {
                    return null;
                }
            },
            writeFile: function (name, contents) {
                var ext = path_1.default.extname(name);
                // get the wasm file
                if (ext === ".wasm") {
                    binary = contents;
                    if (!command.props.outputBinary)
                        return;
                }
                var file = command.props.file;
                var outfileName = path_1.default.join(path_1.default.dirname(file), path_1.default.basename(file, path_1.default.extname(file)) + ext);
                filePromises.push(writeFile_1.writeFile(outfileName, contents));
            }
        }, function (error) { return Promise.all(filePromises)
            .then(function () {
            worker_threads_1.parentPort.postMessage({
                type: "Result",
                props: {
                    error: error ? {
                        message: error.message,
                        stack: error.stack,
                        name: error.name,
                    } : null,
                    binary: binary,
                    file: command.props.file,
                },
            }, binary ? [binary.buffer] : []);
        })
            .catch(function (error) {
            worker_threads_1.parentPort.postMessage({
                type: "Error",
                props: {
                    error: error ? {
                        message: error.message,
                        stack: error.stack,
                        name: error.name,
                    } : null,
                },
            });
        }); });
    }
    worker_threads_1.parentPort.on("message", run);
    var templateObject_1;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY29tcGlsZXIuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi9zcmMvY2xpL3dvcmtsZXRzL2NvbXBpbGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUFBLGlEQUF3RDtJQUN4RCxnREFBMEI7SUFDMUIsOENBQXdCO0lBRXhCLDBDQUFvQjtJQUNwQiwrQ0FBOEM7SUFFOUMsSUFBSSxHQUFRLENBQUM7SUFFYixJQUFJO1FBQ0YsOENBQThDO1FBQzlDLElBQU0sb0JBQW9CLEdBQUcsMkJBQVUsQ0FBQyxRQUFRLENBQUMsVUFBVSxDQUFDLEdBQUcsQ0FBQztZQUM5RCxDQUFDLENBQUMsY0FBSSxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsR0FBRyxFQUFFLEVBQUUsMkJBQVUsQ0FBQyxRQUFRLENBQUM7WUFDL0MsQ0FBQyxDQUFDLDJCQUFVLENBQUMsUUFBUSxDQUFDO1FBRXhCLG9FQUFvRTtRQUNwRSxHQUFHLEdBQUcsT0FBTyxDQUFDLGNBQUksQ0FBQyxJQUFJLENBQUMsb0JBQW9CLEVBQUUsTUFBTSxFQUFFLEtBQUssQ0FBQyxDQUFDLENBQUM7UUFDOUQsSUFBSSxDQUFDLEdBQUcsRUFBRTtZQUNSLE1BQU0sSUFBSSxLQUFLLENBQUksMkJBQVUsQ0FBQyxRQUFRLDhCQUEyQixDQUFDLENBQUM7U0FDcEU7UUFDRCxJQUFJLENBQUMsR0FBRyxDQUFDLElBQUksRUFBRTtZQUNiLE1BQU0sSUFBSSxLQUFLLENBQUksMkJBQVUsQ0FBQyxRQUFRLGlEQUE4QyxDQUFDLENBQUM7U0FDdkY7S0FDRjtJQUFDLE9BQU8sRUFBRSxFQUFFO1FBQ1gsT0FBTyxDQUFDLEtBQUssQ0FBQyxlQUFLLDJJQUFBLGlFQUFrRSxFQUFtQixLQUFLLEtBQXhCLDJCQUFVLENBQUMsUUFBUSxFQUFNLENBQUM7UUFDL0csT0FBTyxDQUFDLEtBQUssQ0FBQyxFQUFFLENBQUMsQ0FBQztRQUNsQiwyQkFBVyxDQUFDLFdBQVcsQ0FB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