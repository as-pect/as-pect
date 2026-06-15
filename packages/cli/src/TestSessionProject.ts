import path from "path";

export interface TestSessionProject {
  cwd: string;
  packageJsonPath(): string;
  resolvePath(location: string): string;
}

export function createTestSessionProject(cwd: string): TestSessionProject {
  const projectCwd = path.resolve(cwd);

  return {
    cwd: projectCwd,
    packageJsonPath(): string {
      return path.join(projectCwd, "package.json");
    },
    resolvePath(location: string): string {
      return path.resolve(projectCwd, location);
    },
  };
}
