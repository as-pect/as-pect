import { TestNodeType } from "./TestNodeType";
import { noOp } from "./noOp";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportBeforeEach")
declare function reportBeforeEach(callback: () => void): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportBeforeAll")
declare function reportBeforeAll(callback: () => void): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportAfterEach")
declare function reportAfterEach(callback: () => void): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportAfterAll")
declare function reportAfterAll(callback: () => void): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportTodo")
declare function reportTodo(description: string): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportTestNode")
declare function reportTestNode(
  type: TestNodeType,
  description: string,
  callback: () => void,
  negated: bool,
  message: string | null,
): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "debug")
@global
export declare function debug(): void;

// @ts-ignore: Decorators *are* valid here!
@global
export function todo(description: string): void {
  reportTodo(description);
}

// @ts-ignore: decorators *are* valid here
@global
export function xit(description: string, callback: () => void): void {
  todo(description);
}

// @ts-ignore: decorators *are* valid here
@global
export function xtest(description: string, callback: () => void): void {
  todo(description);
}

// @ts-ignore: decorators *are* valid here
@global
export function it(description: string, runner: () => void): void {
  reportTestNode(
    TestNodeType.Test,
    description,
    runner,
    false,
    null,
  );
}

// @ts-ignore: decorators *are* valid here
@global
export function test(description: string, runner: () => void): void {
  reportTestNode(
    TestNodeType.Test,
    description,
    runner,
    false,
    null,
  );
}

// @ts-ignore: decorators *are* valid here
@global
export function beforeEach(callback: () => void): void {
  reportBeforeEach(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function beforeAll(callback: () => void): void {
  reportBeforeAll(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function afterEach(callback: () => void): void {
  reportAfterEach(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function afterAll(callback: () => void): void {
  reportAfterAll(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function itThrows(
  description: string,
  runner: () => void,
  message: string | null = null,
): void {
  reportTestNode(
    TestNodeType.Test,
    description,
    runner,
    true,
    message,
  );
}

// @ts-ignore: decorators *are* valid here
@global
export function throws(
  description: string,
  runner: () => void,
  message: string | null = null,
): void {
  reportTestNode(
    TestNodeType.Test,
    description,
    runner,
    true,
    message,
  );
}

// @ts-ignore: Decorators *are* valid here!
@global
export function describe(description: string = "", runner: () => void = noOp): void {
  reportTestNode(
    TestNodeType.Group,
    description,
    runner,
    false,
    null,
  );
}