(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../parser", "./unparse", "./SnapshotComparison"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    const parser_1 = require("../parser");
    const unparse_1 = require("./unparse");
    const SnapshotComparison_1 = require("./SnapshotComparison");
    class Snapshot {
        constructor() {
            /** The snapshot data in object format. */
            this.data = null;
            //** The stringified data in string format. */
            this.stringified = null;
        }
        /**
         * Create a Snapshot from an ISnapshotData.
         *
         * @param {ISnapshotData} data - The snapshot data.
         */
        static fromSnapshotData(data) {
            const result = new Snapshot();
            result.stringified = unparse_1.unparse(data);
            result.data = data;
            return result;
        }
        /**
         * Create a Snapshot from string content.
         *
         * @param {string} data - The stringified snapshot data.
         */
        static fromString(data) {
            if (typeof data !== "string")
                throw new Error("Cannot create snapshot from string when data is not a string.");
            const result = new Snapshot();
            result.stringified = data;
            result.data = parser_1.parseSnapshot(data);
            return result;
        }
        /**
         * Compare two snapshots from each other.
         *
         * @param {Snapshot} other -
         */
        compareTo(other) {
            if (!this.stringified || !other.stringified)
                throw new Error("Cannot compare snapshots when Snapshot was not initialized.");
            return new SnapshotComparison_1.SnapshotComparison(this, other);
        }
    }
    exports.Snapshot = Snapshot;
});
//# sourceMappingURL=Snapshot.js.map