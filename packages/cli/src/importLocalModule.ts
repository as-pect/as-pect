import { pathToFileURL } from "url";

export function toLocalModuleSpecifier(filePath: string): string {
  return pathToFileURL(filePath).href;
}

export async function importLocalModule<TModule>(filePath: string): Promise<TModule> {
  return (await import(toLocalModuleSpecifier(filePath))) as TModule;
}
