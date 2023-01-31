import 'package:flutter/material.dart';
import 'package:project/header.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const loginText = "Log into $applicationName !";

class _HomePageState extends State<HomePage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var listPosts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      backgroundColor: darkGray,
      body:
          // show every posts in the list
          ListView.builder(
        itemCount: listPosts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(listPosts[index]),
            ),
          );
        },
      ),
    );
  }
}
