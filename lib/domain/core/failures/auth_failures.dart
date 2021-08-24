class CancellledByUser implements Exception {
  final String failedValue;

  CancellledByUser({required this.failedValue});
}

class ServerError implements Exception {
  final String failedValue;

  ServerError({required this.failedValue});
}

class EmailAlreadyInUse implements Exception {
  final String failedValue;

  EmailAlreadyInUse({required this.failedValue});
}

class InvalidEmailAndPasswordCombination implements Exception {
  final String failedValue;

  InvalidEmailAndPasswordCombination({required this.failedValue});
}

class EmailNotUse implements Exception {
  final String failedValue;

  EmailNotUse({this.failedValue = "User Not found"});
}

class MainEception<T> implements Exception {
  T exception;
  String exceptionValue;

  MainEception(this.exceptionValue, this.exception);
}
