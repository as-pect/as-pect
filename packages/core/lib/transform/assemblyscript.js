"use strict";
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
//@ts-ignore
var path = require("path");
//@ts-ignore
var assemblyscriptPath = Object.getOwnPropertyNames(require.cache).filter(function (s) { return s.endsWith("assemblyscript.js"); })[0];
var transformerPath;
if (assemblyscriptPath) {
    var splitPath = assemblyscriptPath.split(path.sep).slice(0, -2);
    transformerPath = splitPath.concat(["cli", "transform"]).join(path.sep);
}
else {
    assemblyscriptPath = require.resolve("assemblyscript");
    transformerPath = require.resolve("assemblyscript/cli/transform");
}
//@ts-ignore
module.exports.Transform = require(transformerPath).Transform;
module.exports = __assign(__assign({}, module.exports), require(assemblyscriptPath));
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYXNzZW1ibHlzY3JpcHQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdHJhbnNmb3JtL2Fzc2VtYmx5c2NyaXB0LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7OztBQUFBLFlBQVk7QUFDWixJQUFNLElBQUksR0FBRyxPQUFPLENBQUMsTUFBTSxDQUFDLENBQUM7QUFFN0IsWUFBWTtBQUNaLElBQUksa0JBQWtCLEdBQUcsTUFBTSxDQUFDLG1CQUFtQixDQUFDLE9BQU8sQ0FBQyxLQUFLLENBQUMsQ0FBQyxNQUFNLENBQUMsVUFBQSxDQUFDLElBQUksT0FBQSxDQUFDLENBQUMsUUFBUSxDQUFDLG1CQUFtQixDQUFDLEVBQS9CLENBQStCLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQztBQUNuSCxJQUFJLGVBQWUsQ0FBQztBQUNwQixJQUFJLGtCQUFrQixFQUFFO0lBQ3RCLElBQUksU0FBUyxHQUFHLGtCQUFrQixDQUFDLEtBQUssQ0FBQyxJQUFJLENBQUMsR0FBRyxDQUFDLENBQUMsS0FBSyxDQUFDLENBQUMsRUFBRSxDQUFDLENBQUMsQ0FBQyxDQUFDO0lBQ2hFLGVBQWUsR0FBSSxTQUFTLENBQUMsTUFBTSxDQUFDLENBQUUsS0FBSyxFQUFFLFdBQVcsQ0FBQyxDQUFDLENBQUMsSUFBSSxDQUFDLElBQUksQ0FBQyxHQUFHLENBQUMsQ0FBQztDQUMzRTtLQUFNO0lBQ0wsa0JBQWtCLEdBQUcsT0FBTyxDQUFDLE9BQU8sQ0FBQyxnQkFBZ0IsQ0FBQyxDQUFDO0lBQ3ZELGVBQWUsR0FBRyxPQUFPLENBQUMsT0FBTyxDQUFDLDhCQUE4QixDQUFDLENBQUM7Q0FDbkU7QUFDRCxZQUFZO0FBQ1osTUFBTSxDQUFDLE9BQU8sQ0FBQyxTQUFTLEdBQUcsT0FBTyxDQUFDLGVBQWUsQ0FBQyxDQUFDLFNBQVMsQ0FBQztBQUM5RCxNQUFNLENBQUMsT0FBTyx5QkFBTyxNQUFNLENBQUMsT0FBTyxHQUFLLE9BQU8sQ0FBQyxrQkFBa0IsQ0FBQyxDQUFDLENBQUMifQ==