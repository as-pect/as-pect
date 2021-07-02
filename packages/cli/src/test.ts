const fs = require("fs");
const path = require("path");

require("../lib/index.js").asp(process.argv.slice(2), (file: string, basename: string): string | null => {
  const filepath = path.normalize(path.join(basename, file));
  try {
    return fs.readFileSync(filepath, "utf8");
  } catch(ex) {
    return null;
  }
});
