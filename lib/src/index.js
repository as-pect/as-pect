"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var loader_1 = require("assemblyscript/lib/loader");
function testLoader(buffer) {
    var wasm = loader_1.instantiateBuffer(buffer, {
        __aspect: {
            tryCall: function (pointer) {
                var func = wasm.getFunction(pointer);
                var _ex;
                try {
                    func();
                }
                catch (_ex) {
                    return 0;
                }
                return 1;
            },
        },
    });
}
exports.testLoader = testLoader;
