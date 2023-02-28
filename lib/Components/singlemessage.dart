import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/Message.dart';

Card SingleMessage(Message message) {
  return Card(
    color: const Color(0xFF323232),
    shadowColor: Colors.transparent,
    child: Row(
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
          padding:
              const EdgeInsets.only(right: 100.0, left: 30.0, bottom: 10.0),
          child: Column(
            children: [
              Text(
                message.username,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                message.lastMessage,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        )),
      ],
    ),
  );
}
