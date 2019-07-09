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
    /**
     * This function returns a string that formats the bytes into rows of 8 bytes with a space between
     * byte 4 and 5 on each row.
     *
     * @param {number[]} bytes - The byte array
     * @param {number} pointer - The pointer of the reference.
     * @param {number} offset - The offset of the reference.
     */
    function createReferenceString(bytes, pointer, offset) {
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlUmVmZXJlbmNlU3RyaW5nLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vLi4vc3JjL3JlcG9ydGVyL3V0aWwvY3JlYXRlUmVmZXJlbmNlU3RyaW5nLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBQUE7Ozs7Ozs7T0FPRztJQUNILFNBQWdCLHFCQUFxQixDQUNuQyxLQUFlLEVBQ2YsT0FBZSxFQUNmLE1BQWM7UUFFZCxJQUFNLFlBQVksR0FBRyxPQUFPLEdBQUcsTUFBTSxDQUFDO1FBQ3RDLGlDQUFpQztRQUNqQyxJQUFJLE1BQU0sR0FBRyxrQkFBZ0IsT0FBTyxDQUFDLFFBQVEsRUFBRSxTQUFJLFlBQVksQ0FBQyxRQUFRLEVBQUUsa0JBQWEsT0FBTyxDQUFDLFFBQVEsQ0FDckcsRUFBRSxDQUNILFdBQU0sWUFBWSxDQUFDLFFBQVEsQ0FBQyxFQUFFLENBQUMsTUFBRyxDQUFDO1FBQ3BDLE1BQU0sSUFBSSw2QkFBNkIsQ0FBQztRQUN4QyxNQUFNLElBQUksNkJBQTZCLENBQUM7UUFDeEMsTUFBTSxJQUFJLElBQUksQ0FBQztRQUVmLGdCQUFnQjtRQUNoQixLQUFLLElBQUksQ0FBQyxHQUFHLENBQUMsRUFBRSxDQUFDLEdBQUcsTUFBTSxFQUFFLENBQUMsRUFBRSxFQUFFO1lBQy9CLHNEQUFzRDtZQUN0RCxNQUFNLElBQUksS0FBSyxDQUFDLENBQUMsQ0FBQyxDQUFDLFFBQVEsQ0FBQyxFQUFFLENBQUMsQ0FBQyxRQUFRLENBQUMsQ0FBQyxFQUFFLEdBQUcsQ0FBQyxHQUFHLEdBQUcsQ0FBQztZQUN2RCxJQUFJLENBQUMsR0FBRyxDQUFDLEtBQUssQ0FBQyxFQUFFO2dCQUNmLG1DQUFtQztnQkFDbkMsTUFBTSxJQUFJLElBQUksQ0FBQzthQUNoQjtpQkFBTSxJQUFJLENBQUMsR0FBRyxDQUFDLEtBQUssQ0FBQyxFQUFFO2dCQUN0Qiw2Q0FBNkM7Z0JBQzdDLE1BQU0sSUFBSSxJQUFJLENBQUM7YUFDaEI7U0FDRjtRQUVELHVCQUF1QjtRQUN2QixPQUFPLE1BQU0sQ0FBQyxTQUFTLEVBQUUsQ0FBQztJQUM1QixDQUFDO0lBN0JELHNEQTZCQyJ9