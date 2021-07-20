import 'dart:convert';

import 'package:ddd_signin/domain/auth/email_address.dart';
import 'package:ddd_signin/domain/auth/i_auth_facade.dart';
import 'package:ddd_signin/domain/auth/password.dart';
import 'package:ddd_signin/domain/core/failures/auth_failures.dart';
import 'package:ddd_signin/infrastructure/local/local_storage.dart';

class AuthFacade implements IAuthFacade {
  @override
  Future<void> registerWithEmailAndPassword(
      {EmailAddress? emailAddress, Password? password}) async {
    try {
      String? result = await LocalStorage.getString(emailAddress!.value);
      if (result != null) {
        throw EmailAlreadyInUse(failedValue: emailAddress.value);
      } else {
        Map<String, String> user = new Map<String, String>();
        user["email"] = emailAddress.value;
        user["password"] = password!.value;
        String _encodedBody = jsonEncode(user);
        await LocalStorage.saveString(emailAddress.value, _encodedBody);
      }
    } on EmailNotUse {
      throw ServerError(failedValue: emailAddress!.value);
    }

    // throw ServerError(failedValue: emailAddress.value);
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {EmailAddress? emailAddress, Password? password}) async {
    String? result = await LocalStorage.getString(emailAddress!.value);
    if (result == null) {
      throw EmailNotUse(failedValue: emailAddress.value);
    } else {
      dynamic user = jsonDecode(result);
      String? email = user["email"];
      String? pass = user["password"];
      if (email == emailAddress.value && pass == password!.value) {
      } else {
        throw EmailNotUse(failedValue: "User Not found");
      }
    }
  }
}
