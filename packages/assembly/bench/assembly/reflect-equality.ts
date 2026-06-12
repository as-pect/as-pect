import { Reflect } from "../../assembly/internal/Reflect";

const SET_SIZE_10 = 10;
const SET_SIZE_100 = 100;
const SET_SIZE_1000 = 1000;

const set10Left = createI32Set(SET_SIZE_10);
const set10Right = createI32Set(SET_SIZE_10);
const set100Left = createI32Set(SET_SIZE_100);
const set100Right = createI32Set(SET_SIZE_100);
const set1000Left = createI32Set(SET_SIZE_1000);
const set1000Right = createI32Set(SET_SIZE_1000);

const map10Left = createStringI32Map(SET_SIZE_10);
const map10Right = createStringI32Map(SET_SIZE_10);
const map100Left = createStringI32Map(SET_SIZE_100);
const map100Right = createStringI32Map(SET_SIZE_100);
const map1000Left = createStringI32Map(SET_SIZE_1000);
const map1000Right = createStringI32Map(SET_SIZE_1000);

const nestedArraysLeft = createNestedArray(6, 5);
const nestedArraysRight = createNestedArray(6, 5);

const transformedClassLeft = createTransformedClassTree(5, 4, 1);
const transformedClassRight = createTransformedClassTree(5, 4, 1);

const cyclicClassLeft = createCyclicClassRing(32);
const cyclicClassRight = createCyclicClassRing(32);

export function benchSet10(iterations: i32): i32 {
  return repeatSetEquals(set10Left, set10Right, iterations);
}

export function benchSet100(iterations: i32): i32 {
  return repeatSetEquals(set100Left, set100Right, iterations);
}

export function benchSet1000(iterations: i32): i32 {
  return repeatSetEquals(set1000Left, set1000Right, iterations);
}

export function benchMap10(iterations: i32): i32 {
  return repeatMapEquals(map10Left, map10Right, iterations);
}

export function benchMap100(iterations: i32): i32 {
  return repeatMapEquals(map100Left, map100Right, iterations);
}

export function benchMap1000(iterations: i32): i32 {
  return repeatMapEquals(map1000Left, map1000Right, iterations);
}

export function benchNestedArrays(iterations: i32): i32 {
  return repeatNestedArrayEquals(nestedArraysLeft, nestedArraysRight, iterations);
}

export function benchTransformedClasses(iterations: i32): i32 {
  return repeatTransformedClassEquals(transformedClassLeft, transformedClassRight, iterations);
}

export function benchCyclicClasses(iterations: i32): i32 {
  return repeatCyclicClassEquals(cyclicClassLeft, cyclicClassRight, iterations);
}

function repeatSetEquals(left: Set<i32>, right: Set<i32>, iterations: i32): i32 {
  let matches = 0;
  for (let i = 0; i < iterations; i++) {
    matches += Reflect.equals<Set<i32>>(left, right);
  }
  return matches;
}

function repeatMapEquals(left: Map<string, i32>, right: Map<string, i32>, iterations: i32): i32 {
  let matches = 0;
  for (let i = 0; i < iterations; i++) {
    matches += Reflect.equals<Map<string, i32>>(left, right);
  }
  return matches;
}

function repeatNestedArrayEquals(left: i32[][][], right: i32[][][], iterations: i32): i32 {
  let matches = 0;
  for (let i = 0; i < iterations; i++) {
    matches += Reflect.equals<i32[][][]>(left, right);
  }
  return matches;
}

function repeatTransformedClassEquals(
  left: TransformedClassNode,
  right: TransformedClassNode,
  iterations: i32,
): i32 {
  let matches = 0;
  for (let i = 0; i < iterations; i++) {
    matches += Reflect.equals<TransformedClassNode>(left, right);
  }
  return matches;
}

function repeatCyclicClassEquals(left: CyclicClassNode, right: CyclicClassNode, iterations: i32): i32 {
  let matches = 0;
  for (let i = 0; i < iterations; i++) {
    matches += Reflect.equals<CyclicClassNode>(left, right);
  }
  return matches;
}

function createI32Set(size: i32): Set<i32> {
  const value = new Set<i32>();
  for (let i = 0; i < size; i++) {
    value.add(i);
  }
  return value;
}

function createStringI32Map(size: i32): Map<string, i32> {
  const value = new Map<string, i32>();
  for (let i = 0; i < size; i++) {
    value.set("key-" + i.toString(), i);
  }
  return value;
}

function createNestedArray(width: i32, depth: i32): i32[][][] {
  const value = new Array<Array<Array<i32>>>(width);
  for (let i = 0; i < width; i++) {
    const secondLevel = new Array<Array<i32>>(width);
    for (let j = 0; j < width; j++) {
      const thirdLevel = new Array<i32>(depth);
      for (let k = 0; k < depth; k++) {
        unchecked((thirdLevel[k] = i * 100 + j * 10 + k));
      }
      unchecked((secondLevel[j] = thirdLevel));
    }
    unchecked((value[i] = secondLevel));
  }
  return value;
}

function createTransformedClassTree(depth: i32, width: i32, seed: i32): TransformedClassNode {
  const node = new TransformedClassNode(seed, seed + 1, "node-" + seed.toString());
  for (let i = 0; i < width; i++) {
    node.values.push(seed * 100 + i);
  }
  if (depth > 0) {
    node.child = createTransformedClassTree(depth - 1, width, seed + 1);
  }
  return node;
}

function createCyclicClassRing(size: i32): CyclicClassNode {
  const root = new CyclicClassNode(0);
  let previous = root;
  for (let i = 1; i < size; i++) {
    const current = new CyclicClassNode(i);
    previous.next = current;
    current.previous = previous;
    previous = current;
  }
  previous.next = root;
  root.previous = previous;
  return root;
}

class TransformedClassNode {
  id: i32;
  weight: i64;
  label: string;
  values: i32[] = [];
  child: TransformedClassNode | null = null;

  constructor(id: i32, weight: i64, label: string) {
    this.id = id;
    this.weight = weight;
    this.label = label;
  }
}

class CyclicClassNode {
  id: i32;
  next: CyclicClassNode | null = null;
  previous: CyclicClassNode | null = null;

  constructor(id: i32) {
    this.id = id;
  }
}
