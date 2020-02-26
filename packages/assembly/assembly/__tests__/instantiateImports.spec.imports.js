module.exports = function (_memory, createImports, instantiateSync, binary) {
  return instantiateSync(binary, createImports({
    api: {
      identity(input) { return input; },
    }
  }));
};
