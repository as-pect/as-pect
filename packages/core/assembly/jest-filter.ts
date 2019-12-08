describe("group one", () => {
  test("test one", () => {
    assert(true);
  });

  test("test two", () => {
    assert(false);
  });

  throws("test three", () => {
    assert(true);
  });

  throws("test four", () => {
    assert(false);
  });
});

describe("group two", () => {
  test("test one", () => {
    assert(true);
  });

  test("test two", () => {
    assert(false);
  });

  throws("test three", () => {
    assert(true);
  });

  throws("test four", () => {
    assert(false);
  });
});

describe("group three", () => {
  test("test one", () => {
    assert(true);
  });

  test("test two", () => {
    assert(false);
  });

  throws("test three", () => {
    assert(true);
  });

  throws("test four", () => {
    assert(false);
  });
});
