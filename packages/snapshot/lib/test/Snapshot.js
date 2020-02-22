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
         * @param {SnapshotData} data - The snapshot data.
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
        diff(other, 
        /* istanbul ignore next */
        stringifyParameters = {}) {
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
            for (const groupName of leftData.keys()) {
                const group = leftData.get(groupName);
                if (!group)
                    continue;
                for (const testName of group.keys()) {
                    const test = group.get(testName);
                    if (!test)
                        continue;
                    for (const snapshotName of test.keys()) {
                        const snapshot = test.get(snapshotName);
                        if (typeof snapshot !== "string")
                            continue;
                        const rightGroup = rightData.get(groupName);
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
                        const rightTest = rightGroup.get(testName);
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
                        const rightSnapshot = rightTest.get(snapshotName);
                        if (typeof rightSnapshot !== "string") {
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
            for (const groupName of rightData.keys()) {
                const group = rightData.get(groupName);
                if (!group)
                    continue;
                for (const testName of group.keys()) {
                    const test = group.get(testName);
                    if (!test)
                        continue;
                    for (const snapshotName of test.keys()) {
                        const snapshot = test.get(snapshotName);
                        if (typeof snapshot !== "string")
                            continue;
                        const leftGroup = leftData.get(groupName);
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
                        const leftTest = leftGroup.get(testName);
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
                        const leftSnapshot = leftTest.get(snapshotName);
                        if (typeof leftSnapshot !== "string") {
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
                    " ".repeat(props.indent) +
                        props.addedFormat("+ " + change.value) +
                        "\n";
            }
            else if (change.removed) {
                output +=
                    " ".repeat(props.indent) +
                        props.removedFormat("- " + change.value) +
                        "\n";
            }
            else {
                output +=
                    " ".repeat(props.indent) +
                        props.defaultFormat("  " + change.value) +
                        "\n";
            }
        }
        return output;
    }
});
//# sourceMappingURL=Snapshot.js.map