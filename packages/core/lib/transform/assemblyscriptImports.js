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
    exports.assemblyscriptPath = Object.getOwnPropertyNames(require.cache).filter(function (s) { return s.endsWith("assemblyscript.js"); })[0];
    var transformerPath = exports.assemblyscriptPath.substring(0, exports.assemblyscriptPath.lastIndexOf("/dist/assemblyscript.js")) + "/cli/transform";
    exports.Transform = require(transformerPath).Transform;
    exports.NodeKind = require(exports.assemblyscriptPath).NodeKind;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYXNzZW1ibHlzY3JpcHRJbXBvcnRzLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3RyYW5zZm9ybS9hc3NlbWJseXNjcmlwdEltcG9ydHMudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBYSxRQUFBLGtCQUFrQixHQUFHLE1BQU0sQ0FBQyxtQkFBbUIsQ0FBQyxPQUFPLENBQUMsS0FBSyxDQUFDLENBQUMsTUFBTSxDQUFDLFVBQUEsQ0FBQyxJQUFJLE9BQUEsQ0FBQyxDQUFDLFFBQVEsQ0FBQyxtQkFBbUIsQ0FBQyxFQUEvQixDQUErQixDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUM7SUFJNUgsSUFBTSxlQUFlLEdBQUcsMEJBQWtCLENBQUMsU0FBUyxDQUFDLENBQUMsRUFBRSwwQkFBa0IsQ0FBQyxXQUFXLENBQUMseUJBQXlCLENBQUMsQ0FBQyxHQUFHLGdCQUFnQixDQUFDO0lBQ3pILFFBQUEsU0FBUyxHQUFHLE9BQU8sQ0FBQyxlQUFlLENBQUMsQ0FBQyxTQUFTLENBQUM7SUFLL0MsUUFBQSxRQUFRLEdBQUcsT0FBTyxDQUFDLDBCQUFrQixDQUFDLENBQUMsUUFBUSxDQUFDIn0=