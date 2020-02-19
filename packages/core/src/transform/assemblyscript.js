//@ts-ignore
const path = require("path");

//@ts-ignore
let assemblyscriptPath = Object.getOwnPropertyNames(require.cache).filter(s => s.endsWith("assemblyscript.js"))[0];
let transformerPath;
if (assemblyscriptPath) {
  let prefix = assemblyscriptPath.substring(0, assemblyscriptPath.lastIndexOf("/dist/assemblyscript.js"));
  transformerPath =  path.join(prefix, "cli", "transform");
} else {
  assemblyscriptPath = require.resolve("assemblyscript");
  transformerPath = require.resolve("assemblyscript/cli/transform");

}
//@ts-ignore
module.exports.Transform = require(transformerPath).Transform;
module.exports = {...module.exports, ...require(assemblyscriptPath)};
