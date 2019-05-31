const enum ActualValueType {
  None,
  Null,
  String,
  Reference,
  Float,
  Integer,
}

export class ActualValue {
  public type: ActualValueType = ActualValueType.None;
  public negated: bool = false;
  public stack: i32 = -1;
  public value: f64 = 0;
  public pointer: usize = 0;

  public reset(): void {
    this.type = ActualValueType.None;
    this.negated = false;
    this.stack = -1;
  }
}