(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../parser", "./unparse"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var parser_1 = require("../parser");
    var unparse_1 = require("./unparse");
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
            result.data = parser_1.parseSnapshot(data);
            return result;
        };
        return Snapshot;
    }());
    exports.Snapshot = Snapshot;
});
//# sourceMappingURL=Snapshot.js.map