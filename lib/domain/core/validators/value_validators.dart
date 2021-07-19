import 'package:ddd_signin/domain/core/failures/value_failures.dart';

String validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return "";
  } else if (input.isEmpty) {
    throw EmptyEmailException(failedValue: input);
  } else {
    throw InvalidEmailException(failedValue: input);
  }
}

String validatePassword(String input) {
  if (input.length > 6) {
    return input;
  } else if (input.isEmpty) {
    throw EmptyPasswordException(failedValue: input);
  } else {
    throw ShortPasswordException(failedValue: input);
  }
}
