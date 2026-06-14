import { ClassDeclaration, InterfaceDeclaration } from "assemblyscript/dist/assemblyscript.js";

import {
  ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME,
  HAS_EQ_OPERATOR_MEMBER_NAME,
  STRICT_EQUALS_MEMBER_NAME,
  hasLocalEqualsOperator,
  markGeneratedClassReflectionMember,
  shouldGenerateClassReflectionMember,
} from "./ClassReflectionTransform.js";
import { createAddReflectedValueKeyValuePairsMember } from "./createAddReflectedValueKeyValuePairsMember.js";
import {
  createInterfaceAddReflectedValueKeyValuePairsMember,
  createInterfaceStrictEqualsMember,
} from "./createInterfaceReflectionMembers.js";
import { createHasEqualsOperatorMember, createStrictEqualsMember } from "./createStrictEqualsMember.js";

/** Append all generated reflection members for a class declaration. */
export function appendGeneratedClassReflectionMembers(classDeclaration: ClassDeclaration): void {
  const shouldGenerateStrictEquals = shouldGenerateClassReflectionMember(classDeclaration, STRICT_EQUALS_MEMBER_NAME);
  const shouldGenerateReflectedPairs = shouldGenerateClassReflectionMember(
    classDeclaration,
    ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME,
  );
  const shouldGenerateEqualsMarker = shouldGenerateClassReflectionMember(classDeclaration, HAS_EQ_OPERATOR_MEMBER_NAME);

  if (hasLocalEqualsOperator(classDeclaration) && shouldGenerateEqualsMarker) {
    classDeclaration.members.push(markGeneratedClassReflectionMember(createHasEqualsOperatorMember(classDeclaration)));
  }

  if (shouldGenerateStrictEquals) {
    classDeclaration.members.push(markGeneratedClassReflectionMember(createStrictEqualsMember(classDeclaration)));
  }

  if (shouldGenerateReflectedPairs) {
    classDeclaration.members.push(
      markGeneratedClassReflectionMember(createAddReflectedValueKeyValuePairsMember(classDeclaration)),
    );
  }
}

/** Append all generated reflection contracts for an interface declaration. */
export function appendGeneratedInterfaceReflectionMembers(interfaceDeclaration: InterfaceDeclaration): void {
  const shouldGenerateStrictEquals = shouldGenerateClassReflectionMember(
    interfaceDeclaration,
    STRICT_EQUALS_MEMBER_NAME,
  );
  const shouldGenerateReflectedPairs = shouldGenerateClassReflectionMember(
    interfaceDeclaration,
    ADD_REFLECTED_VALUE_KEY_VALUE_PAIRS_MEMBER_NAME,
  );

  if (shouldGenerateStrictEquals) {
    interfaceDeclaration.members.push(
      markGeneratedClassReflectionMember(createInterfaceStrictEqualsMember(interfaceDeclaration)),
    );
  }

  if (shouldGenerateReflectedPairs) {
    interfaceDeclaration.members.push(
      markGeneratedClassReflectionMember(createInterfaceAddReflectedValueKeyValuePairsMember(interfaceDeclaration)),
    );
  }
}
