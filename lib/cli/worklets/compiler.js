(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var _a = require("worker_threads"), parentPort = _a.parentPort, workerData = _a.workerData;
    var path = require("path");
    var fs = require("fs");
    var writeFile = require("../util/writeFile").writeFile;
    var asc = require(path.join(workerData.assemblyScriptFolder, "dist", "asc"));
    var fileMap = new Map();
    var folderMap = new Map();
    function run(command) {
        var binary;
        var filePromises = [];
        asc.main(command.props.args, {
            stdout: process.stdout,
            stderr: process.stderr,
            listFiles: function (dirname, baseDir) {
                var folder = path.join(baseDir, dirname);
                if (folderMap.has(folder)) {
                    return folderMap.get(folder);
                }
                try {
                    var results = fs
                        .readdirSync(folder)
                        .filter(function (file) { return /^(?!.*\.d\.ts$).*\.ts$/.test(file); });
                    folderMap.set(folder, results);
                    return results;
                }
                catch (e) {
                    return [];
                }
            },
            readFile: function (filename, baseDir) {
                var fileName = path.join(baseDir, filename);
                if (fileMap.has(fileName)) {
                    return fileMap.get(fileName);
                }
                try {
                    var contents = fs.readFileSync(fileName, { encoding: "utf8" });
                    fileMap.set(fileName, contents);
                    return contents;
                }
                catch (e) {
                    return null;
                }
            },
            writeFile: function (name, contents) {
                var ext = path.extname(name);
                // get the wasm file
                if (ext === ".wasm") {
                    binary = contents;
                    if (!command.props.outputBinary)
                        return;
                }
                var file = command.props.file;
                var outfileName = path.join(path.dirname(file), path.basename(file, path.extname(file)) + ext);
                filePromises.push(writeFile(outfileName, contents));
            },
        }, function (error) {
            return Promise.all(filePromises)
                .then(function () {
                parentPort.postMessage({
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
                parentPort.postMessage({
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
    parentPort.on("message", run);
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY29tcGlsZXIuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi9zcmMvY2xpL3dvcmtsZXRzL2NvbXBpbGVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBQ00sSUFBQSw4QkFBc0QsRUFBcEQsMEJBQVUsRUFBRSwwQkFBd0MsQ0FBQztJQUM3RCxJQUFNLElBQUksR0FBRyxPQUFPLENBQUMsTUFBTSxDQUFDLENBQUM7SUFDN0IsSUFBTSxFQUFFLEdBQUcsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDO0lBQ2pCLElBQUEsa0RBQVMsQ0FBa0M7SUFFbkQsSUFBTSxHQUFHLEdBQVEsT0FBTyxDQUFDLElBQUksQ0FBQyxJQUFJLENBQ2hDLFVBQVUsQ0FBQyxvQkFBb0IsRUFDL0IsTUFBTSxFQUNOLEtBQUssQ0FDTixDQUFDLENBQUM7SUFFSCxJQUFNLE9BQU8sR0FBd0IsSUFBSSxHQUFHLEVBQUUsQ0FBQztJQUMvQyxJQUFNLFNBQVMsR0FBMEIsSUFBSSxHQUFHLEVBQUUsQ0FBQztJQUVuRCxTQUFTLEdBQUcsQ0FBQyxPQUFpQjtRQUM1QixJQUFJLE1BQWtCLENBQUM7UUFDdkIsSUFBSSxZQUFZLEdBQW9CLEVBQUUsQ0FBQztRQUV2QyxHQUFHLENBQUMsSUFBSSxDQUNOLE9BQU8sQ0FBQyxLQUFLLENBQUMsSUFBSSxFQUNsQjtZQUNFLE1BQU0sRUFBRSxPQUFPLENBQUMsTUFBYTtZQUM3QixNQUFNLEVBQUUsT0FBTyxDQUFDLE1BQWE7WUFDN0IsU0FBUyxFQUFULFVBQVUsT0FBZSxFQUFFLE9BQWU7Z0JBQ3hDLElBQU0sTUFBTSxHQUFHLElBQUksQ0FBQyxJQUFJLENBQUMsT0FBTyxFQUFFLE9BQU8sQ0FBQyxDQUFDO2dCQUMzQyxJQUFJLFNBQVMsQ0FBQyxHQUFHLENBQUMsTUFBTSxDQUFDLEVBQUU7b0JBQ3pCLE9BQU8sU0FBUyxDQUFDLEdBQUcsQ0FBQyxNQUFNLENBQUUsQ0FBQztpQkFDL0I7Z0JBRUQsSUFBSTtv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