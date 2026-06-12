import chalk from "chalk";
import { existsSync, promises as fs } from "fs";
import { join } from "path";
import url from "url";

const __dirname = url.fileURLToPath(new URL(".", import.meta.url));
const defaultInitTemplateDirectory = join(__dirname, "../init");

type InitPlanCreateBase = {
  displayPath: string;
  path: string;
};

export type InitPlanCreate =
  | (InitPlanCreateBase & { type: "directory" })
  | (InitPlanCreateBase & { sourcePath: string; type: "file" });

export type InitPlanSkipReason = "already-exists" | "test-directory-already-exists";

export interface InitPlanSkip extends InitPlanCreateBase {
  reason: InitPlanSkipReason;
  type: "directory" | "file";
}

export interface InitPlan {
  creates: InitPlanCreate[];
  skips: InitPlanSkip[];
}

export interface InitFileSystemState {
  exists(path: string): boolean;
}

export interface CreateInitPlanOptions {
  cwd: string;
  fileSystem: InitFileSystemState;
  templateDirectory?: string;
}

export interface InitPlanFileSystem {
  mkdir(path: string): Promise<void>;
  readFile(path: string, encoding: BufferEncoding): Promise<string>;
  writeFile(path: string, contents: string, encoding: BufferEncoding): Promise<void>;
}

export interface InitWriter {
  write(text: string): void;
}

export interface ApplyInitPlanOptions {
  fileSystem: InitPlanFileSystem;
  writer?: InitWriter;
}

export interface InitOptions {
  cwd?: string;
  fileSystem?: InitPlanFileSystem & InitFileSystemState;
  templateDirectory?: string;
  writer?: InitWriter;
}

function writeLine(writer: InitWriter | undefined, text = ""): void {
  writer?.write(`${text}\n`);
}

function writeCreateLog(writer: InitWriter | undefined, itemType: "folder" | "file", displayPath: string): void {
  writeLine(writer, `${chalk.bgWhite.black("[Log]")} Creating ${itemType}: ${chalk.yellow(displayPath)}`);
}

function addDirectory(
  plan: InitPlan,
  fileSystem: InitFileSystemState,
  path: string,
  displayPath: string,
): boolean {
  if (fileSystem.exists(path)) {
    plan.skips.push({ displayPath, path, reason: "already-exists", type: "directory" });
    return false;
  }

  plan.creates.push({ displayPath, path, type: "directory" });
  return true;
}

function addFile(
  plan: InitPlan,
  fileSystem: InitFileSystemState,
  path: string,
  displayPath: string,
  sourcePath: string,
): boolean {
  if (fileSystem.exists(path)) {
    plan.skips.push({ displayPath, path, reason: "already-exists", type: "file" });
    return false;
  }

  plan.creates.push({ displayPath, path, sourcePath, type: "file" });
  return true;
}

/**
 * Create the filesystem-independent initialization plan for `asp --init`.
 *
 * The plan intentionally preserves the historical behavior of creating the
 * example spec only when the `assembly/__tests__` folder itself is new.
 */
export function createInitPlan({
  cwd,
  fileSystem,
  templateDirectory = defaultInitTemplateDirectory,
}: CreateInitPlanOptions): InitPlan {
  const plan: InitPlan = { creates: [], skips: [] };
  const assemblyFolder = join(cwd, "assembly");
  const testFolder = join(assemblyFolder, "__tests__");
  const testFolderExists = fileSystem.exists(testFolder);

  addDirectory(plan, fileSystem, assemblyFolder, "./assembly/");
  const createsTestFolder = addDirectory(plan, fileSystem, testFolder, "./assembly/__tests__/");

  const exampleFileLocation = join(testFolder, "example.spec.ts");
  const exampleFileSource = join(templateDirectory, "example.spec.ts");
  if (createsTestFolder) {
    addFile(
      plan,
      fileSystem,
      exampleFileLocation,
      "./assembly/__tests__/example.spec.ts",
      exampleFileSource,
    );
  } else if (testFolderExists) {
    plan.skips.push({
      displayPath: "./assembly/__tests__/example.spec.ts",
      path: exampleFileLocation,
      reason: "test-directory-already-exists",
      type: "file",
    });
  }

  addFile(
    plan,
    fileSystem,
    join(testFolder, "as-pect.d.ts"),
    "./assembly/__tests__/as-pect.d.ts",
    join(templateDirectory, "init-types.d.ts"),
  );
  addFile(
    plan,
    fileSystem,
    join(cwd, "as-pect.config.js"),
    "./as-pect.config.js",
    join(templateDirectory, "as-pect.config.js"),
  );
  addFile(
    plan,
    fileSystem,
    join(cwd, "as-pect.asconfig.json"),
    "./as-pect.asconfig.json",
    join(templateDirectory, "as-pect.asconfig.json"),
  );

  return plan;
}

export async function applyInitPlan(plan: InitPlan, { fileSystem, writer }: ApplyInitPlanOptions): Promise<void> {
  for (const create of plan.creates) {
    if (create.type === "directory") {
      writeCreateLog(writer, "folder", create.displayPath);
      await fileSystem.mkdir(create.path);
      continue;
    }

    writeCreateLog(writer, "file", create.displayPath);
    const contents = await fileSystem.readFile(create.sourcePath, "utf8");
    await fileSystem.writeFile(create.path, contents, "utf8");
  }
}

const defaultInitFileSystem: InitPlanFileSystem & InitFileSystemState = {
  exists: existsSync,
  mkdir: fs.mkdir,
  readFile: fs.readFile,
  writeFile: fs.writeFile,
};

/**
 * @ignore
 *
 * This method initializes a new test project. It is opinionated and reflects the needs of 99% of
 * AssemblyScript developers following the standard way of creating a new AssemblyScript project.
 */
export async function init({
  cwd = process.cwd(),
  fileSystem = defaultInitFileSystem,
  templateDirectory = defaultInitTemplateDirectory,
  writer = process.stdout,
}: InitOptions = {}): Promise<void> {
  writeLine(writer);
  writeLine(writer, `${chalk.bgWhite.black("[Log]")} Initializing test suite files.`);
  writeLine(writer);

  const plan = createInitPlan({ cwd, fileSystem, templateDirectory });
  await applyInitPlan(plan, { fileSystem, writer });
}
