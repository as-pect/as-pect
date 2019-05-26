describe("group one", (): void => {
  test("test one", (): void => {
    assert(true);
  });

  test("test two", (): void => {
    assert(false);
  });

  throws("test three", (): void => {
    assert(true);
  });

  throws("test two", (): void => {
    assert(false);
  })
});

describe("group two", (): void => {
  test("test one", (): void => {
    assert(true);
  });

  test("test two", (): void => {
    assert(false);
  });

  throws("test three", (): void => {
    assert(true);
  });
});

describe("group three", (): void => {
  test("test one", (): void => {
    assert(true);
  });

  test("test two", (): void => {
    assert(false);
  });

  throws("test three", (): void => {
    assert(true);
  });
});
