import 'package:flutter/material.dart';

import '../../Models/global.dart';

AppBar header(
    {bool artist = false,
    bool back = false,
    bool showParameter = false,
    required BuildContext context}) {
  return AppBar(
    backgroundColor: semiLightGray,
    leading: const Padding(
        padding: EdgeInsets.all(10.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://www.snexplores.org/wp-content/uploads/2022/09/091622_FK_fishing-fox_feat-1030x580.jpg"),
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
        : artist
            ? <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/addArt", arguments: false);
                    },
                    icon: const Icon(Icons.add))
              ]
            : back
                ? <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close))
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
