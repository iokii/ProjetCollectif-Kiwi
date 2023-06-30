import 'package:flutter/material.dart';
import 'package:project/Models/Post.dart';

import '../Components/DetailsPublication.dart';
import '../Components/Part/BottomIconBar.dart';
import '../Components/Part/header.dart';
import '../Components/PostList.dart';
import '../Models/global.dart';

import '../Data/Posts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

const loginText = "Log into $applicationName !";

class _HomePageState extends State<HomePage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  late Post _selectedPost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context: context, artist: true),
      backgroundColor: darkGray,
      body: SizedBox(
        child: ListView.builder(
          itemCount: listAllPost.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPost = listAllPost[index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPublication(_selectedPost),
                    ),
                  );
                });
              },
              child: Card(child: PostList(listAllPost[index])),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomIconBar(context),
    );
  }
}
