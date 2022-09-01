export default {
  preset: 'ts-jest',
  collectCoverage: false,
  testMatch: ["**/__tests__/**/*.spec.[jt]s"],
  extensionsToTreatAsEsm: ['.ts'],
  testPathIgnorePatterns: ["/assembly/", "/node_modules/"],
  globals: {
    'ts-jest': {
      useESM: true,
    },
  }
};
