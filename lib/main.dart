// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/Components/ExtractArgumentsCollection.dart';
import 'package:project/DetailsPublication.dart';
import 'package:project/option.dart';
import 'Components/ExtractArgumentsDiscuss.dart';
import 'Components/ExtractArgumentsProfile.dart';
import 'MessPage.dart';
import 'homepage.dart';
import 'reset_password.dart';
import 'create_account.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        //'/home_page': (context) => HomePage(),
        '/details_publication': (context) => const DetailsPublication("2"),
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
