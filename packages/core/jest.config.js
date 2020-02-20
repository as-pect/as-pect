module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  collectCoverage: true,
  collectCoverageFrom: ["**/src/test/*.ts", "**/src/util/stringifyReflectedValue.ts"],
  testMatch: ["**/__tests__/**/*.spec.[jt]s"],
  testPathIgnorePatterns: ["/assembly/", "/node_modules/"],
};
