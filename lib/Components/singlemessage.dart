// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Models/discuss.dart';
import 'package:project/global.dart';

import '../Models/Message.dart';
import 'ExtractArgumentsDiscuss.dart';

GestureDetector SingleMessage(BuildContext context, Message message) {
  GestureDetector showMessage = GestureDetector(
    onTap: () => {
      Navigator.pushNamed(
        context,
        ExtractArgumentsDiscuss.discuss,
        arguments: Discuss("1"),
      )
    },
    child: Card(
        color: const Color(0xFF323232),
        shadowColor: Colors.transparent,
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(message.pdp),
                  radius: 25,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 100.0, left: 30.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Text(message.username,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text(
                        message.lastMessage,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          Divider(
            color: const Color(0xFF505050),
            height: 20,
            thickness: 1,
          )
        ])),
  );

  return showMessage;
}
