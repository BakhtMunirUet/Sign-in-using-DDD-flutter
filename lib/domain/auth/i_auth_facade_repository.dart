import 'package:ddd_signin/domain/auth/email_address.dart';
import 'package:ddd_signin/domain/auth/password.dart';
import 'package:flutter/cupertino.dart';

abstract class IAuthFacadeRepository {
  Future<void> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<void> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
}
