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
  },
}

export function resolveOptionByName(configState: ConfigurationState, name: string): any {
  const option = configState.optionsByName.get(name)!;
  const value = configState.values.get(option)!;
  return value.value;
}
