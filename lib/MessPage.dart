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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(),
        backgroundColor: darkGray,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => SingleMessage(Message(
                    "Fitz",
                    "https://avatars.githubusercontent.com/u/98802482?v=4",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nunc dui, pulvinar auctor nibh ut, consectetur suscipit augue. Nulla elementum purus gravida quam blandit varius. Maecenas scelerisque lacus at massa fermentum, eget viverra diam ultrices. Aliquam sit amet tincidunt metus. Sed eleifend..")),
              ),
            ),
          ],
        ),
        bottomNavigationBar: footer(context));
  }
}
