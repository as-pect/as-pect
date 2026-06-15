import { resolve } from "path";

export default {
  testEnvironment: "node",
  transform: {
    "^.+\\.tsx?$": ["ts-jest", { useESM: true }],
  },
  testMatch: ["**/__tests__/**/*.spec.[jt]s"],
  testPathIgnorePatterns: ["/node_modules/"],
  extensionsToTreatAsEsm: [".ts"],
  moduleNameMapper: {
    "^(\\.{1,2}/.*)\\.js$": "$1",
    "^@as-pect/core$": resolve("../core/src/index.ts"),
    "^@as-pect/reporter-output$": resolve("../reporter-output/index.ts"),
    "^@as-pect/snapshots$": resolve("../snapshots/src/index.ts"),
  },
};
