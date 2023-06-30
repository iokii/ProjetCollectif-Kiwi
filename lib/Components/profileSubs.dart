// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:project/Models/Profile.dart';
import 'package:project/Models/global.dart';
import 'package:project/Page/ExtractArgumentsProfile.dart';

GestureDetector profileSubs(BuildContext context, Profile user) {
  GestureDetector showMessage = GestureDetector(
    onTap: () => {
      Navigator.pushNamed(
        context,
        ExtractArgumentsProfile.profile,
        arguments: user,
      )
    },
    child: Card(
        color: const Color(0xFF323232),
        shadowColor: Colors.transparent,
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.pdp),
                  radius: 25,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 50.0, left: 30.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Text(user.name,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 10,
                              color: white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Color(0xFF505050),
            height: 20,
            thickness: 1,
          )
        ])),
  );

  return showMessage;
}
