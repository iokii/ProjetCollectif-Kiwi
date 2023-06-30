// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project/Page/ExtractArgumentsProfile.dart';
import 'package:provider/provider.dart';
import '../../Data/User.dart';
import '../../Models/Profile.dart';
import '../../Models/global.dart';

BottomAppBar BottomIconBar(context) {
  Profile loggedin = Provider.of<DataUser>(context, listen: false).fitz;
  var iconSize = 35.0;
  return BottomAppBar(
    //Footer a mettre en widget
    color: semiLightGray,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          icon: const Icon(
            Icons.home,
            color: white,
          ),
          iconSize: iconSize,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/search");
          },
          icon: const Icon(
            Icons.search,
            color: white,
          ),
          iconSize: iconSize,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/message');
          },
          icon: const Icon(
            Icons.message,
            color: white,
          ),
          iconSize: iconSize,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              ExtractArgumentsProfile.profile,
              arguments: loggedin,
            );
          },
          icon: const Icon(
            Icons.person,
            color: white,
          ),
          iconSize: iconSize,
        )
      ],
    ),
  );
}
