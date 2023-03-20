import 'package:flutter/material.dart';
import 'package:project/Components/singlemessage.dart';
import 'package:project/Models/Message.dart';
import 'package:project/footer.dart';
import 'package:project/global.dart';
import 'package:project/header.dart';

class MessPage extends StatefulWidget {
  final bool artiste;
  const MessPage(this.artiste);

  @override
  _MessPageState createState() => _MessPageState(artiste);
}

class _MessPageState extends State<MessPage> {
  _MessPageState(bool artiste);

  var listMsg = [
    Message("Fitz", "https://avatars.githubusercontent.com/u/98802482?v=4",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nunc dui, pulvinar auctor nibh ut, consectetur suscipit augue. Nulla elementum purus gravida quam blandit varius. Maecenas scelerisque lacus at massa fermentum, eget viverra diam ultrices. Aliquam sit amet tincidunt metus. Sed eleifend.."),
    Message("La TEam", "https://avatars.githubusercontent.com/u/83698843?v=4",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nunc dui, pulvinar auctor nibh ut, consectetur suscipit augue. Nulla elementum purus gravida quam blandit varius. Maecenas scelerisque lacus at massa fermentum, eget viverra diam ultrices. Aliquam sit amet tincidunt metus. Sed eleifend.."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(),
        backgroundColor: darkGray,
        body: Column(
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: Container(
                      height: 70,
                      width: 420,
                      child: const Card(
                          color: Color(0xFF404040),
                          child: Center(
                            child: Text(
                              "Divers",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ))),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: listMsg.length,
              itemBuilder: (context, index) =>
                  SingleMessage(context, listMsg[index]),
            )),
          ],
        ),
        bottomNavigationBar: footer(context));
  }
}
