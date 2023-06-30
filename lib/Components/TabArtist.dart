// ignore_for_file: no_logic_in_create_state, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:project/Components/singlemessage.dart';
import 'package:project/Models/Message.dart';
import 'package:project/Models/global.dart';

class TabArtist extends StatefulWidget {
  final int actualTab;

  TabArtist({super.key, required this.actualTab});

  @override
  _TabArtistState createState() => _TabArtistState(actualTab);
}

class _TabArtistState extends State<TabArtist> {
  _TabArtistState(int actualTab);

  //TODO query data selon onglet

  @override
  Widget build(BuildContext context) {
    var listMsg = [];

    if (widget.actualTab == 0) {
      listMsg = [
        Message(
            1,
            "Romain",
            "https://avatars.githubusercontent.com/u/83698843?v=4",
            "Merci du compliment !!"),
        Message(
            2,
            "Léonard da Vinci",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpQTpymriyzhjQEivOvItdFuSWXQJkJZ0jXgenzThOXA&s",
            "Bon retour parmis nous !!"),
      ];
    } else if (widget.actualTab == 1) {
      listMsg = [
        Message(
            1,
            "Léonard da Vinci",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpQTpymriyzhjQEivOvItdFuSWXQJkJZ0jXgenzThOXA&s",
            "Veut collaborer avec vous"),
      ];
    } else {
      listMsg = [
        Message(
            1,
            "Romain",
            "https://avatars.githubusercontent.com/u/83698843?v=4",
            "À adoré votre oeuvre : Interview"),
        Message(
            2,
            "Léonard da Vinci",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpQTpymriyzhjQEivOvItdFuSWXQJkJZ0jXgenzThOXA&s",
            "À aimé : Oshi no ko "),
      ];
    }

    return Scaffold(
      backgroundColor: darkGray,
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7585626, //précision
          child: ListView.builder(
            itemCount: listMsg.length,
            itemBuilder: (context, index) =>
                SingleMessage(context, listMsg[index]),
          )),
    );
  }
}
