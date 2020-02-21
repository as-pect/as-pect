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
    var grammar = {
        Lexer: undefined,
        ParserRules: [
            { "name": "_$ebnf$1", "symbols": [] },
            { "name": "_$ebnf$1", "symbols": ["_$ebnf$1", "wschar"], "postprocess": function (d) { return d[0].concat([d[1]]); } },
            { "name": "_", "symbols": ["_$ebnf$1"], "postprocess": function (d) { return null; } },
            { "name": "__$ebnf$1", "symbols": ["wschar"] },
            { "name": "__$ebnf$1", "symbols": ["__$ebnf$1", "wschar"], "postprocess": function (d) { return d[0].concat([d[1]]); } },
            { "name": "__", "symbols": ["__$ebnf$1"], "postprocess": function (d) { return null; } },
            { "name": "wschar", "symbols": [/[ \t\n\v\f]/], "postprocess": id },
            { "name": "snapshots$ebnf$1", "symbols": [] },
            { "name": "snapshots$ebnf$1$subexpression$1", "symbols": ["snapshot", "_"] },
            { "name": "snapshots$ebnf$1", "symbols": ["snapshots$ebnf$1", "snapshots$ebnf$1$subexpression$1"], "postprocess": function (d) { return d[0].concat([d[1]]); } },
            { "name": "snapshots", "symbols": ["_", "snapshots$ebnf$1"], "postprocess": function (d) {
                    var snapshotPairs = d[1].map(function (e) { return e[0]; });
                    var result = {};
                    for (var i = 0; i < snapshotPairs.length; i++) {
                        var _a = snapshotPairs[i], groupName = _a[0], testName = _a[1], snapshotName = _a[2], value = _a[3];
                        var group = result[groupName] = (result[groupName] || {});
                        var test_1 = group[testName] = (group[testName] || {});
                        if (test_1.hasOwnProperty(snapshotName))
                            throw new Error("Invalid snapshot, duplicate detected: " + groupName + " " + testName + " " + snapshotName);
                        test_1[snapshotName] = value;
                    }
                    return result;
                }
            },
            { "name": "snapshot$string$1", "symbols": [{ "literal": "e" }, { "literal": "x" }, { "literal": "p" }, { "literal": "o" }, { "literal": "r" }, { "literal": "t" }, { "literal": "s" }, { "literal": "[" }, { "literal": "`" }], "postprocess": function (d) { return d.join(''); } },
            { "name": "snapshot$string$2", "symbols": [{ "literal": "`" }, { "literal": "]" }, { "literal": "[" }, { "literal": "`" }], "postprocess": function (d) { return d.join(''); } },
            { "name": "snapshot$string$3", "symbols": [{ "literal": "`" }, { "literal": "]" }, { "literal": "[" }, { "literal": "`" }], "postprocess": function (d) { return d.join(''); } },
            { "name": "snapshot$string$4", "symbols": [{ "literal": "`" }, { "literal": "]" }, { "literal": " " }, { "literal": "=" }, { "literal": " " }, { "literal": "`" }], "postprocess": function (d) { return d.join(''); } },
            { "name": "snapshot$string$5", "symbols": [{ "literal": "`" }, { "literal": ";" }], "postprocess": function (d) { return d.join(''); } },
            { "name": "snapshot", "symbols": ["snapshot$string$1", "value", "snapshot$string$2", "value", "snapshot$string$3", "value", "snapshot$string$4", "value", "snapshot$string$5"], "postprocess": function parseSnapshot(d) {
                    return [d[1], d[3], d[5], d[7]];
                }
            },
            { "name": "value$ebnf$1", "symbols": [] },
            { "name": "value$ebnf$1$subexpression$1", "symbols": [/[^`]/] },
            { "name": "value$ebnf$1$subexpression$1", "symbols": ["escapedTick"] },
            { "name": "value$ebnf$1", "symbols": ["value$ebnf$1", "value$ebnf$1$subexpression$1"], "postprocess": function (d) { return d[0].concat([d[1]]); } },
            { "name": "value", "symbols": ["value$ebnf$1"], "postprocess": function parseValue(d) {
                    return d[0].join("");
                }
            },
            { "name": "escapedTick$string$1", "symbols": [{ "literal": "\\" }, { "literal": "`" }], "postprocess": function (d) { return d.join(''); } },
            { "name": "escapedTick", "symbols": ["escapedTick$string$1"], "postprocess": function () { return "`"; } }
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
        var parser = createSnapshotParser();
        parser.feed(snapshot);
        var results = parser.results;
        if (results.length !== 1)
            throw new Error("Invalid snapshot.");
        return results[0];
    }
    exports.parseSnapshot = parseSnapshot;
});
define("index", ["require", "exports", "parser/index"], function (require, exports, parser_1) {
    "use strict";
    function __export(m) {
        for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
    }
    Object.defineProperty(exports, "__esModule", { value: true });
    __export(parser_1);
});
define("test/unparse", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var escapeTick = function (input) { return input.replace(/`/g, "\\`"); };
    /**
     * Convert an ISnapshotData into a stringified representation.
     *
     * @param {ISnapshotData} data - The snapshot data to be converted.
     */
    function unparse(data) {
        var output = "";
        for (var _i = 0, _a = Object.entries(data); _i < _a.length; _i++) {
            var _b = _a[_i], groupName = _b[0], group = _b[1];
            for (var _c = 0, _d = Object.entries(group); _c < _d.length; _c++) {
                var _e = _d[_c], testName = _e[0], test_2 = _e[1];
                for (var _f = 0, _g = Object.entries(test_2); _f < _g.length; _f++) {
                    var _h = _g[_f], snapshotName = _h[0], snapshot = _h[1];
                    output += "exports[`" + escapeTick(groupName) + "`][`" + escapeTick(testName) + "`][`" + escapeTick(snapshotName) + "`] = `" + escapeTick(snapshot) + "`\n\n";
                }
            }
        }
        return output;
    }
    exports.unparse = unparse;
});
define("test/Snapshot", ["require", "exports", "parser/index", "test/unparse"], function (require, exports, parser_2, unparse_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var Snapshot = /** @class */ (function () {
        function Snapshot() {
            this.data = null;
            this.stringified = null;
        }
        Snapshot.fromSnapshotData = function (data) {
            var result = new Snapshot();
            result.stringified = unparse_1.unparse(data);
            result.data = data;
            return result;
        };
        Snapshot.fromString = function (data) {
            var result = new Snapshot();
            result.stringified = data;
            result.data = parser_2.parseSnapshot(data);
            return result;
        };
        return Snapshot;
    }());
    exports.Snapshot = Snapshot;
});
//# sourceMappingURL=as-pect.core.amd.js.map