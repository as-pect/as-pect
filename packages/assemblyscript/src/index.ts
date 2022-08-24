export type ASC = typeof import("assemblyscript/dist/asc.js") ;
export type AS = typeof import("assemblyscript/dist/assemblyscript.js");
export type TRANSFORM = typeof import("assemblyscript/dist/transform.js");

// @ts-ignore: Adding an aspect global
if (!globalThis.__aspect) globalThis.__aspect = {};

// We need to garuntee we use only a single version of the compiler

// @ts-ignore: Adding an aspect global for asc
if (!globalThis.__aspect.asc) globalThis.__aspect.asc = await import("assemblyscript/dist/asc.js");
// @ts-ignore: Adding an aspect global for asc
export const asc: ASC = globalThis.__aspect.asc;

// @ts-ignore: Adding an aspect global for asc
if (!globalThis.__aspect.assemblyscript) globalThis.__aspect.assemblyscript = await import("assemblyscript/dist/assemblyscript.js");
// @ts-ignore: Adding an aspect global for asc
export const assemblyscript: AS = globalThis.__aspect.assemblyscript;

// @ts-ignore: Adding an aspect global for asc
if (!globalThis.__aspect.transform) globalThis.__aspect.transform = await import("assemblyscript/dist/transform.js");
// @ts-ignore: Adding an aspect global for asc
export const transform: TRANSFORM = globalThis.__aspect.transform;

