// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:project/Components/singlemessage.dart';
import 'package:project/Models/Message.dart';
import 'package:project/Models/global.dart';

class MessageTraveller extends StatefulWidget {
  const MessageTraveller({super.key});

  @override
  _MessageTravellerState createState() => _MessageTravellerState();
}

class _MessageTravellerState extends State<MessageTraveller> {
  var listMsg = [
    Message(1, "Fitz", "https://avatars.githubusercontent.com/u/98802482?v=4",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nunc dui, pulvinar auctor nibh ut, consectetur suscipit augue. Nulla elementum purus gravida quam blandit varius. Maecenas scelerisque lacus at massa fermentum, eget viverra diam ultrices. Aliquam sit amet tincidunt metus. Sed eleifend.."),
    Message(
        2,
        "La TEam",
        "https://avatars.githubusercontent.com/u/83698843?v=4",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nunc dui, pulvinar auctor nibh ut, consectetur suscipit augue. Nulla elementum purus gravida quam blandit varius. Maecenas scelerisque lacus at massa fermentum, eget viverra diam ultrices. Aliquam sit amet tincidunt metus. Sed eleifend.."),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: const Card(
                  color: Color(0xFF404040),
                  child: Center(
                    child: Text(
                      "Divers",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 10,
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            )
          ],
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7585626, //précision
            child: ListView.builder(
              itemCount: listMsg.length,
              itemBuilder: (context, index) =>
                  SingleMessage(context, listMsg[index]),
            )),
      ],
    );
  }
}
