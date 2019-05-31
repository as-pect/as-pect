// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "debug")
@global
export declare function debug(): void;

// @ts-ignore: Decorators *are* valid here!
@global
export function todo(description: string): void {

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
  
}

// @ts-ignore: decorators *are* valid here
@global
export function test(description: string, runner: () => void): void {

}

// @ts-ignore: decorators *are* valid here
@global
export function beforeEach(callback: () => void): void {

}

// @ts-ignore: decorators *are* valid here
@global
export function beforeAll(callback: () => void): void {

}

// @ts-ignore: decorators *are* valid here
@global
export function afterEach(callback: () => void): void {

}

// @ts-ignore: decorators *are* valid here
@global
export function afterAll(callback: () => void): void {

}

// @ts-ignore: decorators *are* valid here
@global
export function throws(description: string, callback: () => void, message: string = ""): void {

}
