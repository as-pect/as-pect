// const assemblyscriptPath = Object.getOwnPropertyNames(require.cache).filter(s => s.endsWith("assemblyscript.js"))[0];

// type Parser = import("assemblyscript").Parser;

// const transformerPath = assemblyscriptPath.substring(0, assemblyscriptPath.lastIndexOf("/dist/assemblyscript.js")) + "/cli/transform";
// const Transform = require(transformerPath).Transform;

// type Transform = typeof import("assemblyscript/cli/transform").Transform;
// // const Transform: Transform = require("assemblyscript/cli/transform").Transform;
// type NodeKind = import("assemblyscript").NodeKind;
// const NodeKind = require(assemblyscriptPath).NodeKind;
// type ClassDeclaration = import("assemblyscript").ClassDeclaration;
//@ts-ignore
const assemblyscriptPath = Object.getOwnPropertyNames(require.cache).filter(s => s.endsWith("assemblyscript.js"))[0];
//@ts-ignore
const transformerPath = assemblyscriptPath.substring(0, assemblyscriptPath.lastIndexOf("/dist/assemblyscript.js")) + "/cli/transform";
module.exports.Transform = require(transformerPath).Transform;
module.exports = {...module.exports, ...require(assemblyscriptPath)};