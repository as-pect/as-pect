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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY29tcGlsZXIuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvd29ya2xldHMvY29tcGlsZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFDTSxJQUFBLDhCQUFzRCxFQUFwRCwwQkFBVSxFQUFFLDBCQUF3QyxDQUFDO0lBQzdELElBQU0sSUFBSSxHQUFHLE9BQU8sQ0FBQyxNQUFNLENBQUMsQ0FBQztJQUM3QixJQUFNLEVBQUUsR0FBRyxPQUFPLENBQUMsSUFBSSxDQUFDLENBQUM7SUFDakIsSUFBQSxrREFBUyxDQUFrQztJQUVuRCxJQUFNLEdBQUcsR0FBUSxPQUFPLENBQUMsSUFBSSxDQUFDLElBQUksQ0FDaEMsVUFBVSxDQUFDLG9CQUFvQixFQUMvQixNQUFNLEVBQ04sS0FBSyxDQUNOLENBQUMsQ0FBQztJQUVILElBQU0sT0FBTyxHQUF3QixJQUFJLEdBQUcsRUFBRSxDQUFDO0lBQy9DLElBQU0sU0FBUyxHQUEwQixJQUFJLEdBQUcsRUFBRSxDQUFDO0lBRW5ELFNBQVMsR0FBRyxDQUFDLE9BQWlCO1FBQzVCLElBQUksTUFBa0IsQ0FBQztRQUN2QixJQUFJLFlBQVksR0FBb0IsRUFBRSxDQUFDO1FBRXZDLEdBQUcsQ0FBQyxJQUFJLENBQ04sT0FBTyxDQUFDLEtBQUssQ0FBQyxJQUFJLEVBQ2xCO1lBQ0UsTUFBTSxFQUFFLE9BQU8sQ0FBQyxNQUFhO1lBQzdCLE1BQU0sRUFBRSxPQUFPLENBQUMsTUFBYTtZQUM3QixTQUFTLEVBQVQsVUFBVSxPQUFlLEVBQUUsT0FBZTtnQkFDeEMsSUFBTSxNQUFNLEdBQUcsSUFBSSxDQUFDLElBQUksQ0FBQyxPQUFPLEVBQUUsT0FBTyxDQUFDLENBQUM7Z0JBQzNDLElBQUksU0FBUyxDQUFDLEdBQUcsQ0FBQyxNQUFNLENBQUMsRUFBRTtvQkFDekIsT0FBTyxTQUFTLENBQUMsR0FBRyxDQUFDLE1BQU0sQ0FBRSxDQUFDO2lCQUMvQjtnQkFFRCxJQUFJO29CQUNGLElB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