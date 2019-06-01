export const enum ValueType {
  None = 0,
  Float = 1,
  Reference = 2,
  String = 3,
  Array = 4,
  Null = 5,
  Falsy = 6,
  Truthy = 7,
  Finite = 8,
}

export class Actual {
  public static type: ValueType;
  public static reference: usize;
  public static value: f64;
  public static offset: i32;
  public static stack: i32;
}

export class Expected {
  public static type: ValueType;
  public static reference: usize;
  public static value: f64;
  public static offset: i32;
  public static stack: i32;
  public static negated: i32;
}
