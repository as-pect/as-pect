var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "chalk", "./SnapshotDiff", "diff"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    const chalk_1 = __importDefault(require("chalk"));
    const SnapshotDiff_1 = require("./SnapshotDiff");
    const diff_1 = __importDefault(require("diff"));
    /** Represents a snapshot comparison. */
    class SnapshotComparison {
        constructor(left, right) {
            this.left = left;
            this.right = right;
        }
        /**
         * Diff the current state of the left and the right snapshot.
         *
         * @param {Partial<ISnapshotStringifyOptions>} stringifyParameters - The stringify parameters.
         */
        diff(stringifyParameters = {}) {
            if (!this.left.data || !this.right.data)
                throw new Error("Cannot evaluate diff on uninitialized left or right side");
            const effectiveStringifyParameters = Object.assign({
                addedFormat: chalk_1.default.green,
                removedFormat: chalk_1.default.red,
                defaultFormat: chalk_1.default.gray,
                indent: 0,
            }, stringifyParameters);
            let output = [];
            const leftData = this.left.data;
            const rightData = this.right.data;
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
    exports.SnapshotComparison = SnapshotComparison;
    /**
     * Stringify the changes between two string values.
     *
     * @param {string} left - The left side.
     * @param {string} right - The right side.
     * @param {ISnapshotStringifyOptions} props - The stringify options.
     */
    function stringifyChanges(left, right, props) {
        const changes = diff_1.default.diffLines(left, right);
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
//# sourceMappingURL=SnapshotComparison.js.map