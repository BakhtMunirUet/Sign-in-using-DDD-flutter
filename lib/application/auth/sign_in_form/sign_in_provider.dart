import 'package:ddd_signin/domain/auth/email_address.dart';
import 'package:ddd_signin/domain/auth/i_auth_facade.dart';
import 'package:ddd_signin/domain/auth/password.dart';
import 'package:ddd_signin/domain/core/failures/auth_failures.dart';
import 'package:ddd_signin/domain/core/failures/value_failures.dart';
import 'package:ddd_signin/infrastructure/auth/auth_facade.dart';
import 'package:flutter/foundation.dart';

class SignInProvider with ChangeNotifier {
  String _emailAddress = '';
  String _password = '';

  String get emailAddress => _emailAddress;
  set emailAddress(String value) {
    this._emailAddress = value;
  }

  String get password => _password;
  set password(String value) {
    this._password = value;
  }

  IAuthFacade _authFacade = new AuthFacade();

  registerWithEmailAndPasswordPressed() async {
    try {
      await _authFacade.signInWithEmailAndPassword(
          emailAddress: EmailAddress(_emailAddress),
          password: Password(_password));
    } on InvalidEmailException catch (e) {
      print("Ivalid email and password" + e.toString());
    } on InvalidEmailAndPasswordCombination catch (e) {
      print("Invalid email and password combination" + e.toString());
    }
  }
}
