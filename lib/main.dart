// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:project/Data/User.dart';

import 'package:flutter/material.dart';
import 'package:project/Models/Profile.dart';

import 'package:project/Page/CreateArt.dart';
import 'package:project/Page/ExtractArgumentsCollection.dart';
import 'package:project/Page/SearchPage.dart';
import 'package:project/Page/ShowSubs.dart';
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
  DataUser users = DataUser();
  if (users.fitz.follow.isEmpty) {
    users.majFollow();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataUser()),
      ],
      child: MyApp(
        actualAccount: users.fitz,
      ),

    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.actualAccount});
  Profile actualAccount;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/password_reset': (context) => ResetPasswordPage(),
        '/create_account': (context) => CreateAccountPage(),
        '/homepage': (context) => HomePage(),
        '/option': (context) =>
            Option(actualAccount.typeCompte), //TODO passer le type de compte
        CreateArt.route: (context) => CreateArt(),
        MessPage.route: (context) =>
            MessPage(actualAccount.typeCompte), //TODO passer le type de compte
        SearchPage.route: (context) => SearchPage(),
        ExtractArgumentsDiscuss.discuss: (context) => ExtractArgumentsDiscuss(),
        ExtractArgumentsProfile.profile: (context) => ExtractArgumentsProfile(),
        ExtractArgumentsCollection.collection: (context) =>
            ExtractArgumentsCollection(),
        ShowSubs.route: (context) => ShowSubs()
      },
    );
  }
}
