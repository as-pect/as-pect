//@ts-ignore
const path = require("path");

//@ts-ignore
let assemblyscriptPath = Object.getOwnPropertyNames(require.cache).filter(s => s.endsWith("assemblyscript.js"))[0];
let transformerPath;
if (assemblyscriptPath) {
  let splitPath = assemblyscriptPath.split(path.sep).slice(0, -2);
  transformerPath =  splitPath.concat([ "cli", "transform"]).join(path.sep);
} else {
  assemblyscriptPath = require.resolve("assemblyscript");
  transformerPath = require.resolve("assemblyscript/cli/transform");
}
//@ts-ignore
module.exports.Transform = require(transformerPath).Transform;
module.exports = {...module.exports, ...require(assemblyscriptPath)};
