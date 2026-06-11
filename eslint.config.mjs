import js from "@eslint/js";
import globals from "globals";
import tseslint from "typescript-eslint";

const assemblyFiles = ["**/assembly/**/*.ts"];
const assemblyDefinitions = ["**/assembly/**/*.d.ts"];
const assemblyTests = ["**/assembly/__tests__/**/*.ts"];

export default [
  {
    ignores: [
      "packages/assembly/assembly/internal/runtime.ts",
      "packages/snapshots/src/parser/grammar.ts",
      "packages/assembly/assembly/internal/**",
      "packages/assembly/assembly/__tests__/setup/Test.include.ts",
      "packages/core/assembly/jest-reporter-fail.ts",
      "**/lib/**",
      "node_modules/**",
      "coverage/**",
      "dist/**",
      "build/**",
      "**/*.wasm",
      "**/*.wat",
    ],
  },
  js.configs.recommended,
  ...tseslint.configs.recommended,
  {
    files: ["**/*.ts"],
    languageOptions: {
      ecmaVersion: 2020,
      sourceType: "module",
      parserOptions: {
        experimentalDecorators: true,
        ecmaFeatures: {
          legacyDecorators: true,
        },
      },
      globals: {
        ...globals.node,
        ...globals.jest,
      },
    },
    rules: {
      semi: "error",
      indent: ["error", 2, {
        SwitchCase: 1,
        VariableDeclarator: "first",
        offsetTernaryExpressions: true,
        ignoredNodes: [
          "ConditionalExpression > *",
          "ConditionalExpression > * > *",
          "ConditionalExpression > * > * > *",
        ],
      }],
      "spaced-comment": ["error", "always", {
        markers: ["/"],
        exceptions: ["/"],
      }],
      "prefer-const": "off",
      "no-var": "off",
      "no-fallthrough": "off",
      "no-constant-condition": ["error", { checkLoops: false }],
      "no-inner-declarations": "off",
      "@typescript-eslint/no-this-alias": "off",
      "no-unused-vars": "off",
      "@typescript-eslint/no-unused-vars": "off",
    },
  },
  {
    files: assemblyFiles,
    rules: {
      "@typescript-eslint/no-unused-vars": ["warn", {
        vars: "local",
        varsIgnorePattern: "^_|^[A-Z](?:From|To)?$",
        args: "none",
        ignoreRestSiblings: false,
      }],
      "@typescript-eslint/no-namespace": "off",
      "@typescript-eslint/no-array-constructor": "off",
      "@typescript-eslint/ban-ts-comment": "off",
      "@typescript-eslint/no-non-null-assertion": "off",
      "no-cond-assign": "off",
      "@typescript-eslint/no-inferrable-types": "off",
      "@typescript-eslint/triple-slash-reference": "off",
      "no-shadow-restricted-names": "off",
      "@typescript-eslint/no-restricted-types": "off",
      "@typescript-eslint/no-unused-expressions": "off",
      "no-useless-assignment": "off",
    },
  },
  {
    files: assemblyDefinitions,
    rules: {
      "@typescript-eslint/no-explicit-any": "off",
      "@typescript-eslint/no-empty-object-type": "off",
      "@typescript-eslint/no-restricted-types": "off",
    },
  },
  {
    files: assemblyTests,
    rules: {
      "no-empty": "off",
      "no-cond-assign": "off",
      "no-compare-neg-zero": "off",
      "no-inner-declarations": "off",
      "no-constant-condition": "off",
      "use-isnan": "off",
      "@typescript-eslint/no-namespace": "off",
      "@typescript-eslint/no-unused-vars": "off",
      "@typescript-eslint/no-empty-function": "off",
      "@typescript-eslint/no-non-null-assertion": "off",
      "@typescript-eslint/no-inferrable-types": "off",
      "@typescript-eslint/no-restricted-types": "off",
      "@typescript-eslint/triple-slash-reference": "off",
      "@typescript-eslint/ban-ts-comment": "off",
      "@typescript-eslint/no-extra-non-null-assertion": "off",
      "@typescript-eslint/no-empty-object-type": "off",
    },
  },
];
