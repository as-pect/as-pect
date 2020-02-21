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
//# sourceMappingURL=grammar.js.map