import assert from "node:assert/strict";
import { test } from "node:test";
import { mkdtemp, readFile, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { execFile } from "node:child_process";
import { fileURLToPath } from "node:url";
import { promisify } from "node:util";

const execFileAsync = promisify(execFile);
const runnerPath = new URL("./run-npm-scripts.mjs", import.meta.url);
const runnerFilePath = fileURLToPath(runnerPath);
const { createNpmRunSpawnConfig } = await import(runnerPath.href);

async function createPackage(scripts) {
  const cwd = await mkdtemp(join(tmpdir(), "as-pect-runner-"));
  await writeFile(join(cwd, "package.json"), JSON.stringify({ name: "runner-test", private: true, scripts }, null, 2));
  return cwd;
}

async function run(cwd, ...args) {
  try {
    const result = await execFileAsync(process.execPath, [runnerFilePath, ...args], {
      cwd,
      env: { ...process.env, npm_config_loglevel: "silent" },
    });
    return { status: 0, stdout: result.stdout, stderr: result.stderr };
  } catch (error) {
    return {
      status: error.code ?? 1,
      stdout: error.stdout ?? "",
      stderr: error.stderr ?? "",
    };
  }
}

test("spawns npm scripts through cmd.exe on Windows", () => {
  const spawnConfig = createNpmRunSpawnConfig("build", "win32");

  assert.equal(spawnConfig.command, "cmd.exe");
  assert.deepEqual(spawnConfig.args, ["/d", "/s", "/c", "npm.cmd", "run", "build"]);
  assert.equal(spawnConfig.options.shell, false);
});

test("spawns npm scripts directly on POSIX platforms", () => {
  const spawnConfig = createNpmRunSpawnConfig("build", "linux");

  assert.equal(spawnConfig.command, "npm");
  assert.deepEqual(spawnConfig.args, ["run", "build"]);
  assert.equal(spawnConfig.options.shell, false);
});

test("runs npm scripts sequentially in argument order", async () => {
  const cwd = await createPackage({
    first: "node -e \"require('node:fs').appendFileSync('order.txt','first\\n')\"",
    second: "node -e \"require('node:fs').appendFileSync('order.txt','second\\n')\"",
  });

  const result = await run(cwd, "first", "second");

  assert.equal(result.status, 0);
  assert.equal(await readFile(join(cwd, "order.txt"), "utf8"), "first\nsecond\n");
});

test("stops sequential execution after the first failed script", async () => {
  const cwd = await createPackage({
    fail: 'node -e "process.exit(7)"',
    skipped: "node -e \"require('node:fs').writeFileSync('skipped.txt','ran')\"",
  });

  const result = await run(cwd, "fail", "skipped");

  assert.equal(result.status, 7);
  await assert.rejects(readFile(join(cwd, "skipped.txt"), "utf8"), { code: "ENOENT" });
});

test("runs npm scripts in parallel when requested", async () => {
  const cwd = await createPackage({
    one: "node -e \"require('node:fs').writeFileSync('one.txt','ran')\"",
    two: "node -e \"require('node:fs').writeFileSync('two.txt','ran')\"",
  });

  const result = await run(cwd, "--parallel", "one", "two");

  assert.equal(result.status, 0);
  assert.equal(await readFile(join(cwd, "one.txt"), "utf8"), "ran");
  assert.equal(await readFile(join(cwd, "two.txt"), "utf8"), "ran");
});

test("returns a non-zero status when any parallel script fails", async () => {
  const cwd = await createPackage({
    pass: "node -e \"require('node:fs').writeFileSync('pass.txt','ran')\"",
    fail: 'node -e "process.exit(3)"',
  });

  const result = await run(cwd, "--parallel", "pass", "fail");

  assert.equal(result.status, 3);
  assert.equal(await readFile(join(cwd, "pass.txt"), "utf8"), "ran");
});
