// Characterization fixture for TestContext hook order and ownership.

// @ts-ignore: decorators are valid AssemblyScript syntax here.
@external("__lifecycle", "recordEvent")
declare function recordEvent(code: i32): void;

const OUTER_BEFORE_ALL = 0;
const OUTER_BEFORE_EACH = 1;
const OUTER_TEST_BODY = 2;
const OUTER_AFTER_EACH = 3;
const INNER_BEFORE_ALL = 4;
const INNER_BEFORE_EACH = 5;
const INNER_TEST_BODY = 6;
const INNER_AFTER_EACH = 7;
const INNER_AFTER_ALL = 8;
const OUTER_AFTER_ALL = 9;
const FAILING_BEFORE_ALL = 10;
const SHOULD_NOT_RUN_AFTER_BEFORE_ALL = 11;
const FAILING_BEFORE_EACH = 12;
const SHOULD_NOT_RUN_AFTER_BEFORE_EACH = 13;
const FAILING_AFTER_EACH_TEST_BODY = 14;
const FAILING_AFTER_EACH = 15;
const FAILING_AFTER_ALL_TEST_BODY = 16;
const FAILING_AFTER_ALL = 17;

function record(code: i32, message: string): void {
  recordEvent(code);
  log(message);
}

describe("lifecycle order", () => {
  beforeAll(() => {
    record(OUTER_BEFORE_ALL, "outer beforeAll");
  });

  beforeEach(() => {
    record(OUTER_BEFORE_EACH, "outer beforeEach");
  });

  afterEach(() => {
    record(OUTER_AFTER_EACH, "outer afterEach");
  });

  afterAll(() => {
    record(OUTER_AFTER_ALL, "outer afterAll");
  });

  it("outer test", () => {
    record(OUTER_TEST_BODY, "outer test body");
  });

  describe("inner", () => {
    beforeAll(() => {
      record(INNER_BEFORE_ALL, "inner beforeAll");
    });

    beforeEach(() => {
      record(INNER_BEFORE_EACH, "inner beforeEach");
    });

    afterEach(() => {
      record(INNER_AFTER_EACH, "inner afterEach");
    });

    afterAll(() => {
      record(INNER_AFTER_ALL, "inner afterAll");
    });

    it("inner test", () => {
      record(INNER_TEST_BODY, "inner test body");
    });
  });
});

describe("failing beforeAll hook", () => {
  beforeAll(() => {
    record(FAILING_BEFORE_ALL, "failing beforeAll hook");
    expect<i32>(10).toBe(11, "beforeAll failure marker");
  });

  it("should not run after beforeAll fails", () => {
    record(
      SHOULD_NOT_RUN_AFTER_BEFORE_ALL,
      "should not run after beforeAll fails",
    );
  });
});

describe("failing beforeEach hook", () => {
  beforeEach(() => {
    record(FAILING_BEFORE_EACH, "failing beforeEach hook");
    expect<i32>(20).toBe(21, "beforeEach failure marker");
  });

  it("should not run after beforeEach fails", () => {
    record(
      SHOULD_NOT_RUN_AFTER_BEFORE_EACH,
      "should not run after beforeEach fails",
    );
  });
});

describe("failing afterEach hook", () => {
  afterEach(() => {
    record(FAILING_AFTER_EACH, "failing afterEach hook");
    expect<i32>(30).toBe(31, "afterEach failure marker");
  });

  it("body runs before afterEach fails", () => {
    record(FAILING_AFTER_EACH_TEST_BODY, "failing afterEach test body");
  });
});

describe("failing afterAll hook", () => {
  afterAll(() => {
    record(FAILING_AFTER_ALL, "failing afterAll hook");
    expect<i32>(40).toBe(41, "afterAll failure marker");
  });

  it("body runs before afterAll fails", () => {
    record(FAILING_AFTER_ALL_TEST_BODY, "failing afterAll test body");
  });
});
