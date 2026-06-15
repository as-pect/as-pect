import process from "process";

export interface CliWriter {
  write(text: string): void;
}

export interface CliShell {
  stdout: CliWriter;
  stderr: CliWriter;
  exit(code: number): never;
}

export const processCliShell: CliShell = {
  exit(code: number): never {
    process.exit(code);
  },
  stderr: {
    write(text: string): void {
      process.stderr.write(text);
    },
  },
  stdout: {
    write(text: string): void {
      process.stdout.write(text);
    },
  },
};
