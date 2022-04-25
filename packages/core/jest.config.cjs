module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  collectCoverage: true,
  "extensionsToTreatAsEsm": [".ts"],
  globals: {
    'ts-jest': {
      useESM: true,
    },
  },
  moduleNameMapper: {
    '^(\\.{1,2}/.*)\\.js$': '$1'
  },
  collectCoverageFrom: [
    "**/src/test/*.ts",
    "**/src/util/stringifyReflectedValue.ts",
    "**/src/reporter/SummaryReporter.ts",
    "**/src/reporter/VerboseReporter.ts",
  ],
  testMatch: ["**/__tests__/**/*.spec.[jt]s"],
  testPathIgnorePatterns: ["/assembly/", "/node_modules/"],
};
