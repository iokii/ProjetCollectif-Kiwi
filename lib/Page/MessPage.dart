// ignore_for_file: file_names, no_logic_in_create_state, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/Components/MessageArtiste.dart';
import 'package:project/Components/MessageTraveller.dart';

import '../Components/Part/BottomIconBar.dart';
import '../Components/Part/header.dart';
import '../Models/global.dart';

class MessPage extends StatefulWidget {
  final bool artiste;
  const MessPage(this.artiste, {super.key});
  static const route = '/message';

  @override
  _MessPageState createState() => _MessPageState(artiste);
}

class _MessPageState extends State<MessPage> {
  _MessPageState(bool artiste);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context: context),
        backgroundColor: darkGray,
        body: Column(children: [
          if (widget.artiste)
            const MessageArtiste()
          else
            const MessageTraveller()
        ]),
        bottomNavigationBar: BottomIconBar(context));
  }
}
