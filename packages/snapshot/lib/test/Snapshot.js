var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../parser", "./unparse", "diff", "chalk", "./SnapshotDiff"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    const parser_1 = require("../parser");
    const unparse_1 = require("./unparse");
    const diff_1 = require("diff");
    const chalk_1 = __importDefault(require("chalk"));
    const SnapshotDiff_1 = require("./SnapshotDiff");
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
        static fromData(data) {
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
            /* istanbul ignore next */
            if (typeof data !== "string")
                /* istanbul ignore next */
                throw new Error("Cannot create snapshot from string when data is not a string.");
            const result = new Snapshot();
            result.stringified = data;
            result.data = parser_1.parseSnapshot(data);
            return result;
        }
        /**
         * Diff the current state of the left and the right snapshot.
         *
         * @param {Partial<ISnapshotStringifyOptions>} stringifyParameters - The stringify parameters.
         */
        diff(other, stringifyParameters = {}) {
            /* istanbul ignore next */
            if (!this.data || !other.data)
                /* istanbul ignore next */
                throw new Error("Cannot evaluate diff on uninitialized snapshot data");
            const effectiveStringifyParameters = Object.assign({
                addedFormat: chalk_1.default.green,
                removedFormat: chalk_1.default.red,
                defaultFormat: chalk_1.default.gray,
                indent: 0,
            }, stringifyParameters);
            let output = [];
            const leftData = this.data;
            const rightData = other.data;
            // for each snapshot in the left side
            for (const [groupName, group] of Object.entries(leftData)) {
                for (const [testName, test] of Object.entries(group)) {
                    for (const [snapshotName, snapshot] of Object.entries(test)) {
                        const rightGroup = rightData[groupName];
                        if (!rightGroup) {
                            // the group doesn't exist, it was added
                            const diff = new SnapshotDiff_1.SnapshotDiff();
                            diff.left = snapshot;
                            diff.type = 1 /* Added */;
                            diff.groupName = groupName;
                            diff.testName = testName;
                            diff.snapshotName = snapshotName;
                            output.push(diff);
                            continue;
                        }
                        const rightTest = rightGroup[testName];
                        if (!rightTest) {
                            // the test doesn't exist
                            const diff = new SnapshotDiff_1.SnapshotDiff();
                            diff.left = snapshot;
                            diff.type = 1 /* Added */;
                            diff.groupName = groupName;
                            diff.testName = testName;
                            diff.snapshotName = snapshotName;
                            output.push(diff);
                            continue;
                        }
                        const rightSnapshot = rightTest[snapshotName];
                        if (!rightSnapshot) {
                            // the snapshot doesn't exist
                            const diff = new SnapshotDiff_1.SnapshotDiff();
                            diff.left = snapshot;
                            diff.type = 1 /* Added */;
                            diff.groupName = groupName;
                            diff.testName = testName;
                            diff.snapshotName = snapshotName;
                            output.push(diff);
                            continue;
                        }
                        // the snapshot exists
                        if (snapshot !== rightSnapshot) {
                            // there is a difference
                            const diffObject = new SnapshotDiff_1.SnapshotDiff();
                            diffObject.diff = stringifyChanges(snapshot, rightSnapshot, effectiveStringifyParameters);
                            diffObject.groupName = groupName;
                            diffObject.left = snapshot;
                            diffObject.right = rightSnapshot;
                            diffObject.snapshotName = snapshotName;
                            diffObject.testName = testName;
                            diffObject.type = 3 /* Different */;
                            output.push(diffObject);
                            continue;
                        }
                    }
                }
            }
            // for each snapshot in the right side
            for (const [groupName, group] of Object.entries(rightData)) {
                for (const [testName, test] of Object.entries(group)) {
                    for (const [snapshotName, snapshot] of Object.entries(test)) {
                        const leftGroup = leftData[groupName];
                        if (!leftGroup) {
                            // the group doesn't exist, it was removed
                            const diff = new SnapshotDiff_1.SnapshotDiff();
                            diff.right = snapshot;
                            diff.type = 2 /* Removed */;
                            diff.groupName = groupName;
                            diff.testName = testName;
                            diff.snapshotName = snapshotName;
                            output.push(diff);
                            continue;
                        }
                        const leftTest = leftGroup[testName];
                        if (!leftTest) {
                            // the test doesn't exist
                            const diff = new SnapshotDiff_1.SnapshotDiff();
                            diff.right = snapshot;
                            diff.type = 2 /* Removed */;
                            diff.groupName = groupName;
                            diff.testName = testName;
                            diff.snapshotName = snapshotName;
                            output.push(diff);
                            continue;
                        }
                        const leftSnapshot = leftTest[snapshotName];
                        if (!leftSnapshot) {
                            // the snapshot doesn't exist
                            const diff = new SnapshotDiff_1.SnapshotDiff();
                            diff.right = snapshot;
                            diff.type = 2 /* Removed */;
                            diff.groupName = groupName;
                            diff.testName = testName;
                            diff.snapshotName = snapshotName;
                            output.push(diff);
                            continue;
                        }
                    }
                }
            }
            return output;
        }
    }
    exports.Snapshot = Snapshot;
    /**
     * Stringify the changes between two string values.
     *
     * @param {string} left - The left side.
     * @param {string} right - The right side.
     * @param {ISnapshotStringifyOptions} props - The stringify options.
     */
    function stringifyChanges(left, right, props) {
        const changes = diff_1.diffLines(left, right);
        let output = "";
        for (const change of changes) {
            if (change.added) {
                output +=
                    " ".repeat(props.indent) + props.addedFormat("+ " + change.value);
            }
            else if (change.removed) {
                output +=
                    " ".repeat(props.indent) + props.removedFormat("- " + change.value);
            }
            else {
                output +=
                    " ".repeat(props.indent) + props.defaultFormat("  " + change.value);
            }
        }
        return output;
    }
});
//# sourceMappingURL=Snapshot.js.map