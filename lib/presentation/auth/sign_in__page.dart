import 'package:ddd_signin/application/auth/sign_in_form/sign_in_provider.dart';
import 'package:ddd_signin/domain/auth/email_address.dart';
import 'package:ddd_signin/domain/auth/password.dart';
import 'package:ddd_signin/domain/core/failures/value_failures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInProvider>(
      create: (context) => SignInProvider(),
      child: Consumer<SignInProvider>(
        builder: (context, signInProvider, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Sign In"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  // ignore: deprecated_member_use
                  autovalidate: true,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          try {
                            EmailAddress(value.toString());
                          } on InvalidEmailException {
                            return "Invalid Email address";
                          } on EmptyEmailException {
                            return "enter email address";
                          }
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your username',
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          try {
                            Password(value.toString());
                          } on EmptyPasswordException {
                            return "Enter your password";
                          } on ShortPasswordException {
                            return "password must be greater than 6";
                          }
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your username',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: Text("Login"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
