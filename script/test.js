const fs = require("fs");
const { testLoader } = require("../lib");
var buff = fs.readFileSync("./build/tests.wasm");

testLoader(buff);
