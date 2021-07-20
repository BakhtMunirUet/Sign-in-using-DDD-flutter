import 'package:ddd_signin/application/auth/sign_in_form/sign_in_provider.dart';
import 'package:ddd_signin/application/auth/sign_up/sign_up_provider.dart';
import 'package:ddd_signin/domain/auth/email_address.dart';
import 'package:ddd_signin/domain/auth/password.dart';
import 'package:ddd_signin/domain/core/failures/value_failures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpProvider>(
      create: (context) => SignUpProvider(),
      child: Consumer<SignUpProvider>(
        builder: (context, signUpProvider, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Sign up"),
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
                        onChanged: (value) {
                          signUpProvider.emailAddress = value.trim();
                        },
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
                        onChanged: (value) {
                          signUpProvider.password = value.trim();
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your password',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await signUpProvider
                                .registerWithEmailAndPasswordPressed();
                            if (signUpProvider.isSuccess) {
                              Navigator.pop(context);
                            } else {
                              print("Error:" + signUpProvider.errorMessage);
                            }
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: Text("Sign up"),
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
