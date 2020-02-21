var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
define("parser/grammar", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    // Generated automatically by nearley, version 2.19.1
    // http://github.com/Hardmath123/nearley
    // Bypasses TS6133. Allow declared but unused functions.
    // @ts-ignore
    function id(d) { return d[0]; }
    ;
    ;
    ;
    ;
    const grammar = {
        Lexer: undefined,
        ParserRules: [
            { "name": "_$ebnf$1", "symbols": [] },
            { "name": "_$ebnf$1", "symbols": ["_$ebnf$1", "wschar"], "postprocess": (d) => d[0].concat([d[1]]) },
            { "name": "_", "symbols": ["_$ebnf$1"], "postprocess": function (d) { return null; } },
            { "name": "__$ebnf$1", "symbols": ["wschar"] },
            { "name": "__$ebnf$1", "symbols": ["__$ebnf$1", "wschar"], "postprocess": (d) => d[0].concat([d[1]]) },
            { "name": "__", "symbols": ["__$ebnf$1"], "postprocess": function (d) { return null; } },
            { "name": "wschar", "symbols": [/[ \t\n\v\f]/], "postprocess": id },
            { "name": "snapshots$ebnf$1", "symbols": [] },
            { "name": "snapshots$ebnf$1$subexpression$1", "symbols": ["snapshot", "_"] },
            { "name": "snapshots$ebnf$1", "symbols": ["snapshots$ebnf$1", "snapshots$ebnf$1$subexpression$1"], "postprocess": (d) => d[0].concat([d[1]]) },
            { "name": "snapshots", "symbols": ["_", "snapshots$ebnf$1"], "postprocess": function (d) {
                    const snapshotPairs = d[1].map((e) => e[0]);
                    const result = {};
                    for (let i = 0; i < snapshotPairs.length; i++) {
                        const [groupName, testName, snapshotName, value] = snapshotPairs[i];
                        const group = result[groupName] = (result[groupName] || {});
                        const test = group[testName] = (group[testName] || {});
                        if (test.hasOwnProperty(snapshotName))
                            throw new Error("Invalid snapshot, duplicate detected: " + groupName + " " + testName + " " + snapshotName);
                        test[snapshotName] = value;
                    }
                    return result;
                }
            },
            { "name": "snapshot$string$1", "symbols": [{ "literal": "e" }, { "literal": "x" }, { "literal": "p" }, { "literal": "o" }, { "literal": "r" }, { "literal": "t" }, { "literal": "s" }, { "literal": "[" }, { "literal": "`" }], "postprocess": (d) => d.join('') },
            { "name": "snapshot$string$2", "symbols": [{ "literal": "`" }, { "literal": "]" }, { "literal": "[" }, { "literal": "`" }], "postprocess": (d) => d.join('') },
            { "name": "snapshot$string$3", "symbols": [{ "literal": "`" }, { "literal": "]" }, { "literal": "[" }, { "literal": "`" }], "postprocess": (d) => d.join('') },
            { "name": "snapshot$string$4", "symbols": [{ "literal": "`" }, { "literal": "]" }, { "literal": " " }, { "literal": "=" }, { "literal": " " }, { "literal": "`" }], "postprocess": (d) => d.join('') },
            { "name": "snapshot$string$5", "symbols": [{ "literal": "`" }, { "literal": ";" }], "postprocess": (d) => d.join('') },
            { "name": "snapshot", "symbols": ["snapshot$string$1", "value", "snapshot$string$2", "value", "snapshot$string$3", "value", "snapshot$string$4", "value", "snapshot$string$5"], "postprocess": function parseSnapshot(d) {
                    return [d[1], d[3], d[5], d[7]];
                }
            },
            { "name": "value$ebnf$1", "symbols": [] },
            { "name": "value$ebnf$1$subexpression$1", "symbols": [/[^`]/] },
            { "name": "value$ebnf$1$subexpression$1", "symbols": ["escapedTick"] },
            { "name": "value$ebnf$1", "symbols": ["value$ebnf$1", "value$ebnf$1$subexpression$1"], "postprocess": (d) => d[0].concat([d[1]]) },
            { "name": "value", "symbols": ["value$ebnf$1"], "postprocess": function parseValue(d) {
                    return d[0].join("");
                }
            },
            { "name": "escapedTick$string$1", "symbols": [{ "literal": "\\" }, { "literal": "`" }], "postprocess": (d) => d.join('') },
            { "name": "escapedTick", "symbols": ["escapedTick$string$1"], "postprocess": () => "`" }
        ],
        ParserStart: "snapshots",
    };
    exports.default = grammar;
});
define("parser/index", ["require", "exports", "parser/grammar", "nearley"], function (require, exports, grammar_1, nearley_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    grammar_1 = __importDefault(grammar_1);
    function createSnapshotParser() {
        return new nearley_1.Parser(nearley_1.Grammar.fromCompiled(grammar_1.default));
    }
    exports.createSnapshotParser = createSnapshotParser;
    function parseSnapshot(snapshot) {
        const parser = createSnapshotParser();
        parser.feed(snapshot);
        const results = parser.results;
        if (results.length !== 1)
            throw new Error("Invalid snapshot.");
        return results[0];
    }
    exports.parseSnapshot = parseSnapshot;
});
define("test/unparse", ["require", "exports"], function (require, exports) {
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
define("test/SnapshotDiff", ["require", "exports"], function (require, exports) {
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
define("test/Snapshot", ["require", "exports", "parser/index", "test/unparse", "diff", "chalk", "test/SnapshotDiff"], function (require, exports, parser_1, unparse_1, diff_1, chalk_1, SnapshotDiff_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_1 = __importDefault(chalk_1);
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
define("index", ["require", "exports", "parser/index", "test/Snapshot", "test/SnapshotDiff", "test/unparse"], function (require, exports, parser_2, Snapshot_1, SnapshotDiff_2, unparse_2) {
    "use strict";
    function __export(m) {
        for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
    }
    Object.defineProperty(exports, "__esModule", { value: true });
    __export(parser_2);
    __export(Snapshot_1);
    __export(SnapshotDiff_2);
    __export(unparse_2);
});
//# sourceMappingURL=as-pect.core.amd.js.map