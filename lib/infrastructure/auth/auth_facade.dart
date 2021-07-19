import 'package:ddd_signin/domain/auth/email_address.dart';
import 'package:ddd_signin/domain/auth/i_auth_facade.dart';
import 'package:ddd_signin/domain/auth/password.dart';

class AuthFacade implements IAuthFacade {
  @override
  Future<void> registerWithEmailAndPassword(
      {EmailAddress? emailAddress, Password? password}) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {EmailAddress? emailAddress, Password? password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }
}
