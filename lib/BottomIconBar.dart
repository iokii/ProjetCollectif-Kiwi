import 'package:flutter/material.dart';

import 'global.dart';

BottomAppBar BottomIconBar(context) {
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
            color: Colors.white,
          ),
          iconSize: iconSize,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          iconSize: iconSize,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/message');
          },
          icon: const Icon(
            Icons.message,
            color: Colors.white,
          ),
          iconSize: iconSize,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          iconSize: iconSize,
        )
      ],
    ),
  );
}
