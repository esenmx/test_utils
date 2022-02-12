part of test_utils;

class VoidListener extends Mock {
  void call();

  void called(int count) => verify(call()).called(count);

  void get verifyNotCalled => verifyNever(call());

  void get verifyCalledOnce => called(1);

  void get verifyCalledTwice => called(2);

  void get verifyCalledThrice => called(3);
}

class NextListener<T> extends Mock {
  void call(T next);

  void called(int count, T next) => verify(call(next)).called(count);

  void verifyNotCalled(T next) => verifyNever(call(next));

  void verifyCalledOnce(T next) => called(1, next);

  void verifyCalledTwice(T next) => called(2, next);

  void verifyCalledThrice(T next) => called(3, next);
}

class PreviousNextListener<T> extends Mock {
  void call(T? previous, T next);

  void called(int count, T? previous, T next) =>
      verify(call(previous, next)).called(count);

  void verifyNotCalled(T? previous, T next) =>
      verifyNever(call(previous, next));

  void verifyCalledOnce(T? previous, T next) => called(1, previous, next);

  void verifyCalledTwice(T? previous, T next) => called(2, previous, next);

  void verifyCalledThrice(T? previous, T next) => called(3, previous, next);
}
