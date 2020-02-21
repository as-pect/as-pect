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
    /** Represents a snapshot diff. Simple data class. */
    class SnapshotDiff {
        constructor() {
            /** The snapshot comparison type. */
            this.type = 0 /* None */;
            /** The snapshot diff itself. */
            this.diff = null;
            /** The left side of the change comparison. */
            this.left = null;
            /** The identified group name. */
            this.groupName = null;
            /** The identified test name. */
            this.testName = null;
            /** The identified snapshot name. */
            this.snapshotName = null;
            /** The right side of the change comparison. */
            this.right = null;
        }
    }
    exports.SnapshotDiff = SnapshotDiff;
});
//# sourceMappingURL=SnapshotDiff.js.map