// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/Page/ExtractArgumentsCollection.dart';
import 'package:project/Page/option.dart';
import 'Page/ExtractArgumentsDiscuss.dart';
import 'Page/ExtractArgumentsProfile.dart';
import 'Page/MessPage.dart';
import 'Page/ResetPassword.dart';
import 'Page/CreateAccount.dart';
import 'Page/homepage.dart';
import 'Page/login.dart';

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
        '/message': (context) => const MessPage(false),
        '/option': (context) => const Option(false),

        ExtractArgumentsDiscuss.discuss: (context) => ExtractArgumentsDiscuss(),
        ExtractArgumentsProfile.profile: (context) => ExtractArgumentsProfile(),
        ExtractArgumentsCollection.collection: (context) =>
            ExtractArgumentsCollection()
      },
    );
  }
}
