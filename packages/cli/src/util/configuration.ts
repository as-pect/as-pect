import { Configuration, ConfigurationState } from "configinator";

export const cliConfig: Configuration = {
  // required config option by configinator
  config: {
    name: "config",
    type: "R",
    defaultValue: "as-pect.config.js",
  },
  // version flag
  version: {
    name: "version",
    type: "b",
    defaultValue: false,
  },

  // no-logo: skips the logo
  nologo: {
    name: "nologo",
    type: "b",
    defaultValue: false,
    description: "Skip the logo. (but why?)"
  },

  // no-logo: skips the logo
  types: {
    name: "types",
    type: "b",
    defaultValue: false,
    description: "Add the correct types file to your project to get intelisense for as-pect"
  },

  // no-logo: skips the logo
  typortablepes: {
    name: "portable",
    type: "b",
    defaultValue: false,
  },

  // primary test files
  include: {
    name: "include",
    type: "G",
    defaultValue: ["assembly/__tests__/**/*.ts", "assembly/**/*.spec.ts"],
    description: "Define the primary test entry points with this flag, with an array of globs.",
  }
}

export function resolveOptionByName(configState: ConfigurationState, name: string): any {
  const option = configState.optionsByName.get(name)!;
  const value = configState.values.get(option)!;
  return value.value;
}
