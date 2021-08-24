import 'package:ddd_signin/domain/auth/email_address.dart';
import 'package:ddd_signin/domain/auth/i_auth_facade_repository.dart';
import 'package:ddd_signin/domain/auth/password.dart';
import 'package:ddd_signin/domain/core/failures/auth_failures.dart';
import 'package:ddd_signin/domain/core/failures/value_failures.dart';
import 'package:ddd_signin/infrastructure/auth/auth_facade_repository.dart';
import 'package:flutter/foundation.dart';

class SignInProvider with ChangeNotifier {
  String _emailAddress = '';
  String _password = '';

  bool _isSuccess = false;

  String get emailAddress => _emailAddress;
  set emailAddress(String value) {
    this._emailAddress = value;
  }

  String get password => _password;
  set password(String value) {
    this._password = value;
  }

  bool get isSucess => _isSuccess;

  IAuthFacadeRepository _authFacadeRepository = new AuthFacadeRepository();

  signInWithEmailAndPasswordPressed() async {
    // try {
    //   await _authFacadeRepository.signInWithEmailAndPassword(
    //       emailAddress: EmailAddress(_emailAddress),
    //       password: Password(_password));
    //   _isSuccess = true;
    // } on MainEception catch (e) {
    //   _isSuccess = false;
    //   print(e.exceptionValue.toString());
    // } on EmailNotUse {
    //   print("user not dddddddd");
    // }

    try {
      await _authFacadeRepository.signInWithEmailAndPassword(
          emailAddress: EmailAddress(_emailAddress),
          password: Password(_password));
      _isSuccess = true;
    } on InvalidEmailException catch (e) {
      _isSuccess = false;
      print("Ivalid email and password" + e.toString());
    } on InvalidEmailAndPasswordCombination catch (e) {
      _isSuccess = false;
      print("Invalid email and password combination" + e.toString());
    } on EmailNotUse {
      _isSuccess = false;
      print("Sorry no user found");
    } on ServerError {
      _isSuccess = false;
      print("Server error occures");
    }
  }
}
