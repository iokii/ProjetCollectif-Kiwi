import 'package:flutter/material.dart';
import 'package:project/global.dart';

AppBar header({bool showParameter = false, required BuildContext context}) {
  return AppBar(
    backgroundColor: semiLightGray,
    leading: const Padding(
        padding: EdgeInsets.all(10.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://i.imgur.com/BoN9kdC.png"),
          radius: 10,
        )),
    // if show parameter, show an icon
    actions: showParameter
        ? <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, "/option");
              },
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
