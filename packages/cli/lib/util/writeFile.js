var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "fs"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var fs_1 = __importDefault(require("fs"));
    /**
     * This method promisifies the fs.writeFile function call, and is compatible with node 10.
     *
     * @param {string} file - The file location to write to.
     * @param {Uint8Array} contents - The file contents to write to the disk.
     */
    function writeFile(file, contents) {
        return new Promise(function (resolve, reject) {
            fs_1.default.writeFile(file, contents, function (err) {
                if (err)
                    reject(err);
                else
                    resolve();
            });
        });
    }
    exports.writeFile = writeFile;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoid3JpdGVGaWxlLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3V0aWwvd3JpdGVGaWxlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7O0lBQUEsMENBQW9CO0lBRXBCOzs7OztPQUtHO0lBQ0gsU0FBZ0IsU0FBUyxDQUFDLElBQVksRUFBRSxRQUFvQjtRQUMxRCxPQUFPLElBQUksT0FBTyxDQUFPLFVBQUMsT0FBTyxFQUFFLE1BQU07WUFDdkMsWUFBRSxDQUFDLFNBQVMsQ0FBQyxJQUFJLEVBQUUsUUFBUSxFQUFFLFVBQUEsR0FBRztnQkFDOUIsSUFBSSxHQUFHO29CQUFFLE1BQU0sQ0FBQyxHQUFHLENBQUMsQ0FBQzs7b0JBQ2hCLE9BQU8sRUFBRSxDQUFDO1lBQ2pCLENBQUMsQ0FBQyxDQUFDO1FBQ0wsQ0FBQyxDQUFDLENBQUM7SUFDTCxDQUFDO0lBUEQsOEJBT0MifQ==