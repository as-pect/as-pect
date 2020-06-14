import { random_get } from "wasi";

@external("__debug", "log")
declare function debug(value: f64): void;

let output = [0] as StaticArray<u64>;

test("output", () => {
  debug(1);
  let a = random_get(changetype<usize>(output), sizeof<u64>());
  debug(a);
  log(a);
  log(output[0]);
});
