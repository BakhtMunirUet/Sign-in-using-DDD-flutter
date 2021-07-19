class InvalidEmailException implements Exception {
  final String failedValue;

  InvalidEmailException({required this.failedValue});
}

class EmptyEmailException implements Exception {
  final String failedValue;

  EmptyEmailException({required this.failedValue});
}

class ShortPasswordException {
  final String failedValue;

  ShortPasswordException({required this.failedValue});
}

class WeekPasswordException {
  final String failedValue;

  WeekPasswordException({required this.failedValue});
}

class EmptyPasswordException implements Exception {
  final String failedValue;

  EmptyPasswordException({required this.failedValue});
}
