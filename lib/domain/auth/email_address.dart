import 'package:ddd_signin/domain/core/validators/value_validators.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';

@immutable
class EmailAddress {
  final String value;

  factory EmailAddress(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}
