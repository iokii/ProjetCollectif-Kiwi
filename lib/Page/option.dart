// ignore_for_file: no_logic_in_create_state, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../Components/Part/BottomIconBar.dart';
import '../Components/Part/header.dart';
import '../Models/global.dart';

class Option extends StatefulWidget {
  final bool typeArtiste;
  const Option(this.typeArtiste, {super.key});

  @override
  _OptionState createState() => _OptionState(typeArtiste);
}

const loginText = "Log into $applicationName !";

class _OptionState extends State<Option> {
  _OptionState(id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context: context),
      backgroundColor: darkGray,
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
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(children: const [
                Icon(
                  Icons.map,
                  size: 50,
                  color: white,
                ),
                SizedBox(width: 50),
                Text(
                  "Language : ",
                  style: TextStyle(color: white),
                ),
                Text(
                  "Français",
                  style: TextStyle(color: white, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 70),
                Icon(
                  Icons.navigate_next_sharp,
                  size: 25,
                  color: white,
                )
              ])),
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(children: const [
                  Icon(
                    Icons.brush,
                    size: 50,
                    color: white,
                  ),
                  SizedBox(width: 50),
                  Text(
                    "Devenir un artiste",
                    style: TextStyle(color: white),
                  ),
                  SizedBox(width: 70),
                  Icon(
                    Icons.navigate_next_sharp,
                    size: 25,
                    color: white,
                  )
                ]))),
      ]),
      bottomNavigationBar: BottomIconBar(context),
    );
  }
}
