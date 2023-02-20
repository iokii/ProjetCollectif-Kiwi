import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/Message.dart';

Card SingleMessage(Message message) {
  return Card(
      child: Row(
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(message.pdp),
        maxRadius: 3,
      ),
      Column(
        children: [
          Text(message.username),
          Text(message.lastMessage),
        ],
      )
    ],
  ));
}
