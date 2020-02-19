"use strict";
// const assemblyscriptPath = Object.getOwnPropertyNames(require.cache).filter(s => s.endsWith("assemblyscript.js"))[0];
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
// type Parser = import("assemblyscript").Parser;
// const transformerPath = assemblyscriptPath.substring(0, assemblyscriptPath.lastIndexOf("/dist/assemblyscript.js")) + "/cli/transform";
// const Transform = require(transformerPath).Transform;
// type Transform = typeof import("assemblyscript/cli/transform").Transform;
// // const Transform: Transform = require("assemblyscript/cli/transform").Transform;
// type NodeKind = import("assemblyscript").NodeKind;
// const NodeKind = require(assemblyscriptPath).NodeKind;
// type ClassDeclaration = import("assemblyscript").ClassDeclaration;
//@ts-ignore
var assemblyscriptPath = Object.getOwnPropertyNames(require.cache).filter(function (s) { return s.endsWith("assemblyscript.js"); })[0];
//@ts-ignore
var transformerPath = assemblyscriptPath.substring(0, assemblyscriptPath.lastIndexOf("/dist/assemblyscript.js")) + "/cli/transform";
module.exports.Transform = require(transformerPath).Transform;
module.exports = __assign(__assign({}, module.exports), require(assemblyscriptPath));
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYXNzZW1ibHlzY3JpcHQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdHJhbnNmb3JtL2Fzc2VtYmx5c2NyaXB0LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7QUFBQSx3SEFBd0g7Ozs7Ozs7Ozs7OztBQUV4SCxpREFBaUQ7QUFFakQseUlBQXlJO0FBQ3pJLHdEQUF3RDtBQUV4RCw0RUFBNEU7QUFDNUUscUZBQXFGO0FBQ3JGLHFEQUFxRDtBQUNyRCx5REFBeUQ7QUFDekQscUVBQXFFO0FBQ3JFLFlBQVk7QUFDWixJQUFNLGtCQUFrQixHQUFHLE1BQU0sQ0FBQyxtQkFBbUIsQ0FBQyxPQUFPLENBQUMsS0FBSyxDQUFDLENBQUMsTUFBTSxDQUFDLFVBQUEsQ0FBQyxJQUFJLE9BQUEsQ0FBQyxDQUFDLFFBQVEsQ0FBQyxtQkFBbUIsQ0FBQyxFQUEvQixDQUErQixDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUM7QUFDckgsWUFBWTtBQUNaLElBQU0sZUFBZSxHQUFHLGtCQUFrQixDQUFDLFNBQVMsQ0FBQyxDQUFDLEVBQUUsa0JBQWtCLENBQUMsV0FBVyxDQUFDLHlCQUF5QixDQUFDLENBQUMsR0FBRyxnQkFBZ0IsQ0FBQztBQUN0SSxNQUFNLENBQUMsT0FBTyxDQUFDLFNBQVMsR0FBRyxPQUFPLENBQUMsZUFBZSxDQUFDLENBQUMsU0FBUyxDQUFDO0FBQzlELE1BQU0sQ0FBQyxPQUFPLHlCQUFPLE1BQU0sQ0FBQyxPQUFPLEdBQUssT0FBTyxDQUFDLGtCQUFrQixDQUFDLENBQUMsQ0FBQyJ9