module.exports = {
  "mode": "modules",
  "out": "docs",
  exclude: [
    "**/assembly/**",
    '**/node_modules/**',
    '**/*.spec.ts',
    "**/*.d.ts",
  ],
  name: 'as-pect',
  excludePrivate: true,
  excludeExternals: true,
  skipInternal: true,
};