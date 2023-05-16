import 'package:flutter/material.dart';
import 'package:project/global.dart';

AppBar header({bool showParameter = false, required BuildContext context}) {
  return AppBar(
    backgroundColor: semiLightGray,
    leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: const CircleAvatar(
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
