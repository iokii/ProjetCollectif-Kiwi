// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/Page/CreateArt.dart';
import 'package:project/Page/ExtractArgumentsCollection.dart';
import 'package:project/Page/option.dart';
import 'package:provider/provider.dart';
import 'Page/ExtractArgumentsDiscuss.dart';
import 'Page/ExtractArgumentsProfile.dart';
import 'Page/MessPage.dart';
import 'Page/ResetPassword.dart';
import 'Page/CreateAccount.dart';
import 'Page/homepage.dart';
import 'Page/login.dart';
import 'Provider/UserProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/password_reset': (context) => ResetPasswordPage(),
        '/create_account': (context) => CreateAccountPage(),
        '/homepage': (context) => HomePage(),
        '/message': (context) => const MessPage(false),
        '/option': (context) => const Option(false),
        CreateArt.route: (context) => CreateArt(),
        ExtractArgumentsDiscuss.discuss: (context) => ExtractArgumentsDiscuss(),
        ExtractArgumentsProfile.profile: (context) => ExtractArgumentsProfile(),
        ExtractArgumentsCollection.collection: (context) =>
            ExtractArgumentsCollection()
      },
    );
  }
}
