"use strict";
function __export(m) {
    for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
}
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
__export(require("./test/TestGroup"));
__export(require("./test/TestResult"));
__export(require("./test/TestRunner"));
__export(require("./test/TestSuite"));
__export(require("./reporter/DefaultReporter"));
__export(require("./reporter/Reporter"));
var cli_1 = __importDefault(require("./cli"));
exports.asp = cli_1.default;
//# sourceMappingURL=as-pect.js.map