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
     * @ignore
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlUmVmZXJlbmNlU3RyaW5nLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vLi4vc3JjL3JlcG9ydGVyL3V0aWwvY3JlYXRlUmVmZXJlbmNlU3RyaW5nLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBQUE7Ozs7Ozs7O09BUUc7SUFDSCxTQUFnQixxQkFBcUIsQ0FDbkMsS0FBZSxFQUNmLE9BQWUsRUFDZixNQUFjO1FBRWQsSUFBTSxZQUFZLEdBQUcsT0FBTyxHQUFHLE1BQU0sQ0FBQztRQUN0QyxpQ0FBaUM7UUFDakMsSUFBSSxNQUFNLEdBQUcsa0JBQWdCLE9BQU8sQ0FBQyxRQUFRLEVBQUUsU0FBSSxZQUFZLENBQUMsUUFBUSxFQUFFLGtCQUFhLE9BQU8sQ0FBQyxRQUFRLENBQ3JHLEVBQUUsQ0FDSCxXQUFNLFlBQVksQ0FBQyxRQUFRLENBQUMsRUFBRSxDQUFDLE1BQUcsQ0FBQztRQUNwQyxNQUFNLElBQUksNkJBQTZCLENBQUM7UUFDeEMsTUFBTSxJQUFJLDZCQUE2QixDQUFDO1FBQ3hDLE1BQU0sSUFBSSxJQUFJLENBQUM7UUFFZixnQkFBZ0I7UUFDaEIsS0FBSyxJQUFJLENBQUMsR0FBRyxDQUFDLEVBQUUsQ0FBQyxHQUFHLE1BQU0sRUFBRSxDQUFDLEVBQUUsRUFBRTtZQUMvQixzREFBc0Q7WUFDdEQsTUFBTSxJQUFJLEtBQUssQ0FBQyxDQUFDLENBQUMsQ0FBQyxRQUFRLENBQUMsRUFBRSxDQUFDLENBQUMsUUFBUSxDQUFDLENBQUMsRUFBRSxHQUFHLENBQUMsR0FBRyxHQUFHLENBQUM7WUFDdkQsSUFBSSxDQUFDLEdBQUcsQ0FBQyxLQUFLLENBQUMsRUFBRTtnQkFDZixtQ0FBbUM7Z0JBQ25DLE1BQU0sSUFBSSxJQUFJLENBQUM7YUFDaEI7aUJBQU0sSUFBSSxDQUFDLEdBQUcsQ0FBQyxLQUFLLENBQUMsRUFBRTtnQkFDdEIsNkNBQTZDO2dCQUM3QyxNQUFNLElBQUksSUFBSSxDQUFDO2FBQ2hCO1NBQ0Y7UUFFRCx1QkFBdUI7UUFDdkIsT0FBTyxNQUFNLENBQUMsU0FBUyxFQUFFLENBQUM7SUFDNUIsQ0FBQztJQTdCRCxzREE2QkMifQ==