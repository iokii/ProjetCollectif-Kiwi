// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/Components/ExtractArgumentsCollection.dart';
import 'package:project/DetailsPublication.dart';
import 'package:project/option.dart';
import 'Components/ExtractArgumentsDiscuss.dart';
import 'Components/ExtractArgumentsProfile.dart';
import 'MessPage.dart';
import 'HomePage.dart';
import 'discuss.dart';
import 'ResetPassword.dart';
import 'CreateAccount.dart';
import 'login.dart';

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
