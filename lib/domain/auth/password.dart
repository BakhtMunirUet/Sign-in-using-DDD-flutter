import 'package:ddd_signin/domain/core/validators/value_validators.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Password {
  final String value;

  factory Password(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}
