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
                var _e = _d[_c], testName = _e[0], test_1 = _e[1];
                for (var _f = 0, _g = Object.entries(test_1); _f < _g.length; _f++) {
                    var _h = _g[_f], snapshotName = _h[0], snapshot = _h[1];
                    output += "exports[`" + escapeTick(groupName) + "`][`" + escapeTick(testName) + "`][`" + escapeTick(snapshotName) + "`] = `" + escapeTick(snapshot) + "`\n\n";
                }
            }
        }
        return output;
    }
    exports.unparse = unparse;
});
//# sourceMappingURL=unparse.js.map