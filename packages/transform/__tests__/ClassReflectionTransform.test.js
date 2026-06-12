import test from "node:test";
import assert from "node:assert/strict";

import { ASTBuilder, NodeKind, Parser } from "assemblyscript/dist/assemblyscript.js";

import {
  ClassReflectionMemberKind,
  createClassReflectionMemberPlan,
} from "../lib/ClassReflectionTransform.js";
import { createAddReflectedValueKeyValuePairsMember } from "../lib/createAddReflectedValueKeyValuePairsMember.js";
import { createStrictEqualsMember } from "../lib/createStrictEqualsMember.js";

function parseClass(sourceText, className) {
  const parser = new Parser();
  parser.parseFile(sourceText, "class-reflection-plan.spec.ts", true);
  parser.finish();

  for (const source of parser.sources) {
    for (const statement of source.statements) {
      if (statement.kind === NodeKind.ClassDeclaration && statement.name.text === className) {
        return statement;
      }
    }
  }

  throw new Error(`Unable to find parsed class ${className}`);
}

function getPlanEntries(sourceText, className) {
  return createClassReflectionMemberPlan(parseClass(sourceText, className)).members.map((member) => ({
    name: member.name,
    kind: member.kind,
  }));
}

function assertInOrder(text, orderedNeedles) {
  let previousIndex = -1;

  for (const needle of orderedNeedles) {
    const index = text.indexOf(needle);
    assert.notEqual(index, -1, `Expected generated output to contain ${needle}`);
    assert.ok(index > previousIndex, `Expected ${needle} to appear after the previous checked output`);
    previousIndex = index;
  }
}

function getIgnoreIncludesLiterals(generatedSource) {
  return [...generatedSource.matchAll(/ignore\.includes\(([^)]+)\)/g)].map((match) => match[1]);
}

function getSuperIgnoreLiterals(generatedSource) {
  const match = generatedSource.match(/StaticArray\.concat\(ignore, \[([^\]]*)\] as StaticArray<i64>\)/);
  assert.ok(match, "Expected generated output to pass a local ignore list to the super reflection method");

  return match[1]
    .split(",")
    .map((literal) => literal.trim())
    .filter(Boolean);
}

test("class-member plan includes instance fields and getters in source order", () => {
  const entries = getPlanEntries(
    `class MixedMembers {
      firstField: i32 = 1;
      get secondGetter(): i32 { return 2; }
      thirdField: string = "third";
      get fourthGetter(): bool { return true; }
    }`,
    "MixedMembers",
  );

  assert.deepEqual(entries, [
    { name: "firstField", kind: ClassReflectionMemberKind.Field },
    { name: "secondGetter", kind: ClassReflectionMemberKind.Getter },
    { name: "thirdField", kind: ClassReflectionMemberKind.Field },
    { name: "fourthGetter", kind: ClassReflectionMemberKind.Getter },
  ]);
});

test("class-member plan excludes static members and non-getter methods", () => {
  const entries = getPlanEntries(
    `class FilteredMembers {
      includedField: i32 = 1;
      static staticField: i32 = 2;
      method(): void {}
      static get staticGetter(): i32 { return 3; }
      set writeOnly(value: i32) {}
      get includedGetter(): i32 { return 4; }
    }`,
    "FilteredMembers",
  );

  assert.deepEqual(entries, [
    { name: "includedField", kind: ClassReflectionMemberKind.Field },
    { name: "includedGetter", kind: ClassReflectionMemberKind.Getter },
  ]);
});

test("generated members pass local source-order hashes to super for inherited duplicate suppression", () => {
  const classDeclaration = parseClass(
    `class Parent {
      shared: i32 = 0;
      parentOnly: i32 = 1;
    }

    class Child extends Parent {
      shared: i32 = 2;
      childOnly: i32 = 3;
      get childGetter(): i32 { return 4; }
    }`,
    "Child",
  );

  const strictEqualsSource = ASTBuilder.build(createStrictEqualsMember(classDeclaration));
  const reflectedPairsSource = ASTBuilder.build(createAddReflectedValueKeyValuePairsMember(classDeclaration));

  assertInOrder(strictEqualsSource, ["this.shared", "this.childOnly", "this.childGetter"]);
  assertInOrder(reflectedPairsSource, ['"shared"', '"childOnly"', '"childGetter"']);
  assert.doesNotMatch(strictEqualsSource, /parentOnly/);
  assert.doesNotMatch(reflectedPairsSource, /parentOnly/);

  assert.deepEqual(getSuperIgnoreLiterals(strictEqualsSource), getIgnoreIncludesLiterals(strictEqualsSource));
  assert.deepEqual(getSuperIgnoreLiterals(reflectedPairsSource), getIgnoreIncludesLiterals(reflectedPairsSource));
});
