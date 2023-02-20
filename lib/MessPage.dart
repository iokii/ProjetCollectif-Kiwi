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
      body: ListView.builder(
          itemBuilder: (context, index) => SingleMessage(Message(
              "https://avatars.githubusercontent.com/u/98802482?v=4",
              "Fitz",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In finibus a urna sed laoreet. Donec auctor tellus nec libero bibendum, ac accumsan nisl laoreet."))),
      bottomNavigationBar: footer(context),
    ); // Scaffold
  }
}
