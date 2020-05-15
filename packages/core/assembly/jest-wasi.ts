import { random_get } from "wasi";

let output = [0] as StaticArray<u64>;

test("output", () => {
  log(random_get(changetype<usize>(output), sizeof<u64>()));
  expect(output[0]).not.toBe(0);
});
