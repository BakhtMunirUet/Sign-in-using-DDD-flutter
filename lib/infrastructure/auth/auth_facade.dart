import 'dart:convert';

import 'package:ddd_signin/domain/auth/email_address.dart';
import 'package:ddd_signin/domain/auth/i_auth_facade.dart';
import 'package:ddd_signin/domain/auth/password.dart';
import 'package:ddd_signin/domain/core/failures/auth_failures.dart';
import 'package:ddd_signin/infrastructure/local/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthFacade implements IAuthFacade {
  @override
  Future<void> registerWithEmailAndPassword(
      {EmailAddress? emailAddress, Password? password}) async {
    Map<String, String> user = new Map<String, String>();
    user["email"] = emailAddress!.value;
    user["password"] = password!.value;

    String _encodedBody = jsonEncode(user);

    String _result = await LocalStorage.getString(emailAddress.value);

    if (_result.isEmpty) {
      await LocalStorage.saveString(emailAddress.value, _encodedBody);
    } else {
      throw EmailAlreadyInUse(failedValue: emailAddress.value);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {EmailAddress? emailAddress, Password? password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }
}
