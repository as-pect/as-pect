import { jest } from "@jest/globals";
import { resolveTestSessionWasiOptions } from "../src/TestSessionWasi.js";

describe("Test session WASI option resolution", () => {
  it("loads a CLI --wasi config path relative to cwd", async () => {
    const loadWasiConfig = jest.fn(async () => ({
      default: { args: ["program.wasm"], version: "preview1" as const },
    }));

    await expect(
      resolveTestSessionWasiOptions({
        cliWasi: "config/wasi.js",
        configWasi: undefined,
        cwd: "/workspace/project",
        loadWasiConfig,
      }),
    ).resolves.toEqual({ args: ["program.wasm"], version: "preview1" });

    expect(loadWasiConfig).toHaveBeenCalledWith("/workspace/project/config/wasi.js");
  });

  it("uses CLI WASI config instead of config-file WASI settings", async () => {
    const loadWasiConfig = jest.fn(async () => ({
      default: { args: ["from-cli"], version: "preview1" as const },
    }));

    await expect(
      resolveTestSessionWasiOptions({
        cliWasi: "wasi.js",
        configWasi: { args: ["from-config"], version: "preview1" },
        cwd: "/workspace/project",
        loadWasiConfig,
      }),
    ).resolves.toEqual({ args: ["from-cli"], version: "preview1" });
  });

  it("uses config-file WASI settings when the CLI option is absent", async () => {
    const loadWasiConfig = jest.fn(async () => ({
      default: { args: ["from-cli"], version: "preview1" as const },
    }));

    await expect(
      resolveTestSessionWasiOptions({
        cliWasi: undefined,
        configWasi: { args: ["from-config"], version: "preview1" },
        cwd: "/workspace/project",
        loadWasiConfig,
      }),
    ).resolves.toEqual({ args: ["from-config"], version: "preview1" });

    expect(loadWasiConfig).not.toHaveBeenCalled();
  });

  it("defaults version to preview1 without overwriting an explicit version", async () => {
    await expect(
      resolveTestSessionWasiOptions({
        cliWasi: undefined,
        configWasi: { args: ["without-version"] } as import("wasi").WASIOptions,
        cwd: "/workspace/project",
      }),
    ).resolves.toEqual({ args: ["without-version"], version: "preview1" });

    await expect(
      resolveTestSessionWasiOptions({
        cliWasi: undefined,
        configWasi: { args: ["with-version"], version: "unstable" },
        cwd: "/workspace/project",
      }),
    ).resolves.toEqual({ args: ["with-version"], version: "unstable" });
  });
});
