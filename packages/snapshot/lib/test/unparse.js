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
     * @param {SnapshotData} data - The snapshot data to be converted.
     */
    function unparse(data) {
        let output = "";
        for (const groupKey of data.keys()) {
            const group = data.get(groupKey);
            if (!group)
                continue;
            for (const testKey of group.keys()) {
                const test = group.get(testKey);
                if (!test)
                    continue;
                for (const snapshotKey of test.keys()) {
                    const snapshot = test.get(snapshotKey);
                    if (typeof snapshot !== "string")
                        continue;
                    output += `exports[\`${escapeTick(groupKey)}\`][\`${escapeTick(testKey)}\`][\`${escapeTick(snapshotKey)}\`] = \`${escapeTick(snapshot)}\`\n\n`;
                }
            }
        }
        return output;
    }
    exports.unparse = unparse;
});
//# sourceMappingURL=unparse.js.map