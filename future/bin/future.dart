import 'dart:async';

void main() {
  Future<int> future = createFuture(0, false, 5);
  future.then((value) => print("success $value"));

  Future<int> errorFuture = createFuture(1, true, 5);
  errorFuture.then((value) => print("success $value"),
      onError: (e) => print("onError $e"));
  errorFuture
      .then((value) => print("success $value"))
      .catchError((e) => print("catch $e"));

  Future<int> thenErrorFuture = createFuture(100, false, 5);
  thenErrorFuture.then((value) => print(convert(value)),
      onError: (e) => print("onError $e"));
  thenErrorFuture
      .then((value) => print(convert(value)))
      .catchError((e) => print("catch $e"));

  return;
}

Future<int> createFuture(int emitValue, bool hasError, int delaySecond) async {
  if (hasError) {
    throw Exception("error");
  }

  await Future.delayed(Duration(seconds: delaySecond));
  return emitValue;
}

String convert(int number) {
  if (0 <= number && number <= 9) {
    return number.toString();
  }

  throw Exception("invalid number.");
}
