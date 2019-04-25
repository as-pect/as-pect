module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  collectCoverage: true,
  collectCoverageFrom: ["src/test/*.ts"],
  testEnvironment: "node",
  testMatch: ["**/__tests__/**/*.spec.[jt]s"],
  testPathIgnorePatterns: ["/assembly/"],
};