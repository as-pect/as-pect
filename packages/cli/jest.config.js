export default {
  testEnvironment: "node",
  transform: {
    "^.+\\.tsx?$": ["ts-jest", { useESM: true }],
  },
  testMatch: ["**/__tests__/**/*.spec.[jt]s"],
  testPathIgnorePatterns: ["/assembly/", "/node_modules/"],
  extensionsToTreatAsEsm: [".ts"],
  moduleNameMapper: {
    "^(\\.{1,2}/.*)\\.js$": "$1",
  },
};
