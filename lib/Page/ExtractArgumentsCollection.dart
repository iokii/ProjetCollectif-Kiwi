// A Widget that extracts the necessary arguments from
// the ModalRoute.
// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:project/Components/showPostInRow.dart';
import 'package:project/Models/ArgumentScreenCollection.dart';

import '../Components/DetailsPublication.dart';
import '../Components/Part/BottomIconBar.dart';
import '../Components/Part/header.dart';
import '../Models/global.dart';

class ExtractArgumentsCollection extends StatefulWidget {
  const ExtractArgumentsCollection({super.key});
  static const collection = '/collection';

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ExtractArgumentsCollection> {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args =
        ModalRoute.of(context)!.settings.arguments as ArgumentScreenCollection;

    //Request DB avec args pour l'id discuss

    return Scaffold(
        appBar: header(context: context),
        backgroundColor: const Color(0xFF323232),
        body: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Card(
                color: const Color(0xFF323232),
                elevation: 0,
                child: Column(children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 15))
                ])),
          ),
          Text(
            args.gallery.name,
            style: TextStyle(color: white),
          ),
          Padding(
            padding: EdgeInsets.all(7),
            child: showPostInRow(
                posts: args.gallery.listPublication, heightMult: 0.736),
          )
        ]),
        bottomNavigationBar: BottomIconBar(context));
  }
}

class ScreenArguments {}
