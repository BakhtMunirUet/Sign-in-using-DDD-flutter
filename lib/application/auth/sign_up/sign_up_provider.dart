import 'package:ddd_signin/domain/auth/email_address.dart';
import 'package:ddd_signin/domain/auth/i_auth_facade.dart';
import 'package:ddd_signin/domain/auth/password.dart';
import 'package:ddd_signin/domain/core/failures/auth_failures.dart';
import 'package:ddd_signin/domain/core/failures/value_failures.dart';
import 'package:ddd_signin/infrastructure/auth/auth_facade.dart';
import 'package:flutter/foundation.dart';

class SignUpProvider with ChangeNotifier {
  String _emailAddress = '';
  String _password = '';

  bool _isSuccess = false;
  String _errorMessage = "";

  String get emailAddress => _emailAddress;
  set emailAddress(String value) {
    this._emailAddress = value;
  }

  String get password => _password;
  set password(String value) {
    this._password = value;
  }

  String get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  IAuthFacade _authFacade = new AuthFacade();

  registerWithEmailAndPasswordPressed() async {
    try {
      await _authFacade.registerWithEmailAndPassword(
          emailAddress: EmailAddress(_emailAddress),
          password: Password(_password));
      _isSuccess = true;
    } on InvalidEmailException catch (e) {
      _isSuccess = false;
      _errorMessage = "Invalid Email";
      print("Ivalid email and password" + e.toString());
    } on InvalidEmailAndPasswordCombination catch (e) {
      _isSuccess = false;
      _errorMessage = "Invalid email and password combination";
      print("Invalid email and password combination" + e.toString());
    } on EmailAlreadyInUse {
      _isSuccess = false;
      _errorMessage = "Email Already in use";
    } on ServerError {
      _isSuccess = false;
      _errorMessage = "Somethings went wrong";
    }

    notifyListeners();
  }
}
