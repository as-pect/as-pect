import { resolve } from "path";


export default {
  preset: 'ts-jest',
  testEnvironment: 'node',
  collectCoverage: true,
  collectCoverageFrom: [
    "**/src/test/*.ts",
    "**/src/util/stringifyReflectedValue.ts",
    "**/src/reporter/SummaryReporter.ts",
    "**/src/reporter/VerboseReporter.ts",
  ],
  testMatch: ["**/__tests__/**/*.spec.[jt]s"],
  testPathIgnorePatterns: ["/assembly/", "/node_modules/"],
  extensionsToTreatAsEsm: ['.ts'],
  globals: {
    'ts-jest': {
      useESM: true,
    },
  },
  moduleNameMapper: {
    '^(\\.{1,2}/.*)\\.js$': '$1',
    chalk: resolve("./node_modules/chalk/source/index.js"),
    "#ansi-styles": resolve("./node_modules/chalk/source/vendor/ansi-styles/index.js"),
    "#supports-color": resolve("./node_modules/chalk/source/vendor/supports-color/index.js"),
  },
};
