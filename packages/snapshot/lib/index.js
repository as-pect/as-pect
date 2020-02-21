(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./parser", "./test/Snapshot", "./test/SnapshotDiff", "./test/unparse"], factory);
    }
})(function (require, exports) {
    "use strict";
    function __export(m) {
        for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
    }
    Object.defineProperty(exports, "__esModule", { value: true });
    __export(require("./parser"));
    __export(require("./test/Snapshot"));
    __export(require("./test/SnapshotDiff"));
    __export(require("./test/unparse"));
});
//# sourceMappingURL=index.js.map