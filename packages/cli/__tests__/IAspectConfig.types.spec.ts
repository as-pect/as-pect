import { instantiate as loaderInstantiate } from "@assemblyscript/loader";
import type { AspectCreateImports, AspectImports, IAspectConfig } from "../src/index.js";

const typedConfig: IAspectConfig = {
  async instantiate(memory, createImports, instantiate, binary) {
    const imports: AspectImports = createImports({
      env: { memory },
      host: {
        clock(): number {
          return 1;
        },
      },
    });
    const sameInstantiate: typeof loaderInstantiate = instantiate;

    return sameInstantiate(binary, imports);
  },
};

describe("IAspectConfig types", () => {
  it("typechecks the normal instantiate callback shape used by user configs", () => {
    const passthroughCreateImports: AspectCreateImports = (...imports) => imports[0] ?? {};

    expect(typeof typedConfig.instantiate).toBe("function");
    expect(passthroughCreateImports({ env: {} })).toEqual({ env: {} });
  });
});
