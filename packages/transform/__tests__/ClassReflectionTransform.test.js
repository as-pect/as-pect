import test from "node:test";
import assert from "node:assert/strict";

import { ASTBuilder, NodeKind, Parser } from "assemblyscript/dist/assemblyscript.js";

import AspectTransform from "../lib/index.js";
import { djb2Hash } from "../lib/hash.js";
import {
  ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME,
  ClassReflectionMemberKind,
  HAS_EQ_OPERATOR_MEMBER_NAME,
  STRICT_EQUALS_MEMBER_NAME,
  createClassReflectionMemberPlan,
  hasLocalEqualsOperator,
} from "../lib/ClassReflectionTransform.js";
import { createAddReflectedValueKeyValuePairsMember } from "../lib/createAddReflectedValueKeyValuePairsMember.js";
import { createHasEqualsOperatorMember, createStrictEqualsMember } from "../lib/createStrictEqualsMember.js";
import {
  createInterfaceAddReflectedValueKeyValuePairsMember,
  createInterfaceStrictEqualsMember,
} from "../lib/createInterfaceReflectionMembers.js";

function parseClass(sourceText, className) {
  const parser = new Parser();
  parser.parseFile(sourceText, "class-reflection-plan.spec.ts", true);
  parser.finish();

  return findParsedClass(parser, className);
}

function parseSource(sourceText) {
  const parser = new Parser();
  parser.parseFile(sourceText, "class-reflection-plan.spec.ts", true);
  parser.finish();
  return parser;
}

function findParsedClass(parser, className) {
  for (const source of parser.sources) {
    const found = findClassInStatements(source.statements, className);
    if (found) return found;
  }

  throw new Error(`Unable to find parsed class ${className}`);
}

function findParsedInterface(parser, interfaceName) {
  for (const source of parser.sources) {
    const found = findInterfaceInStatements(source.statements, interfaceName);
    if (found) return found;
  }

  throw new Error(`Unable to find parsed interface ${interfaceName}`);
}

function findClassInStatements(statements, className) {
  for (const statement of statements) {
    if (statement.kind === NodeKind.ClassDeclaration && statement.name.text === className) {
      return statement;
    }

    if (statement.kind === NodeKind.NamespaceDeclaration) {
      const found = findClassInStatements(statement.members, className);
      if (found) return found;
    }
  }

  return null;
}

function findInterfaceInStatements(statements, interfaceName) {
  for (const statement of statements) {
    if (statement.kind === NodeKind.InterfaceDeclaration && statement.name.text === interfaceName) {
      return statement;
    }

    if (statement.kind === NodeKind.NamespaceDeclaration) {
      const found = findInterfaceInStatements(statement.members, interfaceName);
      if (found) return found;
    }
  }

  return null;
}

function getPlanEntries(sourceText, className) {
  return createClassReflectionMemberPlan(parseClass(sourceText, className)).members.map((member) => ({
    name: member.name,
    kind: member.kind,
  }));
}

function findClassMember(classDeclaration, memberName) {
  const member = classDeclaration.members.find((member) => member.name && member.name.text === memberName);
  assert.ok(member, `Expected ${classDeclaration.name.text} to have member ${memberName}`);
  return member;
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

function transformParsedSource(parser) {
  new AspectTransform().afterParse(parser);
}

function countClassMethods(classDeclaration, name) {
  return classDeclaration.members.filter(
    (member) => member.kind === NodeKind.MethodDeclaration && member.name.text === name,
  ).length;
}

function countInterfaceMethods(interfaceDeclaration, name) {
  return interfaceDeclaration.members.filter(
    (member) => member.kind === NodeKind.MethodDeclaration && member.name.text === name,
  ).length;
}

function findGeneratedMethod(declaration, name) {
  const method = declaration.members.find(
    (member) => member.kind === NodeKind.MethodDeclaration && member.name.text === name,
  );
  assert.ok(method, `Expected ${declaration.name.text} to have generated method ${name}`);
  return method;
}

function buildGeneratedMethod(declaration, name) {
  return ASTBuilder.build(findGeneratedMethod(declaration, name));
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

test("class-member plan hashes match member names", () => {
  const plan = createClassReflectionMemberPlan(
    parseClass(
      `class HashedMembers {
        first: i32 = 1;
        get second(): i32 { return 2; }
      }`,
      "HashedMembers",
    ),
  );

  assert.deepEqual(
    plan.members.map((member) => member.hash),
    [djb2Hash("first"), djb2Hash("second")],
  );
  assert.deepEqual(plan.hashes, [djb2Hash("first"), djb2Hash("second")]);
});

test("class-member plan keeps field and getter source ranges", () => {
  const classDeclaration = parseClass(
    `class RangedMembers {
      fieldRange: i32 = 1;
      get getterRange(): i32 { return 2; }
    }`,
    "RangedMembers",
  );

  const fieldDeclaration = findClassMember(classDeclaration, "fieldRange");
  const getterDeclaration = findClassMember(classDeclaration, "getterRange");
  const plan = createClassReflectionMemberPlan(classDeclaration);

  assert.equal(plan.members[0].name, "fieldRange");
  assert.equal(plan.members[0].range, fieldDeclaration.range);
  assert.equal(plan.members[1].name, "getterRange");
  assert.equal(plan.members[1].range, getterDeclaration.name.range);
});

test("class reflection transform is idempotent for the same parsed source", () => {
  const parser = parseSource(`class StableTransform {
    value: i32 = 1;
  }`);

  transformParsedSource(parser);
  transformParsedSource(parser);

  const classDeclaration = findParsedClass(parser, "StableTransform");

  assert.equal(countClassMethods(classDeclaration, STRICT_EQUALS_MEMBER_NAME), 1);
  assert.equal(countClassMethods(classDeclaration, ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME), 1);
});

test("class reflection transform augments interfaces with reflection contracts", () => {
  const parser = parseSource(`interface ComparableValue {
  }

  class ConcreteValue implements ComparableValue {
    value: i32 = 1;
  }`);

  transformParsedSource(parser);

  const interfaceDeclaration = findParsedInterface(parser, "ComparableValue");
  assert.equal(countInterfaceMethods(interfaceDeclaration, STRICT_EQUALS_MEMBER_NAME), 1);
  assert.equal(countInterfaceMethods(interfaceDeclaration, ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME), 1);
  assert.equal(
    buildGeneratedMethod(interfaceDeclaration, STRICT_EQUALS_MEMBER_NAME),
    "public __aspectStrictEquals(rawRef: Object, stack: Array<usize>, cache: Array<usize>, ignore: StaticArray<i64>): bool",
  );
  assert.equal(
    buildGeneratedMethod(interfaceDeclaration, ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME),
    "public __aspectAddReflectedValueKeyValuePairs(reflectedValue: i32, seen: Map<usize, i32>, ignore: StaticArray<i64>): void",
  );
});

test("class reflection transform is idempotent for interface reflection contracts", () => {
  const parser = parseSource(`interface StableInterface {
  }`);

  transformParsedSource(parser);
  transformParsedSource(parser);

  const interfaceDeclaration = findParsedInterface(parser, "StableInterface");
  assert.equal(countInterfaceMethods(interfaceDeclaration, STRICT_EQUALS_MEMBER_NAME), 1);
  assert.equal(countInterfaceMethods(interfaceDeclaration, ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME), 1);
});

test("class reflection transform rejects user-defined interface reflection contract collisions", () => {
  const parser = parseSource(`interface InterfaceCollision {
    __aspectStrictEquals(): bool;
  }`);

  assert.throws(
    () => transformParsedSource(parser),
    /Cannot generate __aspectStrictEquals for interface InterfaceCollision because that member already exists\./,
  );

  const interfaceDeclaration = findParsedInterface(parser, "InterfaceCollision");
  assert.equal(countInterfaceMethods(interfaceDeclaration, STRICT_EQUALS_MEMBER_NAME), 1);
  assert.equal(countInterfaceMethods(interfaceDeclaration, ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME), 0);
});

test("class reflection transform rejects user-defined generated method collisions", () => {
  const parser = parseSource(`class UserCollision {
    value: i32 = 1;
    __aspectStrictEquals(): bool { return true; }
  }`);

  assert.throws(
    () => transformParsedSource(parser),
    /Cannot generate __aspectStrictEquals for class UserCollision because that member already exists\./,
  );

  const classDeclaration = findParsedClass(parser, "UserCollision");
  assert.equal(countClassMethods(classDeclaration, STRICT_EQUALS_MEMBER_NAME), 1);
  assert.equal(countClassMethods(classDeclaration, ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME), 0);
});

test("class reflection transform detects local equality operator overloads", () => {
  assert.equal(
    hasLocalEqualsOperator(
      parseClass(
        `class UsesEquals {
          @operator("==")
          protected __equals(other: UsesEquals): bool { return true; }
        }`,
        "UsesEquals",
      ),
    ),
    true,
  );

  assert.equal(
    hasLocalEqualsOperator(
      parseClass(
        `class UsesOtherOperator {
          @operator(">")
          protected __greater(other: UsesOtherOperator): bool { return true; }
        }`,
        "UsesOtherOperator",
      ),
    ),
    false,
  );
});

test("class reflection transform generates inherited equality marker for classes with equality operator overloads", () => {
  const parser = parseSource(`class UsesEquals {
    @operator("==")
    protected __equals(other: UsesEquals): bool { return true; }
  }

  class UsesStructuralEquality {
    value: i32 = 1;
  }`);

  transformParsedSource(parser);

  const classDeclaration = findParsedClass(parser, "UsesEquals");
  assert.equal(countClassMethods(classDeclaration, HAS_EQ_OPERATOR_MEMBER_NAME), 1);
  assert.equal(
    buildGeneratedMethod(classDeclaration, HAS_EQ_OPERATOR_MEMBER_NAME),
    `protected __aspectHasEqOperator(): bool {
  return true;
}`,
  );

  const structuralClassDeclaration = findParsedClass(parser, "UsesStructuralEquality");
  assert.equal(countClassMethods(structuralClassDeclaration, HAS_EQ_OPERATOR_MEMBER_NAME), 0);
});

test("class reflection transform rejects user-defined equality marker collisions", () => {
  const parser = parseSource(`class UserCollision {
    protected __aspectHasEqOperator(): bool { return true; }
  }`);

  assert.throws(
    () => transformParsedSource(parser),
    /Cannot generate __aspectHasEqOperator for class UserCollision because that member already exists\./,
  );
});

test("generated members include instance fields and getters while excluding static members", () => {
  const classDeclaration = parseClass(
    `class CharacterizedMembers {
      instanceField: i32 = 1;
      static staticField: i32 = 2;
      get instanceGetter(): string { return "ok"; }
      static get staticGetter(): i32 { return 3; }
      utilityMethod(): void {}
    }`,
    "CharacterizedMembers",
  );

  const strictEqualsSource = ASTBuilder.build(createStrictEqualsMember(classDeclaration));
  const reflectedPairsSource = ASTBuilder.build(createAddReflectedValueKeyValuePairsMember(classDeclaration));

  assertInOrder(strictEqualsSource, ["this.instanceField", "this.instanceGetter"]);
  assertInOrder(reflectedPairsSource, ['"instanceField"', '"instanceGetter"']);
  assert.doesNotMatch(strictEqualsSource, /staticField|staticGetter|utilityMethod/);
  assert.doesNotMatch(reflectedPairsSource, /staticField|staticGetter|utilityMethod/);
});

test("generated interface reflection declarations pin runtime method signatures", () => {
  const interfaceDeclaration = findParsedInterface(
    parseSource(`interface ReflectedContract<T> {
    }`),
    "ReflectedContract",
  );

  assert.equal(
    ASTBuilder.build(createInterfaceStrictEqualsMember(interfaceDeclaration)),
    "public __aspectStrictEquals(rawRef: Object, stack: Array<usize>, cache: Array<usize>, ignore: StaticArray<i64>): bool",
  );
  assert.equal(
    ASTBuilder.build(createInterfaceAddReflectedValueKeyValuePairsMember(interfaceDeclaration)),
    "public __aspectAddReflectedValueKeyValuePairs(reflectedValue: i32, seen: Map<usize, i32>, ignore: StaticArray<i64>): void",
  );
});

test("generated strict equality delegates to equality operator marker before structural fields", () => {
  const classDeclaration = parseClass(
    `class UsesEquals {
      value: i32 = 1;
      @operator("==")
      protected __equals(other: UsesEquals): bool { return true; }
    }`,
    "UsesEquals",
  );

  const markerSource = ASTBuilder.build(createHasEqualsOperatorMember(classDeclaration));
  const strictEqualsSource = ASTBuilder.build(createStrictEqualsMember(classDeclaration));

  assert.match(markerSource, /protected __aspectHasEqOperator\(\): bool/);
  assertInOrder(strictEqualsSource, [
    "const ref: UsesEquals",
    "isDefined(this.__aspectHasEqOperator)",
    "return this == ref",
    "this.value",
  ]);
});

test("class reflection transform rejects user-defined reflected-pairs method collisions", () => {
  const parser = parseSource(`class UserCollision {
    value: i32 = 1;
    __aspectAddReflectedValueKeyValuePairs(): void {}
  }`);

  assert.throws(
    () => transformParsedSource(parser),
    /Cannot generate __aspectAddReflectedValueKeyValuePairs for class UserCollision because that member already exists\./,
  );

  const classDeclaration = findParsedClass(parser, "UserCollision");
  assert.equal(countClassMethods(classDeclaration, STRICT_EQUALS_MEMBER_NAME), 0);
  assert.equal(countClassMethods(classDeclaration, ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME), 1);
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
