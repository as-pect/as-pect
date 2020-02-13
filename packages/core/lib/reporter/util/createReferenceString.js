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
    var util = require("util");
    /**
     * @ignore
     * This function returns a string that formats the bytes into rows of 8 bytes with a space between
     * byte 4 and 5 on each row.
     *
     * @param {LogValue} value - The log value.
     */
    function createReferenceString(value) {
        if (value.values.length > 0)
            return util.inspect(value.values, {
                colors: process.stdout.isTTY || false,
            });
        var pointer = value.pointer, offset = value.offset, bytes = value.bytes;
        var referenceEnd = pointer + offset;
        // start with a tabbed out string
        var result = "Range: [dec: " + pointer.toString() + "~" + referenceEnd.toString() + "] [hex: 0x" + pointer.toString(16) + "~0x" + referenceEnd.toString(16) + "]";
        result += "\n07 06 05 04   03 02 01 00";
        result += "\n~~~~~~~~~~~~~~~~~~~~~~~~~";
        result += "\n";
        // for each byte
        for (var i = 0; i < offset; i++) {
            // append a byte of string length 2 and an empty space
            result += bytes[i].toString(16).padStart(2, "0") + " ";
            if (i % 8 === 7) {
                // every 8 characters add a newline
                result += "\n";
            }
            else if (i % 4 === 3) {
                // every 4 characters add an extra two spaces
                result += "  ";
            }
        }
        // remove leading space
        return result.trimRight();
    }
    exports.createReferenceString = createReferenceString;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlUmVmZXJlbmNlU3RyaW5nLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vLi4vc3JjL3JlcG9ydGVyL3V0aWwvY3JlYXRlUmVmZXJlbmNlU3RyaW5nLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBRUEsSUFBTSxJQUFJLEdBQUcsT0FBTyxDQUFDLE1BQU0sQ0FBQyxDQUFDO0lBRTdCOzs7Ozs7T0FNRztJQUNILFNBQWdCLHFCQUFxQixDQUFDLEtBQWU7UUFDbkQsSUFBSSxLQUFLLENBQUMsTUFBTSxDQUFDLE1BQU0sR0FBRyxDQUFDO1lBQ3pCLE9BQU8sSUFBSSxDQUFDLE9BQU8sQ0FBQyxLQUFLLENBQUMsTUFBTSxFQUFFO2dCQUNoQyxNQUFNLEVBQUUsT0FBTyxDQUFDLE1BQU0sQ0FBQyxLQUFLLElBQUksS0FBSzthQUN0QyxDQUFDLENBQUM7UUFDRyxJQUFBLHVCQUFPLEVBQUUscUJBQU0sRUFBRSxtQkFBSyxDQUFXO1FBQ3pDLElBQU0sWUFBWSxHQUFHLE9BQU8sR0FBRyxNQUFNLENBQUM7UUFDdEMsaUNBQWlDO1FBQ2pDLElBQUksTUFBTSxHQUFHLGtCQUFnQixPQUFPLENBQUMsUUFBUSxFQUFFLFNBQUksWUFBWSxDQUFDLFFBQVEsRUFBRSxrQkFBYSxPQUFPLENBQUMsUUFBUSxDQUNyRyxFQUFFLENBQ0gsV0FBTSxZQUFZLENBQUMsUUFBUSxDQUFDLEVBQUUsQ0FBQyxNQUFHLENBQUM7UUFDcEMsTUFBTSxJQUFJLDZCQUE2QixDQUFDO1FBQ3hDLE1BQU0sSUFBSSw2QkFBNkIsQ0FBQztRQUN4QyxNQUFNLElBQUksSUFBSSxDQUFDO1FBRWYsZ0JBQWdCO1FBQ2hCLEtBQUssSUFBSSxDQUFDLEdBQUcsQ0FBQyxFQUFFLENBQUMsR0FBRyxNQUFNLEVBQUUsQ0FBQyxFQUFFLEVBQUU7WUFDL0Isc0RBQXNEO1lBQ3RELE1BQU0sSUFBSSxLQUFLLENBQUMsQ0FBQyxDQUFDLENBQUMsUUFBUSxDQUFDLEVBQUUsQ0FBQyxDQUFDLFFBQVEsQ0FBQyxDQUFDLEVBQUUsR0FBRyxDQUFDLEdBQUcsR0FBRyxDQUFDO1lBQ3ZELElBQUksQ0FBQyxHQUFHLENBQUMsS0FBSyxDQUFDLEVBQUU7Z0JBQ2YsbUNBQW1DO2dCQUNuQyxNQUFNLElBQUksSUFBSSxDQUFDO2FBQ2hCO2lCQUFNLElBQUksQ0FBQyxHQUFHLENBQUMsS0FBSyxDQUFDLEVBQUU7Z0JBQ3RCLDZDQUE2QztnQkFDN0MsTUFBTSxJQUFJLElBQUksQ0FBQzthQUNoQjtTQUNGO1FBRUQsdUJBQXVCO1FBQ3ZCLE9BQU8sTUFBTSxDQUFDLFNBQVMsRUFBRSxDQUFDO0lBQzVCLENBQUM7SUE5QkQsc0RBOEJDIn0=