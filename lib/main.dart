import 'package:flutter/material.dart';
import 'reset_password.dart';
import 'create_account.dart';
import 'login.dart';
import 'global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/password_reset': (context) => ResetPasswordPage(),
        '/create_account': (context) => CreateAccountPage(),
      },
    );
  }
}
