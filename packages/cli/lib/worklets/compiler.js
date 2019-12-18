(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "fs", "path", "worker_threads", "../util/writeFile"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var fs_1 = require("fs");
    var path_1 = require("path");
    var worker_threads_1 = require("worker_threads");
    var writeFile_1 = require("../util/writeFile");
    /**
     * @ignore
     *
     * This variable holds the AssemblyScript compiler.
     */
    var asc = require(path_1.join(worker_threads_1.workerData.assemblyScriptFolder, "dist", "asc"));
    /**
     * @ignore
     *
     * This variable holds the fileMap for the compiler.
     */
    var fileMap = new Map();
    /**
     * @ignore
     *
     * This variable holds the folderMap for the compiler.
     */
    var folderMap = new Map();
    /**
     * @ignore
     *
     * Run a worklet command.
     * @param {ICommand} command - The command to run. (This is the compiler worklet command.)
     */
    function run(command) {
        var binary;
        var filePromises = [];
        asc.main(command.props.args, {
            stdout: process.stdout,
            stderr: process.stderr,
            listFiles: function (dirname, baseDir) {
                var folder = path_1.join(baseDir, dirname);
                if (folderMap.has(folder)) {
                    return folderMap.get(folder);
                }
                try {
                    var results = fs_1.readdirSync(folder)
                        .filter(function (file) { return /^(?!.*\.d\.ts$).*\.ts$/.test(file); });
                    folderMap.set(folder, results);
                    return results;
                }
                catch (e) {
                    return [];
                }
            },
            readFile: function (filename, baseDir) {
                var fileName = path_1.join(baseDir, filename);
                if (fileMap.has(fileName)) {
                    return fileMap.get(fileName);
                }
                try {
                    var contents = fs_1.readFileSync(fileName, { encoding: "utf8" });
                    fileMap.set(fileName, contents);
                    return contents;
                }
                catch (e) {
                    return null;
                }
            },
            writeFile: function (name, contents) {
                var ext = path_1.extname(name);
                // get the wasm file
                if (ext === ".wasm") {
                    binary = contents;
                    if (!command.props.outputBinary)
                        return;
                }
                var file = command.props.file;
                var outfileName = path_1.join(path_1.dirname(file), path_1.basename(file, path_1.extname(file)) + ext);
                filePromises.push(writeFile_1.writeFile(outfileName, contents));
            },
        }, function (error) {
            return Promise.all(filePromises)
                .then(function () {
                worker_threads_1.parentPort.postMessage({
                    type: "Result",
                    props: {
                        error: error
                            ? {
                                message: error.message,
                                stack: error.stack,
                                name: error.name,
                            }
                            : null,
                        binary: binary,
                        file: command.props.file,
                    },
                }, binary ? [binary.buffer] : []);
            })
                .catch(function (error) {
                worker_threads_1.parentPort.postMessage({
                    type: "Error",
                    props: {
                        error: error
                            ? {
                                message: error.message,
                                stack: error.stack,
                                name: error.name,
                            }
                            : null,
                    },
                });
            });
        });
    }
    worker_threads_1.parentPort.on("message", run);
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY29tcGlsZXIuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvd29ya2xldHMvY29tcGlsZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFDQSx5QkFBZ0Q7SUFDaEQsNkJBQXdEO0lBQ3hELGlEQUF3RDtJQUN4RCwrQ0FBOEM7SUFFOUM7Ozs7T0FJRztJQUNILElBQU0sR0FBRyxHQUFRLE9BQU8sQ0FBQyxXQUFJLENBQzNCLDJCQUFVLENBQUMsb0JBQW9CLEVBQy9CLE1BQU0sRUFDTixLQUFLLENBQ04sQ0FBQyxDQUFDO0lBRUg7Ozs7T0FJRztJQUNILElBQU0sT0FBTyxHQUF3QixJQUFJLEdBQUcsRUFBRSxDQUFDO0lBRS9DOzs7O09BSUc7SUFDSCxJQUFNLFNBQVMsR0FBMEIsSUFBSSxHQUFHLEVBQUUsQ0FBQztJQUVuRDs7Ozs7T0FLRztJQUNILFNBQVMsR0FBRyxDQUFDLE9BQWlCO1FBQzVCLElBQUksTUFBa0IsQ0FBQztRQUN2QixJQUFJLFlBQVksR0FBb0IsRUFBRSxDQUFDO1FBRXZDLEdBQUcsQ0FBQyxJQUFJLENBQ04sT0FBTyxDQUFDLEtBQUssQ0FBQyxJQUFJLEVBQ2xCO1lBQ0UsTUFBTSxFQUFFLE9BQU8sQ0FBQyxNQUFhO1lBQzdCLE1BQU0sRUFBRSxPQUFPLENBQUMsTUFBYTtZQUM3QixTQUFTLEVBQVQsVUFBVSxPQUFlLEVBQUUsT0FBZTtnQkFDeEMsSUFBTSxNQUFNLEdBQUcsV0FBSSxDQUFDLE9BQU8sRUFBRSxPQUFPLENBQUMsQ0FBQztnQkFDdEMsSUFBSSxTQUFTLENBQUMsR0FBRyxDQUFDLE1BQU0sQ0FBQyxFQUFFO29CQUN6QixPQUFPLFNBQVMsQ0FBQyxHQUFHLENBQUMsTUFBTSxDQUFFLENBQUM7aUJBQy9CO2dCQUVELElBQUk7b0JBQ0YsSUFBTSxPQUFPLEdBQUcsZ0JBQVcsQ0FBQyxNQUFNLENBQUM7eUJBQ2hDLE1BQU0sQ0FBQyxVQUFDLElBQVksSUFBSyxPQUFBLHdCQUF3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