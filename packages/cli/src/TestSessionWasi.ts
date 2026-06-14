import path from "path";
import { importLocalModule } from "./importLocalModule.js";

export type TestSessionWasiOptions = import("wasi").WASIOptions;
export type TestSessionWasi = import("wasi").WASI;

export type TestSessionWasiConfigModule = { default: TestSessionWasiOptions };

export type TestSessionWasiConfigLoader = (location: string) => Promise<TestSessionWasiConfigModule>;

export type TestSessionWasiFactory = (options: TestSessionWasiOptions) => Promise<TestSessionWasi>;

export interface ResolveTestSessionWasiOptionsOptions {
  cliWasi?: string;
  configWasi?: TestSessionWasiOptions;
  cwd: string;
  loadWasiConfig?: TestSessionWasiConfigLoader;
}

export interface CreateTestSessionWasiOptions extends ResolveTestSessionWasiOptionsOptions {
  createWasi?: TestSessionWasiFactory;
}

function withWasiPreview1(options: TestSessionWasiOptions): TestSessionWasiOptions {
  return { ...options, version: options.version ?? "preview1" } as TestSessionWasiOptions;
}

async function createNodeWasi(options: TestSessionWasiOptions): Promise<TestSessionWasi> {
  const { WASI } = await import("wasi");
  return new WASI(options);
}

export async function resolveTestSessionWasiOptions({
  cliWasi,
  configWasi,
  cwd,
  loadWasiConfig = importLocalModule,
}: ResolveTestSessionWasiOptionsOptions): Promise<TestSessionWasiOptions | undefined> {
  if (cliWasi) {
    const wasiLocation = path.resolve(cwd, cliWasi);
    const wasiConfig = (await loadWasiConfig(wasiLocation)).default;
    return withWasiPreview1(wasiConfig);
  }

  return configWasi ? withWasiPreview1(configWasi) : undefined;
}

export async function createTestSessionWasi({
  createWasi = createNodeWasi,
  ...options
}: CreateTestSessionWasiOptions): Promise<TestSessionWasi | undefined> {
  const wasiOptions = await resolveTestSessionWasiOptions(options);
  return wasiOptions ? createWasi(wasiOptions) : undefined;
}
