export default {
  testEnvironment: "node",
  transform: {
    "^.+\\.tsx?$": ["ts-jest", { useESM: true }],
  },
  collectCoverage: true,
  collectCoverageFrom: [
    "**/src/test/*.ts",
    "**/src/util/stringifyReflectedValue.ts",
    "**/src/reporter/SummaryReporter.ts",
    "**/src/reporter/VerboseReporter.ts",
  ],
  testMatch: ["**/__tests__/**/*.spec.[jt]s"],
  testPathIgnorePatterns: ["/assembly/", "/node_modules/"],
  extensionsToTreatAsEsm: [".ts"],
  moduleNameMapper: {
    "^(\\.{1,2}/.*)\\.js$": "$1",
  },
};
