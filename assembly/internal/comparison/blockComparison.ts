import { exactComparison } from "./exactComparison";
import { reportExpectedNull } from "../report/reportExpectedNull";
import { reportExpectedReference } from "../report/reportExpectedReference";
import { reportActualNull } from "../report/reportActualNull";
import { reportActualReference } from "../report/reportActualReference";

// @ts-ignore inline is valid here in AssemblyScript
@inline
export function blockComparison<T>(actual: T, expected: T, negated: i32, message: string): void {

  if (actual == expected) {
    exactComparison<T>(actual, expected, negated, message);
    return;
  }

  // collect the reference pointers
  // todo: make this const when const expressions are supported by AS
  let expectedPtr = changetype<usize>(expected);
  // todo: make this const when const expressions are supported by AS
  let actualPtr = changetype<usize>(actual);

  // collect the block sizes
  // todo: make this const when const expressions are supported by AS
  let expectedSize = load<i32>(expectedPtr - 4);
  // todo: make this const when const expressions are supported by AS
  let actualSize = load<i32>(actualPtr - 4);


  // report the expected rederence
  if (expected == null) {
    reportExpectedNull(negated);
  } else {
    reportExpectedReference(expectedPtr, expectedSize, negated);
  }

  // report the actual reference
  if (actual == null) {
    reportActualNull();
  } else {
    reportActualReference(actualSize, actualSize);
  }

  // todo: make this const when const expressions are supported by AS
  let actualNull: i32 = i32(actual == null);
  // todo: make this const when const expressions are supported by AS
  let expectedNull: i32 = i32(expected == null);


  if (actualNull ^ expectedNull) {
    assert(negated, message);
  } else {
    // todo: make this const when const expressions are supported by AS
    let lengthEqual = actualSize == expectedSize;

    if (!lengthEqual) {
      assert(negated, message);
    } else {
      // todo: make this const when const expressions are supported by AS
      let bytesEqual = memory.compare(actualPtr, expectedPtr, actualSize) == 0;
      assert(negated ^ i32(bytesEqual), message);
    }
  }
}
