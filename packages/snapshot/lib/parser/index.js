var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./grammar", "nearley"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    const grammar_1 = __importDefault(require("./grammar"));
    const nearley_1 = require("nearley");
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
//# sourceMappingURL=index.js.map