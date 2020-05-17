import { IAspectConfiguration } from "./IAspectConfiguration";

export interface IAspectRunContext {
  parsed: import("assemblyscript/cli/util/options").Result;
  config: Partial<IAspectConfiguration>;
}
