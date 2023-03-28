import 'package:flutter/material.dart';
import 'package:project/DetailsPublication.dart';
import 'Components/ExtractArgumentsScreen.dart';
import 'MessPage.dart';
import 'HomePage.dart';
import 'discuss.dart';
import 'ResetPassword.dart';
import 'CreateAccount.dart';
import 'login.dart';
import 'global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        //'/home_page': (context) => HomePage(),
        // '/details_publication': (context) => DetailsPublication(null),
        '/password_reset': (context) => ResetPasswordPage(),
        '/create_account': (context) => CreateAccountPage(),
        '/homepage': (context) => HomePage(),
        '/message': (context) => MessPage(false),
        ExtractArgumentsDiscuss.discuss: (context) => ExtractArgumentsDiscuss()
      },
    );
  }
}
