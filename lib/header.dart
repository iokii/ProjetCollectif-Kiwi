import 'package:flutter/material.dart';
import 'package:project/global.dart';

AppBar header({bool showParameter = false}) {
  return AppBar(
    backgroundColor: semiLightGray,
    leading: const CircleAvatar(
      backgroundImage: NetworkImage("https://i.imgur.com/BoN9kdC.png"),
      maxRadius: 3,
    ),
    // if show parameter, show an icon
    actions: showParameter
        ? <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ]
        : null,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(4.0),
      child: Container(
        color: darkGray,
        height: 3.0,
      ),
    ),
  );
}
