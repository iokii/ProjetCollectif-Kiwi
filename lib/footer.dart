import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

BottomAppBar footer(context) {
  return BottomAppBar(
    //Footer a mettre en widget
    color: semiLightGray,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/message');
          },
          icon: const Icon(Icons.message),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
          iconSize: 50,
        )
      ],
    ),
  );
}