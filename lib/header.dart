import 'package:flutter/material.dart';
import 'package:project/global.dart';
import 'package:provider/provider.dart';

import 'Models/UserStored.dart';
import 'Provider/UserProvider.dart';

AppBar header({bool showParameter = false, required BuildContext context}) {
  UserStored user = Provider.of<UserProvider>(context, listen: false).user;
  return AppBar(
    backgroundColor: semiLightGray,
    leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(user.pfp),
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
