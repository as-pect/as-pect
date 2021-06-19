const ignoreRegex = /^[\t ]*\/\/ @as-covers: ignore.*$/gm;
const linecol = require("line-column");
const fs = require("fs");
const text = fs.readFileSync("./packages/assembly/assembly/internal/Expectation.ts", "utf8");
const lc = linecol(text);
let results = text.matchAll(ignoreRegex);
for (const result of results) {
  console.log(lc.fromIndex(result.index));
}
