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
    const escapeTick = (input) => input.replace(/`/g, "\\`");
    /**
     * Convert an ISnapshotData into a stringified representation.
     *
     * @param {ISnapshotData} data - The snapshot data to be converted.
     */
    function unparse(data) {
        let output = "";
        for (const [groupName, group] of Object.entries(data)) {
            for (const [testName, test] of Object.entries(group)) {
                for (const [snapshotName, snapshot] of Object.entries(test)) {
                    output += `exports[\`${escapeTick(groupName)}\`][\`${escapeTick(testName)}\`][\`${escapeTick(snapshotName)}\`] = \`${escapeTick(snapshot)}\`\n\n`;
                }
            }
        }
        return output;
    }
    exports.unparse = unparse;
});
//# sourceMappingURL=unparse.js.map