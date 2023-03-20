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
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          icon: const Icon(Icons.home,color: Colors.white,size: 40),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search,color: Colors.white,size: 40),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/message');
          },
          icon: const Icon(Icons.message,color: Colors.white,size: 40),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person,color: Colors.white,size: 40),
          iconSize: 50,
        )
      ],
    ),
  );
}