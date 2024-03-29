// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project/Models/global.dart';

import '../Models/Message.dart';
import '../Page/ExtractArgumentsDiscuss.dart';

GestureDetector SingleMessage(BuildContext context, Message message) {
  GestureDetector showMessage = GestureDetector(
    onTap: () => {
      Navigator.pushNamed(
        context,
        ExtractArgumentsDiscuss.discuss,
        arguments: message.id,
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
                  backgroundImage: NetworkImage(message.pdp),
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
                      Text(message.username,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 10,
                              color: white,
                              fontWeight: FontWeight.bold)),
                      Text(
                        message.lastMessage,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 10, color: white),
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
