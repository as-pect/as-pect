const glob = require("glob");
const path = require("path");
const pattern = path.join(process.cwd(), "assembly/tests/**/*.ts");
console.log(pattern);

console.log(glob.sync(pattern));